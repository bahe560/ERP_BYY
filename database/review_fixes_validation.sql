-- Validation checks for review_fixes_2026-11-20.sql
-- Run only after restoring the schema into a disposable PostgreSQL database
-- and applying the migration. This script does not modify business data.

DO $$
DECLARE
    v_expected text[] := ARRAY[
        'ix_customer_ledger_journal_entry',
        'ix_customer_ledger_voucher_detail',
        'ix_customer_ledger_currency',
        'ix_supplier_ledger_journal_entry',
        'ix_supplier_ledger_voucher_detail',
        'ix_supplier_ledger_currency',
        'ix_journal_entries_fiscal_period',
        'ix_journal_entries_reversed_entry',
        'ix_sales_documents_warehouse',
        'ix_sales_documents_branch',
        'ix_sales_documents_journal_entry',
        'ix_sales_documents_stock_document',
        'ix_sales_documents_order',
        'ix_purchase_documents_warehouse',
        'ix_purchase_documents_branch',
        'ix_purchase_documents_journal_entry',
        'ix_purchase_documents_stock_document',
        'ix_purchase_documents_order',
        'ix_sales_document_lines_order_line',
        'ix_sales_document_lines_source_line',
        'ix_sales_document_lines_quotation_line',
        'ix_purchase_document_lines_order_line',
        'ix_purchase_document_lines_source_line',
        'ix_purchase_document_lines_request_line',
        'ix_stock_movements_item',
        'ix_stock_movements_line',
        'ix_financial_vouchers_voucher_type',
        'ix_financial_vouchers_journal_entry',
        'ix_financial_vouchers_fiscal_period',
        'ix_cheques_customer',
        'ix_cheques_supplier',
        'ix_pos_cash_movements_session',
        'ix_bank_reconciliation_matches_reconciliation'
    ];
    v_missing text[];
    v_bad text[];
BEGIN
    SELECT array_agg(x) INTO v_missing
    FROM unnest(v_expected) AS x
    WHERE NOT EXISTS (
        SELECT 1 FROM pg_indexes
        WHERE schemaname = 'erp' AND indexname = x
    );

    IF v_missing IS NOT NULL THEN
        RAISE EXCEPTION 'Missing expected migration indexes: %', v_missing;
    END IF;

    SELECT array_agg(indexname) INTO v_bad
    FROM pg_indexes
    WHERE schemaname = 'erp'
      AND indexname = ANY(v_expected)
      AND indexdef ILIKE '% WHERE %';

    IF v_bad IS NOT NULL THEN
        RAISE EXCEPTION 'Unexpected partial indexes among migration indexes: %', v_bad;
    END IF;

    RAISE NOTICE 'PASS: all % expected indexes exist.', cardinality(v_expected);
END $$;

-- The zero/null guards execute before any database access in the function.
DO $$
DECLARE
    v_pass boolean := false;
BEGIN
    BEGIN
        PERFORM erp.fn_apply_stock_movement(
            NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            0, NULL, false, 2
        );
        RAISE EXCEPTION 'Expected zero-quantity guard did not fire';
    EXCEPTION WHEN check_violation THEN
        v_pass := true;
    END;

    IF NOT v_pass THEN
        RAISE EXCEPTION 'Zero-quantity guard test failed';
    END IF;

    v_pass := false;
    BEGIN
        PERFORM erp.fn_apply_stock_movement(
            NULL, NULL, NULL, NULL, NULL, NULL, NULL,
            NULL, NULL, false, 2
        );
        RAISE EXCEPTION 'Expected NULL-quantity guard did not fire';
    EXCEPTION WHEN check_violation THEN
        v_pass := true;
    END;

    IF NOT v_pass THEN
        RAISE EXCEPTION 'NULL-quantity guard test failed';
    END IF;

    RAISE NOTICE 'PASS: zero and NULL quantity are rejected before database writes.';
END $$;

-- Additional required integration tests (use valid fixture IDs from the test DB):
-- 1) Positive movement: quantity > 0, inbound value >= 0; assert balances and movement row.
-- 2) Negative movement: quantity < 0; assert average-cost valuation and balances.
-- 3) Negative movement exceeding available quantity with p_allow_negative=false:
--    expect SQLSTATE 23514 and no persisted changes.
-- 4) Negative movement with p_allow_negative=true: assert resulting negative balance.
-- 5) Batch/batch-balance movement: ensure batch quantity and main balance stay consistent.
-- 6) Run each test in a transaction and ROLLBACK after assertions.
