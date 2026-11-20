-- ERP BYY: targeted database review fixes
-- Apply only to a dedicated test database first. This file is idempotent.
-- Indexes are non-concurrent so the migration can run inside a transaction.
BEGIN;

-- Customer / supplier ledgers: FK and common source/journal lookups.
CREATE INDEX IF NOT EXISTS ix_customer_ledger_journal_entry
    ON erp.customer_ledger (company_id, journal_entry_id);
CREATE INDEX IF NOT EXISTS ix_customer_ledger_voucher_detail
    ON erp.customer_ledger (company_id, voucher_detail_id);
CREATE INDEX IF NOT EXISTS ix_customer_ledger_currency
    ON erp.customer_ledger (company_id, currency_id);

CREATE INDEX IF NOT EXISTS ix_supplier_ledger_journal_entry
    ON erp.supplier_ledger (company_id, journal_entry_id);
CREATE INDEX IF NOT EXISTS ix_supplier_ledger_voucher_detail
    ON erp.supplier_ledger (company_id, voucher_detail_id);
CREATE INDEX IF NOT EXISTS ix_supplier_ledger_currency
    ON erp.supplier_ledger (company_id, currency_id);

-- Journal entries: fiscal-period filtering and reversal lookup.
CREATE INDEX IF NOT EXISTS ix_journal_entries_fiscal_period
    ON erp.journal_entries (company_id, fiscal_period_id);
CREATE INDEX IF NOT EXISTS ix_journal_entries_reversed_entry
    ON erp.journal_entries (company_id, reversed_entry_id);

-- Sales documents: warehouse, branch, journal, stock document and order links.
CREATE INDEX IF NOT EXISTS ix_sales_documents_warehouse
    ON erp.sales_documents (company_id, warehouse_id);
CREATE INDEX IF NOT EXISTS ix_sales_documents_branch
    ON erp.sales_documents (company_id, branch_id);
CREATE INDEX IF NOT EXISTS ix_sales_documents_journal_entry
    ON erp.sales_documents (company_id, journal_entry_id);
CREATE INDEX IF NOT EXISTS ix_sales_documents_stock_document
    ON erp.sales_documents (company_id, stock_document_id);
CREATE INDEX IF NOT EXISTS ix_sales_documents_order
    ON erp.sales_documents (company_id, order_id);

-- Purchase documents: warehouse, branch, journal, stock document and order links.
CREATE INDEX IF NOT EXISTS ix_purchase_documents_warehouse
    ON erp.purchase_documents (company_id, warehouse_id);
CREATE INDEX IF NOT EXISTS ix_purchase_documents_branch
    ON erp.purchase_documents (company_id, branch_id);
CREATE INDEX IF NOT EXISTS ix_purchase_documents_journal_entry
    ON erp.purchase_documents (company_id, journal_entry_id);
CREATE INDEX IF NOT EXISTS ix_purchase_documents_stock_document
    ON erp.purchase_documents (company_id, stock_document_id);
CREATE INDEX IF NOT EXISTS ix_purchase_documents_order
    ON erp.purchase_documents (company_id, order_id);

-- Document-line links used by order settlement / conversion routines.
CREATE INDEX IF NOT EXISTS ix_sales_document_lines_order_line
    ON erp.sales_document_lines (company_id, order_line_id);
CREATE INDEX IF NOT EXISTS ix_sales_document_lines_source_line
    ON erp.sales_document_lines (company_id, source_line_id);
CREATE INDEX IF NOT EXISTS ix_sales_document_lines_quotation_line
    ON erp.sales_document_lines (company_id, quotation_line_id);

CREATE INDEX IF NOT EXISTS ix_purchase_document_lines_order_line
    ON erp.purchase_document_lines (company_id, order_line_id);
CREATE INDEX IF NOT EXISTS ix_purchase_document_lines_source_line
    ON erp.purchase_document_lines (company_id, source_line_id);
CREATE INDEX IF NOT EXISTS ix_purchase_document_lines_request_line
    ON erp.purchase_document_lines (company_id, request_line_id);

-- Stock movement lookups.
CREATE INDEX IF NOT EXISTS ix_stock_movements_item
    ON erp.stock_movements (company_id, item_id);
CREATE INDEX IF NOT EXISTS ix_stock_movements_line
    ON erp.stock_movements (company_id, line_id);

-- Vouchers and cheques.
CREATE INDEX IF NOT EXISTS ix_financial_vouchers_voucher_type
    ON erp.financial_vouchers (company_id, voucher_type_id);
CREATE INDEX IF NOT EXISTS ix_financial_vouchers_journal_entry
    ON erp.financial_vouchers (company_id, journal_entry_id);
CREATE INDEX IF NOT EXISTS ix_financial_vouchers_fiscal_period
    ON erp.financial_vouchers (company_id, fiscal_period_id);
CREATE INDEX IF NOT EXISTS ix_cheques_customer
    ON erp.cheques (company_id, customer_id);
CREATE INDEX IF NOT EXISTS ix_cheques_supplier
    ON erp.cheques (company_id, supplier_id);

-- POS and bank-reconciliation lookup indexes.
CREATE INDEX IF NOT EXISTS ix_pos_cash_movements_session
    ON erp.pos_cash_movements (company_id, session_id);
CREATE INDEX IF NOT EXISTS ix_bank_reconciliation_matches_reconciliation
    ON erp.bank_reconciliation_matches (company_id, reconciliation_id);

COMMIT;

-- Guard against zero-quantity calls before division by abs(p_qty_signed).
-- Existing callers should never post a zero stock movement.
CREATE OR REPLACE FUNCTION erp.fn_apply_stock_movement(
    p_doc_id bigint,
    p_line_id bigint,
    p_company bigint,
    p_date date,
    p_warehouse bigint,
    p_item bigint,
    p_batch bigint,
    p_qty_signed numeric,
    p_in_value numeric,
    p_allow_negative boolean,
    p_dp smallint,
    OUT o_value numeric
) RETURNS numeric
LANGUAGE plpgsql
AS $$
DECLARE
    b          record;
    v_out      numeric;
    v_cost     numeric;
    v_new_qty  numeric;
    v_new_val  numeric;
    v_last     numeric;
    v_batch_q  numeric;
BEGIN
    IF p_qty_signed IS NULL OR p_qty_signed = 0 THEN
        RAISE EXCEPTION 'كمية حركة المخزون يجب ألا تكون صفراً'
            USING ERRCODE = '23514';
    END IF;

    IF p_qty_signed > 0 AND (p_in_value IS NULL OR p_in_value < 0) THEN
        RAISE EXCEPTION 'قيمة حركة الإدخال غير صحيحة'
            USING ERRCODE = '23514';
    END IF;

    INSERT INTO erp.stock_balances (company_id, warehouse_id, item_id)
    VALUES (p_company, p_warehouse, p_item)
    ON CONFLICT (warehouse_id, item_id) DO NOTHING;

    SELECT qty_on_hand, total_value, last_avg_cost INTO b
      FROM erp.stock_balances
     WHERE warehouse_id = p_warehouse AND item_id = p_item
     FOR UPDATE;

    IF p_qty_signed > 0 THEN
        o_value := p_in_value;
    ELSE
        v_out := -p_qty_signed;
        IF b.qty_on_hand < v_out AND NOT p_allow_negative THEN
            RAISE EXCEPTION 'الرصيد غير كافٍ (صنف %، مخزن %): المتاح % والمطلوب %',
                p_item, p_warehouse, b.qty_on_hand, v_out USING ERRCODE = '23514';
        END IF;
        v_cost := CASE WHEN b.qty_on_hand > 0 THEN b.total_value / b.qty_on_hand ELSE b.last_avg_cost END;
        o_value := CASE WHEN v_out = b.qty_on_hand THEN b.total_value
                        ELSE round(v_out * v_cost, p_dp) END;
    END IF;

    v_new_qty := b.qty_on_hand + p_qty_signed;
    v_new_val := b.total_value + CASE WHEN p_qty_signed > 0 THEN o_value ELSE -o_value END;
    v_last    := CASE WHEN v_new_qty > 0 THEN round(v_new_val / v_new_qty, 8) ELSE b.last_avg_cost END;

    UPDATE erp.stock_balances
       SET qty_on_hand = v_new_qty, total_value = v_new_val, last_avg_cost = v_last, updated_at = now()
     WHERE warehouse_id = p_warehouse AND item_id = p_item;

    IF p_batch IS NOT NULL THEN
        INSERT INTO erp.stock_batch_balances (company_id, warehouse_id, item_id, batch_id)
        VALUES (p_company, p_warehouse, p_item, p_batch)
        ON CONFLICT (warehouse_id, item_id, batch_id) DO NOTHING;

        UPDATE erp.stock_batch_balances
           SET qty_on_hand = qty_on_hand + p_qty_signed
         WHERE warehouse_id = p_warehouse AND item_id = p_item AND batch_id = p_batch
         RETURNING qty_on_hand INTO v_batch_q;

        IF v_batch_q < 0 AND NOT p_allow_negative THEN
            RAISE EXCEPTION 'رصيد التشغيلة غير كافٍ (صنف %، تشغيلة %)', p_item, p_batch
                USING ERRCODE = '23514';
        END IF;
    END IF;

    INSERT INTO erp.stock_movements (
        company_id, document_id, line_id, movement_date, warehouse_id, item_id, batch_id,
        qty_signed, unit_cost, value_signed, qty_after, value_after, avg_cost_after
    )
    VALUES (
        p_company, p_doc_id, p_line_id, p_date, p_warehouse, p_item, p_batch,
        p_qty_signed, round(o_value / abs(p_qty_signed), 8),
        CASE WHEN p_qty_signed > 0 THEN o_value ELSE -o_value END,
        v_new_qty, v_new_val,
        CASE WHEN v_new_qty <> 0 THEN round(v_new_val / v_new_qty, 8) ELSE 0 END
    );
END $$;

-- NOTE: The deferred balance trigger and session-variable write guards are not
-- changed here. They require a dedicated security/performance design and tests.
