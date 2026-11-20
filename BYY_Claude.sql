--
-- PostgreSQL database dump
--

\restrict ZlefVb444ZO611VRzz7rfWcO4D5pULlvAUdkgWUQ6ihhGOSlqaKvyHbvyuF8qdP

-- Dumped from database version 18.7
-- Dumped by pg_dump version 18.7

-- Started on 2026-11-20 19:44:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 42567)
-- Name: erp; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA erp;


ALTER SCHEMA erp OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 41841)
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- TOC entry 7428 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- TOC entry 3 (class 3079 OID 45287)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 7429 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 1458 (class 1247 OID 42574)
-- Name: account_category; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.account_category AS ENUM (
    'asset',
    'liability',
    'equity',
    'revenue',
    'expense'
);


ALTER TYPE erp.account_category OWNER TO postgres;

--
-- TOC entry 1455 (class 1247 OID 42569)
-- Name: account_nature; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.account_nature AS ENUM (
    'debit',
    'credit'
);


ALTER TYPE erp.account_nature OWNER TO postgres;

--
-- TOC entry 1461 (class 1247 OID 42586)
-- Name: account_subtype; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.account_subtype AS ENUM (
    'general',
    'cash',
    'bank',
    'customer',
    'supplier',
    'inventory'
);


ALTER TYPE erp.account_subtype OWNER TO postgres;

--
-- TOC entry 1782 (class 1247 OID 57482)
-- Name: bank_line_direction; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.bank_line_direction AS ENUM (
    'debit',
    'credit'
);


ALTER TYPE erp.bank_line_direction OWNER TO postgres;

--
-- TOC entry 1788 (class 1247 OID 57498)
-- Name: bank_match_method; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.bank_match_method AS ENUM (
    'manual',
    'suggested',
    'rule_based'
);


ALTER TYPE erp.bank_match_method OWNER TO postgres;

--
-- TOC entry 1785 (class 1247 OID 57488)
-- Name: bank_reconciliation_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.bank_reconciliation_status AS ENUM (
    'draft',
    'in_progress',
    'completed',
    'cancelled'
);


ALTER TYPE erp.bank_reconciliation_status OWNER TO postgres;

--
-- TOC entry 1779 (class 1247 OID 57470)
-- Name: bank_statement_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.bank_statement_status AS ENUM (
    'draft',
    'imported',
    'reviewed',
    'closed',
    'void'
);


ALTER TYPE erp.bank_statement_status OWNER TO postgres;

--
-- TOC entry 1767 (class 1247 OID 57372)
-- Name: cheque_direction; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.cheque_direction AS ENUM (
    'receipt',
    'payment'
);


ALTER TYPE erp.cheque_direction OWNER TO postgres;

--
-- TOC entry 1770 (class 1247 OID 57378)
-- Name: cheque_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.cheque_status AS ENUM (
    'in_hand',
    'deposited',
    'cleared',
    'returned',
    'void'
);


ALTER TYPE erp.cheque_status OWNER TO postgres;

--
-- TOC entry 1845 (class 1247 OID 62170)
-- Name: depreciation_method; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.depreciation_method AS ENUM (
    'straight_line',
    'declining_balance'
);


ALTER TYPE erp.depreciation_method OWNER TO postgres;

--
-- TOC entry 1848 (class 1247 OID 62176)
-- Name: depreciation_run_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.depreciation_run_status AS ENUM (
    'draft',
    'posted',
    'reversed'
);


ALTER TYPE erp.depreciation_run_status OWNER TO postgres;

--
-- TOC entry 1464 (class 1247 OID 42600)
-- Name: entry_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.entry_status AS ENUM (
    'draft',
    'posted',
    'reversed'
);


ALTER TYPE erp.entry_status OWNER TO postgres;

--
-- TOC entry 1842 (class 1247 OID 62160)
-- Name: fixed_asset_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.fixed_asset_status AS ENUM (
    'draft',
    'active',
    'fully_depreciated',
    'disposed'
);


ALTER TYPE erp.fixed_asset_status OWNER TO postgres;

--
-- TOC entry 1581 (class 1247 OID 43638)
-- Name: landed_alloc_method; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.landed_alloc_method AS ENUM (
    'value',
    'quantity'
);


ALTER TYPE erp.landed_alloc_method OWNER TO postgres;

--
-- TOC entry 1632 (class 1247 OID 44252)
-- Name: payment_method_kind; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.payment_method_kind AS ENUM (
    'cash',
    'card',
    'other'
);


ALTER TYPE erp.payment_method_kind OWNER TO postgres;

--
-- TOC entry 1578 (class 1247 OID 43632)
-- Name: payment_type; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.payment_type AS ENUM (
    'cash',
    'credit'
);


ALTER TYPE erp.payment_type OWNER TO postgres;

--
-- TOC entry 1467 (class 1247 OID 42608)
-- Name: period_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.period_status AS ENUM (
    'open',
    'closed',
    'locked'
);


ALTER TYPE erp.period_status OWNER TO postgres;

--
-- TOC entry 1635 (class 1247 OID 44260)
-- Name: pos_session_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.pos_session_status AS ENUM (
    'open',
    'closed'
);


ALTER TYPE erp.pos_session_status OWNER TO postgres;

--
-- TOC entry 1638 (class 1247 OID 44266)
-- Name: price_list_kind; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.price_list_kind AS ENUM (
    'retail',
    'wholesale',
    'special',
    'other'
);


ALTER TYPE erp.price_list_kind OWNER TO postgres;

--
-- TOC entry 1572 (class 1247 OID 43608)
-- Name: purchase_doc_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.purchase_doc_status AS ENUM (
    'draft',
    'approved',
    'partially_received',
    'received',
    'posted',
    'cancelled'
);


ALTER TYPE erp.purchase_doc_status OWNER TO postgres;

--
-- TOC entry 1569 (class 1247 OID 43601)
-- Name: purchase_doc_type; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.purchase_doc_type AS ENUM (
    'order',
    'invoice',
    'return'
);


ALTER TYPE erp.purchase_doc_type OWNER TO postgres;

--
-- TOC entry 1575 (class 1247 OID 43622)
-- Name: purchase_request_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.purchase_request_status AS ENUM (
    'draft',
    'approved',
    'closed',
    'cancelled'
);


ALTER TYPE erp.purchase_request_status OWNER TO postgres;

--
-- TOC entry 1629 (class 1247 OID 44236)
-- Name: sales_doc_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.sales_doc_status AS ENUM (
    'draft',
    'approved',
    'converted',
    'partially_delivered',
    'delivered',
    'posted',
    'cancelled'
);


ALTER TYPE erp.sales_doc_status OWNER TO postgres;

--
-- TOC entry 1626 (class 1247 OID 44227)
-- Name: sales_doc_type; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.sales_doc_type AS ENUM (
    'quotation',
    'order',
    'invoice',
    'return'
);


ALTER TYPE erp.sales_doc_type OWNER TO postgres;

--
-- TOC entry 1824 (class 1247 OID 61973)
-- Name: stock_count_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.stock_count_status AS ENUM (
    'draft',
    'counting',
    'approved',
    'posted',
    'cancelled'
);


ALTER TYPE erp.stock_count_status OWNER TO postgres;

--
-- TOC entry 1827 (class 1247 OID 61984)
-- Name: stock_count_type; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.stock_count_type AS ENUM (
    'full',
    'partial',
    'adjustment'
);


ALTER TYPE erp.stock_count_type OWNER TO postgres;

--
-- TOC entry 1521 (class 1247 OID 43118)
-- Name: stock_doc_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.stock_doc_status AS ENUM (
    'draft',
    'posted'
);


ALTER TYPE erp.stock_doc_status OWNER TO postgres;

--
-- TOC entry 1518 (class 1247 OID 43110)
-- Name: stock_doc_type; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.stock_doc_type AS ENUM (
    'receipt',
    'issue',
    'transfer'
);


ALTER TYPE erp.stock_doc_type OWNER TO postgres;

--
-- TOC entry 1701 (class 1247 OID 45002)
-- Name: voucher_kind; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.voucher_kind AS ENUM (
    'receipt',
    'payment',
    'journal'
);


ALTER TYPE erp.voucher_kind OWNER TO postgres;

--
-- TOC entry 1704 (class 1247 OID 45010)
-- Name: voucher_status; Type: TYPE; Schema: erp; Owner: postgres
--

CREATE TYPE erp.voucher_status AS ENUM (
    'draft',
    'posted',
    'cancelled'
);


ALTER TYPE erp.voucher_status OWNER TO postgres;

--
-- TOC entry 456 (class 1255 OID 44199)
-- Name: approve_purchase_order(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.approve_purchase_order(p_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE d record;
BEGIN
    SELECT doc_type, status INTO d FROM erp.purchase_documents WHERE id = p_id FOR UPDATE;
    IF NOT FOUND OR d.doc_type <> 'order' OR d.status <> 'draft' THEN
        RAISE EXCEPTION 'أمر الشراء غير موجود أو ليس مسودة' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.purchase_document_lines WHERE document_id = p_id) THEN
        RAISE EXCEPTION 'أمر الشراء بلا أسطر' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.purch_write', 'on', true);

    -- تحويل كميات طلبات الشراء إلى "مطلوب بأمر شراء" (قيد ck_prl_ordered يمنع تجاوز الكمية)
    UPDATE erp.purchase_request_lines r
       SET ordered_qty_base = r.ordered_qty_base + x.q
      FROM (SELECT request_line_id, SUM(qty_base) AS q
              FROM erp.purchase_document_lines
             WHERE document_id = p_id AND request_line_id IS NOT NULL
             GROUP BY request_line_id) x
     WHERE r.id = x.request_line_id;

    UPDATE erp.purchase_requests pr SET status = 'closed'
     WHERE pr.status = 'approved'
       AND pr.id IN (SELECT rl.request_id FROM erp.purchase_request_lines rl
                      JOIN erp.purchase_document_lines pl ON pl.request_line_id = rl.id
                     WHERE pl.document_id = p_id)
       AND NOT EXISTS (SELECT 1 FROM erp.purchase_request_lines x WHERE x.request_id = pr.id AND x.ordered_qty_base < x.qty_base);

    UPDATE erp.purchase_documents SET status = 'approved', approved_by = p_user_id, approved_at = now() WHERE id = p_id;
    PERFORM set_config('erp.purch_write', 'off', true);
END $$;


ALTER FUNCTION erp.approve_purchase_order(p_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 424 (class 1255 OID 44198)
-- Name: approve_purchase_request(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.approve_purchase_request(p_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE r record;
BEGIN
    SELECT status INTO r FROM erp.purchase_requests WHERE id = p_id FOR UPDATE;
    IF NOT FOUND OR r.status <> 'draft' THEN
        RAISE EXCEPTION 'طلب الشراء غير موجود أو ليس مسودة' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.purchase_request_lines WHERE request_id = p_id) THEN
        RAISE EXCEPTION 'طلب الشراء بلا أسطر' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.purch_write', 'on', true);
    UPDATE erp.purchase_requests SET status = 'approved', approved_by = p_user_id, approved_at = now() WHERE id = p_id;
    PERFORM set_config('erp.purch_write', 'off', true);
END $$;


ALTER FUNCTION erp.approve_purchase_request(p_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 664 (class 1255 OID 44965)
-- Name: approve_sales_document(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.approve_sales_document(p_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE d record;
BEGIN
    SELECT doc_type, status INTO d FROM erp.sales_documents WHERE id = p_id FOR UPDATE;
    IF NOT FOUND OR d.doc_type NOT IN ('quotation', 'order') OR d.status <> 'draft' THEN
        RAISE EXCEPTION 'المستند غير موجود أو ليس عرض سعر/أمر بيع بحالة مسودة' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.sales_document_lines WHERE document_id = p_id) THEN
        RAISE EXCEPTION 'المستند بلا أسطر' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.sales_write', 'on', true);
    UPDATE erp.sales_documents SET status = 'approved', approved_by = p_user_id, approved_at = now() WHERE id = p_id;
    PERFORM set_config('erp.sales_write', 'off', true);
END $$;


ALTER FUNCTION erp.approve_sales_document(p_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 479 (class 1255 OID 45519)
-- Name: authenticate(character varying, text, character varying); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.authenticate(p_username character varying, p_password text, p_ip character varying DEFAULT NULL::character varying) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE u record;
BEGIN
    SELECT * INTO u FROM erp.app_users WHERE lower(username) = lower(p_username) FOR UPDATE;
    IF NOT FOUND THEN
        INSERT INTO erp.user_login_log (username_attempted, success, reason, ip) VALUES (p_username, false, 'unknown_user', p_ip);
        RETURN NULL;
    END IF;
    IF NOT u.is_active THEN
        INSERT INTO erp.user_login_log (user_id, username_attempted, success, reason, ip) VALUES (u.id, p_username, false, 'inactive', p_ip);
        RETURN NULL;
    END IF;
    IF u.locked_until IS NOT NULL AND u.locked_until > now() THEN
        INSERT INTO erp.user_login_log (user_id, username_attempted, success, reason, ip) VALUES (u.id, p_username, false, 'locked', p_ip);
        RETURN NULL;
    END IF;
    IF u.password_hash = crypt(p_password, u.password_hash) THEN
        UPDATE erp.app_users SET failed_attempts = 0, locked_until = NULL, last_login_at = now() WHERE id = u.id;
        INSERT INTO erp.user_login_log (user_id, username_attempted, success, reason, ip) VALUES (u.id, p_username, true, 'ok', p_ip);
        RETURN u.id;
    END IF;
    UPDATE erp.app_users
       SET failed_attempts = CASE WHEN failed_attempts + 1 >= 5 THEN 0 ELSE failed_attempts + 1 END,
           locked_until    = CASE WHEN failed_attempts + 1 >= 5 THEN now() + interval '15 minutes' ELSE locked_until END
     WHERE id = u.id;
    INSERT INTO erp.user_login_log (user_id, username_attempted, success, reason, ip) VALUES (u.id, p_username, false, 'bad_password', p_ip);
    RETURN NULL;
END $$;


ALTER FUNCTION erp.authenticate(p_username character varying, p_password text, p_ip character varying) OWNER TO postgres;

--
-- TOC entry 393 (class 1255 OID 57688)
-- Name: bank_reconciliation_complete(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_reconciliation_complete(p_reconciliation_id bigint) RETURNS TABLE(statement_balance numeric, ledger_balance numeric, difference numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_company_id bigint;
  v_statement_id bigint;
  v_account_id bigint;
  v_currency_id bigint;
  v_recon_date date;
  v_status erp.bank_reconciliation_status;
  v_statement_status erp.bank_statement_status;
  v_bank_closing numeric(20,4);
  v_ledger numeric(20,4);
  v_unmatched numeric(20,4);
BEGIN
  SELECT r.company_id,r.statement_id,r.bank_account_id,r.currency_id,r.reconciliation_date,r.status,
         s.status,s.closing_balance
    INTO v_company_id,v_statement_id,v_account_id,v_currency_id,v_recon_date,v_status,
         v_statement_status,v_bank_closing
  FROM erp.bank_reconciliations r
  JOIN erp.bank_statements s ON s.company_id=r.company_id AND s.id=r.statement_id
  WHERE r.id=p_reconciliation_id
  FOR UPDATE OF r,s;
  IF NOT FOUND THEN RAISE EXCEPTION 'Reconciliation % not found',p_reconciliation_id; END IF;
  IF v_status NOT IN ('draft','in_progress') THEN RAISE EXCEPTION 'Reconciliation is not open'; END IF;
  IF v_statement_status NOT IN ('imported','reviewed') THEN
    RAISE EXCEPTION 'Statement must be imported or reviewed before reconciliation completion';
  END IF;
  IF v_bank_closing IS NULL THEN RAISE EXCEPTION 'Bank statement closing balance is required'; END IF;

  SELECT COALESCE(SUM(l.amount-COALESCE(a.allocated_fc,0)),0)
    INTO v_unmatched
  FROM erp.bank_statement_lines l
  LEFT JOIN (
    SELECT statement_line_id,SUM(matched_amount_fc) AS allocated_fc
    FROM erp.bank_reconciliation_matches WHERE reversed_at IS NULL GROUP BY statement_line_id
  ) a ON a.statement_line_id=l.id
  WHERE l.company_id=v_company_id AND l.statement_id=v_statement_id;
  IF abs(v_unmatched)>0.0001 THEN
    RAISE EXCEPTION 'Cannot complete reconciliation: unmatched statement amount remains %',v_unmatched;
  END IF;

  SELECT COALESCE(SUM(jel.debit_fc-jel.credit_fc),0)::numeric(20,4)
    INTO v_ledger
  FROM erp.journal_entry_lines jel
  JOIN erp.journal_entries je ON je.company_id=jel.company_id AND je.id=jel.entry_id
  WHERE jel.company_id=v_company_id AND jel.account_id=v_account_id
    AND jel.currency_id=v_currency_id AND je.status='posted' AND je.entry_date<=v_recon_date;

  UPDATE erp.bank_reconciliations
  SET status='completed',statement_balance=v_bank_closing,ledger_balance=v_ledger,
      difference=(v_bank_closing-v_ledger),completed_at=now(),updated_at=now()
  WHERE id=p_reconciliation_id;
  RETURN QUERY SELECT v_bank_closing,v_ledger,(v_bank_closing-v_ledger);
END;
$$;


ALTER FUNCTION erp.bank_reconciliation_complete(p_reconciliation_id bigint) OWNER TO postgres;

--
-- TOC entry 760 (class 1255 OID 57657)
-- Name: bank_reconciliation_match_line(bigint, bigint, bigint, numeric, erp.bank_match_method, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_reconciliation_match_line(p_reconciliation_id bigint, p_statement_line_id bigint, p_journal_entry_line_id bigint, p_amount_fc numeric, p_method erp.bank_match_method DEFAULT 'manual'::erp.bank_match_method, p_notes text DEFAULT NULL::text) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_company_id bigint;
  v_statement_id bigint;
  v_bank_account_id bigint;
  v_currency_id bigint;
  v_recon_status erp.bank_reconciliation_status;
  v_stmt_direction erp.bank_line_direction;
  v_stmt_amount numeric(20,4);
  v_stmt_allocated numeric(20,4);
  v_stmt_date date;
  v_line_company bigint;
  v_line_entry_id bigint;
  v_line_account_id bigint;
  v_line_currency_id bigint;
  v_line_debit_fc numeric(20,4);
  v_line_credit_fc numeric(20,4);
  v_line_debit_local numeric(20,4);
  v_line_credit_local numeric(20,4);
  v_entry_status erp.entry_status;
  v_entry_company bigint;
  v_entry_date date;
  v_line_allocated numeric(20,4);
  v_local_amount numeric(20,4);
  v_match_id bigint;
  v_side_fc numeric(20,4);
  v_side_local numeric(20,4);
BEGIN
  IF p_amount_fc IS NULL OR p_amount_fc <= 0 THEN
    RAISE EXCEPTION 'Match amount must be positive';
  END IF;

  -- Lock reconciliation first to serialize matching within a session.
  SELECT r.company_id, r.statement_id, r.bank_account_id, r.currency_id, r.status
    INTO v_company_id, v_statement_id, v_bank_account_id, v_currency_id, v_recon_status
  FROM erp.bank_reconciliations r
  WHERE r.id = p_reconciliation_id
  FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'Reconciliation % not found', p_reconciliation_id; END IF;
  IF v_recon_status NOT IN ('draft','in_progress') THEN
    RAISE EXCEPTION 'Reconciliation is not open for matching';
  END IF;

  SELECT l.direction, l.amount, l.transaction_date
    INTO v_stmt_direction, v_stmt_amount, v_stmt_date
  FROM erp.bank_statement_lines l
  WHERE l.id = p_statement_line_id
    AND l.company_id = v_company_id
    AND l.statement_id = v_statement_id
  FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'Statement line does not belong to reconciliation statement'; END IF;

  SELECT COALESCE(sum(m.matched_amount_fc),0)
    INTO v_stmt_allocated
  FROM erp.bank_reconciliation_matches m
  WHERE m.company_id = v_company_id
    AND m.statement_line_id = p_statement_line_id
    AND m.reversed_at IS NULL;
  IF v_stmt_allocated + p_amount_fc > v_stmt_amount THEN
    RAISE EXCEPTION 'Allocation exceeds statement line amount (remaining %)', v_stmt_amount-v_stmt_allocated;
  END IF;

  SELECT l.company_id, l.entry_id, l.account_id, l.currency_id,
         l.debit_fc, l.credit_fc, l.debit_local, l.credit_local,
         e.status, e.company_id, e.entry_date
    INTO v_line_company, v_line_entry_id, v_line_account_id, v_line_currency_id,
         v_line_debit_fc, v_line_credit_fc, v_line_debit_local, v_line_credit_local,
         v_entry_status, v_entry_company, v_entry_date
  FROM erp.journal_entry_lines l
  JOIN erp.journal_entries e ON e.id = l.entry_id AND e.company_id = l.company_id
  WHERE l.id = p_journal_entry_line_id
  FOR UPDATE OF l, e;
  IF NOT FOUND THEN RAISE EXCEPTION 'Journal entry line not found'; END IF;

  IF v_line_company <> v_company_id OR v_entry_company <> v_company_id THEN
    RAISE EXCEPTION 'Company mismatch';
  END IF;
  IF v_line_account_id <> v_bank_account_id THEN
    RAISE EXCEPTION 'Journal line is not for reconciliation bank account';
  END IF;
  IF v_line_currency_id <> v_currency_id THEN
    RAISE EXCEPTION 'Currency mismatch between statement and journal line';
  END IF;
  IF v_entry_status <> 'posted' THEN
    RAISE EXCEPTION 'Only posted journal entries may be matched';
  END IF;
  IF v_entry_date > v_stmt_date THEN
    RAISE EXCEPTION 'Journal entry date is after bank transaction date';
  END IF;

  IF v_stmt_direction = 'debit' THEN
    v_side_fc := v_line_debit_fc;
    v_side_local := v_line_debit_local;
  ELSE
    v_side_fc := v_line_credit_fc;
    v_side_local := v_line_credit_local;
  END IF;
  IF v_side_fc <= 0 THEN
    RAISE EXCEPTION 'Statement direction does not match journal line debit/credit';
  END IF;

  SELECT COALESCE(sum(m.matched_amount_fc),0)
    INTO v_line_allocated
  FROM erp.bank_reconciliation_matches m
  WHERE m.journal_entry_line_id = p_journal_entry_line_id
    AND m.reversed_at IS NULL;
  IF v_line_allocated + p_amount_fc > v_side_fc THEN
    RAISE EXCEPTION 'Allocation exceeds journal line remaining amount (remaining %)', v_side_fc-v_line_allocated;
  END IF;

  v_local_amount := round(v_side_local * p_amount_fc / v_side_fc, 4);
  IF v_local_amount <= 0 THEN RAISE EXCEPTION 'Calculated local match amount is zero'; END IF;

  INSERT INTO erp.bank_reconciliation_matches(
    company_id, reconciliation_id, statement_line_id, journal_entry_line_id,
    matched_amount_fc, matched_amount_local, method, notes
  ) VALUES (
    v_company_id, p_reconciliation_id, p_statement_line_id, p_journal_entry_line_id,
    p_amount_fc, v_local_amount, p_method, p_notes
  ) RETURNING id INTO v_match_id;

  UPDATE erp.bank_reconciliations
  SET status = 'in_progress', updated_at = now()
  WHERE id = p_reconciliation_id AND status = 'draft';

  RETURN v_match_id;
END;
$$;


ALTER FUNCTION erp.bank_reconciliation_match_line(p_reconciliation_id bigint, p_statement_line_id bigint, p_journal_entry_line_id bigint, p_amount_fc numeric, p_method erp.bank_match_method, p_notes text) OWNER TO postgres;

--
-- TOC entry 604 (class 1255 OID 57659)
-- Name: bank_reconciliation_unmatch(bigint, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_reconciliation_unmatch(p_match_id bigint, p_reason text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_reconciliation_id bigint;
  v_status erp.bank_reconciliation_status;
BEGIN
  IF NULLIF(trim(p_reason),'') IS NULL THEN
    RAISE EXCEPTION 'Unmatch reason is required';
  END IF;
  SELECT m.reconciliation_id, r.status
    INTO v_reconciliation_id, v_status
  FROM erp.bank_reconciliation_matches m
  JOIN erp.bank_reconciliations r ON r.id=m.reconciliation_id
  WHERE m.id=p_match_id AND m.reversed_at IS NULL
  FOR UPDATE OF m, r;
  IF NOT FOUND THEN RAISE EXCEPTION 'Active match not found'; END IF;
  IF v_status NOT IN ('draft','in_progress') THEN
    RAISE EXCEPTION 'Completed/cancelled reconciliation cannot be unmatched';
  END IF;
  UPDATE erp.bank_reconciliation_matches
  SET reversed_at=now(), reversal_reason=trim(p_reason)
  WHERE id=p_match_id AND reversed_at IS NULL;
END;
$$;


ALTER FUNCTION erp.bank_reconciliation_unmatch(p_match_id bigint, p_reason text) OWNER TO postgres;

--
-- TOC entry 579 (class 1255 OID 57685)
-- Name: bank_statement_add_line(bigint, date, erp.bank_line_direction, numeric, text, text, date, numeric, jsonb, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_statement_add_line(p_statement_id bigint, p_transaction_date date, p_direction erp.bank_line_direction, p_amount numeric, p_description text DEFAULT NULL::text, p_bank_reference text DEFAULT NULL::text, p_value_date date DEFAULT NULL::date, p_balance_after numeric DEFAULT NULL::numeric, p_raw_data jsonb DEFAULT NULL::jsonb, p_allow_cross_statement_duplicate boolean DEFAULT false) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_company_id bigint;
  v_account_id bigint;
  v_status erp.bank_statement_status;
  v_start date;
  v_end date;
  v_fingerprint text;
  v_line_id bigint;
BEGIN
  IF p_amount IS NULL OR p_amount <= 0 THEN RAISE EXCEPTION 'Statement amount must be positive'; END IF;
  IF p_transaction_date IS NULL THEN RAISE EXCEPTION 'Transaction date is required'; END IF;

  SELECT s.company_id, s.bank_account_id, s.status, s.statement_start, s.statement_end
    INTO v_company_id, v_account_id, v_status, v_start, v_end
  FROM erp.bank_statements s WHERE s.id=p_statement_id FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'Bank statement % not found', p_statement_id; END IF;
  IF v_status <> 'draft' THEN RAISE EXCEPTION 'Only draft statements accept imported lines'; END IF;
  IF p_transaction_date < v_start OR p_transaction_date > v_end THEN
    RAISE EXCEPTION 'Transaction date % is outside statement period % to %', p_transaction_date, v_start, v_end;
  END IF;

  v_fingerprint := erp.bank_statement_line_fingerprint(p_transaction_date,p_direction,p_amount,p_bank_reference,p_description);

  -- Serialize duplicate check by company/account/fingerprint to reduce race risk.
  PERFORM pg_advisory_xact_lock(hashtextextended(v_company_id::text || ':' || v_account_id::text || ':' || v_fingerprint, 0));
  IF NOT p_allow_cross_statement_duplicate AND EXISTS (
    SELECT 1
    FROM erp.bank_statement_lines l
    JOIN erp.bank_statements s ON s.company_id=l.company_id AND s.id=l.statement_id
    WHERE s.company_id=v_company_id AND s.bank_account_id=v_account_id
      AND l.fingerprint=v_fingerprint AND s.id<>p_statement_id
      AND s.status <> 'void'
  ) THEN
    RAISE EXCEPTION 'Possible duplicate bank transaction exists in another statement (fingerprint %)', v_fingerprint;
  END IF;

  INSERT INTO erp.bank_statement_lines(
    company_id,statement_id,line_no,transaction_date,value_date,description,
    bank_reference,direction,amount,balance_after,fingerprint,raw_data
  )
  SELECT v_company_id,p_statement_id,COALESCE(MAX(line_no),0)+1,p_transaction_date,p_value_date,
         p_description,p_bank_reference,p_direction,p_amount,p_balance_after,v_fingerprint,p_raw_data
  FROM erp.bank_statement_lines WHERE statement_id=p_statement_id
  RETURNING id INTO v_line_id;
  RETURN v_line_id;
END;
$$;


ALTER FUNCTION erp.bank_statement_add_line(p_statement_id bigint, p_transaction_date date, p_direction erp.bank_line_direction, p_amount numeric, p_description text, p_bank_reference text, p_value_date date, p_balance_after numeric, p_raw_data jsonb, p_allow_cross_statement_duplicate boolean) OWNER TO postgres;

--
-- TOC entry 703 (class 1255 OID 57689)
-- Name: bank_statement_close(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_statement_close(p_statement_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_company_id bigint;
  v_status erp.bank_statement_status;
  v_recon_status erp.bank_reconciliation_status;
  v_unmatched numeric(20,4);
BEGIN
  SELECT company_id,status INTO v_company_id,v_status
  FROM erp.bank_statements WHERE id=p_statement_id FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'Bank statement % not found',p_statement_id; END IF;
  IF v_status <> 'reviewed' THEN RAISE EXCEPTION 'Only reviewed statements can be closed'; END IF;
  SELECT r.status INTO v_recon_status FROM erp.bank_reconciliations r
  WHERE r.company_id=v_company_id AND r.statement_id=p_statement_id FOR UPDATE;
  IF NOT FOUND OR v_recon_status <> 'completed' THEN
    RAISE EXCEPTION 'Statement must have a completed reconciliation before closing';
  END IF;
  SELECT COALESCE(SUM(l.amount-COALESCE(a.matched_amount,0)),0)
  INTO v_unmatched
  FROM erp.bank_statement_lines l
  LEFT JOIN (
    SELECT statement_line_id,SUM(matched_amount_fc) AS matched_amount
    FROM erp.bank_reconciliation_matches WHERE reversed_at IS NULL GROUP BY statement_line_id
  ) a ON a.statement_line_id=l.id
  WHERE l.company_id=v_company_id AND l.statement_id=p_statement_id;
  IF abs(v_unmatched)>0.0001 THEN RAISE EXCEPTION 'Cannot close statement: unmatched amount remains %',v_unmatched; END IF;
  UPDATE erp.bank_statements SET status='closed',updated_at=now() WHERE id=p_statement_id;
END;
$$;


ALTER FUNCTION erp.bank_statement_close(p_statement_id bigint) OWNER TO postgres;

--
-- TOC entry 591 (class 1255 OID 57686)
-- Name: bank_statement_finalize_import(bigint, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_statement_finalize_import(p_statement_id bigint, p_require_balance_check boolean DEFAULT false) RETURNS TABLE(line_count bigint, calculated_closing_balance numeric, closing_balance_difference numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_status erp.bank_statement_status;
  v_opening numeric(20,4);
  v_closing numeric(20,4);
  v_movement numeric(20,4);
  v_count bigint;
BEGIN
  SELECT status,opening_balance,closing_balance INTO v_status,v_opening,v_closing
  FROM erp.bank_statements WHERE id=p_statement_id FOR UPDATE;
  IF NOT FOUND THEN RAISE EXCEPTION 'Bank statement % not found',p_statement_id; END IF;
  IF v_status <> 'draft' THEN RAISE EXCEPTION 'Only draft statements can be finalized as imported'; END IF;
  SELECT COUNT(*),COALESCE(SUM(CASE WHEN direction='debit' THEN amount ELSE -amount END),0)
    INTO v_count,v_movement
  FROM erp.bank_statement_lines WHERE statement_id=p_statement_id;
  IF v_count=0 THEN RAISE EXCEPTION 'Cannot import an empty statement'; END IF;
  IF v_opening IS NOT NULL AND v_closing IS NOT NULL THEN
    IF p_require_balance_check AND abs(v_closing-(v_opening+v_movement))>0.0001 THEN
      RAISE EXCEPTION 'Statement balance check failed: calculated %, bank closing %',v_opening+v_movement,v_closing;
    END IF;
  ELSIF p_require_balance_check THEN
    RAISE EXCEPTION 'Opening and closing balances are required for strict balance validation';
  END IF;
  UPDATE erp.bank_statements SET status='imported',updated_at=now() WHERE id=p_statement_id;
  RETURN QUERY SELECT v_count,
    CASE WHEN v_opening IS NULL THEN NULL ELSE (v_opening+v_movement)::numeric(20,4) END,
    CASE WHEN v_opening IS NULL OR v_closing IS NULL THEN NULL ELSE (v_closing-(v_opening+v_movement))::numeric(20,4) END;
END;
$$;


ALTER FUNCTION erp.bank_statement_finalize_import(p_statement_id bigint, p_require_balance_check boolean) OWNER TO postgres;

--
-- TOC entry 447 (class 1255 OID 57681)
-- Name: bank_statement_guard_status(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_statement_guard_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.status IS DISTINCT FROM OLD.status THEN
    IF OLD.status = 'draft' AND NEW.status IN ('imported','void') THEN
      NULL;
    ELSIF OLD.status = 'imported' AND NEW.status IN ('reviewed','void') THEN
      NULL;
    ELSIF OLD.status = 'reviewed' AND NEW.status IN ('closed','void') THEN
      NULL;
    ELSE
      RAISE EXCEPTION 'Invalid bank statement status transition: % -> %', OLD.status, NEW.status;
    END IF;
  END IF;
  IF NEW.status = 'reviewed' AND OLD.status IS DISTINCT FROM 'reviewed' THEN
    NEW.reviewed_at := now();
  END IF;
  NEW.updated_at := now();
  RETURN NEW;
END;
$$;


ALTER FUNCTION erp.bank_statement_guard_status() OWNER TO postgres;

--
-- TOC entry 637 (class 1255 OID 57680)
-- Name: bank_statement_line_fingerprint(date, erp.bank_line_direction, numeric, text, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_statement_line_fingerprint(p_transaction_date date, p_direction erp.bank_line_direction, p_amount numeric, p_bank_reference text, p_description text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
  SELECT md5(concat_ws('|',
    p_transaction_date::text,
    p_direction::text,
    round(p_amount::numeric,4)::text,
    lower(regexp_replace(coalesce(trim(p_bank_reference),''), '\s+', ' ', 'g')),
    CASE WHEN NULLIF(trim(p_bank_reference),'') IS NULL
      THEN lower(regexp_replace(coalesce(trim(p_description),''), '\s+', ' ', 'g'))
      ELSE '' END
  ));
$$;


ALTER FUNCTION erp.bank_statement_line_fingerprint(p_transaction_date date, p_direction erp.bank_line_direction, p_amount numeric, p_bank_reference text, p_description text) OWNER TO postgres;

--
-- TOC entry 573 (class 1255 OID 57683)
-- Name: bank_statement_line_guard(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_statement_line_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  v_status erp.bank_statement_status;
BEGIN
  IF TG_OP = 'DELETE' THEN
    SELECT s.status INTO v_status
    FROM erp.bank_statements s
    WHERE s.company_id=OLD.company_id AND s.id=OLD.statement_id
    FOR UPDATE;
    IF v_status <> 'draft' THEN
      RAISE EXCEPTION 'Statement lines may only be deleted while statement is draft';
    END IF;
    RETURN OLD;
  END IF;

  SELECT s.status INTO v_status
  FROM erp.bank_statements s
  WHERE s.company_id=NEW.company_id AND s.id=NEW.statement_id
  FOR UPDATE;
  IF v_status IS DISTINCT FROM 'draft' THEN
    RAISE EXCEPTION 'Statement lines may only be inserted/updated while statement is draft';
  END IF;
  IF NEW.transaction_date < (SELECT statement_start FROM erp.bank_statements WHERE id=NEW.statement_id)
     OR NEW.transaction_date > (SELECT statement_end FROM erp.bank_statements WHERE id=NEW.statement_id) THEN
    RAISE EXCEPTION 'Transaction date is outside statement date range';
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION erp.bank_statement_line_guard() OWNER TO postgres;

--
-- TOC entry 758 (class 1255 OID 57687)
-- Name: bank_statement_mark_reviewed(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.bank_statement_mark_reviewed(p_statement_id bigint, p_reviewer_id bigint DEFAULT NULL::bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  UPDATE erp.bank_statements
  SET status='reviewed', reviewed_by=p_reviewer_id, reviewed_at=now(), updated_at=now()
  WHERE id=p_statement_id AND status='imported';
  IF NOT FOUND THEN RAISE EXCEPTION 'Statement not found or not in imported status'; END IF;
END;
$$;


ALTER FUNCTION erp.bank_statement_mark_reviewed(p_statement_id bigint, p_reviewer_id bigint) OWNER TO postgres;

--
-- TOC entry 630 (class 1255 OID 45269)
-- Name: cancel_financial_voucher(bigint, bigint, date, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.cancel_financial_voucher(p_id bigint, p_user_id bigint DEFAULT NULL::bigint, p_date date DEFAULT CURRENT_DATE, p_reason text DEFAULT NULL::text) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    h       record;
    v_new   bigint;
BEGIN
    SELECT * INTO h FROM erp.financial_vouchers WHERE id = p_id FOR UPDATE;
    IF NOT FOUND OR h.status <> 'posted' THEN
        RAISE EXCEPTION 'السند غير موجود أو ليس مُرحّلاً' USING ERRCODE = '23514';
    END IF;
    IF EXISTS (SELECT 1 FROM erp.voucher_allocations a
                 JOIN erp.customer_ledger l ON l.id = a.customer_ledger_id
                WHERE l.doc_type = 'voucher' AND l.doc_id = h.id AND NOT a.reversed AND a.voucher_id <> h.id)
    OR EXISTS (SELECT 1 FROM erp.voucher_allocations a
                 JOIN erp.supplier_ledger l ON l.id = a.supplier_ledger_id
                WHERE l.doc_type = 'voucher' AND l.doc_id = h.id AND NOT a.reversed AND a.voucher_id <> h.id) THEN
        RAISE EXCEPTION 'لا يمكن إلغاء السند: تمت تسوية بنوده بسندات أخرى. ألغِ تلك التسويات أولاً' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.voucher_write', 'on', true);

    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, reversed_entry_id, created_by)
    VALUES (h.company_id, h.branch_id, p_date, 'voucher', 'financial_voucher', h.id,
            'REV-' || h.voucher_ref, 'إلغاء سند رقم ' || h.voucher_ref || COALESCE(' - ' || p_reason, ''),
            h.journal_entry_id, p_user_id)
    RETURNING id INTO v_new;

    INSERT INTO erp.journal_entry_lines (company_id, entry_id, account_id, cost_center_id, currency_id,
                                         debit_fc, credit_fc, exchange_rate, debit_local, credit_local, description)
    SELECT company_id, v_new, account_id, cost_center_id, currency_id,
           credit_fc, debit_fc, exchange_rate, credit_local, debit_local, 'عكس - ' || COALESCE(description, '')
      FROM erp.journal_entry_lines WHERE entry_id = h.journal_entry_id ORDER BY line_no;

    PERFORM erp.post_journal_entry(v_new, p_user_id);
    UPDATE erp.journal_entries SET status = 'reversed' WHERE id = h.journal_entry_id;

    INSERT INTO erp.customer_ledger (company_id, customer_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                     currency_id, exchange_rate, debit_fc, credit_fc, debit_local, credit_local, description)
    SELECT company_id, customer_id, p_date, p_date, 'voucher_reversal', doc_id, v_new,
           currency_id, exchange_rate, credit_fc, debit_fc, credit_local, debit_local, 'إلغاء سند ' || h.voucher_ref
      FROM erp.customer_ledger WHERE doc_type = 'voucher' AND doc_id = h.id;
    INSERT INTO erp.supplier_ledger (company_id, supplier_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                     currency_id, exchange_rate, debit_fc, credit_fc, debit_local, credit_local, description)
    SELECT company_id, supplier_id, p_date, p_date, 'voucher_reversal', doc_id, v_new,
           currency_id, exchange_rate, credit_fc, debit_fc, credit_local, debit_local, 'إلغاء سند ' || h.voucher_ref
      FROM erp.supplier_ledger WHERE doc_type = 'voucher' AND doc_id = h.id;

    UPDATE erp.voucher_allocations SET reversed = true WHERE voucher_id = h.id;

    UPDATE erp.financial_vouchers
       SET status = 'cancelled', cancel_journal_entry_id = v_new, cancelled_by = p_user_id,
           cancelled_at = now(), cancel_reason = p_reason
     WHERE id = h.id;

    PERFORM set_config('erp.voucher_write', 'off', true);
    RETURN v_new;
END $$;


ALTER FUNCTION erp.cancel_financial_voucher(p_id bigint, p_user_id bigint, p_date date, p_reason text) OWNER TO postgres;

--
-- TOC entry 559 (class 1255 OID 44200)
-- Name: cancel_purchase_order(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.cancel_purchase_order(p_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE d record;
BEGIN
    SELECT doc_type, status INTO d FROM erp.purchase_documents WHERE id = p_id FOR UPDATE;
    IF NOT FOUND OR d.doc_type <> 'order' OR d.status NOT IN ('draft', 'approved') THEN
        RAISE EXCEPTION 'لا يمكن إلغاء الأمر (غير موجود أو استُلمت منه كميات)' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.purch_write', 'on', true);
    IF d.status = 'approved' THEN
        UPDATE erp.purchase_request_lines r
           SET ordered_qty_base = r.ordered_qty_base - x.q
          FROM (SELECT request_line_id, SUM(qty_base) AS q FROM erp.purchase_document_lines
                 WHERE document_id = p_id AND request_line_id IS NOT NULL GROUP BY request_line_id) x
         WHERE r.id = x.request_line_id;
        UPDATE erp.purchase_requests SET status = 'approved'
         WHERE status = 'closed' AND id IN (SELECT rl.request_id FROM erp.purchase_request_lines rl
                                             JOIN erp.purchase_document_lines pl ON pl.request_line_id = rl.id
                                            WHERE pl.document_id = p_id);
    END IF;
    UPDATE erp.purchase_documents SET status = 'cancelled' WHERE id = p_id;
    PERFORM set_config('erp.purch_write', 'off', true);
END $$;


ALTER FUNCTION erp.cancel_purchase_order(p_id bigint) OWNER TO postgres;

--
-- TOC entry 640 (class 1255 OID 44966)
-- Name: cancel_sales_document(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.cancel_sales_document(p_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE d record;
BEGIN
    SELECT doc_type, status INTO d FROM erp.sales_documents WHERE id = p_id FOR UPDATE;
    IF NOT FOUND OR d.doc_type NOT IN ('quotation', 'order') OR d.status NOT IN ('draft', 'approved') THEN
        RAISE EXCEPTION 'لا يمكن الإلغاء (غير موجود/مُسلَّم جزئياً/محوَّل)' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.sales_write', 'on', true);
    UPDATE erp.sales_documents SET status = 'cancelled' WHERE id = p_id;
    PERFORM set_config('erp.sales_write', 'off', true);
END $$;


ALTER FUNCTION erp.cancel_sales_document(p_id bigint) OWNER TO postgres;

--
-- TOC entry 770 (class 1255 OID 45520)
-- Name: change_password(bigint, text, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.change_password(p_user bigint, p_old text, p_new text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE u record;
BEGIN
    IF length(p_new) < 8 THEN
        RAISE EXCEPTION 'كلمة المرور الجديدة يجب ألا تقل عن 8 أحرف' USING ERRCODE = '23514';
    END IF;
    SELECT * INTO u FROM erp.app_users WHERE id = p_user FOR UPDATE;
    IF NOT FOUND OR u.password_hash <> crypt(p_old, u.password_hash) THEN
        RAISE EXCEPTION 'كلمة المرور الحالية غير صحيحة' USING ERRCODE = '28P01';
    END IF;
    UPDATE erp.app_users
       SET password_hash = crypt(p_new, gen_salt('bf', 10)), must_change_password = false, password_changed_at = now()
     WHERE id = p_user;
    INSERT INTO erp.audit_log (user_id, table_name, record_id, action, new_data, txid)
    VALUES (COALESCE(erp.current_user_id(), p_user), 'app_users', p_user::text, 'UPDATE',
            jsonb_build_object('event', 'password_changed'), txid_current());
END $$;


ALTER FUNCTION erp.change_password(p_user bigint, p_old text, p_new text) OWNER TO postgres;

--
-- TOC entry 788 (class 1255 OID 57359)
-- Name: close_fiscal_period(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.close_fiscal_period(p_period bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    p   record;
    v_n bigint;
BEGIN
    SELECT * INTO p FROM erp.fiscal_periods WHERE id = p_period FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الفترة المالية غير موجودة' USING ERRCODE = '23503';
    END IF;
    IF p.status <> 'open' THEN
        RAISE EXCEPTION 'الفترة ليست مفتوحة (%)', p.status USING ERRCODE = '23514';
    END IF;
    LOCK TABLE erp.journal_entries IN SHARE ROW EXCLUSIVE MODE;

    IF EXISTS (SELECT 1 FROM erp.fiscal_periods q
                WHERE q.fiscal_year_id = p.fiscal_year_id AND q.start_date < p.start_date AND q.status = 'open') THEN
        RAISE EXCEPTION 'أقفل الفترات السابقة أولاً' USING ERRCODE = '23514';
    END IF;
    SELECT (SELECT count(*) FROM erp.journal_entries e
             WHERE e.company_id = p.company_id AND e.status = 'draft' AND e.entry_date BETWEEN p.start_date AND p.end_date)
         + (SELECT count(*) FROM erp.financial_vouchers v
             WHERE v.company_id = p.company_id AND v.status = 'draft' AND v.voucher_date BETWEEN p.start_date AND p.end_date)
      INTO v_n;
    IF v_n > 0 THEN
        RAISE EXCEPTION 'توجد % مستندات مسودة (قيود/سندات) ضمن الفترة؛ رحّلها أو احذفها', v_n USING ERRCODE = '23514';
    END IF;

    UPDATE erp.fiscal_periods SET status = 'closed' WHERE id = p.id;
END $$;


ALTER FUNCTION erp.close_fiscal_period(p_period bigint) OWNER TO postgres;

--
-- TOC entry 483 (class 1255 OID 57356)
-- Name: close_fiscal_year(bigint, bigint, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.close_fiscal_year(p_fy bigint, p_user_id bigint DEFAULT NULL::bigint, p_lock_periods boolean DEFAULT true) RETURNS TABLE(o_branch_id bigint, o_entry_id bigint, o_net_income numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE
    fy      record;
    br      record;
    v_base  bigint;
    v_re    bigint;
    v_entry bigint;
    v_sum   numeric;
    v_msg   text;
BEGIN
    SELECT * INTO fy FROM erp.fiscal_years WHERE id = p_fy FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'السنة المالية غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(fy.company_id, 'accounting.year.close');

    LOCK TABLE erp.journal_entries IN SHARE ROW EXCLUSIVE MODE;

    SELECT string_agg(i.issue || ' (' || i.cnt || ')', E'\n') INTO v_msg
      FROM erp.fn_year_close_issues(p_fy) i WHERE i.severity = 'error';
    IF v_msg IS NOT NULL THEN
        RAISE EXCEPTION E'لا يمكن إقفال السنة المالية:\n%', v_msg USING ERRCODE = '23514';
    END IF;

    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = fy.company_id;
    SELECT retained_earnings_account_id INTO v_re FROM erp.company_settings WHERE company_id = fy.company_id;

    FOR br IN
        SELECT t.bid
          FROM (SELECT e.branch_id AS bid, l.account_id, l.cost_center_id
                  FROM erp.journal_entry_lines l
                  JOIN erp.journal_entries e ON e.id = l.entry_id AND e.status <> 'draft'
                  JOIN erp.accounts a ON a.id = l.account_id AND a.category IN ('revenue', 'expense')
                 WHERE l.company_id = fy.company_id AND e.entry_date BETWEEN fy.start_date AND fy.end_date
                 GROUP BY e.branch_id, l.account_id, l.cost_center_id
                HAVING SUM(l.debit_local - l.credit_local) <> 0) t
         GROUP BY t.bid
         ORDER BY t.bid
    LOOP
        INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                         reference, description, created_by)
        VALUES (fy.company_id, br.bid, fy.end_date, 'closing', 'fiscal_year', fy.id,
                'CLOSE-' || fy.name, 'قيد إقفال السنة المالية ' || fy.name, p_user_id)
        RETURNING id INTO v_entry;

        -- إقفال كل حساب إيراد/مصروف (بمركز التكلفة نفسه) بعكس رصيده
        INSERT INTO erp.journal_entry_lines (company_id, entry_id, line_no, account_id, cost_center_id, currency_id,
                                             debit_fc, credit_fc, exchange_rate, debit_local, credit_local, description)
        SELECT fy.company_id, v_entry,
               row_number() OVER (ORDER BY g.account_id, g.cost_center_id NULLS FIRST),
               g.account_id, g.cost_center_id, v_base,
               GREATEST(-g.net, 0), GREATEST(g.net, 0), 1,
               GREATEST(-g.net, 0), GREATEST(g.net, 0),
               'إقفال ' || a.code || ' - ' || a.name_ar
          FROM (SELECT l.account_id, l.cost_center_id, SUM(l.debit_local - l.credit_local) AS net
                  FROM erp.journal_entry_lines l
                  JOIN erp.journal_entries e ON e.id = l.entry_id AND e.status <> 'draft'
                  JOIN erp.accounts a2 ON a2.id = l.account_id AND a2.category IN ('revenue', 'expense')
                 WHERE l.company_id = fy.company_id AND e.branch_id = br.bid
                   AND e.entry_date BETWEEN fy.start_date AND fy.end_date
                 GROUP BY l.account_id, l.cost_center_id
                HAVING SUM(l.debit_local - l.credit_local) <> 0) g
          JOIN erp.accounts a ON a.id = g.account_id;

        -- الفرق (ربح > 0) يُرحَّل للأرباح المحتجزة: دائن عند الربح، مدين عند الخسارة
        SELECT COALESCE(SUM(l.debit_local - l.credit_local), 0) INTO v_sum
          FROM erp.journal_entry_lines l WHERE l.entry_id = v_entry;
        IF v_sum > 0 THEN
            PERFORM erp.fn_pur_je_line(v_entry, fy.company_id, v_re, NULL, v_base, 'C', v_sum, v_sum, 1,
                                       'صافي ربح السنة المالية ' || fy.name);
        ELSIF v_sum < 0 THEN
            PERFORM erp.fn_pur_je_line(v_entry, fy.company_id, v_re, NULL, v_base, 'D', -v_sum, -v_sum, 1,
                                       'صافي خسارة السنة المالية ' || fy.name);
        END IF;

        PERFORM erp.post_journal_entry(v_entry, p_user_id);

        o_branch_id := br.bid;  o_entry_id := v_entry;  o_net_income := v_sum;
        RETURN NEXT;
    END LOOP;

    UPDATE erp.fiscal_years
       SET is_closed = true, closed_at = now(), closed_by = COALESCE(p_user_id, erp.current_user_id())
     WHERE id = fy.id;

    UPDATE erp.fiscal_periods
       SET status = CASE WHEN p_lock_periods THEN 'locked'::erp.period_status ELSE 'closed'::erp.period_status END
     WHERE fiscal_year_id = fy.id AND status <> (CASE WHEN p_lock_periods THEN 'locked'::erp.period_status
                                                      ELSE 'closed'::erp.period_status END);
END $$;


ALTER FUNCTION erp.close_fiscal_year(p_fy bigint, p_user_id bigint, p_lock_periods boolean) OWNER TO postgres;

--
-- TOC entry 437 (class 1255 OID 44976)
-- Name: close_pos_session(bigint, numeric, bigint, date, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.close_pos_session(p_session bigint, p_counted_cash numeric DEFAULT NULL::numeric, p_user_id bigint DEFAULT NULL::bigint, p_close_date date DEFAULT CURRENT_DATE, p_notes text DEFAULT NULL::text) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    s       record;
    r       record;
    ss      record;
    v_dp    smallint;
    v_base  bigint;
    v_exp   numeric;
    v_cnt   numeric;
    v_diff  numeric;
    v_entry bigint;
    v_desc  text;
BEGIN
    SELECT * INTO s FROM erp.pos_sessions WHERE id = p_session FOR UPDATE;
    IF NOT FOUND OR s.status <> 'open' THEN
        RAISE EXCEPTION 'الوردية غير موجودة أو مغلقة' USING ERRCODE = '23514';
    END IF;
    IF EXISTS (SELECT 1 FROM erp.sales_documents WHERE pos_session_id = p_session AND status = 'draft') THEN
        RAISE EXCEPTION 'توجد مستندات غير مرحّلة في الوردية؛ رحّلها أو احذفها قبل الإغلاق' USING ERRCODE = '23514';
    END IF;
    SELECT * INTO r FROM erp.pos_registers WHERE id = s.register_id;
    v_dp   := erp.fn_base_decimals(s.company_id);
    v_exp  := erp.fn_pos_expected_cash(p_session);
    v_cnt  := COALESCE(p_counted_cash, (SELECT SUM(amount) FROM erp.pos_session_cash_counts WHERE session_id = p_session));
    IF v_cnt IS NULL THEN
        RAISE EXCEPTION 'أدخل النقدية الفعلية أو سجّل جرد الدرج قبل الإغلاق' USING ERRCODE = '23514';
    END IF;
    v_diff := round(v_cnt - v_exp, v_dp);

    IF v_diff <> 0 THEN
        SELECT cash_over_short_account_id INTO ss FROM erp.sales_settings WHERE company_id = s.company_id;
        IF NOT FOUND OR ss.cash_over_short_account_id IS NULL THEN
            RAISE EXCEPTION 'حساب عجز/زيادة الصندوق غير معرّف في sales_settings (الفرق %)', v_diff USING ERRCODE = '23514';
        END IF;
        SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = s.company_id;
        v_desc := 'فرق صندوق وردية رقم ' || s.session_no || ' - ' || r.name_ar;
        INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                         reference, description, created_by)
        VALUES (s.company_id, r.branch_id, p_close_date, 'pos', 'pos_session', s.id, 'POS-' || r.code || '-' || s.session_no, v_desc, p_user_id)
        RETURNING id INTO v_entry;
        IF v_diff > 0 THEN        -- زيادة: من الصندوق إلى حساب الفروق
            PERFORM erp.fn_pur_je_line(v_entry, s.company_id, r.cash_account_id, NULL, v_base, 'D', v_diff, NULL, NULL, v_desc);
            PERFORM erp.fn_pur_je_line(v_entry, s.company_id, ss.cash_over_short_account_id, NULL, v_base, 'C', v_diff, NULL, NULL, v_desc);
        ELSE                      -- عجز
            PERFORM erp.fn_pur_je_line(v_entry, s.company_id, ss.cash_over_short_account_id, NULL, v_base, 'D', -v_diff, NULL, NULL, v_desc);
            PERFORM erp.fn_pur_je_line(v_entry, s.company_id, r.cash_account_id, NULL, v_base, 'C', -v_diff, NULL, NULL, v_desc);
        END IF;
        PERFORM erp.post_journal_entry(v_entry, p_user_id);
    END IF;

    PERFORM set_config('erp.sales_write', 'on', true);
    UPDATE erp.pos_sessions
       SET status = 'closed', closed_at = now(), closed_by = p_user_id, expected_cash = v_exp, counted_cash = v_cnt,
           difference = v_diff, journal_entry_id = v_entry, notes = COALESCE(p_notes, notes)
     WHERE id = p_session;
    PERFORM set_config('erp.sales_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.close_pos_session(p_session bigint, p_counted_cash numeric, p_user_id bigint, p_close_date date, p_notes text) OWNER TO postgres;

--
-- TOC entry 448 (class 1255 OID 44967)
-- Name: convert_quotation_to_order(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.convert_quotation_to_order(p_quote bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    q       record;
    v_order bigint;
BEGIN
    SELECT * INTO q FROM erp.sales_documents WHERE id = p_quote AND doc_type = 'quotation' FOR UPDATE;
    IF NOT FOUND OR q.status <> 'approved' THEN
        RAISE EXCEPTION 'عرض السعر غير موجود أو غير معتمد' USING ERRCODE = '23514';
    END IF;
    IF q.valid_until IS NOT NULL AND q.valid_until < CURRENT_DATE THEN
        RAISE EXCEPTION 'عرض السعر منتهي الصلاحية (%)', q.valid_until USING ERRCODE = '23514';
    END IF;

    INSERT INTO erp.sales_documents (company_id, doc_type, doc_date, customer_id, warehouse_id, currency_id, price_list_id,
                                     discount_pct, cost_center_id, quotation_id, salesperson_id, notes, created_by)
    VALUES (q.company_id, 'order', CURRENT_DATE, q.customer_id, q.warehouse_id, q.currency_id, q.price_list_id,
            q.discount_pct, q.cost_center_id, q.id, q.salesperson_id, q.notes, p_user_id)
    RETURNING id INTO v_order;

    INSERT INTO erp.sales_document_lines (company_id, document_id, item_id, item_unit_id, quantity, unit_price,
                                          discount_pct, tax_rate, quotation_line_id, notes)
    SELECT company_id, v_order, item_id, item_unit_id, quantity, unit_price, discount_pct, tax_rate, id, notes
      FROM erp.sales_document_lines WHERE document_id = p_quote ORDER BY line_no;

    PERFORM set_config('erp.sales_write', 'on', true);
    UPDATE erp.sales_document_lines SET settled_qty_base = qty_base WHERE document_id = p_quote;
    UPDATE erp.sales_documents SET status = 'converted' WHERE id = p_quote;
    PERFORM set_config('erp.sales_write', 'off', true);
    RETURN v_order;
END $$;


ALTER FUNCTION erp.convert_quotation_to_order(p_quote bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 463 (class 1255 OID 45518)
-- Name: create_user(character varying, text, character varying, character varying, boolean, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.create_user(p_username character varying, p_password text, p_full_name character varying, p_email character varying DEFAULT NULL::character varying, p_is_superadmin boolean DEFAULT false, p_default_company bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE v_id bigint;
BEGIN
    IF length(p_password) < 8 THEN
        RAISE EXCEPTION 'كلمة المرور يجب ألا تقل عن 8 أحرف' USING ERRCODE = '23514';
    END IF;
    INSERT INTO erp.app_users (username, full_name, email, password_hash, is_superadmin, default_company_id)
    VALUES (p_username, p_full_name, p_email, crypt(p_password, gen_salt('bf', 10)), p_is_superadmin, p_default_company)
    RETURNING id INTO v_id;
    RETURN v_id;
END $$;


ALTER FUNCTION erp.create_user(p_username character varying, p_password text, p_full_name character varying, p_email character varying, p_is_superadmin boolean, p_default_company bigint) OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 45512)
-- Name: current_user_id(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.current_user_id() RETURNS bigint
    LANGUAGE sql STABLE
    AS $$
    SELECT NULLIF(current_setting('erp.current_user_id', true), '')::bigint
$$;


ALTER FUNCTION erp.current_user_id() OWNER TO postgres;

--
-- TOC entry 636 (class 1255 OID 57460)
-- Name: deposit_cheque(bigint, bigint, date); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.deposit_cheque(p_cheque bigint, p_bank bigint, p_date date DEFAULT CURRENT_DATE) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE c record;
BEGIN
    SELECT * INTO c FROM erp.cheques WHERE id = p_cheque FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الشيك غير موجود' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'accounting.cheque.manage', c.branch_id);
    IF c.direction <> 'receipt' OR c.status <> 'in_hand' THEN
        RAISE EXCEPTION 'الإيداع لشيك قبض في الصندوق فقط' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.accounts a WHERE a.id = p_bank AND a.company_id = c.company_id
                      AND a.subtype = 'bank' AND NOT a.is_group AND a.is_active) THEN
        RAISE EXCEPTION 'الحساب المختار ليس حساب بنك فرعياً فعّالاً' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.cheque_write', 'on', true);
    UPDATE erp.cheques SET status = 'deposited', bank_account_id = p_bank, deposited_at = p_date WHERE id = c.id;
    PERFORM set_config('erp.cheque_write', 'off', true);
END $$;


ALTER FUNCTION erp.deposit_cheque(p_cheque bigint, p_bank bigint, p_date date) OWNER TO postgres;

--
-- TOC entry 749 (class 1255 OID 62456)
-- Name: depreciation_run_create(bigint, bigint, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.depreciation_run_create(p_company bigint, p_branch bigint, p_period_end date, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_end  date := (date_trunc('month', p_period_end) + interval '1 month' - interval '1 day')::date;
    v_run  bigint;
    a      record;
    d      record;
    v_n    integer := 0;
BEGIN
    PERFORM erp.require_permission(p_company, 'assets.fixed.depreciate', p_branch);

    INSERT INTO erp.depreciation_runs (company_id, branch_id, period_end, created_by)
    VALUES (p_company, p_branch, v_end, p_user)
    RETURNING id INTO v_run;

    FOR a IN
        SELECT fa.*, c.expense_account_id AS exp_acc, c.accum_account_id AS acc_acc
          FROM erp.fixed_assets fa
          JOIN erp.fixed_asset_categories c ON c.id = fa.category_id
         WHERE fa.company_id = p_company AND fa.branch_id = p_branch
           AND fa.status = 'active' AND fa.in_service_date <= v_end
         ORDER BY fa.asset_no
    LOOP
        SELECT * INTO d FROM erp.fn_fa_depreciation_due(a.id, v_end);
        IF d.o_months > 0 AND d.o_amount > 0 THEN
            INSERT INTO erp.depreciation_lines (run_id, asset_id, months, amount, prev_last_dep_date, prev_months_done,
                                                accumulated_after, book_after, expense_account_id, accum_account_id, cost_center_id)
            VALUES (v_run, a.id, d.o_months, d.o_amount, a.last_depreciation_date, a.dep_months_done,
                    a.accumulated_depreciation + d.o_amount, a.cost - a.accumulated_depreciation - d.o_amount,
                    a.exp_acc, a.acc_acc, a.cost_center_id);
            v_n := v_n + 1;
        END IF;
    END LOOP;

    IF v_n = 0 THEN
        RAISE EXCEPTION 'لا توجد أصول مستحقة الإهلاك حتى % في هذا الفرع', v_end USING ERRCODE = '23514';
    END IF;

    PERFORM set_config('erp.asset_write', 'on', true);
    UPDATE erp.depreciation_runs
       SET total_amount = (SELECT sum(amount) FROM erp.depreciation_lines WHERE run_id = v_run)
     WHERE id = v_run;
    PERFORM set_config('erp.asset_write', 'off', true);
    RETURN v_run;
END $$;


ALTER FUNCTION erp.depreciation_run_create(p_company bigint, p_branch bigint, p_period_end date, p_user bigint) OWNER TO postgres;

--
-- TOC entry 443 (class 1255 OID 62457)
-- Name: depreciation_run_discard(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.depreciation_run_discard(p_run bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    r record;
BEGIN
    SELECT * INTO r FROM erp.depreciation_runs WHERE id = p_run FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'دفعة الإهلاك غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(r.company_id, 'assets.fixed.depreciate', r.branch_id);
    IF r.status <> 'draft' THEN
        RAISE EXCEPTION 'يُحذف المسودة فقط' USING ERRCODE = '23514';
    END IF;
    DELETE FROM erp.depreciation_runs WHERE id = p_run;
END $$;


ALTER FUNCTION erp.depreciation_run_discard(p_run bigint) OWNER TO postgres;

--
-- TOC entry 714 (class 1255 OID 62458)
-- Name: depreciation_run_post(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.depreciation_run_post(p_run bigint, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    r       record;
    l       record;
    g       record;
    v_base  bigint;
    v_entry bigint;
    v_desc  text;
    v_total numeric;
BEGIN
    SELECT * INTO r FROM erp.depreciation_runs WHERE id = p_run FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'دفعة الإهلاك غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(r.company_id, 'assets.fixed.depreciate', r.branch_id);
    IF r.status <> 'draft' THEN
        RAISE EXCEPTION 'الدفعة ليست مسودة (الحالة: %)', r.status USING ERRCODE = '23514';
    END IF;

    FOR l IN
        SELECT dl.*, fa.dep_months_done AS cur_months, fa.last_depreciation_date AS cur_last, fa.status AS cur_status
          FROM erp.depreciation_lines dl
          JOIN erp.fixed_assets fa ON fa.id = dl.asset_id
         WHERE dl.run_id = p_run
           FOR UPDATE OF fa
    LOOP
        IF l.cur_status <> 'active' OR l.cur_months <> l.prev_months_done
           OR l.cur_last IS DISTINCT FROM l.prev_last_dep_date THEN
            RAISE EXCEPTION 'تغيّرت حالة الأصل % بعد إنشاء المسودة؛ احذف المسودة وأعد إنشاءها', l.asset_id USING ERRCODE = '23514';
        END IF;
    END LOOP;

    SELECT sum(amount) INTO v_total FROM erp.depreciation_lines WHERE run_id = p_run;
    IF v_total IS NULL OR v_total <= 0 THEN
        RAISE EXCEPTION 'الدفعة بلا أسطر' USING ERRCODE = '23514';
    END IF;

    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = r.company_id;
    v_desc := 'إهلاك الأصول الثابتة عن شهر ' || to_char(r.period_end, 'YYYY-MM');

    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (r.company_id, r.branch_id, r.period_end, 'depreciation', 'depreciation_run', r.id,
            'DEP-' || r.run_no, v_desc, p_user)
    RETURNING id INTO v_entry;

    FOR g IN
        SELECT expense_account_id, accum_account_id, cost_center_id, sum(amount) AS amt
          FROM erp.depreciation_lines WHERE run_id = p_run
         GROUP BY expense_account_id, accum_account_id, cost_center_id
         ORDER BY expense_account_id, accum_account_id, cost_center_id
    LOOP
        PERFORM erp.fn_pur_je_line(v_entry, r.company_id, g.expense_account_id, g.cost_center_id, v_base, 'D', g.amt, g.amt, 1, v_desc);
        PERFORM erp.fn_pur_je_line(v_entry, r.company_id, g.accum_account_id,   NULL,             v_base, 'C', g.amt, g.amt, 1, v_desc);
    END LOOP;
    PERFORM erp.post_journal_entry(v_entry, p_user);

    PERFORM set_config('erp.asset_write', 'on', true);
    UPDATE erp.fixed_assets fa
       SET accumulated_depreciation = fa.accumulated_depreciation + dl.amount,
           dep_months_done          = fa.dep_months_done + dl.months,
           last_depreciation_date   = r.period_end,
           status = CASE WHEN fa.cost - fa.accumulated_depreciation - dl.amount <= fa.salvage_value
                         THEN 'fully_depreciated'::erp.fixed_asset_status ELSE fa.status END
      FROM erp.depreciation_lines dl
     WHERE dl.run_id = p_run AND dl.asset_id = fa.id;

    UPDATE erp.depreciation_runs
       SET status = 'posted', total_amount = v_total, journal_entry_id = v_entry,
           posted_by = COALESCE(p_user, erp.current_user_id()), posted_at = now()
     WHERE id = p_run;
    PERFORM set_config('erp.asset_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.depreciation_run_post(p_run bigint, p_user bigint) OWNER TO postgres;

--
-- TOC entry 776 (class 1255 OID 62459)
-- Name: depreciation_run_reverse(bigint, date, text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.depreciation_run_reverse(p_run bigint, p_date date DEFAULT NULL::date, p_reason text DEFAULT NULL::text, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    r      record;
    l      record;
    v_new  bigint;
    v_date date;
BEGIN
    SELECT * INTO r FROM erp.depreciation_runs WHERE id = p_run FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'دفعة الإهلاك غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(r.company_id, 'assets.fixed.depreciate', r.branch_id);
    IF r.status <> 'posted' THEN
        RAISE EXCEPTION 'يمكن عكس الدفعات المُرحّلة فقط' USING ERRCODE = '23514';
    END IF;

    FOR l IN
        SELECT dl.*, fa.dep_months_done AS cur_months, fa.last_depreciation_date AS cur_last, fa.status AS cur_status
          FROM erp.depreciation_lines dl
          JOIN erp.fixed_assets fa ON fa.id = dl.asset_id
         WHERE dl.run_id = p_run
           FOR UPDATE OF fa
    LOOP
        IF l.cur_status = 'disposed' THEN
            RAISE EXCEPTION 'الأصل % مستبعد؛ لا يمكن عكس إهلاكه', l.asset_id USING ERRCODE = '23514';
        END IF;
        IF l.cur_last IS DISTINCT FROM r.period_end OR l.cur_months <> l.prev_months_done + l.months THEN
            RAISE EXCEPTION 'لا يمكن العكس: للأصل % حركات إهلاك لاحقة. اعكس الدفعات اللاحقة أولاً', l.asset_id USING ERRCODE = '23514';
        END IF;
    END LOOP;

    v_date := COALESCE(p_date, r.period_end);
    PERFORM set_config('erp.asset_write', 'on', true);

    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, reversed_entry_id, created_by)
    VALUES (r.company_id, r.branch_id, v_date, 'depreciation', 'depreciation_run', r.id,
            'REV-DEP-' || r.run_no,
            'عكس دفعة إهلاك ' || to_char(r.period_end, 'YYYY-MM') || COALESCE(' - ' || p_reason, ''),
            r.journal_entry_id, p_user)
    RETURNING id INTO v_new;

    INSERT INTO erp.journal_entry_lines (company_id, entry_id, account_id, cost_center_id, currency_id,
                                         debit_fc, credit_fc, exchange_rate, debit_local, credit_local, description)
    SELECT company_id, v_new, account_id, cost_center_id, currency_id,
           credit_fc, debit_fc, exchange_rate, credit_local, debit_local, 'عكس - ' || COALESCE(description, '')
      FROM erp.journal_entry_lines WHERE entry_id = r.journal_entry_id ORDER BY line_no;

    PERFORM erp.post_journal_entry(v_new, p_user);
    UPDATE erp.journal_entries SET status = 'reversed' WHERE id = r.journal_entry_id;

    UPDATE erp.fixed_assets fa
       SET accumulated_depreciation = fa.accumulated_depreciation - dl.amount,
           dep_months_done          = dl.prev_months_done,
           last_depreciation_date   = dl.prev_last_dep_date,
           status = CASE WHEN fa.status = 'fully_depreciated' THEN 'active'::erp.fixed_asset_status ELSE fa.status END
      FROM erp.depreciation_lines dl
     WHERE dl.run_id = p_run AND dl.asset_id = fa.id;

    UPDATE erp.depreciation_runs
       SET status = 'reversed', reversal_entry_id = v_new, reversed_at = now(),
           notes = CASE WHEN p_reason IS NULL THEN notes
                        ELSE COALESCE(notes || E'\n', '') || 'سبب العكس: ' || p_reason END
     WHERE id = p_run;
    PERFORM set_config('erp.asset_write', 'off', true);
    RETURN v_new;
END $$;


ALTER FUNCTION erp.depreciation_run_reverse(p_run bigint, p_date date, p_reason text, p_user bigint) OWNER TO postgres;

--
-- TOC entry 520 (class 1255 OID 62454)
-- Name: fixed_asset_activate(bigint, bigint, numeric, integer, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fixed_asset_activate(p_asset bigint, p_counter_account bigint, p_opening_accum numeric DEFAULT 0, p_opening_months integer DEFAULT 0, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    a       record;
    c       record;
    v_base  bigint;
    v_entry bigint;
    v_desc  text;
    v_acc   numeric := COALESCE(p_opening_accum, 0);
    v_mon   integer := COALESCE(p_opening_months, 0);
    v_ca    record;
BEGIN
    SELECT * INTO a FROM erp.fixed_assets WHERE id = p_asset FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الأصل غير موجود' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(a.company_id, 'assets.fixed.manage', a.branch_id);
    IF a.status <> 'draft' THEN
        RAISE EXCEPTION 'الأصل مفعّل مسبقاً (الحالة: %)', a.status USING ERRCODE = '23514';
    END IF;
    IF v_acc < 0 OR v_mon < 0 THEN
        RAISE EXCEPTION 'الأرصدة الافتتاحية لا تكون سالبة' USING ERRCODE = '23514';
    END IF;
    IF v_acc > a.cost - a.salvage_value THEN
        RAISE EXCEPTION 'مجمع الإهلاك الافتتاحي يتجاوز القيمة القابلة للإهلاك' USING ERRCODE = '23514';
    END IF;
    IF a.method = 'straight_line' AND v_mon > a.life_months THEN
        RAISE EXCEPTION 'أشهر الإهلاك الافتتاحية تتجاوز العمر الإنتاجي' USING ERRCODE = '23514';
    END IF;

    SELECT is_group, is_active, company_id INTO v_ca FROM erp.accounts WHERE id = p_counter_account;
    IF NOT FOUND OR v_ca.company_id <> a.company_id OR v_ca.is_group OR NOT v_ca.is_active THEN
        RAISE EXCEPTION 'الحساب المقابل يجب أن يكون حساباً فرعياً فعّالاً في نفس الشركة' USING ERRCODE = '23514';
    END IF;

    SELECT * INTO c FROM erp.fixed_asset_categories WHERE id = a.category_id;
    IF p_counter_account IN (c.cost_account_id, c.accum_account_id) THEN
        RAISE EXCEPTION 'الحساب المقابل لا يكون حساب الأصل أو مجمع الإهلاك' USING ERRCODE = '23514';
    END IF;

    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = a.company_id;
    v_desc := 'اقتناء أصل ثابت ' || a.asset_no || ' - ' || a.name_ar;

    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (a.company_id, a.branch_id, a.acquisition_date, 'fixed_asset', 'fixed_asset', a.id,
            'FA-' || a.asset_no, v_desc, p_user)
    RETURNING id INTO v_entry;

    PERFORM erp.fn_pur_je_line(v_entry, a.company_id, c.cost_account_id, NULL, v_base, 'D', a.cost, a.cost, 1, v_desc);
    PERFORM erp.fn_pur_je_line(v_entry, a.company_id, c.accum_account_id, NULL, v_base, 'C', v_acc, v_acc, 1,
                               'مجمع إهلاك افتتاحي - ' || a.asset_no);
    PERFORM erp.fn_pur_je_line(v_entry, a.company_id, p_counter_account, NULL, v_base, 'C', a.cost - v_acc, a.cost - v_acc, 1, v_desc);
    PERFORM erp.post_journal_entry(v_entry, p_user);

    PERFORM set_config('erp.asset_write', 'on', true);
    UPDATE erp.fixed_assets
       SET status = CASE WHEN a.cost - v_acc <= a.salvage_value
                         THEN 'fully_depreciated'::erp.fixed_asset_status ELSE 'active'::erp.fixed_asset_status END,
           counter_account_id = p_counter_account,
           opening_accumulated = v_acc, opening_months = v_mon,
           accumulated_depreciation = v_acc, dep_months_done = v_mon,
           acquisition_entry_id = v_entry,
           activated_by = COALESCE(p_user, erp.current_user_id()), activated_at = now()
     WHERE id = a.id;
    PERFORM set_config('erp.asset_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.fixed_asset_activate(p_asset bigint, p_counter_account bigint, p_opening_accum numeric, p_opening_months integer, p_user bigint) OWNER TO postgres;

--
-- TOC entry 803 (class 1255 OID 62453)
-- Name: fixed_asset_create(bigint, character varying, date, numeric, date, numeric, integer, erp.depreciation_method, numeric, bigint, bigint, character varying, character varying, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fixed_asset_create(p_category bigint, p_name character varying, p_acquisition_date date, p_cost numeric, p_in_service_date date DEFAULT NULL::date, p_salvage numeric DEFAULT NULL::numeric, p_life_months integer DEFAULT NULL::integer, p_method erp.depreciation_method DEFAULT NULL::erp.depreciation_method, p_rate numeric DEFAULT NULL::numeric, p_branch bigint DEFAULT NULL::bigint, p_cost_center bigint DEFAULT NULL::bigint, p_serial character varying DEFAULT NULL::character varying, p_location character varying DEFAULT NULL::character varying, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    c        record;
    v_branch bigint;
    v_method erp.depreciation_method;
    v_dp     smallint;
    v_id     bigint;
BEGIN
    SELECT * INTO c FROM erp.fixed_asset_categories WHERE id = p_category;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'فئة الأصل غير موجودة' USING ERRCODE = '23503';
    END IF;
    IF NOT c.is_active THEN
        RAISE EXCEPTION 'فئة الأصل غير فعّالة' USING ERRCODE = '23514';
    END IF;
    v_branch := COALESCE(p_branch,
                (SELECT id FROM erp.branches WHERE company_id = c.company_id AND is_active ORDER BY is_main DESC, id LIMIT 1));
    IF v_branch IS NULL THEN
        RAISE EXCEPTION 'لا يوجد فرع فعّال للشركة' USING ERRCODE = '23514';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'assets.fixed.manage', v_branch);

    v_method := COALESCE(p_method, c.method);
    v_dp := erp.fn_base_decimals(c.company_id);

    INSERT INTO erp.fixed_assets (company_id, branch_id, category_id, name_ar, serial_no, location, cost_center_id,
                                  acquisition_date, in_service_date, cost, salvage_value,
                                  method, life_months, declining_rate_pct, created_by)
    VALUES (c.company_id, v_branch, c.id, p_name, p_serial, p_location, p_cost_center,
            p_acquisition_date, COALESCE(p_in_service_date, p_acquisition_date), p_cost,
            COALESCE(p_salvage, round(p_cost * c.salvage_pct / 100, v_dp)),
            v_method,
            CASE WHEN v_method = 'straight_line' THEN COALESCE(p_life_months, c.life_months) END,
            CASE WHEN v_method = 'declining_balance' THEN COALESCE(p_rate, c.declining_rate_pct) END,
            p_user)
    RETURNING id INTO v_id;
    RETURN v_id;
END $$;


ALTER FUNCTION erp.fixed_asset_create(p_category bigint, p_name character varying, p_acquisition_date date, p_cost numeric, p_in_service_date date, p_salvage numeric, p_life_months integer, p_method erp.depreciation_method, p_rate numeric, p_branch bigint, p_cost_center bigint, p_serial character varying, p_location character varying, p_user bigint) OWNER TO postgres;

--
-- TOC entry 707 (class 1255 OID 62460)
-- Name: fixed_asset_dispose(bigint, date, numeric, bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fixed_asset_dispose(p_asset bigint, p_date date, p_proceeds numeric DEFAULT 0, p_proceeds_account bigint DEFAULT NULL::bigint, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    a        record;
    c        record;
    v_req    date;
    v_due    integer;
    v_base   bigint;
    v_entry  bigint;
    v_desc   text;
    v_pro    numeric := COALESCE(p_proceeds, 0);
    v_accum  numeric;
    v_book   numeric;
    v_gain   numeric;
BEGIN
    SELECT * INTO a FROM erp.fixed_assets WHERE id = p_asset FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الأصل غير موجود' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(a.company_id, 'assets.fixed.dispose', a.branch_id);
    IF a.status NOT IN ('active', 'fully_depreciated') THEN
        RAISE EXCEPTION 'لا يمكن استبعاد أصل في حالة %', a.status USING ERRCODE = '23514';
    END IF;
    IF p_date < a.in_service_date THEN
        RAISE EXCEPTION 'تاريخ الاستبعاد قبل تاريخ بدء التشغيل' USING ERRCODE = '23514';
    END IF;
    IF v_pro < 0 THEN
        RAISE EXCEPTION 'المتحصل لا يكون سالباً' USING ERRCODE = '23514';
    END IF;

    v_req := (date_trunc('month', p_date) - interval '1 day')::date;
    SELECT o_months INTO v_due FROM erp.fn_fa_depreciation_due(a.id, v_req);
    IF v_due > 0 THEN
        RAISE EXCEPTION 'رحّل إهلاك الأصل % حتى %-% قبل الاستبعاد', a.asset_no, to_char(v_req, 'YYYY'), to_char(v_req, 'MM') USING ERRCODE = '23514';
    END IF;

    SELECT * INTO c FROM erp.fixed_asset_categories WHERE id = a.category_id;
    v_accum := a.accumulated_depreciation;
    v_book  := a.cost - v_accum;
    v_gain  := v_pro - v_book;

    IF v_pro > 0 THEN
        IF p_proceeds_account IS NULL OR NOT EXISTS (
               SELECT 1 FROM erp.accounts WHERE id = p_proceeds_account AND company_id = a.company_id
                  AND NOT is_group AND is_active) THEN
            RAISE EXCEPTION 'حدد حساباً فرعياً فعّالاً لاستلام المتحصل' USING ERRCODE = '23514';
        END IF;
    END IF;
    IF v_gain > 0 AND c.gain_account_id IS NULL THEN
        RAISE EXCEPTION 'حساب أرباح بيع الأصول غير محدد في الفئة %', c.code USING ERRCODE = '23514';
    END IF;
    IF v_gain < 0 AND c.loss_account_id IS NULL THEN
        RAISE EXCEPTION 'حساب خسائر بيع الأصول غير محدد في الفئة %', c.code USING ERRCODE = '23514';
    END IF;

    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = a.company_id;
    v_desc := CASE WHEN v_pro > 0 THEN 'بيع' ELSE 'استبعاد' END || ' أصل ثابت ' || a.asset_no || ' - ' || a.name_ar;

    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (a.company_id, a.branch_id, p_date, 'fixed_asset', 'fixed_asset_disposal', a.id,
            'FAD-' || a.asset_no, v_desc, p_user)
    RETURNING id INTO v_entry;

    PERFORM erp.fn_pur_je_line(v_entry, a.company_id, c.accum_account_id, NULL, v_base, 'D', v_accum, v_accum, 1, v_desc);
    PERFORM erp.fn_pur_je_line(v_entry, a.company_id, p_proceeds_account, NULL, v_base, 'D', v_pro, v_pro, 1, v_desc);
    IF v_gain < 0 THEN
        PERFORM erp.fn_pur_je_line(v_entry, a.company_id, c.loss_account_id, a.cost_center_id, v_base, 'D', -v_gain, -v_gain, 1, v_desc);
    END IF;
    PERFORM erp.fn_pur_je_line(v_entry, a.company_id, c.cost_account_id, NULL, v_base, 'C', a.cost, a.cost, 1, v_desc);
    IF v_gain > 0 THEN
        PERFORM erp.fn_pur_je_line(v_entry, a.company_id, c.gain_account_id, a.cost_center_id, v_base, 'C', v_gain, v_gain, 1, v_desc);
    END IF;
    PERFORM erp.post_journal_entry(v_entry, p_user);

    PERFORM set_config('erp.asset_write', 'on', true);
    UPDATE erp.fixed_assets
       SET status = 'disposed', disposal_date = p_date, disposal_proceeds = v_pro,
           disposal_account_id = p_proceeds_account, disposal_gain_loss = v_gain,
           disposal_entry_id = v_entry, disposed_by = COALESCE(p_user, erp.current_user_id())
     WHERE id = a.id;
    PERFORM set_config('erp.asset_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.fixed_asset_dispose(p_asset bigint, p_date date, p_proceeds numeric, p_proceeds_account bigint, p_user bigint) OWNER TO postgres;

--
-- TOC entry 427 (class 1255 OID 49153)
-- Name: fn_account_statement(bigint, bigint, date, date, bigint, bigint, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_account_statement(p_company bigint, p_account bigint, p_from date, p_to date, p_branch bigint DEFAULT NULL::bigint, p_cost_center bigint DEFAULT NULL::bigint, p_include_children boolean DEFAULT true) RETURNS TABLE(row_type text, tx_date date, entry_id bigint, entry_no bigint, account_code character varying, reference character varying, description text, currency_id bigint, debit_fc numeric, credit_fc numeric, debit numeric, credit numeric, balance numeric)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_path text;
    v_open numeric;
BEGIN
    SELECT a0.path INTO v_path FROM erp.accounts a0 WHERE a0.id = p_account AND a0.company_id = p_company;
    IF v_path IS NULL THEN
        RAISE EXCEPTION 'الحساب غير موجود في هذه الشركة' USING ERRCODE = '23503';
    END IF;

    SELECT COALESCE(SUM(l.debit_local - l.credit_local), 0) INTO v_open
      FROM erp.journal_entry_lines l
      JOIN erp.journal_entries e ON e.id = l.entry_id AND e.status <> 'draft'
      JOIN erp.accounts a ON a.id = l.account_id
     WHERE l.company_id = p_company AND e.entry_date < p_from
       AND (a.id = p_account OR (p_include_children AND a.path LIKE v_path || '%'))
       AND (p_branch IS NULL OR e.branch_id = p_branch)
       AND (p_cost_center IS NULL OR l.cost_center_id = p_cost_center);

    RETURN QUERY
    SELECT 'opening'::text, p_from, NULL::bigint, NULL::bigint, NULL::varchar, NULL::varchar,
           'رصيد افتتاحي'::text, NULL::bigint, NULL::numeric, NULL::numeric,
           GREATEST(v_open, 0), GREATEST(-v_open, 0), v_open;

    RETURN QUERY
    SELECT 'entry'::text, e.entry_date, e.id, e.entry_no, a.code, e.reference,
           COALESCE(l.description, e.description), l.currency_id, l.debit_fc, l.credit_fc,
           l.debit_local, l.credit_local,
           v_open + SUM(l.debit_local - l.credit_local) OVER (ORDER BY e.entry_date, e.id, l.id)
      FROM erp.journal_entry_lines l
      JOIN erp.journal_entries e ON e.id = l.entry_id AND e.status <> 'draft'
      JOIN erp.accounts a ON a.id = l.account_id
     WHERE l.company_id = p_company AND e.entry_date BETWEEN p_from AND p_to
       AND (a.id = p_account OR (p_include_children AND a.path LIKE v_path || '%'))
       AND (p_branch IS NULL OR e.branch_id = p_branch)
       AND (p_cost_center IS NULL OR l.cost_center_id = p_cost_center)
     ORDER BY e.entry_date, e.id, l.id;
END $$;


ALTER FUNCTION erp.fn_account_statement(p_company bigint, p_account bigint, p_from date, p_to date, p_branch bigint, p_cost_center bigint, p_include_children boolean) OWNER TO postgres;

--
-- TOC entry 551 (class 1255 OID 43583)
-- Name: fn_apply_stock_movement(bigint, bigint, bigint, date, bigint, bigint, bigint, numeric, numeric, boolean, smallint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_apply_stock_movement(p_doc_id bigint, p_line_id bigint, p_company bigint, p_date date, p_warehouse bigint, p_item bigint, p_batch bigint, p_qty_signed numeric, p_in_value numeric, p_allow_negative boolean, p_dp smallint, OUT o_value numeric) RETURNS numeric
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
    INSERT INTO erp.stock_balances (company_id, warehouse_id, item_id)
    VALUES (p_company, p_warehouse, p_item)
    ON CONFLICT (warehouse_id, item_id) DO NOTHING;

    SELECT qty_on_hand, total_value, last_avg_cost INTO b
      FROM erp.stock_balances WHERE warehouse_id = p_warehouse AND item_id = p_item FOR UPDATE;

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

    -- أرصدة التشغيلات (كميات فقط؛ التكلفة على مستوى الصنف/المخزن)
    IF p_batch IS NOT NULL THEN
        INSERT INTO erp.stock_batch_balances (company_id, warehouse_id, item_id, batch_id)
        VALUES (p_company, p_warehouse, p_item, p_batch)
        ON CONFLICT (warehouse_id, item_id, batch_id) DO NOTHING;

        UPDATE erp.stock_batch_balances SET qty_on_hand = qty_on_hand + p_qty_signed
         WHERE warehouse_id = p_warehouse AND item_id = p_item AND batch_id = p_batch
         RETURNING qty_on_hand INTO v_batch_q;
        IF v_batch_q < 0 AND NOT p_allow_negative THEN
            RAISE EXCEPTION 'رصيد التشغيلة غير كافٍ (صنف %، تشغيلة %)', p_item, p_batch USING ERRCODE = '23514';
        END IF;
    END IF;

    INSERT INTO erp.stock_movements (company_id, document_id, line_id, movement_date, warehouse_id, item_id, batch_id,
                                     qty_signed, unit_cost, value_signed, qty_after, value_after, avg_cost_after)
    VALUES (p_company, p_doc_id, p_line_id, p_date, p_warehouse, p_item, p_batch,
            p_qty_signed, round(o_value / abs(p_qty_signed), 8),
            CASE WHEN p_qty_signed > 0 THEN o_value ELSE -o_value END,
            v_new_qty, v_new_val,
            CASE WHEN v_new_qty <> 0 THEN round(v_new_val / v_new_qty, 8) ELSE 0 END);
END $$;


ALTER FUNCTION erp.fn_apply_stock_movement(p_doc_id bigint, p_line_id bigint, p_company bigint, p_date date, p_warehouse bigint, p_item bigint, p_batch bigint, p_qty_signed numeric, p_in_value numeric, p_allow_negative boolean, p_dp smallint, OUT o_value numeric) OWNER TO postgres;

--
-- TOC entry 598 (class 1255 OID 43091)
-- Name: fn_assert_entry_balanced(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_assert_entry_balanced(p_entry_id bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_t record;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM erp.journal_entries WHERE id = p_entry_id) THEN
        RETURN;   -- القيد محذوف (cascade)
    END IF;
    SELECT * INTO v_t FROM erp.fn_entry_totals(p_entry_id);
    IF v_t.o_debit <> v_t.o_credit THEN
        RAISE EXCEPTION 'القيد رقم % غير متوازن بالعملة المحلية: مدين % ≠ دائن %',
            p_entry_id, v_t.o_debit, v_t.o_credit USING ERRCODE = '23514';
    END IF;
END $$;


ALTER FUNCTION erp.fn_assert_entry_balanced(p_entry_id bigint) OWNER TO postgres;

--
-- TOC entry 783 (class 1255 OID 45644)
-- Name: fn_audit(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_audit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_old     jsonb;
    v_new     jsonb;
    v_old_chg jsonb;
    v_new_chg jsonb;
    v_ref     jsonb;
    v_noise   text[] := ARRAY['updated_at', 'last_login_at', 'failed_attempts', 'locked_until'];
BEGIN
    IF TG_OP IN ('UPDATE', 'DELETE') THEN
        v_old := to_jsonb(OLD) - 'password_hash';
    END IF;
    IF TG_OP IN ('INSERT', 'UPDATE') THEN
        v_new := to_jsonb(NEW) - 'password_hash';
    END IF;

    IF TG_OP = 'UPDATE' THEN
        SELECT COALESCE(jsonb_object_agg(n.key, n.value), '{}'::jsonb),
               COALESCE(jsonb_object_agg(n.key, o.value), '{}'::jsonb)
          INTO v_new_chg, v_old_chg
          FROM jsonb_each(v_new) n
          LEFT JOIN jsonb_each(v_old) o ON o.key = n.key
         WHERE n.value IS DISTINCT FROM o.value AND n.key <> ALL (v_noise);
        IF v_new_chg = '{}'::jsonb THEN
            RETURN NULL;                         -- لا تغيير جوهري
        END IF;
        v_old := v_old_chg;
        v_new := v_new_chg;
    END IF;

    v_ref := COALESCE(to_jsonb(NEW), to_jsonb(OLD));
    INSERT INTO erp.audit_log (company_id, user_id, table_name, record_id, action, old_data, new_data, txid)
    VALUES (CASE WHEN TG_TABLE_NAME = 'companies' THEN (v_ref->>'id')::bigint ELSE NULLIF(v_ref->>'company_id', '')::bigint END,
            erp.current_user_id(), TG_TABLE_NAME,
            COALESCE(v_ref->>'id', v_ref->>'company_id', v_ref->>'role_id', v_ref->>'user_id'),
            TG_OP, v_old, v_new, txid_current());
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_audit() OWNER TO postgres;

--
-- TOC entry 777 (class 1255 OID 49156)
-- Name: fn_balance_sheet(bigint, date, bigint, integer); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_balance_sheet(p_company bigint, p_as_of date, p_branch bigint DEFAULT NULL::bigint, p_level integer DEFAULT NULL::integer) RETURNS TABLE(section text, account_id bigint, code character varying, name_ar character varying, level smallint, is_group boolean, amount numeric)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_fy    date;
    v_prior numeric;
    v_cur   numeric;
BEGIN
    SELECT fy.start_date INTO v_fy FROM erp.fiscal_years fy
     WHERE fy.company_id = p_company AND p_as_of BETWEEN fy.start_date AND fy.end_date;
    v_fy := COALESCE(v_fy, date '1900-01-01');

    SELECT COALESCE(SUM(l.credit_local - l.debit_local) FILTER (WHERE e.entry_date <  v_fy), 0),
           COALESCE(SUM(l.credit_local - l.debit_local) FILTER (WHERE e.entry_date >= v_fy), 0)
      INTO v_prior, v_cur
      FROM erp.journal_entry_lines l
      JOIN erp.journal_entries e ON e.id = l.entry_id AND e.status <> 'draft'
      JOIN erp.accounts a ON a.id = l.account_id AND a.category IN ('revenue', 'expense')
     WHERE l.company_id = p_company AND e.entry_date <= p_as_of
       AND (p_branch IS NULL OR e.branch_id = p_branch);

    RETURN QUERY
    SELECT CASE tb.category WHEN 'asset' THEN 'assets' WHEN 'liability' THEN 'liabilities' ELSE 'equity' END,
           tb.account_id, tb.code, tb.name_ar, tb.level, tb.is_group,
           CASE tb.category WHEN 'asset' THEN tb.closing_debit - tb.closing_credit
                            ELSE tb.closing_credit - tb.closing_debit END
      FROM erp.fn_trial_balance(p_company, date '1900-01-01', p_as_of, p_branch, NULL, p_level, false) tb
     WHERE tb.category IN ('asset', 'liability', 'equity');

    RETURN QUERY SELECT 'equity'::text, NULL::bigint, NULL::varchar, 'أرباح (خسائر) السنوات السابقة'::varchar, NULL::smallint, false, v_prior;
    RETURN QUERY SELECT 'equity'::text, NULL::bigint, NULL::varchar, 'أرباح (خسائر) السنة الحالية'::varchar,   NULL::smallint, false, v_cur;
END $$;


ALTER FUNCTION erp.fn_balance_sheet(p_company bigint, p_as_of date, p_branch bigint, p_level integer) OWNER TO postgres;

--
-- TOC entry 608 (class 1255 OID 49157)
-- Name: fn_balance_sheet_check(bigint, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_balance_sheet_check(p_company bigint, p_as_of date, p_branch bigint DEFAULT NULL::bigint) RETURNS TABLE(total_assets numeric, total_liabilities numeric, total_equity numeric, difference numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT s.ta, s.tl, s.te, s.ta - s.tl - s.te
      FROM (SELECT COALESCE(SUM(b.amount) FILTER (WHERE b.section = 'assets'), 0)      AS ta,
                   COALESCE(SUM(b.amount) FILTER (WHERE b.section = 'liabilities'), 0) AS tl,
                   COALESCE(SUM(b.amount) FILTER (WHERE b.section = 'equity'), 0)      AS te
              FROM erp.fn_balance_sheet(p_company, p_as_of, p_branch, NULL) b
             WHERE NOT b.is_group) s
$$;


ALTER FUNCTION erp.fn_balance_sheet_check(p_company bigint, p_as_of date, p_branch bigint) OWNER TO postgres;

--
-- TOC entry 405 (class 1255 OID 43123)
-- Name: fn_base_decimals(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_base_decimals(p_company bigint) RETURNS smallint
    LANGUAGE sql STABLE
    AS $$
    SELECT c.decimal_places
      FROM erp.companies co JOIN erp.currencies c ON c.id = co.base_currency_id
     WHERE co.id = p_company
$$;


ALTER FUNCTION erp.fn_base_decimals(p_company bigint) OWNER TO postgres;

--
-- TOC entry 548 (class 1255 OID 43586)
-- Name: fn_convert_qty(bigint, numeric, bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_convert_qty(p_item bigint, p_qty numeric, p_from_unit bigint, p_to_unit bigint) RETURNS numeric
    LANGUAGE sql STABLE
    AS $$
    SELECT p_qty * f.factor_to_base / t.factor_to_base
      FROM erp.item_units f, erp.item_units t
     WHERE f.item_id = p_item AND f.unit_id = p_from_unit
       AND t.item_id = p_item AND t.unit_id = p_to_unit
$$;


ALTER FUNCTION erp.fn_convert_qty(p_item bigint, p_qty numeric, p_from_unit bigint, p_to_unit bigint) OWNER TO postgres;

--
-- TOC entry 509 (class 1255 OID 44594)
-- Name: fn_customer_balance(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_customer_balance(p_customer bigint) RETURNS numeric
    LANGUAGE sql STABLE
    AS $$
    SELECT COALESCE(SUM(debit_local - credit_local), 0) FROM erp.customer_ledger WHERE customer_id = p_customer
$$;


ALTER FUNCTION erp.fn_customer_balance(p_customer bigint) OWNER TO postgres;

--
-- TOC entry 753 (class 1255 OID 49160)
-- Name: fn_customer_statement(bigint, bigint, date, date); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_customer_statement(p_company bigint, p_customer bigint, p_from date, p_to date) RETURNS TABLE(row_type text, tx_date date, due_date date, doc_type character varying, doc_id bigint, description text, currency_id bigint, debit_fc numeric, credit_fc numeric, debit numeric, credit numeric, balance numeric)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE v_open numeric;
BEGIN
    SELECT COALESCE(SUM(l.debit_local - l.credit_local), 0) INTO v_open
      FROM erp.customer_ledger l
     WHERE l.company_id = p_company AND l.customer_id = p_customer AND l.entry_date < p_from;

    RETURN QUERY
    SELECT 'opening'::text, p_from, NULL::date, NULL::varchar, NULL::bigint, 'رصيد افتتاحي'::text,
           NULL::bigint, NULL::numeric, NULL::numeric, GREATEST(v_open, 0), GREATEST(-v_open, 0), v_open;

    RETURN QUERY
    SELECT 'entry'::text, l.entry_date, l.due_date, l.doc_type, l.doc_id, l.description,
           l.currency_id, l.debit_fc, l.credit_fc, l.debit_local, l.credit_local,
           v_open + SUM(l.debit_local - l.credit_local) OVER (ORDER BY l.entry_date, l.id)
      FROM erp.customer_ledger l
     WHERE l.company_id = p_company AND l.customer_id = p_customer AND l.entry_date BETWEEN p_from AND p_to
     ORDER BY l.entry_date, l.id;
END $$;


ALTER FUNCTION erp.fn_customer_statement(p_company bigint, p_customer bigint, p_from date, p_to date) OWNER TO postgres;

--
-- TOC entry 395 (class 1255 OID 62473)
-- Name: fn_depreciation_schedule(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_depreciation_schedule(p_asset bigint) RETURNS TABLE(o_period_end date, o_depreciation numeric, o_accumulated numeric, o_book_value numeric)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    a       record;
    v_dp    smallint;
    v_acc   numeric;
    v_done  integer;
    v_end   date;
    v_d     numeric;
    v_left  numeric;
    v_guard integer := 0;
BEGIN
    SELECT * INTO a FROM erp.fixed_assets WHERE id = p_asset;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الأصل غير موجود' USING ERRCODE = '23503';
    END IF;
    IF a.status = 'disposed' THEN
        RETURN;
    END IF;
    v_dp   := erp.fn_base_decimals(a.company_id);
    v_acc  := a.accumulated_depreciation;
    v_done := a.dep_months_done;
    v_end  := (date_trunc('month', a.in_service_date) + make_interval(months => v_done + 1) - interval '1 day')::date;

    LOOP
        v_left := a.cost - a.salvage_value - v_acc;
        EXIT WHEN v_left <= 0 OR v_guard > 1200;
        IF a.method = 'straight_line' THEN
            EXIT WHEN v_done >= a.life_months;
            v_d := CASE WHEN v_done + 1 >= a.life_months THEN v_left
                        ELSE LEAST(round((a.cost - a.salvage_value) / a.life_months, v_dp), v_left) END;
        ELSE
            v_d := LEAST(round((a.cost - v_acc) * a.declining_rate_pct / 1200, v_dp), v_left);
            EXIT WHEN v_d <= 0;
        END IF;
        v_acc   := v_acc + v_d;
        v_done  := v_done + 1;
        v_guard := v_guard + 1;
        RETURN QUERY SELECT v_end, v_d, v_acc, a.cost - v_acc;
        v_end := (date_trunc('month', v_end) + interval '2 months' - interval '1 day')::date;
    END LOOP;
END $$;


ALTER FUNCTION erp.fn_depreciation_schedule(p_asset bigint) OWNER TO postgres;

--
-- TOC entry 809 (class 1255 OID 45514)
-- Name: fn_enforcing(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_enforcing(p_company bigint) RETURNS boolean
    LANGUAGE sql STABLE
    AS $$
    SELECT COALESCE((SELECT enforce_permissions FROM erp.security_settings WHERE company_id = p_company), false)
$$;


ALTER FUNCTION erp.fn_enforcing(p_company bigint) OWNER TO postgres;

--
-- TOC entry 539 (class 1255 OID 43086)
-- Name: fn_entry_totals(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_entry_totals(p_entry_id bigint, OUT o_debit numeric, OUT o_credit numeric, OUT o_lines integer) RETURNS record
    LANGUAGE sql STABLE
    AS $$
    SELECT COALESCE(SUM(debit_local), 0), COALESCE(SUM(credit_local), 0), COUNT(*)::int
      FROM erp.journal_entry_lines WHERE entry_id = p_entry_id
$$;


ALTER FUNCTION erp.fn_entry_totals(p_entry_id bigint, OUT o_debit numeric, OUT o_credit numeric, OUT o_lines integer) OWNER TO postgres;

--
-- TOC entry 665 (class 1255 OID 62435)
-- Name: fn_fa_check_account(bigint, bigint, erp.account_category, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_fa_check_account(p_company bigint, p_account bigint, p_category erp.account_category, p_label text) RETURNS void
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    a record;
BEGIN
    IF p_account IS NULL THEN
        RETURN;
    END IF;
    SELECT company_id, category, is_group, is_active INTO a FROM erp.accounts WHERE id = p_account;
    IF NOT FOUND OR a.company_id <> p_company THEN
        RAISE EXCEPTION 'حساب % غير موجود في هذه الشركة', p_label USING ERRCODE = '23503';
    END IF;
    IF a.is_group OR NOT a.is_active OR a.category <> p_category THEN
        RAISE EXCEPTION 'حساب % يجب أن يكون حساباً فرعياً فعّالاً من تصنيف %', p_label, p_category USING ERRCODE = '23514';
    END IF;
END $$;


ALTER FUNCTION erp.fn_fa_check_account(p_company bigint, p_account bigint, p_category erp.account_category, p_label text) OWNER TO postgres;

--
-- TOC entry 785 (class 1255 OID 62436)
-- Name: fn_fa_depreciation_due(bigint, date); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_fa_depreciation_due(p_asset bigint, p_period_end date) RETURNS TABLE(o_months integer, o_amount numeric)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    a         record;
    v_dp      smallint;
    v_due     integer;
    v_missing integer;
    v_left    numeric;
    v_m       integer;
    v_amt     numeric := 0;
    v_book    numeric;
    v_d       numeric;
    i         integer;
BEGIN
    SELECT * INTO a FROM erp.fixed_assets WHERE id = p_asset;
    IF NOT FOUND OR a.status NOT IN ('active', 'fully_depreciated') THEN
        RETURN QUERY SELECT 0, 0::numeric;
        RETURN;
    END IF;
    v_dp := erp.fn_base_decimals(a.company_id);
    v_due := (extract(year FROM p_period_end)::int * 12 + extract(month FROM p_period_end)::int)
           - (extract(year FROM a.in_service_date)::int * 12 + extract(month FROM a.in_service_date)::int) + 1;
    v_missing := v_due - a.dep_months_done;
    v_left := a.cost - a.salvage_value - a.accumulated_depreciation;
    IF v_missing <= 0 OR v_left <= 0 THEN
        RETURN QUERY SELECT 0, 0::numeric;
        RETURN;
    END IF;

    IF a.method = 'straight_line' THEN
        v_m := LEAST(v_missing, a.life_months - a.dep_months_done);
        IF v_m <= 0 THEN
            RETURN QUERY SELECT 0, 0::numeric;
            RETURN;
        END IF;
        IF a.dep_months_done + v_m >= a.life_months THEN
            v_amt := v_left;            -- آخر قسط: الباقي كاملاً (يمتص فروق التقريب)
        ELSE
            v_amt := LEAST(round((a.cost - a.salvage_value) / a.life_months * v_m, v_dp), v_left);
        END IF;
    ELSE
        v_m := v_missing;
        v_book := a.cost - a.accumulated_depreciation;
        FOR i IN 1..v_missing LOOP
            v_d := LEAST(round(v_book * a.declining_rate_pct / 1200, v_dp), v_book - a.salvage_value);
            EXIT WHEN v_d <= 0;
            v_amt := v_amt + v_d;
            v_book := v_book - v_d;
        END LOOP;
    END IF;
    RETURN QUERY SELECT v_m, v_amt;
END $$;


ALTER FUNCTION erp.fn_fa_depreciation_due(p_asset bigint, p_period_end date) OWNER TO postgres;

--
-- TOC entry 546 (class 1255 OID 43587)
-- Name: fn_find_by_barcode(bigint, character varying); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_find_by_barcode(p_company bigint, p_barcode character varying) RETURNS TABLE(item_id bigint, item_unit_id bigint, factor_to_base numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT b.item_id, b.item_unit_id, u.factor_to_base
      FROM erp.item_barcodes b JOIN erp.item_units u ON u.id = b.item_unit_id
     WHERE b.company_id = p_company AND b.barcode = p_barcode
$$;


ALTER FUNCTION erp.fn_find_by_barcode(p_company bigint, p_barcode character varying) OWNER TO postgres;

--
-- TOC entry 623 (class 1255 OID 62472)
-- Name: fn_fixed_asset_register(bigint, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_fixed_asset_register(p_company bigint, p_as_of date, p_branch bigint DEFAULT NULL::bigint) RETURNS TABLE(o_asset_id bigint, o_asset_no character varying, o_name character varying, o_category_code character varying, o_branch_id bigint, o_acquisition_date date, o_in_service_date date, o_cost numeric, o_accumulated numeric, o_book_value numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT x.id, x.asset_no, x.name_ar, x.code, x.branch_id, x.acquisition_date, x.in_service_date,
           x.cost, x.acc, x.cost - x.acc
      FROM (
        SELECT a.id, a.asset_no, a.name_ar, c.code, a.branch_id, a.acquisition_date, a.in_service_date, a.cost,
               a.opening_accumulated + COALESCE((
                   SELECT sum(dl.amount)
                     FROM erp.depreciation_lines dl
                     JOIN erp.depreciation_runs r ON r.id = dl.run_id
                    WHERE dl.asset_id = a.id AND r.status = 'posted' AND r.period_end <= p_as_of), 0) AS acc
          FROM erp.fixed_assets a
          JOIN erp.fixed_asset_categories c ON c.id = a.category_id
         WHERE a.company_id = p_company
           AND a.status IN ('active', 'fully_depreciated', 'disposed')
           AND a.acquisition_date <= p_as_of
           AND (a.disposal_date IS NULL OR a.disposal_date > p_as_of)
           AND (p_branch IS NULL OR a.branch_id = p_branch)
      ) x
     ORDER BY x.asset_no
$$;


ALTER FUNCTION erp.fn_fixed_asset_register(p_company bigint, p_as_of date, p_branch bigint) OWNER TO postgres;

--
-- TOC entry 721 (class 1255 OID 62474)
-- Name: fn_fixed_assets_gl_check(bigint, date); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_fixed_assets_gl_check(p_company bigint, p_as_of date) RETURNS TABLE(o_category_code character varying, o_register_cost numeric, o_gl_cost numeric, o_cost_diff numeric, o_register_accum numeric, o_gl_accum numeric, o_accum_diff numeric)
    LANGUAGE sql STABLE
    AS $$
    WITH reg AS (
        SELECT a.category_id AS cat_id, sum(r.o_cost) AS cost, sum(r.o_accumulated) AS accum
          FROM erp.fn_fixed_asset_register(p_company, p_as_of) r
          JOIN erp.fixed_assets a ON a.id = r.o_asset_id
         GROUP BY a.category_id
    ), gl AS (
        SELECT l.account_id, sum(l.debit_local - l.credit_local) AS bal
          FROM erp.journal_entry_lines l
          JOIN erp.journal_entries e ON e.id = l.entry_id
         WHERE l.company_id = p_company AND e.status IN ('posted', 'reversed') AND e.entry_date <= p_as_of
         GROUP BY l.account_id
    )
    SELECT c.code,
           COALESCE(reg.cost, 0), COALESCE(g1.bal, 0), COALESCE(reg.cost, 0) - COALESCE(g1.bal, 0),
           COALESCE(reg.accum, 0), -COALESCE(g2.bal, 0), COALESCE(reg.accum, 0) + COALESCE(g2.bal, 0)
      FROM erp.fixed_asset_categories c
      LEFT JOIN reg ON reg.cat_id = c.id
      LEFT JOIN gl g1 ON g1.account_id = c.cost_account_id
      LEFT JOIN gl g2 ON g2.account_id = c.accum_account_id
     WHERE c.company_id = p_company
     ORDER BY c.code
$$;


ALTER FUNCTION erp.fn_fixed_assets_gl_check(p_company bigint, p_as_of date) OWNER TO postgres;

--
-- TOC entry 712 (class 1255 OID 45000)
-- Name: fn_format_doc_no(character varying, bigint, smallint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_format_doc_no(p_prefix character varying, p_no bigint, p_padding smallint DEFAULT 6) RETURNS character varying
    LANGUAGE sql IMMUTABLE
    AS $$
    SELECT COALESCE(p_prefix || '-', '') || lpad(p_no::text, p_padding, '0')
$$;


ALTER FUNCTION erp.fn_format_doc_no(p_prefix character varying, p_no bigint, p_padding smallint) OWNER TO postgres;

--
-- TOC entry 643 (class 1255 OID 42616)
-- Name: fn_fx_difference(numeric, numeric, numeric, integer); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_fx_difference(p_amount_fc numeric, p_original_rate numeric, p_settlement_rate numeric, p_decimals integer DEFAULT 4) RETURNS numeric
    LANGUAGE sql IMMUTABLE
    AS $$
    SELECT round(p_amount_fc * (p_settlement_rate - p_original_rate), p_decimals)
$$;


ALTER FUNCTION erp.fn_fx_difference(p_amount_fc numeric, p_original_rate numeric, p_settlement_rate numeric, p_decimals integer) OWNER TO postgres;

--
-- TOC entry 522 (class 1255 OID 49154)
-- Name: fn_income_statement(bigint, date, date, bigint, bigint, integer); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_income_statement(p_company bigint, p_from date, p_to date, p_branch bigint DEFAULT NULL::bigint, p_cost_center bigint DEFAULT NULL::bigint, p_level integer DEFAULT NULL::integer) RETURNS TABLE(account_id bigint, code character varying, name_ar character varying, level smallint, is_group boolean, category erp.account_category, amount numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT tb.account_id, tb.code, tb.name_ar, tb.level, tb.is_group, tb.category,
           CASE tb.category WHEN 'revenue' THEN tb.period_credit - tb.period_debit
                            ELSE tb.period_debit - tb.period_credit END
      FROM erp.fn_trial_balance_x(p_company, p_from, p_to, p_branch, p_cost_center, p_level, false, true) tb
     WHERE tb.category IN ('revenue', 'expense')
$$;


ALTER FUNCTION erp.fn_income_statement(p_company bigint, p_from date, p_to date, p_branch bigint, p_cost_center bigint, p_level integer) OWNER TO postgres;

--
-- TOC entry 799 (class 1255 OID 49155)
-- Name: fn_income_summary(bigint, date, date, bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_income_summary(p_company bigint, p_from date, p_to date, p_branch bigint DEFAULT NULL::bigint, p_cost_center bigint DEFAULT NULL::bigint) RETURNS TABLE(total_revenue numeric, total_expense numeric, net_profit numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT s.r, s.x, s.r - s.x
      FROM (SELECT COALESCE(SUM(l.credit_local - l.debit_local) FILTER (WHERE a.category = 'revenue'), 0) AS r,
                   COALESCE(SUM(l.debit_local - l.credit_local) FILTER (WHERE a.category = 'expense'), 0) AS x
              FROM erp.journal_entry_lines l
              JOIN erp.journal_entries e ON e.id = l.entry_id AND e.status <> 'draft' AND e.entry_type <> 'closing'
              JOIN erp.accounts a ON a.id = l.account_id
             WHERE l.company_id = p_company AND e.entry_date BETWEEN p_from AND p_to
               AND (p_branch IS NULL OR e.branch_id = p_branch)
               AND (p_cost_center IS NULL OR l.cost_center_id = p_cost_center)) s
$$;


ALTER FUNCTION erp.fn_income_summary(p_company bigint, p_from date, p_to date, p_branch bigint, p_cost_center bigint) OWNER TO postgres;

--
-- TOC entry 535 (class 1255 OID 49158)
-- Name: fn_item_card(bigint, bigint, date, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_item_card(p_company bigint, p_item bigint, p_from date, p_to date, p_warehouse bigint DEFAULT NULL::bigint) RETURNS TABLE(row_type text, tx_date date, warehouse_id bigint, doc_type text, doc_no bigint, batch_id bigint, qty_in numeric, qty_out numeric, unit_cost numeric, value_in numeric, value_out numeric, running_qty numeric, running_value numeric)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_q numeric;
    v_v numeric;
BEGIN
    SELECT COALESCE(SUM(sm.qty_signed), 0), COALESCE(SUM(sm.value_signed), 0) INTO v_q, v_v
      FROM erp.stock_movements sm
     WHERE sm.company_id = p_company AND sm.item_id = p_item AND sm.movement_date < p_from
       AND (p_warehouse IS NULL OR sm.warehouse_id = p_warehouse);

    RETURN QUERY
    SELECT 'opening'::text, p_from, p_warehouse, NULL::text, NULL::bigint, NULL::bigint,
           NULL::numeric, NULL::numeric, NULL::numeric, NULL::numeric, NULL::numeric, v_q, v_v;

    RETURN QUERY
    SELECT 'movement'::text, sm.movement_date, sm.warehouse_id, sd.doc_type::text, sd.doc_no, sm.batch_id,
           GREATEST(sm.qty_signed, 0), GREATEST(-sm.qty_signed, 0), sm.unit_cost,
           GREATEST(sm.value_signed, 0), GREATEST(-sm.value_signed, 0),
           v_q + SUM(sm.qty_signed) OVER w, v_v + SUM(sm.value_signed) OVER w
      FROM erp.stock_movements sm
      JOIN erp.stock_documents sd ON sd.id = sm.document_id
     WHERE sm.company_id = p_company AND sm.item_id = p_item AND sm.movement_date BETWEEN p_from AND p_to
       AND (p_warehouse IS NULL OR sm.warehouse_id = p_warehouse)
    WINDOW w AS (ORDER BY sm.movement_date, sm.id)
     ORDER BY sm.movement_date, sm.id;
END $$;


ALTER FUNCTION erp.fn_item_card(p_company bigint, p_item bigint, p_from date, p_to date, p_warehouse bigint) OWNER TO postgres;

--
-- TOC entry 580 (class 1255 OID 62117)
-- Name: fn_item_live_cost(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_item_live_cost(p_warehouse bigint, p_item bigint) RETURNS numeric
    LANGUAGE sql STABLE
    AS $$
    SELECT COALESCE((SELECT CASE WHEN qty_on_hand > 0 THEN round(total_value / qty_on_hand, 8) ELSE last_avg_cost END
                       FROM erp.stock_balances
                      WHERE warehouse_id = p_warehouse AND item_id = p_item), 0)
$$;


ALTER FUNCTION erp.fn_item_live_cost(p_warehouse bigint, p_item bigint) OWNER TO postgres;

--
-- TOC entry 532 (class 1255 OID 62116)
-- Name: fn_item_live_qty(bigint, bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_item_live_qty(p_warehouse bigint, p_item bigint, p_batch bigint DEFAULT NULL::bigint) RETURNS numeric
    LANGUAGE sql STABLE
    AS $$
    SELECT COALESCE(
        CASE
            WHEN p_batch IS NOT NULL THEN
                (SELECT qty_on_hand FROM erp.stock_batch_balances
                  WHERE warehouse_id = p_warehouse AND item_id = p_item AND batch_id = p_batch)
            WHEN EXISTS (SELECT 1 FROM erp.items WHERE id = p_item AND track_batch) THEN 0
            ELSE
                (SELECT qty_on_hand FROM erp.stock_balances
                  WHERE warehouse_id = p_warehouse AND item_id = p_item)
        END, 0)
$$;


ALTER FUNCTION erp.fn_item_live_qty(p_warehouse bigint, p_item bigint, p_batch bigint) OWNER TO postgres;

--
-- TOC entry 495 (class 1255 OID 45248)
-- Name: fn_item_open(text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_item_open(p_party text, p_ledger bigint, OUT o_party_id bigint, OUT o_currency_id bigint, OUT o_side text, OUT o_open_fc numeric, OUT o_open_local numeric) RETURNS record
    LANGUAGE sql STABLE
    AS $$
    SELECT party_id, currency_id, side, open_fc, open_local
      FROM erp.v_party_open_items WHERE party_type = p_party AND ledger_id = p_ledger
$$;


ALTER FUNCTION erp.fn_item_open(p_party text, p_ledger bigint, OUT o_party_id bigint, OUT o_currency_id bigint, OUT o_side text, OUT o_open_fc numeric, OUT o_open_local numeric) OWNER TO postgres;

--
-- TOC entry 581 (class 1255 OID 42823)
-- Name: fn_next_doc_no(bigint, character varying, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_next_doc_no(p_company bigint, p_doc_type character varying, p_fy bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE v_no bigint;
BEGIN
    INSERT INTO erp.document_sequences AS s (company_id, doc_type, fiscal_year_id, last_no)
    VALUES (p_company, p_doc_type, p_fy, 1)
    ON CONFLICT (company_id, doc_type, fiscal_year_id) DO UPDATE SET last_no = s.last_no + 1
    RETURNING s.last_no INTO v_no;
    RETURN v_no;
END $$;


ALTER FUNCTION erp.fn_next_doc_no(p_company bigint, p_doc_type character varying, p_fy bigint) OWNER TO postgres;

--
-- TOC entry 678 (class 1255 OID 45632)
-- Name: fn_perm_for(text, jsonb); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_perm_for(p_table text, p_row jsonb) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $$
    SELECT CASE p_table
        WHEN 'journal_entries' THEN
            CASE WHEN p_row->>'status' = 'posted' AND p_row->>'entry_type' = 'manual' THEN 'accounting.journal.post' END
        WHEN 'financial_vouchers' THEN
            CASE p_row->>'status' WHEN 'posted' THEN 'accounting.voucher.post' WHEN 'cancelled' THEN 'accounting.voucher.cancel' END
        WHEN 'purchase_requests' THEN
            CASE WHEN p_row->>'status' = 'approved' THEN 'purchases.request.approve' END
        WHEN 'purchase_documents' THEN
            CASE p_row->>'status'
                WHEN 'approved'  THEN 'purchases.order.approve'
                WHEN 'cancelled' THEN 'purchases.order.cancel'
                WHEN 'posted'    THEN CASE WHEN p_row->>'doc_type' = 'return' THEN 'purchases.return.post' ELSE 'purchases.invoice.post' END
            END
        WHEN 'sales_documents' THEN
            CASE p_row->>'status'
                WHEN 'approved'  THEN 'sales.order.approve'
                WHEN 'cancelled' THEN 'sales.order.cancel'
                WHEN 'posted'    THEN CASE WHEN p_row->>'doc_type' = 'return' THEN 'sales.return.post' ELSE 'sales.invoice.post' END
            END
        WHEN 'pos_sessions' THEN
            CASE p_row->>'status' WHEN 'open' THEN 'pos.session.open' WHEN 'closed' THEN 'pos.session.close' END
        WHEN 'fiscal_periods' THEN 'accounting.period.manage'
    END
$$;


ALTER FUNCTION erp.fn_perm_for(p_table text, p_row jsonb) OWNER TO postgres;

--
-- TOC entry 526 (class 1255 OID 44975)
-- Name: fn_pos_expected_cash(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_pos_expected_cash(p_session bigint) RETURNS numeric
    LANGUAGE sql STABLE
    AS $$
    SELECT s.opening_cash
         + COALESCE((SELECT SUM(CASE d.doc_type WHEN 'invoice' THEN p.amount_local ELSE -p.amount_local END)
                       FROM erp.sales_document_payments p
                       JOIN erp.sales_documents d ON d.id = p.document_id
                       JOIN erp.payment_methods m ON m.id = p.payment_method_id
                      WHERE d.pos_session_id = s.id AND d.status = 'posted' AND m.kind = 'cash'), 0)
         + COALESCE((SELECT SUM(CASE movement_type WHEN 'cash_in' THEN amount ELSE -amount END)
                       FROM erp.pos_cash_movements WHERE session_id = s.id), 0)
      FROM erp.pos_sessions s WHERE s.id = p_session
$$;


ALTER FUNCTION erp.fn_pos_expected_cash(p_session bigint) OWNER TO postgres;

--
-- TOC entry 467 (class 1255 OID 43645)
-- Name: fn_pur_je_line(bigint, bigint, bigint, bigint, bigint, character, numeric, numeric, numeric, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_pur_je_line(p_entry bigint, p_company bigint, p_account bigint, p_cc bigint, p_currency bigint, p_side character, p_fc numeric, p_local numeric, p_rate numeric, p_desc text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF p_fc IS NULL OR p_fc <= 0 THEN
        RETURN;
    END IF;
    INSERT INTO erp.journal_entry_lines (company_id, entry_id, account_id, cost_center_id, currency_id,
                                         debit_fc, credit_fc, exchange_rate, debit_local, credit_local, description)
    VALUES (p_company, p_entry, p_account, p_cc, p_currency,
            CASE WHEN p_side = 'D' THEN p_fc ELSE 0 END,
            CASE WHEN p_side = 'C' THEN p_fc ELSE 0 END,
            p_rate,
            CASE WHEN p_side = 'D' THEN p_local END,
            CASE WHEN p_side = 'C' THEN p_local END,
            p_desc);
END $$;


ALTER FUNCTION erp.fn_pur_je_line(p_entry bigint, p_company bigint, p_account bigint, p_cc bigint, p_currency bigint, p_side character, p_fc numeric, p_local numeric, p_rate numeric, p_desc text) OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 44195)
-- Name: fn_recalc_purchase_totals(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_recalc_purchase_totals(p_doc bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_net numeric;
    v_tax numeric;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM erp.purchase_documents WHERE id = p_doc AND status = 'draft') THEN
        RETURN;
    END IF;
    SELECT COALESCE(SUM(net_fc), 0), COALESCE(SUM(tax_fc), 0) INTO v_net, v_tax
      FROM erp.purchase_document_lines WHERE document_id = p_doc;
    UPDATE erp.purchase_documents SET subtotal_fc = v_net, tax_fc = v_tax WHERE id = p_doc;   -- الباقي يُحسب بالـ trigger
END $$;


ALTER FUNCTION erp.fn_recalc_purchase_totals(p_doc bigint) OWNER TO postgres;

--
-- TOC entry 451 (class 1255 OID 44201)
-- Name: fn_refresh_order_status(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_refresh_order_status(p_order bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_all boolean;
    v_any boolean;
BEGIN
    SELECT bool_and(settled_qty_base >= qty_base), bool_or(settled_qty_base > 0) INTO v_all, v_any
      FROM erp.purchase_document_lines WHERE document_id = p_order;
    PERFORM set_config('erp.purch_write', 'on', true);
    UPDATE erp.purchase_documents
       SET status = CASE WHEN v_all THEN 'received'::erp.purchase_doc_status
                         WHEN v_any THEN 'partially_received'::erp.purchase_doc_status
                         ELSE status END
     WHERE id = p_order AND status IN ('approved', 'partially_received');
END $$;


ALTER FUNCTION erp.fn_refresh_order_status(p_order bigint) OWNER TO postgres;

--
-- TOC entry 812 (class 1255 OID 44968)
-- Name: fn_refresh_sales_order_status(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_refresh_sales_order_status(p_order bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_all boolean;
    v_any boolean;
BEGIN
    SELECT bool_and(settled_qty_base >= qty_base), bool_or(settled_qty_base > 0) INTO v_all, v_any
      FROM erp.sales_document_lines WHERE document_id = p_order;
    PERFORM set_config('erp.sales_write', 'on', true);
    UPDATE erp.sales_documents
       SET status = CASE WHEN v_all THEN 'delivered'::erp.sales_doc_status
                         WHEN v_any THEN 'partially_delivered'::erp.sales_doc_status
                         ELSE status END
     WHERE id = p_order AND status IN ('approved', 'partially_delivered');
END $$;


ALTER FUNCTION erp.fn_refresh_sales_order_status(p_order bigint) OWNER TO postgres;

--
-- TOC entry 578 (class 1255 OID 43644)
-- Name: fn_resolve_batch(bigint, bigint, bigint, character varying, date, date, boolean, integer); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_resolve_batch(p_company bigint, p_item bigint, p_batch_id bigint, p_batch_no character varying, p_mfg date, p_exp date, p_create boolean, p_line integer) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    i       record;
    v_batch bigint := p_batch_id;
    v_exp   date;
BEGIN
    SELECT track_batch, track_expiry INTO i FROM erp.items WHERE id = p_item;
    IF NOT i.track_batch THEN
        RETURN NULL;
    END IF;
    IF v_batch IS NULL THEN
        IF p_batch_no IS NULL THEN
            RAISE EXCEPTION 'السطر %: الصنف يتطلب رقم تشغيلة', p_line USING ERRCODE = '23514';
        END IF;
        SELECT id INTO v_batch FROM erp.item_batches
         WHERE company_id = p_company AND item_id = p_item AND batch_no = p_batch_no;
        IF v_batch IS NULL THEN
            IF NOT p_create THEN
                RAISE EXCEPTION 'السطر %: التشغيلة % غير موجودة', p_line, p_batch_no USING ERRCODE = '23514';
            END IF;
            INSERT INTO erp.item_batches (company_id, item_id, batch_no, manufacture_date, expiry_date)
            VALUES (p_company, p_item, p_batch_no, p_mfg, p_exp) RETURNING id INTO v_batch;
        END IF;
    END IF;
    IF i.track_expiry THEN
        SELECT expiry_date INTO v_exp FROM erp.item_batches WHERE id = v_batch;
        IF v_exp IS NULL THEN
            RAISE EXCEPTION 'السطر %: تاريخ انتهاء الصلاحية مطلوب', p_line USING ERRCODE = '23514';
        END IF;
    END IF;
    RETURN v_batch;
END $$;


ALTER FUNCTION erp.fn_resolve_batch(p_company bigint, p_item bigint, p_batch_id bigint, p_batch_no character varying, p_mfg date, p_exp date, p_create boolean, p_line integer) OWNER TO postgres;

--
-- TOC entry 472 (class 1255 OID 43643)
-- Name: fn_resolve_rate(bigint, bigint, date, numeric); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_resolve_rate(p_company bigint, p_currency bigint, p_date date, p_rate numeric DEFAULT NULL::numeric) RETURNS numeric
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_base bigint;
    c      record;
    v      numeric;
BEGIN
    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = p_company;
    IF p_currency = v_base THEN
        RETURN 1;
    END IF;
    SELECT is_active, default_rate, min_rate, max_rate INTO c
      FROM erp.company_currencies WHERE company_id = p_company AND currency_id = p_currency;
    IF NOT FOUND OR NOT c.is_active THEN
        RAISE EXCEPTION 'العملة غير مفعّلة للشركة' USING ERRCODE = '23514';
    END IF;
    v := p_rate;
    IF v IS NULL THEN
        SELECT r.rate INTO v FROM erp.exchange_rates r
         WHERE r.company_id = p_company AND r.currency_id = p_currency AND r.rate_date <= p_date
         ORDER BY r.rate_date DESC LIMIT 1;
        v := COALESCE(v, c.default_rate);
    END IF;
    IF v < c.min_rate OR v > c.max_rate THEN
        RAISE EXCEPTION 'سعر الصرف % خارج الحدود المسموحة [% - %]', v, c.min_rate, c.max_rate USING ERRCODE = '23514';
    END IF;
    RETURN v;
END $$;


ALTER FUNCTION erp.fn_resolve_rate(p_company bigint, p_currency bigint, p_date date, p_rate numeric) OWNER TO postgres;

--
-- TOC entry 629 (class 1255 OID 44960)
-- Name: fn_sal_recalc_totals(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_sal_recalc_totals(p_doc bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_net numeric;
    v_tax numeric;
BEGIN
    IF NOT EXISTS (SELECT 1 FROM erp.sales_documents WHERE id = p_doc AND status = 'draft') THEN
        RETURN;
    END IF;
    SELECT COALESCE(SUM(net_fc), 0), COALESCE(SUM(tax_fc), 0) INTO v_net, v_tax
      FROM erp.sales_document_lines WHERE document_id = p_doc;
    UPDATE erp.sales_documents SET subtotal_fc = v_net, tax_fc = v_tax WHERE id = p_doc;
END $$;


ALTER FUNCTION erp.fn_sal_recalc_totals(p_doc bigint) OWNER TO postgres;

--
-- TOC entry 756 (class 1255 OID 44342)
-- Name: fn_sales_price(bigint, bigint, bigint, numeric, date, bigint, numeric); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_sales_price(p_company bigint, p_price_list bigint, p_item_unit bigint, p_qty numeric, p_date date, p_currency bigint, p_rate numeric) RETURNS numeric
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_price  numeric;
    v_cur    bigint;
    v_base   bigint;
BEGIN
    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = p_company;
    IF p_price_list IS NOT NULL THEN
        SELECT pli.price, pl.currency_id INTO v_price, v_cur
          FROM erp.price_list_items pli JOIN erp.price_lists pl ON pl.id = pli.price_list_id
         WHERE pli.price_list_id = p_price_list AND pli.item_unit_id = p_item_unit AND pli.min_qty <= p_qty
           AND pl.is_active AND (pl.valid_from IS NULL OR pl.valid_from <= p_date) AND (pl.valid_to IS NULL OR pl.valid_to >= p_date)
         ORDER BY pli.min_qty DESC LIMIT 1;
    END IF;
    IF v_price IS NULL THEN
        SELECT sale_price INTO v_price FROM erp.item_units WHERE id = p_item_unit;
        v_cur := v_base;
    END IF;
    IF v_cur = p_currency THEN
        RETURN round(v_price, 6);
    END IF;
    RETURN round(v_price * erp.fn_resolve_rate(p_company, v_cur, p_date) / p_rate, 6);
END $$;


ALTER FUNCTION erp.fn_sales_price(p_company bigint, p_price_list bigint, p_item_unit bigint, p_qty numeric, p_date date, p_currency bigint, p_rate numeric) OWNER TO postgres;

--
-- TOC entry 442 (class 1255 OID 49162)
-- Name: fn_sales_profit(bigint, date, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_sales_profit(p_company bigint, p_from date, p_to date, p_branch bigint DEFAULT NULL::bigint) RETURNS TABLE(item_id bigint, item_code character varying, item_name character varying, qty_base numeric, net_sales numeric, cogs numeric, profit numeric, margin_pct numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT i.id, i.code, i.name_ar,
           SUM(s.sgn * l.qty_base), SUM(s.sgn * l.net_local), SUM(s.sgn * l.cogs_local),
           SUM(s.sgn * (l.net_local - l.cogs_local)),
           CASE WHEN SUM(s.sgn * l.net_local) <> 0
                THEN round(100 * SUM(s.sgn * (l.net_local - l.cogs_local)) / SUM(s.sgn * l.net_local), 2) END
      FROM erp.sales_document_lines l
      JOIN erp.sales_documents d ON d.id = l.document_id AND d.status = 'posted' AND d.doc_type IN ('invoice', 'return')
      CROSS JOIN LATERAL (SELECT CASE WHEN d.doc_type = 'invoice' THEN 1 ELSE -1 END AS sgn) s
      JOIN erp.items i ON i.id = l.item_id
     WHERE d.company_id = p_company AND d.doc_date BETWEEN p_from AND p_to
       AND (p_branch IS NULL OR d.branch_id = p_branch)
     GROUP BY i.id, i.code, i.name_ar
     ORDER BY i.code
$$;


ALTER FUNCTION erp.fn_sales_profit(p_company bigint, p_from date, p_to date, p_branch bigint) OWNER TO postgres;

--
-- TOC entry 612 (class 1255 OID 45270)
-- Name: fn_set_next_voucher_no(bigint, character varying, bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_set_next_voucher_no(p_company bigint, p_type_code character varying, p_fiscal_year bigint, p_next_no bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE v_max bigint;
BEGIN
    SELECT COALESCE(MAX(v.voucher_no), 0) INTO v_max
      FROM erp.financial_vouchers v JOIN erp.voucher_types t ON t.id = v.voucher_type_id
     WHERE v.company_id = p_company AND t.code = p_type_code AND v.fiscal_year_id = p_fiscal_year;
    IF p_next_no <= v_max THEN
        RAISE EXCEPTION 'الرقم التالي يجب أن يكون أكبر من آخر رقم مستخدم (%)', v_max USING ERRCODE = '23514';
    END IF;
    INSERT INTO erp.document_sequences (company_id, doc_type, fiscal_year_id, last_no)
    VALUES (p_company, 'VCH-' || p_type_code, p_fiscal_year, p_next_no - 1)
    ON CONFLICT (company_id, doc_type, fiscal_year_id) DO UPDATE SET last_no = EXCLUDED.last_no;
END $$;


ALTER FUNCTION erp.fn_set_next_voucher_no(p_company bigint, p_type_code character varying, p_fiscal_year bigint, p_next_no bigint) OWNER TO postgres;

--
-- TOC entry 702 (class 1255 OID 42615)
-- Name: fn_set_updated_at(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_set_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at := now();
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_set_updated_at() OWNER TO postgres;

--
-- TOC entry 412 (class 1255 OID 62147)
-- Name: fn_stock_adjustment_report(bigint, date, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_stock_adjustment_report(p_company bigint, p_from date, p_to date, p_warehouse bigint DEFAULT NULL::bigint) RETURNS TABLE(count_no bigint, count_date date, warehouse_code character varying, item_code character varying, item_name character varying, batch_no character varying, system_qty numeric, counted_qty numeric, diff_qty numeric, diff_value numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT v.count_no, v.count_date, v.warehouse_code, v.item_code, v.item_name, v.batch_no,
           v.system_qty, v.counted_qty, v.diff_qty, v.diff_value
      FROM erp.v_stock_count_variance v
      JOIN erp.stock_counts sc ON sc.id = v.count_id
     WHERE v.company_id = p_company AND v.status = 'posted'
       AND v.count_date BETWEEN p_from AND p_to
       AND (p_warehouse IS NULL OR sc.warehouse_id = p_warehouse)
       AND v.diff_qty <> 0
     ORDER BY v.count_date, v.count_no, v.item_code
$$;


ALTER FUNCTION erp.fn_stock_adjustment_report(p_company bigint, p_from date, p_to date, p_warehouse bigint) OWNER TO postgres;

--
-- TOC entry 514 (class 1255 OID 62146)
-- Name: fn_stock_count_sheet(bigint, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_stock_count_sheet(p_count bigint, p_blind boolean DEFAULT true) RETURNS TABLE(line_no integer, item_code character varying, item_name character varying, base_unit character varying, batch_no character varying, expiry_date date, system_qty numeric, counted_qty numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT scl.line_no, i.code, i.name_ar, u.code,
           COALESCE(b.batch_no, scl.batch_no), COALESCE(b.expiry_date, scl.expiry_date),
           CASE WHEN p_blind THEN NULL ELSE scl.system_qty END,
           scl.counted_qty
      FROM erp.stock_count_lines scl
      JOIN erp.items i ON i.id = scl.item_id
      JOIN erp.units u ON u.id = i.base_unit_id
      LEFT JOIN erp.item_batches b ON b.id = scl.batch_id
     WHERE scl.count_id = p_count
     ORDER BY scl.line_no
$$;


ALTER FUNCTION erp.fn_stock_count_sheet(p_count bigint, p_blind boolean) OWNER TO postgres;

--
-- TOC entry 806 (class 1255 OID 49159)
-- Name: fn_stock_valuation(bigint, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_stock_valuation(p_company bigint, p_as_of date, p_warehouse bigint DEFAULT NULL::bigint) RETURNS TABLE(warehouse_id bigint, warehouse_code character varying, item_id bigint, item_code character varying, item_name character varying, qty numeric, stock_value numeric, avg_cost numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT sm.warehouse_id, w.code, sm.item_id, i.code, i.name_ar,
           SUM(sm.qty_signed), SUM(sm.value_signed),
           CASE WHEN SUM(sm.qty_signed) <> 0 THEN round(SUM(sm.value_signed) / SUM(sm.qty_signed), 8) ELSE 0 END
      FROM erp.stock_movements sm
      JOIN erp.warehouses w ON w.id = sm.warehouse_id
      JOIN erp.items i      ON i.id = sm.item_id
     WHERE sm.company_id = p_company AND sm.movement_date <= p_as_of
       AND (p_warehouse IS NULL OR sm.warehouse_id = p_warehouse)
     GROUP BY sm.warehouse_id, w.code, sm.item_id, i.code, i.name_ar
    HAVING SUM(sm.qty_signed) <> 0 OR SUM(sm.value_signed) <> 0
     ORDER BY w.code, i.code
$$;


ALTER FUNCTION erp.fn_stock_valuation(p_company bigint, p_as_of date, p_warehouse bigint) OWNER TO postgres;

--
-- TOC entry 498 (class 1255 OID 43812)
-- Name: fn_supplier_balance(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_supplier_balance(p_supplier bigint) RETURNS numeric
    LANGUAGE sql STABLE
    AS $$
    SELECT COALESCE(SUM(credit_local - debit_local), 0) FROM erp.supplier_ledger WHERE supplier_id = p_supplier
$$;


ALTER FUNCTION erp.fn_supplier_balance(p_supplier bigint) OWNER TO postgres;

--
-- TOC entry 616 (class 1255 OID 49161)
-- Name: fn_supplier_statement(bigint, bigint, date, date); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_supplier_statement(p_company bigint, p_supplier bigint, p_from date, p_to date) RETURNS TABLE(row_type text, tx_date date, due_date date, doc_type character varying, doc_id bigint, description text, currency_id bigint, debit_fc numeric, credit_fc numeric, debit numeric, credit numeric, balance numeric)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE v_open numeric;
BEGIN
    SELECT COALESCE(SUM(l.credit_local - l.debit_local), 0) INTO v_open
      FROM erp.supplier_ledger l
     WHERE l.company_id = p_company AND l.supplier_id = p_supplier AND l.entry_date < p_from;

    RETURN QUERY
    SELECT 'opening'::text, p_from, NULL::date, NULL::varchar, NULL::bigint, 'رصيد افتتاحي'::text,
           NULL::bigint, NULL::numeric, NULL::numeric, GREATEST(-v_open, 0), GREATEST(v_open, 0), v_open;

    RETURN QUERY
    SELECT 'entry'::text, l.entry_date, l.due_date, l.doc_type, l.doc_id, l.description,
           l.currency_id, l.debit_fc, l.credit_fc, l.debit_local, l.credit_local,
           v_open + SUM(l.credit_local - l.debit_local) OVER (ORDER BY l.entry_date, l.id)
      FROM erp.supplier_ledger l
     WHERE l.company_id = p_company AND l.supplier_id = p_supplier AND l.entry_date BETWEEN p_from AND p_to
     ORDER BY l.entry_date, l.id;
END $$;


ALTER FUNCTION erp.fn_supplier_statement(p_company bigint, p_supplier bigint, p_from date, p_to date) OWNER TO postgres;

--
-- TOC entry 547 (class 1255 OID 42894)
-- Name: fn_trg_accounts_subtree(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_accounts_subtree() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE erp.accounts a
       SET path = NEW.path || substr(a.path, length(OLD.path) + 1),
           level = a.level + (NEW.level - OLD.level)
     WHERE a.company_id = NEW.company_id AND a.id <> NEW.id AND a.path LIKE OLD.path || '%';
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_accounts_subtree() OWNER TO postgres;

--
-- TOC entry 635 (class 1255 OID 42893)
-- Name: fn_trg_accounts_tree(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_accounts_tree() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE p record;
BEGIN
    IF TG_OP = 'UPDATE' THEN
        IF NEW.is_group AND NOT OLD.is_group
           AND EXISTS (SELECT 1 FROM erp.journal_entry_lines WHERE account_id = NEW.id) THEN
            RAISE EXCEPTION 'لا يمكن تحويل حساب عليه حركات إلى حساب رئيسي' USING ERRCODE = '23514';
        END IF;
        IF OLD.is_group AND NOT NEW.is_group
           AND EXISTS (SELECT 1 FROM erp.accounts WHERE parent_id = NEW.id) THEN
            RAISE EXCEPTION 'لا يمكن تحويل حساب رئيسي له فروع إلى حساب فرعي' USING ERRCODE = '23514';
        END IF;
    END IF;

    IF TG_OP = 'INSERT' OR NEW.parent_id IS DISTINCT FROM OLD.parent_id THEN
        IF NEW.parent_id IS NULL THEN
            NEW.level := 1;
            NEW.path  := '/' || NEW.id || '/';
        ELSE
            SELECT level, path, is_group INTO p FROM erp.accounts WHERE id = NEW.parent_id;
            IF NOT FOUND THEN
                RAISE EXCEPTION 'الحساب الأب غير موجود' USING ERRCODE = '23503';
            END IF;
            IF NOT p.is_group THEN
                RAISE EXCEPTION 'الحساب الأب يجب أن يكون حساباً رئيسياً (is_group)' USING ERRCODE = '23514';
            END IF;
            IF p.path LIKE '%/' || NEW.id || '/%' THEN
                RAISE EXCEPTION 'حلقة مفرغة في شجرة الحسابات' USING ERRCODE = '23514';
            END IF;
            NEW.level := p.level + 1;
            NEW.path  := p.path || NEW.id || '/';
        END IF;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_accounts_tree() OWNER TO postgres;

--
-- TOC entry 540 (class 1255 OID 43092)
-- Name: fn_trg_balance_guard(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_balance_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_TABLE_NAME = 'journal_entries' THEN
        PERFORM erp.fn_assert_entry_balanced(NEW.id);
    ELSE
        IF TG_OP IN ('INSERT', 'UPDATE') THEN
            PERFORM erp.fn_assert_entry_balanced(NEW.entry_id);
        END IF;
        IF TG_OP = 'DELETE' OR (TG_OP = 'UPDATE' AND OLD.entry_id <> NEW.entry_id) THEN
            PERFORM erp.fn_assert_entry_balanced(OLD.entry_id);
        END IF;
    END IF;
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_balance_guard() OWNER TO postgres;

--
-- TOC entry 554 (class 1255 OID 57455)
-- Name: fn_trg_cheques_guard(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_cheques_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        RAISE EXCEPTION 'لا يمكن حذف شيك؛ استخدم void_cheque' USING ERRCODE = '23514';
    END IF;
    IF current_setting('erp.cheque_write', true) IS DISTINCT FROM 'on' THEN
        RAISE EXCEPTION 'تتغير بيانات الشيك عبر دوال الشيكات فقط' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_cheques_guard() OWNER TO postgres;

--
-- TOC entry 794 (class 1255 OID 42754)
-- Name: fn_trg_company_base_currency(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_company_base_currency() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'UPDATE' AND NEW.base_currency_id <> OLD.base_currency_id
       AND EXISTS (SELECT 1 FROM erp.journal_entries WHERE company_id = OLD.id) THEN
        RAISE EXCEPTION 'لا يمكن تغيير العملة المحلية بعد وجود قيود محاسبية' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_company_base_currency() OWNER TO postgres;

--
-- TOC entry 587 (class 1255 OID 42755)
-- Name: fn_trg_company_base_currency_row(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_company_base_currency_row() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO erp.company_currencies (company_id, currency_id, default_rate, min_rate, max_rate)
    VALUES (NEW.id, NEW.base_currency_id, 1, 1, 1)
    ON CONFLICT (company_id, currency_id) DO NOTHING;
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_company_base_currency_row() OWNER TO postgres;

--
-- TOC entry 461 (class 1255 OID 57351)
-- Name: fn_trg_company_settings_re(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_company_settings_re() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE a record;
BEGIN
    IF NEW.retained_earnings_account_id IS NOT NULL THEN
        SELECT category, is_group, is_active INTO a FROM erp.accounts WHERE id = NEW.retained_earnings_account_id;
        IF a.category <> 'equity' OR a.is_group OR NOT a.is_active THEN
            RAISE EXCEPTION 'حساب الأرباح المحتجزة يجب أن يكون حساب حقوق ملكية فرعياً وفعّالاً' USING ERRCODE = '23514';
        END IF;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_company_settings_re() OWNER TO postgres;

--
-- TOC entry 415 (class 1255 OID 42936)
-- Name: fn_trg_cost_centers_subtree(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_cost_centers_subtree() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE erp.cost_centers c
       SET path = NEW.path || substr(c.path, length(OLD.path) + 1),
           level = c.level + (NEW.level - OLD.level)
     WHERE c.company_id = NEW.company_id AND c.id <> NEW.id AND c.path LIKE OLD.path || '%';
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_cost_centers_subtree() OWNER TO postgres;

--
-- TOC entry 619 (class 1255 OID 42935)
-- Name: fn_trg_cost_centers_tree(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_cost_centers_tree() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE p record;
BEGIN
    IF TG_OP = 'UPDATE' THEN
        IF NEW.is_group AND NOT OLD.is_group
           AND EXISTS (SELECT 1 FROM erp.journal_entry_lines WHERE cost_center_id = NEW.id) THEN
            RAISE EXCEPTION 'لا يمكن تحويل مركز تكلفة عليه حركات إلى مركز رئيسي' USING ERRCODE = '23514';
        END IF;
        IF OLD.is_group AND NOT NEW.is_group
           AND EXISTS (SELECT 1 FROM erp.cost_centers WHERE parent_id = NEW.id) THEN
            RAISE EXCEPTION 'لا يمكن تحويل مركز رئيسي له فروع إلى فرعي' USING ERRCODE = '23514';
        END IF;
    END IF;

    IF TG_OP = 'INSERT' OR NEW.parent_id IS DISTINCT FROM OLD.parent_id THEN
        IF NEW.parent_id IS NULL THEN
            NEW.level := 1;
            NEW.path  := '/' || NEW.id || '/';
        ELSE
            SELECT level, path, is_group INTO p FROM erp.cost_centers WHERE id = NEW.parent_id;
            IF NOT FOUND THEN
                RAISE EXCEPTION 'مركز التكلفة الأب غير موجود' USING ERRCODE = '23503';
            END IF;
            IF NOT p.is_group THEN
                RAISE EXCEPTION 'مركز التكلفة الأب يجب أن يكون رئيسياً (is_group)' USING ERRCODE = '23514';
            END IF;
            IF p.path LIKE '%/' || NEW.id || '/%' THEN
                RAISE EXCEPTION 'حلقة مفرغة في شجرة مراكز التكلفة' USING ERRCODE = '23514';
            END IF;
            NEW.level := p.level + 1;
            NEW.path  := p.path || NEW.id || '/';
        END IF;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_cost_centers_tree() OWNER TO postgres;

--
-- TOC entry 700 (class 1255 OID 44595)
-- Name: fn_trg_customers_biu(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_customers_biu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_parent bigint;
    p        record;
    a        record;
BEGIN
    IF NEW.account_id IS NULL THEN
        v_parent := COALESCE(NEW.parent_account_id,
                    (SELECT default_customer_control_account_id FROM erp.sales_settings WHERE company_id = NEW.company_id));
        IF v_parent IS NULL THEN
            RAISE EXCEPTION 'حدد حساب العميل أو الحساب الرئيسي (parent_account_id) أو الحساب الافتراضي في الإعدادات'
                USING ERRCODE = '23514';
        END IF;
        SELECT id, code, is_group INTO p FROM erp.accounts WHERE id = v_parent AND company_id = NEW.company_id;
        IF NOT FOUND OR NOT p.is_group THEN
            RAISE EXCEPTION 'الحساب الرئيسي للعملاء غير موجود أو ليس حساباً رئيسياً' USING ERRCODE = '23514';
        END IF;
        INSERT INTO erp.accounts (company_id, parent_id, code, name_ar, name_en, is_group, category, nature, subtype)
        VALUES (NEW.company_id, p.id, p.code || '-' || NEW.code, NEW.name_ar, NEW.name_en, false, 'asset', 'debit', 'customer')
        RETURNING id INTO NEW.account_id;
        NEW.parent_account_id := p.id;
    END IF;

    SELECT subtype, is_group INTO a FROM erp.accounts WHERE id = NEW.account_id;
    IF a.is_group OR a.subtype <> 'customer' THEN
        RAISE EXCEPTION 'حساب العميل يجب أن يكون حساباً فرعياً من نوع (عميل/customer)' USING ERRCODE = '23514';
    END IF;
    IF TG_OP = 'UPDATE' AND NEW.account_id <> OLD.account_id
       AND EXISTS (SELECT 1 FROM erp.customer_ledger WHERE customer_id = OLD.id) THEN
        RAISE EXCEPTION 'لا يمكن تغيير حساب عميل عليه حركات' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_customers_biu() OWNER TO postgres;

--
-- TOC entry 735 (class 1255 OID 43571)
-- Name: fn_trg_deny_change(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_deny_change() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    RAISE EXCEPTION 'السجل % غير قابل للتعديل أو الحذف', TG_TABLE_NAME USING ERRCODE = '23514';
END $$;


ALTER FUNCTION erp.fn_trg_deny_change() OWNER TO postgres;

--
-- TOC entry 416 (class 1255 OID 45641)
-- Name: fn_trg_discount_limit(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_discount_limit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_code  text;
    v_limit numeric;
BEGIN
    IF NOT erp.fn_enforcing(NEW.company_id) THEN
        RETURN NEW;
    END IF;
    IF TG_OP = 'UPDATE' AND NEW.discount_pct IS NOT DISTINCT FROM OLD.discount_pct THEN
        RETURN NEW;
    END IF;
    IF COALESCE(NEW.discount_pct, 0) > 0 THEN
        IF erp.current_user_id() IS NULL THEN
            RAISE EXCEPTION 'لم يُحدَّد المستخدم الحالي لفحص سقف الخصم' USING ERRCODE = '42501';
        END IF;
        v_code  := CASE TG_TABLE_NAME WHEN 'sales_documents' THEN 'sales.max_invoice_discount_pct'
                                      ELSE 'sales.max_line_discount_pct' END;
        v_limit := erp.user_limit(NEW.company_id, v_code);
        IF v_limit IS NOT NULL AND NEW.discount_pct > v_limit THEN
            RAISE EXCEPTION 'الخصم % %% يتجاوز السقف المسموح لك (% %%)', NEW.discount_pct, v_limit USING ERRCODE = '42501';
        END IF;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_discount_limit() OWNER TO postgres;

--
-- TOC entry 402 (class 1255 OID 62440)
-- Name: fn_trg_dl_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_dl_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_priv boolean := current_setting('erp.asset_write', true) IS NOT DISTINCT FROM 'on';
    v_run  record;
    v_as   record;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT status INTO v_run FROM erp.depreciation_runs WHERE id = OLD.run_id;
        IF FOUND AND v_run.status <> 'draft' AND NOT v_priv THEN
            RAISE EXCEPTION 'لا يمكن حذف سطر من دفعة إهلاك مُرحّلة' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;
    IF TG_OP = 'UPDATE' THEN
        RAISE EXCEPTION 'أسطر الإهلاك لا تُعدَّل؛ احذف المسودة وأعد إنشاءها' USING ERRCODE = '23514';
    END IF;

    SELECT company_id, branch_id, status INTO v_run FROM erp.depreciation_runs WHERE id = NEW.run_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'دفعة الإهلاك غير موجودة' USING ERRCODE = '23503';
    END IF;
    IF v_run.status <> 'draft' THEN
        RAISE EXCEPTION 'لا يمكن إضافة أسطر لدفعة غير مسودة' USING ERRCODE = '23514';
    END IF;
    SELECT branch_id INTO v_as FROM erp.fixed_assets WHERE id = NEW.asset_id AND company_id = v_run.company_id;
    IF NOT FOUND OR v_as.branch_id <> v_run.branch_id THEN
        RAISE EXCEPTION 'الأصل لا يتبع فرع الدفعة' USING ERRCODE = '23514';
    END IF;
    NEW.company_id := v_run.company_id;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_dl_biud() OWNER TO postgres;

--
-- TOC entry 697 (class 1255 OID 62439)
-- Name: fn_trg_dr_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_dr_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_priv boolean := current_setting('erp.asset_write', true) IS NOT DISTINCT FROM 'on';
    v_fy   bigint;
    v_b    record;
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف دفعة إهلاك مُرحّلة أو معكوسة' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        IF OLD.status = 'reversed' THEN
            RAISE EXCEPTION 'دفعة الإهلاك المعكوسة لا تقبل التعديل' USING ERRCODE = '23514';
        END IF;
        IF OLD.status = 'posted' AND NOT v_priv THEN
            RAISE EXCEPTION 'دفعة الإهلاك المُرحّلة لا تقبل التعديل؛ استخدم العكس' USING ERRCODE = '23514';
        END IF;
        IF NOT v_priv AND (
              NEW.status            IS DISTINCT FROM OLD.status
           OR NEW.total_amount      IS DISTINCT FROM OLD.total_amount
           OR NEW.journal_entry_id  IS DISTINCT FROM OLD.journal_entry_id
           OR NEW.reversal_entry_id IS DISTINCT FROM OLD.reversal_entry_id
           OR NEW.posted_by         IS DISTINCT FROM OLD.posted_by
           OR NEW.posted_at         IS DISTINCT FROM OLD.posted_at
           OR NEW.reversed_at       IS DISTINCT FROM OLD.reversed_at) THEN
            RAISE EXCEPTION 'حالة الدفعة ومجاميعها تتغير عبر دوال الإهلاك فقط' USING ERRCODE = '23514';
        END IF;
        IF NEW.company_id <> OLD.company_id OR NEW.branch_id <> OLD.branch_id OR NEW.period_end <> OLD.period_end THEN
            RAISE EXCEPTION 'لا يمكن تغيير الفرع أو الشهر لدفعة قائمة' USING ERRCODE = '23514';
        END IF;
        RETURN NEW;
    END IF;

    -- INSERT
    IF NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء دفعة الإهلاك كمسودة' USING ERRCODE = '23514';
    END IF;
    IF NEW.period_end <> (date_trunc('month', NEW.period_end) + interval '1 month' - interval '1 day')::date THEN
        RAISE EXCEPTION 'تاريخ الدفعة يجب أن يكون آخر يوم في الشهر' USING ERRCODE = '23514';
    END IF;
    SELECT is_active INTO v_b FROM erp.branches WHERE id = NEW.branch_id AND company_id = NEW.company_id;
    IF NOT FOUND OR NOT v_b.is_active THEN
        RAISE EXCEPTION 'الفرع غير موجود أو غير فعّال' USING ERRCODE = '23514';
    END IF;
    SELECT id INTO v_fy FROM erp.fiscal_years
     WHERE company_id = NEW.company_id AND NEW.period_end BETWEEN start_date AND end_date;
    IF v_fy IS NULL THEN
        RAISE EXCEPTION 'لا توجد سنة مالية تغطي تاريخ %', NEW.period_end USING ERRCODE = '23514';
    END IF;
    NEW.fiscal_year_id := v_fy;
    NEW.run_no := erp.fn_next_doc_no(NEW.company_id, 'FA-DEP', v_fy);
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_dr_biud() OWNER TO postgres;

--
-- TOC entry 638 (class 1255 OID 62438)
-- Name: fn_trg_fa_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_fa_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_priv boolean := current_setting('erp.asset_write', true) IS NOT DISTINCT FROM 'on';
    v_b    record;
    v_cc   record;
    v_fy   record;
    v_n    bigint;
    v_free text[] := ARRAY['name_ar', 'name_en', 'serial_no', 'location', 'cost_center_id', 'notes', 'updated_at'];
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف أصل بعد تفعيله' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        IF NEW.status IS DISTINCT FROM OLD.status AND NOT v_priv THEN
            RAISE EXCEPTION 'حالة الأصل تتغير عبر دوال الأصول فقط' USING ERRCODE = '23514';
        END IF;
        IF OLD.status <> 'draft' AND NOT v_priv
           AND (to_jsonb(NEW) - v_free) IS DISTINCT FROM (to_jsonb(OLD) - v_free) THEN
            RAISE EXCEPTION 'الأصل بعد التفعيل يقبل تعديل الاسم والموقع والرقم التسلسلي ومركز التكلفة والملاحظات فقط' USING ERRCODE = '23514';
        END IF;
    ELSIF NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء الأصل كمسودة ثم تفعيله' USING ERRCODE = '23514';
    END IF;

    IF NOT v_priv AND (NEW.accumulated_depreciation <> 0 OR NEW.dep_months_done <> 0
                       OR NEW.opening_accumulated <> 0 OR NEW.opening_months <> 0
                       OR NEW.last_depreciation_date IS NOT NULL) THEN
        RAISE EXCEPTION 'الأرصدة الافتتاحية والإهلاك المتراكم تُحدَّد عند التفعيل فقط' USING ERRCODE = '23514';
    END IF;

    SELECT is_active INTO v_b FROM erp.branches WHERE id = NEW.branch_id AND company_id = NEW.company_id;
    IF NOT FOUND OR NOT v_b.is_active THEN
        RAISE EXCEPTION 'الفرع غير موجود أو غير فعّال' USING ERRCODE = '23514';
    END IF;
    IF NEW.cost_center_id IS NOT NULL THEN
        SELECT is_group, is_active INTO v_cc FROM erp.cost_centers WHERE id = NEW.cost_center_id AND company_id = NEW.company_id;
        IF NOT FOUND OR v_cc.is_group OR NOT v_cc.is_active THEN
            RAISE EXCEPTION 'مركز التكلفة غير موجود أو رئيسي أو غير فعّال' USING ERRCODE = '23514';
        END IF;
    END IF;

    IF TG_OP = 'INSERT' AND NEW.asset_no IS NULL THEN
        SELECT id, name INTO v_fy FROM erp.fiscal_years
         WHERE company_id = NEW.company_id AND NEW.acquisition_date BETWEEN start_date AND end_date;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'لا توجد سنة مالية تغطي تاريخ الاقتناء %', NEW.acquisition_date USING ERRCODE = '23514';
        END IF;
        v_n := erp.fn_next_doc_no(NEW.company_id, 'FA', v_fy.id);
        NEW.asset_no := 'FA-' || v_fy.name || '-' || lpad(v_n::text, 5, '0');
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_fa_biud() OWNER TO postgres;

--
-- TOC entry 624 (class 1255 OID 62437)
-- Name: fn_trg_fac_biu(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_fac_biu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM erp.fn_fa_check_account(NEW.company_id, NEW.cost_account_id,    'asset',   'الأصل');
    PERFORM erp.fn_fa_check_account(NEW.company_id, NEW.accum_account_id,   'asset',   'مجمع الإهلاك');
    PERFORM erp.fn_fa_check_account(NEW.company_id, NEW.expense_account_id, 'expense', 'مصروف الإهلاك');
    PERFORM erp.fn_fa_check_account(NEW.company_id, NEW.gain_account_id,    'revenue', 'أرباح بيع الأصول');
    PERFORM erp.fn_fa_check_account(NEW.company_id, NEW.loss_account_id,    'expense', 'خسائر بيع الأصول');
    IF NEW.cost_account_id = NEW.accum_account_id THEN
        RAISE EXCEPTION 'حساب الأصل ومجمع الإهلاك يجب أن يكونا مختلفين' USING ERRCODE = '23514';
    END IF;
    IF TG_OP = 'UPDATE' AND (
           NEW.cost_account_id    <> OLD.cost_account_id
        OR NEW.accum_account_id   <> OLD.accum_account_id
        OR NEW.expense_account_id <> OLD.expense_account_id)
       AND EXISTS (SELECT 1 FROM erp.fixed_assets WHERE category_id = NEW.id AND status <> 'draft') THEN
        RAISE EXCEPTION 'لا يمكن تغيير حسابات فئة لها أصول مفعّلة' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_fac_biu() OWNER TO postgres;

--
-- TOC entry 740 (class 1255 OID 43577)
-- Name: fn_trg_item_units_lock(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_item_units_lock() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        IF (NEW.factor_to_base <> OLD.factor_to_base OR NEW.unit_id <> OLD.unit_id OR NEW.is_base <> OLD.is_base)
           AND EXISTS (SELECT 1 FROM erp.stock_document_lines WHERE item_unit_id = OLD.id) THEN
            RAISE EXCEPTION 'لا يمكن تغيير معامل التحويل لوحدة مستخدمة في مستندات' USING ERRCODE = '23514';
        END IF;
        RETURN NEW;
    END IF;
    IF OLD.is_base THEN
        RAISE EXCEPTION 'لا يمكن حذف الوحدة الأساسية' USING ERRCODE = '23514';
    END IF;
    RETURN OLD;
END $$;


ALTER FUNCTION erp.fn_trg_item_units_lock() OWNER TO postgres;

--
-- TOC entry 642 (class 1255 OID 43573)
-- Name: fn_trg_items_base_unit(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_items_base_unit() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO erp.item_units (company_id, item_id, unit_id, factor_to_base, is_base)
    VALUES (NEW.company_id, NEW.id, NEW.base_unit_id, 1, true);
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_items_base_unit() OWNER TO postgres;

--
-- TOC entry 470 (class 1255 OID 43575)
-- Name: fn_trg_items_lock(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_items_lock() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF (NEW.base_unit_id <> OLD.base_unit_id OR NEW.track_batch <> OLD.track_batch
        OR NEW.track_expiry <> OLD.track_expiry OR NEW.is_stockable <> OLD.is_stockable)
       AND EXISTS (SELECT 1 FROM erp.stock_movements WHERE item_id = OLD.id) THEN
        RAISE EXCEPTION 'لا يمكن تغيير الوحدة الأساسية أو خصائص التتبع لصنف عليه حركات' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_items_lock() OWNER TO postgres;

--
-- TOC entry 615 (class 1255 OID 43087)
-- Name: fn_trg_je_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_je_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_p       record;
    v_t       record;
    v_resolve boolean;
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف قيد مُرحّل؛ استخدم قيد عكسي' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' AND OLD.status <> 'draft' THEN
        -- المسموح الوحيد: posted -> reversed دون تغيير أي حقل آخر
        IF OLD.status = 'posted' AND NEW.status = 'reversed'
           AND (to_jsonb(NEW) - 'status' - 'updated_at') = (to_jsonb(OLD) - 'status' - 'updated_at') THEN
            RETURN NEW;
        END IF;
        RAISE EXCEPTION 'القيد المُرحّل لا يقبل التعديل' USING ERRCODE = '23514';
    END IF;

    IF TG_OP = 'INSERT' AND NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء القيد كمسودة ثم ترحيله' USING ERRCODE = '23514';
    END IF;

    -- تحديد الفترة المالية
    v_resolve := (TG_OP = 'INSERT');
    IF TG_OP = 'UPDATE' THEN
        v_resolve := (NEW.entry_date IS DISTINCT FROM OLD.entry_date OR NEW.status = 'posted');
    END IF;

    IF v_resolve THEN
        SELECT p.id, p.fiscal_year_id, p.status INTO v_p
          FROM erp.fiscal_periods p
         WHERE p.company_id = NEW.company_id AND NEW.entry_date BETWEEN p.start_date AND p.end_date;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'لا توجد فترة مالية تغطي تاريخ القيد %', NEW.entry_date USING ERRCODE = '23514';
        END IF;
        IF v_p.status <> 'open' THEN
            RAISE EXCEPTION 'الفترة المالية غير مفتوحة (%)', v_p.status USING ERRCODE = '23514';
        END IF;
        IF NEW.entry_no IS NULL THEN
            NEW.entry_no := erp.fn_next_doc_no(NEW.company_id, 'JV', v_p.fiscal_year_id);
        ELSIF TG_OP = 'UPDATE' THEN
            IF v_p.fiscal_year_id <> OLD.fiscal_year_id THEN
                NEW.entry_no := erp.fn_next_doc_no(NEW.company_id, 'JV', v_p.fiscal_year_id);
            END IF;
        END IF;
        NEW.fiscal_year_id   := v_p.fiscal_year_id;
        NEW.fiscal_period_id := v_p.id;
    END IF;

    -- الترحيل: التحقق من التوازن وتثبيت المجاميع
    IF NEW.status = 'posted' THEN
        SELECT * INTO v_t FROM erp.fn_entry_totals(NEW.id);
        IF v_t.o_lines < 2 THEN
            RAISE EXCEPTION 'القيد يجب أن يحتوي على سطرين على الأقل' USING ERRCODE = '23514';
        END IF;
        IF v_t.o_debit <> v_t.o_credit THEN
            RAISE EXCEPTION 'قيد غير متوازن: مدين % ≠ دائن %', v_t.o_debit, v_t.o_credit USING ERRCODE = '23514';
        END IF;
        IF v_t.o_debit <= 0 THEN
            RAISE EXCEPTION 'قيمة القيد يجب أن تكون أكبر من صفر' USING ERRCODE = '23514';
        END IF;
        NEW.total_debit_local  := v_t.o_debit;
        NEW.total_credit_local := v_t.o_credit;
        NEW.posted_at          := now();
    ELSIF NEW.status = 'reversed' THEN
        RAISE EXCEPTION 'لا يمكن عكس قيد غير مُرحّل' USING ERRCODE = '23514';
    END IF;

    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_je_biud() OWNER TO postgres;

--
-- TOC entry 666 (class 1255 OID 43089)
-- Name: fn_trg_jel_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_jel_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_entry record;
    v_acc   record;
    v_cc    record;
    v_cur   record;
    v_base  bigint;
    v_dp    smallint;
    v_tol   numeric;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT status INTO v_entry FROM erp.journal_entries WHERE id = OLD.entry_id;
        IF FOUND AND v_entry.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف سطر من قيد مُرحّل' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' AND NEW.entry_id <> OLD.entry_id THEN
        RAISE EXCEPTION 'لا يمكن نقل السطر إلى قيد آخر' USING ERRCODE = '23514';
    END IF;

    SELECT status, entry_date INTO v_entry FROM erp.journal_entries WHERE id = NEW.entry_id;
    IF v_entry.status <> 'draft' THEN
        RAISE EXCEPTION 'لا يمكن إضافة/تعديل أسطر قيد مُرحّل' USING ERRCODE = '23514';
    END IF;

    -- الحساب
    SELECT is_group, is_active, allow_all_currencies, require_cost_center INTO v_acc
      FROM erp.accounts WHERE id = NEW.account_id;
    IF v_acc.is_group THEN
        RAISE EXCEPTION 'لا يمكن القيد على حساب رئيسي' USING ERRCODE = '23514';
    END IF;
    IF NOT v_acc.is_active THEN
        RAISE EXCEPTION 'الحساب غير فعّال' USING ERRCODE = '23514';
    END IF;
    IF v_acc.require_cost_center AND NEW.cost_center_id IS NULL THEN
        RAISE EXCEPTION 'هذا الحساب يتطلب مركز تكلفة' USING ERRCODE = '23514';
    END IF;

    -- مركز التكلفة
    IF NEW.cost_center_id IS NOT NULL THEN
        SELECT is_group, is_active INTO v_cc FROM erp.cost_centers WHERE id = NEW.cost_center_id;
        IF v_cc.is_group OR NOT v_cc.is_active THEN
            RAISE EXCEPTION 'مركز التكلفة رئيسي أو غير فعّال' USING ERRCODE = '23514';
        END IF;
    END IF;

    -- العملة
    SELECT cc.is_active, cc.default_rate, cc.min_rate, cc.max_rate INTO v_cur
      FROM erp.company_currencies cc WHERE cc.company_id = NEW.company_id AND cc.currency_id = NEW.currency_id;
    IF NOT v_cur.is_active THEN
        RAISE EXCEPTION 'العملة غير فعّالة للشركة' USING ERRCODE = '23514';
    END IF;
    IF NOT v_acc.allow_all_currencies AND NOT EXISTS (
        SELECT 1 FROM erp.account_currencies ac WHERE ac.account_id = NEW.account_id AND ac.currency_id = NEW.currency_id
    ) THEN
        RAISE EXCEPTION 'العملة غير مسموح بها لهذا الحساب' USING ERRCODE = '23514';
    END IF;

    SELECT co.base_currency_id, c.decimal_places INTO v_base, v_dp
      FROM erp.companies co JOIN erp.currencies c ON c.id = co.base_currency_id
     WHERE co.id = NEW.company_id;

    -- سعر الصرف
    IF NEW.currency_id = v_base THEN
        NEW.exchange_rate := 1;
    ELSE
        IF NEW.exchange_rate IS NULL THEN
            SELECT r.rate INTO NEW.exchange_rate
              FROM erp.exchange_rates r
             WHERE r.company_id = NEW.company_id AND r.currency_id = NEW.currency_id AND r.rate_date <= v_entry.entry_date
             ORDER BY r.rate_date DESC LIMIT 1;
            IF NEW.exchange_rate IS NULL THEN
                NEW.exchange_rate := v_cur.default_rate;
            END IF;
        END IF;
        IF NEW.exchange_rate < v_cur.min_rate OR NEW.exchange_rate > v_cur.max_rate THEN
            RAISE EXCEPTION 'سعر الصرف % خارج الحدود المسموحة [% - %]', NEW.exchange_rate, v_cur.min_rate, v_cur.max_rate
                USING ERRCODE = '23514';
        END IF;
    END IF;

    -- المقابل المحلي: يُحسب إن لم يُحدد، وإلا يُتحقق من أنه ضمن هامش تقريب واحد
    NEW.debit_local  := COALESCE(NEW.debit_local,  round(NEW.debit_fc  * NEW.exchange_rate, v_dp));
    NEW.credit_local := COALESCE(NEW.credit_local, round(NEW.credit_fc * NEW.exchange_rate, v_dp));
    v_tol := CASE WHEN NEW.currency_id = v_base THEN 0 ELSE power(10::numeric, -v_dp) END;
    IF abs(NEW.debit_local  - NEW.debit_fc  * NEW.exchange_rate) > v_tol
    OR abs(NEW.credit_local - NEW.credit_fc * NEW.exchange_rate) > v_tol THEN
        RAISE EXCEPTION 'المبلغ المحلي لا يطابق (المبلغ الأجنبي × سعر الصرف)' USING ERRCODE = '23514';
    END IF;

    IF NEW.line_no IS NULL THEN
        SELECT COALESCE(MAX(line_no), 0) + 1 INTO NEW.line_no FROM erp.journal_entry_lines WHERE entry_id = NEW.entry_id;
    END IF;

    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_jel_biud() OWNER TO postgres;

--
-- TOC entry 488 (class 1255 OID 44371)
-- Name: fn_trg_payment_methods_account(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_payment_methods_account() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE a record;
BEGIN
    SELECT subtype, is_group INTO a FROM erp.accounts WHERE id = NEW.account_id;
    IF a.is_group OR a.subtype NOT IN ('cash', 'bank') THEN
        RAISE EXCEPTION 'حساب وسيلة الدفع يجب أن يكون صندوقاً أو بنكاً (فرعي)' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_payment_methods_account() OWNER TO postgres;

--
-- TOC entry 647 (class 1255 OID 44193)
-- Name: fn_trg_pdl_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_pdl_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    h      record;
    i      record;
    ol     record;
    sl     record;
    rl     record;
    v_f    numeric;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT status INTO h FROM erp.purchase_documents WHERE id = OLD.document_id;
        IF FOUND AND h.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف سطر من مستند معتمد/مُرحّل' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    SELECT d.doc_type, d.status, d.supplier_id, d.discount_pct, c.decimal_places AS cur_dp INTO h
      FROM erp.purchase_documents d JOIN erp.currencies c ON c.id = d.currency_id
     WHERE d.id = NEW.document_id;
    IF h.status <> 'draft' THEN
        IF TG_OP = 'UPDATE' AND current_setting('erp.purch_write', true) = 'on' THEN
            RETURN NEW;                      -- تحديث الكميات المنفذة من دوال الترحيل
        END IF;
        RAISE EXCEPTION 'لا يمكن تعديل أسطر مستند معتمد/مُرحّل' USING ERRCODE = '23514';
    END IF;

    SELECT is_stockable, is_active INTO i FROM erp.items WHERE id = NEW.item_id;
    IF NOT i.is_stockable OR NOT i.is_active THEN
        RAISE EXCEPTION 'الصنف غير مخزني أو غير فعّال' USING ERRCODE = '23514';
    END IF;
    SELECT factor_to_base INTO v_f FROM erp.item_units WHERE id = NEW.item_unit_id;
    NEW.qty_base := round(NEW.quantity * v_f, 6);

    -- المبالغ بعملة المستند
    NEW.net_fc := round(NEW.quantity * NEW.unit_price * (1 - NEW.discount_pct / 100) * (1 - h.discount_pct / 100), h.cur_dp);
    NEW.tax_fc := round(NEW.net_fc * NEW.tax_rate / 100, h.cur_dp);

    -- الروابط بين المستندات
    IF NEW.order_line_id IS NOT NULL THEN
        IF h.doc_type <> 'invoice' THEN
            RAISE EXCEPTION 'order_line_id خاص بالفواتير' USING ERRCODE = '23514';
        END IF;
        SELECT l.item_id, l.remaining_qty_base, d.supplier_id, d.doc_type, d.status INTO ol
          FROM erp.purchase_document_lines l JOIN erp.purchase_documents d ON d.id = l.document_id
         WHERE l.id = NEW.order_line_id;
        IF ol.doc_type <> 'order' OR ol.status NOT IN ('approved', 'partially_received')
           OR ol.supplier_id <> h.supplier_id OR ol.item_id <> NEW.item_id THEN
            RAISE EXCEPTION 'سطر أمر الشراء غير صالح للربط (حالة/مورد/صنف)' USING ERRCODE = '23514';
        END IF;
        IF NEW.qty_base > ol.remaining_qty_base THEN
            RAISE EXCEPTION 'الكمية % تتجاوز المتبقي من أمر الشراء %', NEW.qty_base, ol.remaining_qty_base USING ERRCODE = '23514';
        END IF;
    END IF;
    IF NEW.source_line_id IS NOT NULL THEN
        IF h.doc_type <> 'return' THEN
            RAISE EXCEPTION 'source_line_id خاص بالمردودات' USING ERRCODE = '23514';
        END IF;
        SELECT l.item_id, l.remaining_qty_base, d.supplier_id, d.doc_type, d.status INTO sl
          FROM erp.purchase_document_lines l JOIN erp.purchase_documents d ON d.id = l.document_id
         WHERE l.id = NEW.source_line_id;
        IF sl.doc_type <> 'invoice' OR sl.status <> 'posted' OR sl.supplier_id <> h.supplier_id OR sl.item_id <> NEW.item_id THEN
            RAISE EXCEPTION 'سطر الفاتورة غير صالح للربط (حالة/مورد/صنف)' USING ERRCODE = '23514';
        END IF;
        IF NEW.qty_base > sl.remaining_qty_base THEN
            RAISE EXCEPTION 'كمية المردود % تتجاوز المتبقي في الفاتورة %', NEW.qty_base, sl.remaining_qty_base USING ERRCODE = '23514';
        END IF;
    END IF;
    IF NEW.request_line_id IS NOT NULL THEN
        IF h.doc_type <> 'order' THEN
            RAISE EXCEPTION 'request_line_id خاص بأوامر الشراء' USING ERRCODE = '23514';
        END IF;
        SELECT l.item_id, r.status INTO rl
          FROM erp.purchase_request_lines l JOIN erp.purchase_requests r ON r.id = l.request_id
         WHERE l.id = NEW.request_line_id;
        IF rl.item_id <> NEW.item_id OR rl.status <> 'approved' THEN
            RAISE EXCEPTION 'سطر طلب الشراء غير صالح (صنف مختلف أو طلب غير معتمد)' USING ERRCODE = '23514';
        END IF;
    END IF;

    IF NEW.line_no IS NULL THEN
        SELECT COALESCE(MAX(line_no), 0) + 1 INTO NEW.line_no FROM erp.purchase_document_lines WHERE document_id = NEW.document_id;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_pdl_biud() OWNER TO postgres;

--
-- TOC entry 733 (class 1255 OID 44196)
-- Name: fn_trg_pdl_totals(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_pdl_totals() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'UPDATE' AND OLD.net_fc IS NOT DISTINCT FROM NEW.net_fc AND OLD.tax_fc IS NOT DISTINCT FROM NEW.tax_fc THEN
        RETURN NULL;
    END IF;
    PERFORM erp.fn_recalc_purchase_totals(COALESCE(NEW.document_id, OLD.document_id));
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_pdl_totals() OWNER TO postgres;

--
-- TOC entry 764 (class 1255 OID 44188)
-- Name: fn_trg_pdoc_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_pdoc_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    s      record;
    w      record;
    a      record;
    o      record;
    v_fy   bigint;
    v_key  text;
    v_dp   smallint;
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف مستند شراء معتمد/مُرحّل' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        IF OLD.status IN ('posted', 'cancelled') THEN
            RAISE EXCEPTION 'المستند مُرحّل/ملغى ولا يقبل التعديل' USING ERRCODE = '23514';
        END IF;
        IF (OLD.status <> 'draft' OR NEW.status IS DISTINCT FROM OLD.status)
           AND current_setting('erp.purch_write', true) IS DISTINCT FROM 'on' THEN
            RAISE EXCEPTION 'تغيير الحالة يتم فقط عبر دوال الاعتماد/الترحيل' USING ERRCODE = '23514';
        END IF;
        IF NEW.doc_type <> OLD.doc_type OR NEW.company_id <> OLD.company_id THEN
            RAISE EXCEPTION 'لا يمكن تغيير نوع المستند أو الشركة' USING ERRCODE = '23514';
        END IF;
        IF OLD.status <> 'draft' THEN
            RETURN NEW;                      -- تحديثات الحالة الداخلية فقط
        END IF;
    ELSIF NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء المستند كمسودة' USING ERRCODE = '23514';
    END IF;

    -- المورد والعملة
    SELECT is_active, allow_all_currencies, payment_days INTO s FROM erp.suppliers WHERE id = NEW.supplier_id;
    IF NOT s.is_active THEN
        RAISE EXCEPTION 'المورد غير فعّال' USING ERRCODE = '23514';
    END IF;
    IF NOT s.allow_all_currencies AND NOT EXISTS (
        SELECT 1 FROM erp.supplier_currencies sc WHERE sc.supplier_id = NEW.supplier_id AND sc.currency_id = NEW.currency_id
    ) THEN
        RAISE EXCEPTION 'العملة غير مسموح بها لهذا المورد' USING ERRCODE = '23514';
    END IF;
    NEW.exchange_rate := erp.fn_resolve_rate(NEW.company_id, NEW.currency_id, NEW.doc_date, NEW.exchange_rate);

    -- المخزن والفرع
    SELECT branch_id, is_active INTO w FROM erp.warehouses WHERE id = NEW.warehouse_id;
    IF NOT w.is_active THEN
        RAISE EXCEPTION 'المخزن غير فعّال' USING ERRCODE = '23514';
    END IF;
    IF NEW.branch_id IS NULL THEN
        NEW.branch_id := w.branch_id;
    ELSIF NEW.branch_id <> w.branch_id THEN
        RAISE EXCEPTION 'فرع المستند يجب أن يطابق فرع المخزن' USING ERRCODE = '23514';
    END IF;

    -- الدفع
    IF NEW.payment_type = 'cash' THEN
        IF NEW.payment_account_id IS NULL THEN
            RAISE EXCEPTION 'الدفع النقدي يتطلب حساب صندوق/بنك' USING ERRCODE = '23514';
        END IF;
        SELECT subtype, is_group INTO a FROM erp.accounts WHERE id = NEW.payment_account_id;
        IF a.is_group OR a.subtype NOT IN ('cash', 'bank') THEN
            RAISE EXCEPTION 'حساب الدفع يجب أن يكون صندوقاً أو بنكاً (فرعي)' USING ERRCODE = '23514';
        END IF;
    ELSE
        NEW.payment_account_id := NULL;
    END IF;
    IF NEW.due_date IS NULL THEN
        NEW.due_date := NEW.doc_date + CASE WHEN NEW.payment_type = 'cash' THEN 0 ELSE s.payment_days END;
    END IF;

    -- الروابط
    IF NEW.order_id IS NOT NULL THEN
        SELECT doc_type, supplier_id INTO o FROM erp.purchase_documents WHERE id = NEW.order_id;
        IF o.doc_type <> 'order' OR o.supplier_id <> NEW.supplier_id THEN
            RAISE EXCEPTION 'أمر الشراء المرتبط غير صالح أو لمورد مختلف' USING ERRCODE = '23514';
        END IF;
    END IF;
    IF NEW.invoice_id IS NOT NULL THEN
        SELECT doc_type, supplier_id, status INTO o FROM erp.purchase_documents WHERE id = NEW.invoice_id;
        IF o.doc_type <> 'invoice' OR o.status <> 'posted' OR o.supplier_id <> NEW.supplier_id THEN
            RAISE EXCEPTION 'الفاتورة المرتبطة يجب أن تكون مُرحّلة ولنفس المورد' USING ERRCODE = '23514';
        END IF;
    END IF;

    -- السنة المالية والترقيم
    SELECT id INTO v_fy FROM erp.fiscal_years
     WHERE company_id = NEW.company_id AND NEW.doc_date BETWEEN start_date AND end_date;
    IF v_fy IS NULL THEN
        RAISE EXCEPTION 'لا توجد سنة مالية تغطي التاريخ %', NEW.doc_date USING ERRCODE = '23514';
    END IF;
    v_key := CASE NEW.doc_type WHEN 'order' THEN 'PUR-ORD' WHEN 'invoice' THEN 'PUR-INV' ELSE 'PUR-RET' END;
    IF NEW.doc_no IS NULL THEN
        NEW.doc_no := erp.fn_next_doc_no(NEW.company_id, v_key, v_fy);
    ELSIF TG_OP = 'UPDATE' AND v_fy <> OLD.fiscal_year_id THEN
        NEW.doc_no := erp.fn_next_doc_no(NEW.company_id, v_key, v_fy);
    END IF;
    NEW.fiscal_year_id := v_fy;

    -- الإجماليات المحلية التقديرية للمسودة
    IF NEW.status = 'draft' THEN
        v_dp := erp.fn_base_decimals(NEW.company_id);
        NEW.total_fc        := NEW.subtotal_fc + NEW.tax_fc;
        NEW.subtotal_local  := round(NEW.subtotal_fc * NEW.exchange_rate, v_dp);
        NEW.tax_local       := round(NEW.tax_fc * NEW.exchange_rate, v_dp);
        NEW.total_local     := NEW.subtotal_local + NEW.tax_local;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_pdoc_biud() OWNER TO postgres;

--
-- TOC entry 620 (class 1255 OID 44191)
-- Name: fn_trg_pdoc_refresh_lines(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_pdoc_refresh_lines() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE erp.purchase_document_lines SET line_no = line_no WHERE document_id = NEW.id;
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_pdoc_refresh_lines() OWNER TO postgres;

--
-- TOC entry 680 (class 1255 OID 44183)
-- Name: fn_trg_plc_biu(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_plc_biu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    h      record;
    t      record;
    v_cdp  smallint;
BEGIN
    SELECT doc_type, status, doc_date INTO h FROM erp.purchase_documents WHERE id = NEW.document_id;
    IF h.doc_type <> 'invoice' OR h.status <> 'draft' THEN
        RAISE EXCEPTION 'المصاريف الإضافية تُسجَّل على فاتورة مشتريات (مسودة) فقط' USING ERRCODE = '23514';
    END IF;
    IF NEW.credit_account_id IS NULL AND NEW.payee_supplier_id IS NULL THEN
        SELECT default_account_id, default_allocation_method INTO t FROM erp.landed_cost_types WHERE id = NEW.cost_type_id;
        NEW.credit_account_id := t.default_account_id;
    END IF;
    SELECT decimal_places INTO v_cdp FROM erp.currencies WHERE id = NEW.currency_id;
    NEW.exchange_rate := erp.fn_resolve_rate(NEW.company_id, NEW.currency_id, h.doc_date, NEW.exchange_rate);
    NEW.amount_fc     := round(NEW.amount_fc, v_cdp);
    NEW.amount_local  := round(NEW.amount_fc * NEW.exchange_rate, erp.fn_base_decimals(NEW.company_id));
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_plc_biu() OWNER TO postgres;

--
-- TOC entry 779 (class 1255 OID 44185)
-- Name: fn_trg_plc_delete_guard(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_plc_delete_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM erp.purchase_documents WHERE id = OLD.document_id AND status <> 'draft') THEN
        RAISE EXCEPTION 'لا يمكن حذف مصروف إضافي من فاتورة مُرحّلة' USING ERRCODE = '23514';
    END IF;
    RETURN OLD;
END $$;


ALTER FUNCTION erp.fn_trg_plc_delete_guard() OWNER TO postgres;

--
-- TOC entry 453 (class 1255 OID 44724)
-- Name: fn_trg_pos_open_only(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_pos_open_only() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE v_sid bigint; v_status erp.pos_session_status;
BEGIN
    v_sid := CASE WHEN TG_OP = 'DELETE' THEN OLD.session_id ELSE NEW.session_id END;
    SELECT status INTO v_status FROM erp.pos_sessions WHERE id = v_sid;
    IF FOUND AND v_status <> 'open' THEN
        RAISE EXCEPTION 'الوردية مغلقة: لا يمكن تعديل الجرد أو الحركات النقدية' USING ERRCODE = '23514';
    END IF;
    RETURN CASE WHEN TG_OP = 'DELETE' THEN OLD ELSE NEW END;
END $$;


ALTER FUNCTION erp.fn_trg_pos_open_only() OWNER TO postgres;

--
-- TOC entry 804 (class 1255 OID 44641)
-- Name: fn_trg_pos_registers_biu(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_pos_registers_biu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    a record;
    w record;
BEGIN
    SELECT subtype, is_group INTO a FROM erp.accounts WHERE id = NEW.cash_account_id;
    IF a.is_group OR a.subtype <> 'cash' THEN
        RAISE EXCEPTION 'حساب درج الكاشير يجب أن يكون حساب صندوق (فرعي)' USING ERRCODE = '23514';
    END IF;
    SELECT branch_id INTO w FROM erp.warehouses WHERE id = NEW.warehouse_id;
    IF w.branch_id <> NEW.branch_id THEN
        RAISE EXCEPTION 'مخزن نقطة البيع يجب أن يتبع نفس الفرع' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_pos_registers_biu() OWNER TO postgres;

--
-- TOC entry 430 (class 1255 OID 44679)
-- Name: fn_trg_pos_sessions_biu(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_pos_sessions_biu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        IF NEW.status <> 'open' THEN
            RAISE EXCEPTION 'يجب فتح الوردية بحالة open' USING ERRCODE = '23514';
        END IF;
        IF NEW.session_no IS NULL THEN
            SELECT COALESCE(MAX(session_no), 0) + 1 INTO NEW.session_no FROM erp.pos_sessions WHERE register_id = NEW.register_id;
        END IF;
        RETURN NEW;
    END IF;
    IF OLD.status = 'closed' THEN
        RAISE EXCEPTION 'الوردية مغلقة ولا تقبل التعديل' USING ERRCODE = '23514';
    END IF;
    IF NEW.register_id <> OLD.register_id OR NEW.opened_at <> OLD.opened_at OR NEW.opening_cash <> OLD.opening_cash
       OR NEW.cashier_id IS DISTINCT FROM OLD.cashier_id THEN
        RAISE EXCEPTION 'بيانات فتح الوردية غير قابلة للتعديل' USING ERRCODE = '23514';
    END IF;
    IF NEW.status <> OLD.status AND current_setting('erp.sales_write', true) IS DISTINCT FROM 'on' THEN
        RAISE EXCEPTION 'إغلاق الوردية يتم فقط عبر close_pos_session' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_pos_sessions_biu() OWNER TO postgres;

--
-- TOC entry 815 (class 1255 OID 43898)
-- Name: fn_trg_pr_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_pr_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE v_fy bigint;
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف طلب شراء معتمد' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;
    IF TG_OP = 'UPDATE' THEN
        IF OLD.status IN ('closed', 'cancelled') THEN
            RAISE EXCEPTION 'طلب الشراء مغلق' USING ERRCODE = '23514';
        END IF;
        IF (OLD.status <> 'draft' OR NEW.status IS DISTINCT FROM OLD.status)
           AND current_setting('erp.purch_write', true) IS DISTINCT FROM 'on' THEN
            RAISE EXCEPTION 'استخدم دوال الاعتماد لتغيير حالة طلب الشراء' USING ERRCODE = '23514';
        END IF;
        IF OLD.status <> 'draft' THEN
            RETURN NEW;
        END IF;
    ELSIF NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء طلب الشراء كمسودة' USING ERRCODE = '23514';
    END IF;

    SELECT id INTO v_fy FROM erp.fiscal_years
     WHERE company_id = NEW.company_id AND NEW.pr_date BETWEEN start_date AND end_date;
    IF v_fy IS NULL THEN
        RAISE EXCEPTION 'لا توجد سنة مالية تغطي التاريخ %', NEW.pr_date USING ERRCODE = '23514';
    END IF;
    IF NEW.pr_no IS NULL THEN
        NEW.pr_no := erp.fn_next_doc_no(NEW.company_id, 'PUR-REQ', v_fy);
    ELSIF TG_OP = 'UPDATE' AND v_fy <> OLD.fiscal_year_id THEN
        NEW.pr_no := erp.fn_next_doc_no(NEW.company_id, 'PUR-REQ', v_fy);
    END IF;
    NEW.fiscal_year_id := v_fy;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_pr_biud() OWNER TO postgres;

--
-- TOC entry 426 (class 1255 OID 43900)
-- Name: fn_trg_prl_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_prl_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    h record;
    i record;
    v_f numeric;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT status INTO h FROM erp.purchase_requests WHERE id = OLD.request_id;
        IF FOUND AND h.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف سطر من طلب شراء معتمد' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;
    SELECT status INTO h FROM erp.purchase_requests WHERE id = NEW.request_id;
    IF h.status <> 'draft' THEN
        IF TG_OP = 'UPDATE' AND current_setting('erp.purch_write', true) = 'on' THEN
            RETURN NEW;
        END IF;
        RAISE EXCEPTION 'لا يمكن تعديل أسطر طلب شراء معتمد' USING ERRCODE = '23514';
    END IF;
    SELECT is_stockable, is_active INTO i FROM erp.items WHERE id = NEW.item_id;
    IF NOT i.is_stockable OR NOT i.is_active THEN
        RAISE EXCEPTION 'الصنف غير مخزني أو غير فعّال' USING ERRCODE = '23514';
    END IF;
    SELECT factor_to_base INTO v_f FROM erp.item_units WHERE id = NEW.item_unit_id;
    NEW.qty_base := round(NEW.quantity * v_f, 6);
    IF NEW.line_no IS NULL THEN
        SELECT COALESCE(MAX(line_no), 0) + 1 INTO NEW.line_no FROM erp.purchase_request_lines WHERE request_id = NEW.request_id;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_prl_biud() OWNER TO postgres;

--
-- TOC entry 688 (class 1255 OID 45633)
-- Name: fn_trg_require_status_permission(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_require_status_permission() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_new  jsonb := to_jsonb(NEW);
    v_code text;
BEGIN
    IF TG_OP = 'UPDATE' AND v_new->>'status' IS NOT DISTINCT FROM to_jsonb(OLD)->>'status' THEN
        RETURN NEW;
    END IF;
    v_code := erp.fn_perm_for(TG_TABLE_NAME, v_new);
    IF v_code IS NOT NULL THEN
        PERFORM erp.require_permission((v_new->>'company_id')::bigint, v_code, NULLIF(v_new->>'branch_id', '')::bigint);
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_require_status_permission() OWNER TO postgres;

--
-- TOC entry 537 (class 1255 OID 44953)
-- Name: fn_trg_sal_doc_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_sal_doc_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    c           record;
    w           record;
    o           record;
    ps          record;
    v_pay_days  int     := 0;
    v_cust_pl   bigint;
    v_cust_disc numeric := 0;
    v_fy        bigint;
    v_key       text;
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف مستند مبيعات معتمد/مُرحّل' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        IF OLD.status IN ('posted', 'cancelled', 'converted') THEN
            RAISE EXCEPTION 'المستند مُرحّل/ملغى/محوَّل ولا يقبل التعديل' USING ERRCODE = '23514';
        END IF;
        IF (OLD.status <> 'draft' OR NEW.status IS DISTINCT FROM OLD.status)
           AND current_setting('erp.sales_write', true) IS DISTINCT FROM 'on' THEN
            RAISE EXCEPTION 'تغيير الحالة يتم فقط عبر دوال الاعتماد/الترحيل' USING ERRCODE = '23514';
        END IF;
        IF NEW.doc_type <> OLD.doc_type OR NEW.company_id <> OLD.company_id THEN
            RAISE EXCEPTION 'لا يمكن تغيير نوع المستند أو الشركة' USING ERRCODE = '23514';
        END IF;
        IF OLD.status <> 'draft' THEN
            RETURN NEW;
        END IF;
    ELSIF NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء المستند كمسودة' USING ERRCODE = '23514';
    END IF;

    -- العميل والعملة
    IF NEW.customer_id IS NOT NULL THEN
        SELECT is_active, allow_all_currencies, payment_days, price_list_id, default_discount_pct INTO c
          FROM erp.customers WHERE id = NEW.customer_id;
        IF NOT c.is_active THEN
            RAISE EXCEPTION 'العميل غير فعّال' USING ERRCODE = '23514';
        END IF;
        IF NOT c.allow_all_currencies AND NOT EXISTS (
            SELECT 1 FROM erp.customer_currencies cc WHERE cc.customer_id = NEW.customer_id AND cc.currency_id = NEW.currency_id
        ) THEN
            RAISE EXCEPTION 'العملة غير مسموح بها لهذا العميل' USING ERRCODE = '23514';
        END IF;
        v_pay_days := c.payment_days;  v_cust_pl := c.price_list_id;  v_cust_disc := c.default_discount_pct;
    END IF;
    NEW.exchange_rate := erp.fn_resolve_rate(NEW.company_id, NEW.currency_id, NEW.doc_date, NEW.exchange_rate);
    IF NEW.price_list_id IS NULL THEN
        NEW.price_list_id := COALESCE(v_cust_pl, (SELECT default_price_list_id FROM erp.sales_settings WHERE company_id = NEW.company_id));
    END IF;
    IF NEW.discount_pct IS NULL THEN
        NEW.discount_pct := v_cust_disc;
    END IF;
    IF NEW.due_date IS NULL THEN
        NEW.due_date := NEW.doc_date + v_pay_days;
    END IF;

    -- المخزن والفرع
    SELECT branch_id, is_active INTO w FROM erp.warehouses WHERE id = NEW.warehouse_id;
    IF NOT w.is_active THEN
        RAISE EXCEPTION 'المخزن غير فعّال' USING ERRCODE = '23514';
    END IF;
    IF NEW.branch_id IS NULL THEN
        NEW.branch_id := w.branch_id;
    ELSIF NEW.branch_id <> w.branch_id THEN
        RAISE EXCEPTION 'فرع المستند يجب أن يطابق فرع المخزن' USING ERRCODE = '23514';
    END IF;

    -- نقطة البيع: وردية مفتوحة وبنفس المخزن
    IF NEW.pos_session_id IS NOT NULL THEN
        SELECT s.status, r.warehouse_id INTO ps
          FROM erp.pos_sessions s JOIN erp.pos_registers r ON r.id = s.register_id WHERE s.id = NEW.pos_session_id;
        IF ps.status <> 'open' THEN
            RAISE EXCEPTION 'وردية نقطة البيع مغلقة' USING ERRCODE = '23514';
        END IF;
        IF ps.warehouse_id <> NEW.warehouse_id THEN
            RAISE EXCEPTION 'مخزن المستند يجب أن يطابق مخزن نقطة البيع' USING ERRCODE = '23514';
        END IF;
    END IF;

    -- الروابط
    IF NEW.quotation_id IS NOT NULL THEN
        SELECT doc_type, status, customer_id INTO o FROM erp.sales_documents WHERE id = NEW.quotation_id;
        IF o.doc_type <> 'quotation' OR o.status <> 'approved' OR o.customer_id IS DISTINCT FROM NEW.customer_id THEN
            RAISE EXCEPTION 'عرض السعر المرتبط غير معتمد أو لعميل مختلف' USING ERRCODE = '23514';
        END IF;
    END IF;
    IF NEW.order_id IS NOT NULL THEN
        SELECT doc_type, customer_id INTO o FROM erp.sales_documents WHERE id = NEW.order_id;
        IF o.doc_type <> 'order' OR o.customer_id IS DISTINCT FROM NEW.customer_id THEN
            RAISE EXCEPTION 'أمر البيع المرتبط غير صالح أو لعميل مختلف' USING ERRCODE = '23514';
        END IF;
    END IF;
    IF NEW.invoice_id IS NOT NULL THEN
        SELECT doc_type, status, customer_id INTO o FROM erp.sales_documents WHERE id = NEW.invoice_id;
        IF o.doc_type <> 'invoice' OR o.status <> 'posted' OR o.customer_id IS DISTINCT FROM NEW.customer_id THEN
            RAISE EXCEPTION 'الفاتورة المرتبطة يجب أن تكون مُرحّلة ولنفس العميل' USING ERRCODE = '23514';
        END IF;
    END IF;

    -- السنة المالية والترقيم
    SELECT id INTO v_fy FROM erp.fiscal_years
     WHERE company_id = NEW.company_id AND NEW.doc_date BETWEEN start_date AND end_date;
    IF v_fy IS NULL THEN
        RAISE EXCEPTION 'لا توجد سنة مالية تغطي التاريخ %', NEW.doc_date USING ERRCODE = '23514';
    END IF;
    v_key := CASE NEW.doc_type WHEN 'quotation' THEN 'SAL-QUO' WHEN 'order' THEN 'SAL-ORD'
                               WHEN 'invoice' THEN 'SAL-INV' ELSE 'SAL-RET' END;
    IF NEW.doc_no IS NULL THEN
        NEW.doc_no := erp.fn_next_doc_no(NEW.company_id, v_key, v_fy);
    ELSIF TG_OP = 'UPDATE' AND v_fy <> OLD.fiscal_year_id THEN
        NEW.doc_no := erp.fn_next_doc_no(NEW.company_id, v_key, v_fy);
    END IF;
    NEW.fiscal_year_id := v_fy;

    -- الإجماليات المحلية التقديرية للمسودة
    IF NEW.status = 'draft' THEN
        NEW.total_fc       := NEW.subtotal_fc + NEW.tax_fc;
        NEW.total_local    := round(NEW.total_fc * NEW.exchange_rate, erp.fn_base_decimals(NEW.company_id));
        NEW.subtotal_local := round(NEW.subtotal_fc * NEW.exchange_rate, erp.fn_base_decimals(NEW.company_id));
        NEW.tax_local      := NEW.total_local - NEW.subtotal_local;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_sal_doc_biud() OWNER TO postgres;

--
-- TOC entry 549 (class 1255 OID 44956)
-- Name: fn_trg_sal_doc_refresh_lines(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_sal_doc_refresh_lines() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE erp.sales_document_lines SET line_no = line_no WHERE document_id = NEW.id;
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_sal_doc_refresh_lines() OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 44958)
-- Name: fn_trg_sal_line_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_sal_line_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    h     record;
    i     record;
    ol    record;
    v_f   numeric;
    v_vat numeric;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT status INTO h FROM erp.sales_documents WHERE id = OLD.document_id;
        IF FOUND AND h.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف سطر من مستند معتمد/مُرحّل' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    SELECT d.doc_type, d.status, d.customer_id, d.price_list_id, d.discount_pct, d.doc_date, d.currency_id,
           d.exchange_rate, c.decimal_places AS cur_dp, COALESCE(cu.is_tax_exempt, false) AS exempt INTO h
      FROM erp.sales_documents d
      JOIN erp.currencies c ON c.id = d.currency_id
      LEFT JOIN erp.customers cu ON cu.id = d.customer_id
     WHERE d.id = NEW.document_id;
    IF h.status <> 'draft' THEN
        IF TG_OP = 'UPDATE' AND current_setting('erp.sales_write', true) = 'on' THEN
            RETURN NEW;                      -- تحديث الكميات المنفذة من دوال الترحيل
        END IF;
        RAISE EXCEPTION 'لا يمكن تعديل أسطر مستند معتمد/مُرحّل' USING ERRCODE = '23514';
    END IF;

    SELECT is_stockable, is_active INTO i FROM erp.items WHERE id = NEW.item_id;
    IF NOT i.is_stockable OR NOT i.is_active THEN
        RAISE EXCEPTION 'الصنف غير مخزني أو غير فعّال' USING ERRCODE = '23514';
    END IF;
    SELECT factor_to_base INTO v_f FROM erp.item_units WHERE id = NEW.item_unit_id;
    NEW.qty_base := round(NEW.quantity * v_f, 6);

    -- السعر من قائمة الأسعار، والضريبة من الإعدادات (0 للعميل المعفى)
    IF NEW.unit_price IS NULL THEN
        NEW.unit_price := erp.fn_sales_price(NEW.company_id, h.price_list_id, NEW.item_unit_id, NEW.quantity,
                                             h.doc_date, h.currency_id, h.exchange_rate);
    END IF;
    IF h.exempt THEN
        NEW.tax_rate := 0;
    ELSIF NEW.tax_rate IS NULL THEN
        SELECT default_vat_rate INTO v_vat FROM erp.sales_settings WHERE company_id = NEW.company_id;
        NEW.tax_rate := COALESCE(v_vat, 0);
    END IF;

    NEW.net_fc := round(NEW.quantity * NEW.unit_price * (1 - NEW.discount_pct / 100) * (1 - h.discount_pct / 100), h.cur_dp);
    NEW.tax_fc := round(NEW.net_fc * NEW.tax_rate / 100, h.cur_dp);

    -- الروابط
    IF NEW.quotation_line_id IS NOT NULL THEN
        IF h.doc_type <> 'order' THEN
            RAISE EXCEPTION 'quotation_line_id خاص بأوامر البيع' USING ERRCODE = '23514';
        END IF;
        SELECT l.item_id, d.status INTO ol FROM erp.sales_document_lines l JOIN erp.sales_documents d ON d.id = l.document_id
         WHERE l.id = NEW.quotation_line_id AND d.doc_type = 'quotation';
        IF NOT FOUND OR ol.item_id <> NEW.item_id OR ol.status <> 'approved' THEN
            RAISE EXCEPTION 'سطر عرض السعر غير صالح (صنف مختلف أو عرض غير معتمد)' USING ERRCODE = '23514';
        END IF;
    END IF;
    IF NEW.order_line_id IS NOT NULL THEN
        IF h.doc_type <> 'invoice' THEN
            RAISE EXCEPTION 'order_line_id خاص بالفواتير' USING ERRCODE = '23514';
        END IF;
        SELECT l.item_id, l.remaining_qty_base, d.customer_id, d.status INTO ol
          FROM erp.sales_document_lines l JOIN erp.sales_documents d ON d.id = l.document_id
         WHERE l.id = NEW.order_line_id AND d.doc_type = 'order';
        IF NOT FOUND OR ol.status NOT IN ('approved', 'partially_delivered')
           OR ol.customer_id IS DISTINCT FROM h.customer_id OR ol.item_id <> NEW.item_id THEN
            RAISE EXCEPTION 'سطر أمر البيع غير صالح للربط (حالة/عميل/صنف)' USING ERRCODE = '23514';
        END IF;
        IF NEW.qty_base > ol.remaining_qty_base THEN
            RAISE EXCEPTION 'الكمية % تتجاوز المتبقي من أمر البيع %', NEW.qty_base, ol.remaining_qty_base USING ERRCODE = '23514';
        END IF;
    END IF;
    IF NEW.source_line_id IS NOT NULL THEN
        IF h.doc_type <> 'return' THEN
            RAISE EXCEPTION 'source_line_id خاص بالمردودات' USING ERRCODE = '23514';
        END IF;
        SELECT l.item_id, l.remaining_qty_base, d.customer_id, d.status INTO ol
          FROM erp.sales_document_lines l JOIN erp.sales_documents d ON d.id = l.document_id
         WHERE l.id = NEW.source_line_id AND d.doc_type = 'invoice';
        IF NOT FOUND OR ol.status <> 'posted' OR ol.customer_id IS DISTINCT FROM h.customer_id OR ol.item_id <> NEW.item_id THEN
            RAISE EXCEPTION 'سطر الفاتورة غير صالح للربط (حالة/عميل/صنف)' USING ERRCODE = '23514';
        END IF;
        IF NEW.qty_base > ol.remaining_qty_base THEN
            RAISE EXCEPTION 'كمية المردود % تتجاوز المتبقي في الفاتورة %', NEW.qty_base, ol.remaining_qty_base USING ERRCODE = '23514';
        END IF;
    END IF;

    IF NEW.line_no IS NULL THEN
        SELECT COALESCE(MAX(line_no), 0) + 1 INTO NEW.line_no FROM erp.sales_document_lines WHERE document_id = NEW.document_id;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_sal_line_biud() OWNER TO postgres;

--
-- TOC entry 534 (class 1255 OID 44961)
-- Name: fn_trg_sal_line_totals(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_sal_line_totals() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF TG_OP = 'UPDATE' AND OLD.net_fc IS NOT DISTINCT FROM NEW.net_fc AND OLD.tax_fc IS NOT DISTINCT FROM NEW.tax_fc THEN
        RETURN NULL;
    END IF;
    PERFORM erp.fn_sal_recalc_totals(COALESCE(NEW.document_id, OLD.document_id));
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_sal_line_totals() OWNER TO postgres;

--
-- TOC entry 696 (class 1255 OID 44963)
-- Name: fn_trg_sal_pay_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_sal_pay_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    h record;
    m record;
BEGIN
    SELECT d.doc_type, d.status, c.decimal_places AS cur_dp INTO h
      FROM erp.sales_documents d JOIN erp.currencies c ON c.id = d.currency_id
     WHERE d.id = COALESCE(NEW.document_id, OLD.document_id);
    IF h.status <> 'draft' THEN
        IF TG_OP = 'UPDATE' AND current_setting('erp.sales_write', true) = 'on' THEN
            RETURN NEW;
        END IF;
        RAISE EXCEPTION 'لا يمكن تعديل مدفوعات مستند مُرحّل' USING ERRCODE = '23514';
    END IF;
    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;
    IF h.doc_type NOT IN ('invoice', 'return') THEN
        RAISE EXCEPTION 'المدفوعات خاصة بالفواتير والمردودات' USING ERRCODE = '23514';
    END IF;
    SELECT is_active INTO m FROM erp.payment_methods WHERE id = NEW.payment_method_id;
    IF NOT m.is_active THEN
        RAISE EXCEPTION 'وسيلة الدفع غير فعّالة' USING ERRCODE = '23514';
    END IF;
    NEW.amount_fc := round(NEW.amount_fc, h.cur_dp);
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_sal_pay_biud() OWNER TO postgres;

--
-- TOC entry 667 (class 1255 OID 62118)
-- Name: fn_trg_sc_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_sc_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_priv boolean := current_setting('erp.count_write', true) IS NOT DISTINCT FROM 'on';
    v_wh   record;
    v_fy   bigint;
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status NOT IN ('draft', 'cancelled') THEN
            RAISE EXCEPTION 'لا يمكن حذف جلسة جرد في حالة %', OLD.status USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        IF OLD.status IN ('posted', 'cancelled') THEN
            RAISE EXCEPTION 'جلسة الجرد % لا تقبل التعديل (الحالة: %)', OLD.count_no, OLD.status USING ERRCODE = '23514';
        END IF;
        IF NOT v_priv AND (
              NEW.status         IS DISTINCT FROM OLD.status
           OR NEW.snapshot_at    IS DISTINCT FROM OLD.snapshot_at
           OR NEW.receipt_doc_id IS DISTINCT FROM OLD.receipt_doc_id
           OR NEW.issue_doc_id   IS DISTINCT FROM OLD.issue_doc_id
           OR NEW.surplus_value  IS DISTINCT FROM OLD.surplus_value
           OR NEW.shortage_value IS DISTINCT FROM OLD.shortage_value
           OR NEW.approved_by    IS DISTINCT FROM OLD.approved_by
           OR NEW.approved_at    IS DISTINCT FROM OLD.approved_at
           OR NEW.posted_by      IS DISTINCT FROM OLD.posted_by
           OR NEW.posted_at      IS DISTINCT FROM OLD.posted_at
           OR NEW.cancelled_at   IS DISTINCT FROM OLD.cancelled_at) THEN
            RAISE EXCEPTION 'حالة الجرد وحقول الاعتماد والترحيل تتغير عبر دوال الجرد فقط' USING ERRCODE = '23514';
        END IF;
        IF OLD.status <> 'draft' AND (
              NEW.company_id   <> OLD.company_id
           OR NEW.warehouse_id <> OLD.warehouse_id
           OR NEW.count_type   <> OLD.count_type
           OR NEW.count_date   <> OLD.count_date
           OR NEW.category_id  IS DISTINCT FROM OLD.category_id) THEN
            RAISE EXCEPTION 'لا يمكن تغيير المخزن أو النوع أو التاريخ بعد بدء الجرد' USING ERRCODE = '23514';
        END IF;
    ELSIF NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء جلسة الجرد كمسودة' USING ERRCODE = '23514';
    END IF;

    SELECT branch_id, is_active INTO v_wh FROM erp.warehouses
     WHERE id = NEW.warehouse_id AND company_id = NEW.company_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'المخزن غير موجود في هذه الشركة' USING ERRCODE = '23503';
    END IF;
    IF NOT v_wh.is_active THEN
        RAISE EXCEPTION 'المخزن غير فعّال' USING ERRCODE = '23514';
    END IF;
    IF NEW.branch_id IS NOT NULL AND NEW.branch_id <> v_wh.branch_id THEN
        RAISE EXCEPTION 'فرع الجرد يجب أن يطابق فرع المخزن' USING ERRCODE = '23514';
    END IF;
    NEW.branch_id := v_wh.branch_id;

    SELECT id INTO v_fy FROM erp.fiscal_years
     WHERE company_id = NEW.company_id AND NEW.count_date BETWEEN start_date AND end_date;
    IF v_fy IS NULL THEN
        RAISE EXCEPTION 'لا توجد سنة مالية تغطي تاريخ الجرد %', NEW.count_date USING ERRCODE = '23514';
    END IF;
    IF NEW.count_no IS NULL THEN
        NEW.count_no := erp.fn_next_doc_no(NEW.company_id, 'STK-CNT', v_fy);
    ELSIF TG_OP = 'UPDATE' AND v_fy <> OLD.fiscal_year_id THEN
        NEW.count_no := erp.fn_next_doc_no(NEW.company_id, 'STK-CNT', v_fy);
    END IF;
    NEW.fiscal_year_id := v_fy;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_sc_biud() OWNER TO postgres;

--
-- TOC entry 731 (class 1255 OID 62119)
-- Name: fn_trg_scl_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_scl_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_priv boolean := current_setting('erp.count_write', true) IS NOT DISTINCT FROM 'on';
    v_sc   record;
    v_it   record;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT status INTO v_sc FROM erp.stock_counts WHERE id = OLD.count_id;
        IF FOUND AND v_sc.status NOT IN ('draft', 'counting') AND NOT v_priv THEN
            RAISE EXCEPTION 'لا يمكن حذف سطر جرد بعد الاعتماد' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    SELECT company_id, status, warehouse_id INTO v_sc FROM erp.stock_counts WHERE id = NEW.count_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'جلسة الجرد غير موجودة' USING ERRCODE = '23503';
    END IF;
    NEW.company_id := v_sc.company_id;

    IF NOT v_priv THEN
        IF v_sc.status NOT IN ('draft', 'counting') THEN
            RAISE EXCEPTION 'لا يمكن إضافة/تعديل أسطر الجرد في حالة %', v_sc.status USING ERRCODE = '23514';
        END IF;
        IF TG_OP = 'UPDATE' AND (
              NEW.count_id   <> OLD.count_id
           OR NEW.item_id    <> OLD.item_id
           OR NEW.batch_id   IS DISTINCT FROM OLD.batch_id
           OR NEW.system_qty <> OLD.system_qty
           OR NEW.unit_cost  <> OLD.unit_cost
           OR NEW.diff_value IS DISTINCT FROM OLD.diff_value
           OR NEW.stock_document_line_id IS DISTINCT FROM OLD.stock_document_line_id) THEN
            RAISE EXCEPTION 'لا يمكن تعديل الصنف أو الرصيد الدفتري أو التكلفة في سطر الجرد' USING ERRCODE = '23514';
        END IF;
    END IF;

    IF TG_OP = 'INSERT' THEN
        SELECT is_stockable, is_active, track_batch, track_expiry INTO v_it FROM erp.items
         WHERE id = NEW.item_id AND company_id = NEW.company_id;
        IF NOT FOUND OR NOT v_it.is_stockable OR NOT v_it.is_active THEN
            RAISE EXCEPTION 'الصنف غير موجود أو غير مخزني أو غير فعّال' USING ERRCODE = '23514';
        END IF;
        IF NOT v_it.track_batch AND (NEW.batch_id IS NOT NULL OR NEW.batch_no IS NOT NULL) THEN
            RAISE EXCEPTION 'الصنف لا يتتبّع التشغيلات' USING ERRCODE = '23514';
        END IF;
        IF v_it.track_batch AND NEW.batch_id IS NULL AND NEW.batch_no IS NULL THEN
            RAISE EXCEPTION 'الصنف يتطلب تحديد التشغيلة' USING ERRCODE = '23514';
        END IF;
        IF v_it.track_expiry AND NEW.batch_id IS NULL AND NEW.expiry_date IS NULL THEN
            RAISE EXCEPTION 'تاريخ الانتهاء مطلوب للتشغيلة الجديدة' USING ERRCODE = '23514';
        END IF;
        IF NEW.line_no IS NULL THEN
            SELECT COALESCE(MAX(line_no), 0) + 1 INTO NEW.line_no FROM erp.stock_count_lines WHERE count_id = NEW.count_id;
        END IF;
    END IF;

    IF NEW.counted_qty IS NOT NULL AND (TG_OP = 'INSERT' OR NEW.counted_qty IS DISTINCT FROM OLD.counted_qty) THEN
        NEW.counted_by := COALESCE(NEW.counted_by, erp.current_user_id());
        NEW.counted_at := COALESCE(NEW.counted_at, now());
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_scl_biud() OWNER TO postgres;

--
-- TOC entry 533 (class 1255 OID 43581)
-- Name: fn_trg_sdl_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_sdl_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_doc  record;
    v_item record;
    v_f    numeric;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT status INTO v_doc FROM erp.stock_documents WHERE id = OLD.document_id;
        IF FOUND AND v_doc.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف سطر من مستند مُرحّل' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    SELECT status, doc_type INTO v_doc FROM erp.stock_documents WHERE id = NEW.document_id;
    IF v_doc.status <> 'draft' THEN
        RAISE EXCEPTION 'لا يمكن إضافة/تعديل أسطر مستند مُرحّل' USING ERRCODE = '23514';
    END IF;

    SELECT is_stockable, is_active INTO v_item FROM erp.items WHERE id = NEW.item_id;
    IF NOT v_item.is_stockable OR NOT v_item.is_active THEN
        RAISE EXCEPTION 'الصنف غير مخزني أو غير فعّال' USING ERRCODE = '23514';
    END IF;

    SELECT factor_to_base INTO v_f FROM erp.item_units WHERE id = NEW.item_unit_id;
    NEW.qty_base := round(NEW.quantity * v_f, 6);

    IF v_doc.doc_type = 'receipt' THEN
        IF NEW.unit_cost IS NULL THEN
            RAISE EXCEPTION 'تكلفة الوحدة مطلوبة في مستند التوريد' USING ERRCODE = '23514';
        END IF;
    ELSE
        NEW.unit_cost := NULL;      -- الصرف/التحويل بالمتوسط المرجح، لا تُدخل التكلفة يدوياً
    END IF;

    IF NEW.line_no IS NULL THEN
        SELECT COALESCE(MAX(line_no), 0) + 1 INTO NEW.line_no FROM erp.stock_document_lines WHERE document_id = NEW.document_id;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_sdl_biud() OWNER TO postgres;

--
-- TOC entry 750 (class 1255 OID 43579)
-- Name: fn_trg_sdoc_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_sdoc_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_fy bigint;
    v_wh record;
    v_set record;
    v_key text;
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف مستند مخزني مُرحّل' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        IF OLD.status = 'posted' THEN
            RAISE EXCEPTION 'المستند المخزني المُرحّل لا يقبل التعديل' USING ERRCODE = '23514';
        END IF;
        IF NEW.doc_type <> OLD.doc_type OR NEW.company_id <> OLD.company_id THEN
            RAISE EXCEPTION 'لا يمكن تغيير نوع المستند أو الشركة' USING ERRCODE = '23514';
        END IF;
    ELSIF NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء المستند كمسودة ثم ترحيله' USING ERRCODE = '23514';
    END IF;

    -- المخزن والفرع
    SELECT branch_id, is_active INTO v_wh FROM erp.warehouses WHERE id = NEW.warehouse_id;
    IF NOT v_wh.is_active THEN
        RAISE EXCEPTION 'المخزن غير فعّال' USING ERRCODE = '23514';
    END IF;
    IF NEW.branch_id IS NULL THEN
        NEW.branch_id := v_wh.branch_id;
    ELSIF NEW.branch_id <> v_wh.branch_id THEN
        RAISE EXCEPTION 'فرع المستند يجب أن يطابق فرع المخزن' USING ERRCODE = '23514';
    END IF;

    -- الحساب المقابل
    IF NEW.doc_type = 'transfer' THEN
        NEW.counter_account_id := NULL;
    ELSIF NEW.counter_account_id IS NULL THEN
        SELECT default_cogs_account_id, default_receipt_account_id INTO v_set
          FROM erp.inventory_settings WHERE company_id = NEW.company_id;
        NEW.counter_account_id := CASE NEW.doc_type WHEN 'issue' THEN v_set.default_cogs_account_id
                                                    ELSE v_set.default_receipt_account_id END;
        IF NEW.counter_account_id IS NULL THEN
            RAISE EXCEPTION 'الحساب المقابل مطلوب (ولا يوجد حساب افتراضي في إعدادات المخزون)' USING ERRCODE = '23514';
        END IF;
    END IF;

    -- السنة المالية والترقيم
    SELECT id INTO v_fy FROM erp.fiscal_years
     WHERE company_id = NEW.company_id AND NEW.doc_date BETWEEN start_date AND end_date;
    IF v_fy IS NULL THEN
        RAISE EXCEPTION 'لا توجد سنة مالية تغطي تاريخ المستند %', NEW.doc_date USING ERRCODE = '23514';
    END IF;
    v_key := 'STK-' || CASE NEW.doc_type WHEN 'receipt' THEN 'R' WHEN 'issue' THEN 'I' ELSE 'T' END;
    IF NEW.doc_no IS NULL THEN
        NEW.doc_no := erp.fn_next_doc_no(NEW.company_id, v_key, v_fy);
    ELSIF TG_OP = 'UPDATE' AND v_fy <> OLD.fiscal_year_id THEN
        NEW.doc_no := erp.fn_next_doc_no(NEW.company_id, v_key, v_fy);
    END IF;
    NEW.fiscal_year_id := v_fy;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_sdoc_biud() OWNER TO postgres;

--
-- TOC entry 769 (class 1255 OID 45614)
-- Name: fn_trg_set_approved_by(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_set_approved_by() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.status::text = 'approved' AND OLD.status::text IS DISTINCT FROM 'approved' AND NEW.approved_by IS NULL THEN
        NEW.approved_by := erp.current_user_id();
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_set_approved_by() OWNER TO postgres;

--
-- TOC entry 778 (class 1255 OID 45615)
-- Name: fn_trg_set_closed_by(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_set_closed_by() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.status::text = 'closed' AND OLD.status::text IS DISTINCT FROM 'closed' AND NEW.closed_by IS NULL THEN
        NEW.closed_by := erp.current_user_id();
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_set_closed_by() OWNER TO postgres;

--
-- TOC entry 719 (class 1255 OID 45612)
-- Name: fn_trg_set_created_by(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_set_created_by() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.created_by IS NULL THEN
        NEW.created_by := erp.current_user_id();
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_set_created_by() OWNER TO postgres;

--
-- TOC entry 414 (class 1255 OID 45613)
-- Name: fn_trg_set_posted_by(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_set_posted_by() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.status::text = 'posted' AND OLD.status::text IS DISTINCT FROM 'posted' AND NEW.posted_by IS NULL THEN
        NEW.posted_by := erp.current_user_id();
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_set_posted_by() OWNER TO postgres;

--
-- TOC entry 418 (class 1255 OID 43415)
-- Name: fn_trg_stock_write_guard(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_stock_write_guard() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF current_setting('erp.stock_write', true) IS DISTINCT FROM 'on' THEN
        RAISE EXCEPTION 'أرصدة المخزون تتغير فقط عبر ترحيل مستند مخزني' USING ERRCODE = '23514';
    END IF;
    RETURN COALESCE(NEW, OLD);
END $$;


ALTER FUNCTION erp.fn_trg_stock_write_guard() OWNER TO postgres;

--
-- TOC entry 669 (class 1255 OID 43813)
-- Name: fn_trg_suppliers_biu(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_suppliers_biu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_parent bigint;
    p        record;
    a        record;
BEGIN
    IF NEW.account_id IS NULL THEN
        v_parent := COALESCE(NEW.parent_account_id,
                    (SELECT default_supplier_control_account_id FROM erp.purchasing_settings WHERE company_id = NEW.company_id));
        IF v_parent IS NULL THEN
            RAISE EXCEPTION 'حدد حساب المورد أو الحساب الرئيسي (parent_account_id) أو الحساب الافتراضي في الإعدادات'
                USING ERRCODE = '23514';
        END IF;
        SELECT id, code, is_group INTO p FROM erp.accounts WHERE id = v_parent AND company_id = NEW.company_id;
        IF NOT FOUND OR NOT p.is_group THEN
            RAISE EXCEPTION 'الحساب الرئيسي للموردين غير موجود أو ليس حساباً رئيسياً' USING ERRCODE = '23514';
        END IF;
        INSERT INTO erp.accounts (company_id, parent_id, code, name_ar, name_en, is_group, category, nature, subtype)
        VALUES (NEW.company_id, p.id, p.code || '-' || NEW.code, NEW.name_ar, NEW.name_en, false, 'liability', 'credit', 'supplier')
        RETURNING id INTO NEW.account_id;
        NEW.parent_account_id := p.id;
    END IF;

    SELECT subtype, is_group INTO a FROM erp.accounts WHERE id = NEW.account_id;
    IF a.is_group OR a.subtype <> 'supplier' THEN
        RAISE EXCEPTION 'حساب المورد يجب أن يكون حساباً فرعياً من نوع (مورد/supplier)' USING ERRCODE = '23514';
    END IF;
    IF TG_OP = 'UPDATE' AND NEW.account_id <> OLD.account_id
       AND EXISTS (SELECT 1 FROM erp.supplier_ledger WHERE supplier_id = OLD.id) THEN
        RAISE EXCEPTION 'لا يمكن تغيير حساب مورد عليه حركات' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_suppliers_biu() OWNER TO postgres;

--
-- TOC entry 486 (class 1255 OID 45265)
-- Name: fn_trg_va_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_va_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    h     record;
    d     record;
    o     record;
    v_sum numeric;
    v_side text;
BEGIN
    IF TG_OP = 'UPDATE' AND current_setting('erp.voucher_write', true) = 'on' THEN
        RETURN NEW;                              -- ترحيل/إلغاء السند
    END IF;
    SELECT status, currency_id INTO h FROM erp.financial_vouchers WHERE id = COALESCE(NEW.voucher_id, OLD.voucher_id);
    IF FOUND AND h.status <> 'draft' THEN
        RAISE EXCEPTION 'لا يمكن تعديل تسويات سند مُرحّل' USING ERRCODE = '23514';
    END IF;
    IF TG_OP = 'DELETE' THEN
        RETURN OLD;
    END IF;

    SELECT customer_id, supplier_id, debit_fc, credit_fc INTO d FROM erp.voucher_details WHERE id = NEW.voucher_detail_id;
    IF NEW.customer_ledger_id IS NOT NULL THEN
        IF d.customer_id IS NULL THEN
            RAISE EXCEPTION 'سطر السند ليس لعميل' USING ERRCODE = '23514';
        END IF;
        SELECT * INTO o FROM erp.fn_item_open('customer', NEW.customer_ledger_id);
        IF o.o_party_id IS DISTINCT FROM d.customer_id THEN
            RAISE EXCEPTION 'البند المُسوّى يخص عميلاً آخر' USING ERRCODE = '23514';
        END IF;
    ELSE
        IF d.supplier_id IS NULL THEN
            RAISE EXCEPTION 'سطر السند ليس لمورد' USING ERRCODE = '23514';
        END IF;
        SELECT * INTO o FROM erp.fn_item_open('supplier', NEW.supplier_ledger_id);
        IF o.o_party_id IS DISTINCT FROM d.supplier_id THEN
            RAISE EXCEPTION 'البند المُسوّى يخص مورداً آخر' USING ERRCODE = '23514';
        END IF;
    END IF;

    IF o.o_currency_id <> h.currency_id THEN
        RAISE EXCEPTION 'عملة البند المُسوّى تختلف عن عملة السند' USING ERRCODE = '23514';
    END IF;
    v_side := CASE WHEN d.debit_fc > 0 THEN 'D' ELSE 'C' END;
    IF o.o_side = v_side THEN
        RAISE EXCEPTION 'التسوية تكون على بند بعكس اتجاه سطر السند' USING ERRCODE = '23514';
    END IF;
    IF NEW.amount_fc > o.o_open_fc THEN
        RAISE EXCEPTION 'المبلغ المخصص % يتجاوز المتبقي المفتوح %', NEW.amount_fc, o.o_open_fc USING ERRCODE = '23514';
    END IF;
    SELECT COALESCE(SUM(amount_fc), 0) INTO v_sum FROM erp.voucher_allocations
     WHERE voucher_detail_id = NEW.voucher_detail_id AND id IS DISTINCT FROM NEW.id AND NOT reversed;
    IF v_sum + NEW.amount_fc > GREATEST(d.debit_fc, d.credit_fc) THEN
        RAISE EXCEPTION 'مجموع التسويات يتجاوز مبلغ سطر السند' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_va_biud() OWNER TO postgres;

--
-- TOC entry 761 (class 1255 OID 45259)
-- Name: fn_trg_vch_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_vch_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    t      record;
    a      record;
    per    record;
    v_resolve boolean;
BEGIN
    IF TG_OP = 'DELETE' THEN
        IF OLD.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف سند مُرحّل؛ استخدم الإلغاء بقيد عكسي' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    IF TG_OP = 'UPDATE' THEN
        IF OLD.status = 'cancelled' THEN
            RAISE EXCEPTION 'السند ملغى ولا يقبل التعديل' USING ERRCODE = '23514';
        END IF;
        IF OLD.status = 'posted' THEN
            IF NEW.status = 'cancelled' AND current_setting('erp.voucher_write', true) = 'on'
               AND (to_jsonb(NEW) - 'status' - 'cancelled_at' - 'cancelled_by' - 'cancel_reason' - 'cancel_journal_entry_id' - 'updated_at')
                 = (to_jsonb(OLD) - 'status' - 'cancelled_at' - 'cancelled_by' - 'cancel_reason' - 'cancel_journal_entry_id' - 'updated_at') THEN
                RETURN NEW;
            END IF;
            RAISE EXCEPTION 'السند المُرحّل لا يقبل التعديل' USING ERRCODE = '23514';
        END IF;
        IF NEW.status IS DISTINCT FROM OLD.status AND current_setting('erp.voucher_write', true) IS DISTINCT FROM 'on' THEN
            RAISE EXCEPTION 'تغيير الحالة يتم فقط عبر post_financial_voucher / cancel_financial_voucher' USING ERRCODE = '23514';
        END IF;
        IF NEW.company_id <> OLD.company_id OR NEW.voucher_type_id <> OLD.voucher_type_id THEN
            RAISE EXCEPTION 'لا يمكن تغيير الشركة أو نوع السند' USING ERRCODE = '23514';
        END IF;
    ELSIF NEW.status <> 'draft' THEN
        RAISE EXCEPTION 'يجب إنشاء السند كمسودة ثم ترحيله' USING ERRCODE = '23514';
    END IF;

    -- النوع
    SELECT kind, code, is_active, default_treasury_account_id, prefix, number_padding INTO t
      FROM erp.voucher_types WHERE id = NEW.voucher_type_id;
    IF NOT t.is_active THEN
        RAISE EXCEPTION 'نوع السند غير فعّال' USING ERRCODE = '23514';
    END IF;
    NEW.kind := t.kind;

    -- الصندوق/البنك
    IF NEW.kind = 'journal' THEN
        NEW.treasury_account_id := NULL;
    ELSE
        NEW.treasury_account_id := COALESCE(NEW.treasury_account_id, t.default_treasury_account_id);
        IF NEW.treasury_account_id IS NULL THEN
            RAISE EXCEPTION 'حدد الصندوق/البنك للسند' USING ERRCODE = '23514';
        END IF;
        SELECT subtype, is_group, is_active, allow_all_currencies INTO a FROM erp.accounts WHERE id = NEW.treasury_account_id;
        IF a.is_group OR NOT a.is_active OR a.subtype NOT IN ('cash', 'bank') THEN
            RAISE EXCEPTION 'حساب الصندوق/البنك غير صالح (يجب فرعي، فعّال، من نوع صندوق/بنك)' USING ERRCODE = '23514';
        END IF;
        IF NOT a.allow_all_currencies AND NOT EXISTS (
            SELECT 1 FROM erp.account_currencies ac WHERE ac.account_id = NEW.treasury_account_id AND ac.currency_id = NEW.currency_id
        ) THEN
            RAISE EXCEPTION 'عملة السند غير مسموح بها لحساب الصندوق/البنك' USING ERRCODE = '23514';
        END IF;
    END IF;

    NEW.exchange_rate := erp.fn_resolve_rate(NEW.company_id, NEW.currency_id, NEW.voucher_date, NEW.exchange_rate);

    -- الفترة المالية والترقيم
    v_resolve := (TG_OP = 'INSERT');
    IF TG_OP = 'UPDATE' THEN
        v_resolve := (NEW.voucher_date IS DISTINCT FROM OLD.voucher_date OR NEW.status = 'posted');
    END IF;
    IF v_resolve THEN
        SELECT p.id, p.fiscal_year_id, p.status INTO per
          FROM erp.fiscal_periods p
         WHERE p.company_id = NEW.company_id AND NEW.voucher_date BETWEEN p.start_date AND p.end_date;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'لا توجد فترة مالية تغطي تاريخ السند %', NEW.voucher_date USING ERRCODE = '23514';
        END IF;
        IF per.status <> 'open' THEN
            RAISE EXCEPTION 'الفترة المالية غير مفتوحة (%)', per.status USING ERRCODE = '23514';
        END IF;
        IF NEW.voucher_no IS NULL THEN
            NEW.voucher_no := erp.fn_next_doc_no(NEW.company_id, 'VCH-' || t.code, per.fiscal_year_id);
        ELSIF TG_OP = 'UPDATE' THEN
            IF per.fiscal_year_id <> OLD.fiscal_year_id THEN
                NEW.voucher_no := erp.fn_next_doc_no(NEW.company_id, 'VCH-' || t.code, per.fiscal_year_id);
            END IF;
        END IF;
        NEW.fiscal_year_id   := per.fiscal_year_id;
        NEW.fiscal_period_id := per.id;
    END IF;
    NEW.voucher_ref := erp.fn_format_doc_no(t.prefix, NEW.voucher_no, t.number_padding);
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_vch_biud() OWNER TO postgres;

--
-- TOC entry 817 (class 1255 OID 45261)
-- Name: fn_trg_vd_biud(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_vd_biud() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    h  record;
    a  record;
    cc record;
    p  record;
BEGIN
    IF TG_OP = 'DELETE' THEN
        SELECT status INTO h FROM erp.financial_vouchers WHERE id = OLD.voucher_id;
        IF FOUND AND h.status <> 'draft' THEN
            RAISE EXCEPTION 'لا يمكن حذف سطر من سند مُرحّل' USING ERRCODE = '23514';
        END IF;
        RETURN OLD;
    END IF;

    SELECT v.status, v.kind, v.currency_id, v.treasury_account_id, c.decimal_places AS cur_dp INTO h
      FROM erp.financial_vouchers v JOIN erp.currencies c ON c.id = v.currency_id
     WHERE v.id = NEW.voucher_id;
    IF h.status <> 'draft' THEN
        IF TG_OP = 'UPDATE' AND current_setting('erp.voucher_write', true) = 'on' THEN
            RETURN NEW;                          -- تثبيت المبالغ المحلية عند الترحيل
        END IF;
        RAISE EXCEPTION 'لا يمكن تعديل أسطر سند مُرحّل' USING ERRCODE = '23514';
    END IF;

    -- الطرف: العميل/المورد يحدد الحساب
    IF NEW.customer_id IS NOT NULL THEN
        SELECT account_id, is_active INTO p FROM erp.customers WHERE id = NEW.customer_id;
        IF NOT p.is_active THEN
            RAISE EXCEPTION 'العميل غير فعّال' USING ERRCODE = '23514';
        END IF;
        IF NEW.account_id IS NULL THEN
            NEW.account_id := p.account_id;
        ELSIF NEW.account_id <> p.account_id THEN
            RAISE EXCEPTION 'حساب السطر لا يطابق حساب العميل' USING ERRCODE = '23514';
        END IF;
    ELSIF NEW.supplier_id IS NOT NULL THEN
        SELECT account_id, is_active INTO p FROM erp.suppliers WHERE id = NEW.supplier_id;
        IF NOT p.is_active THEN
            RAISE EXCEPTION 'المورد غير فعّال' USING ERRCODE = '23514';
        END IF;
        IF NEW.account_id IS NULL THEN
            NEW.account_id := p.account_id;
        ELSIF NEW.account_id <> p.account_id THEN
            RAISE EXCEPTION 'حساب السطر لا يطابق حساب المورد' USING ERRCODE = '23514';
        END IF;
    END IF;

    -- الحساب
    SELECT is_group, is_active, allow_all_currencies, require_cost_center INTO a FROM erp.accounts WHERE id = NEW.account_id;
    IF a.is_group THEN
        RAISE EXCEPTION 'لا يمكن القيد على حساب رئيسي' USING ERRCODE = '23514';
    END IF;
    IF NOT a.is_active THEN
        RAISE EXCEPTION 'الحساب غير فعّال' USING ERRCODE = '23514';
    END IF;
    IF a.require_cost_center AND NEW.cost_center_id IS NULL THEN
        RAISE EXCEPTION 'هذا الحساب يتطلب مركز تكلفة' USING ERRCODE = '23514';
    END IF;
    IF NOT a.allow_all_currencies AND NOT EXISTS (
        SELECT 1 FROM erp.account_currencies ac WHERE ac.account_id = NEW.account_id AND ac.currency_id = h.currency_id
    ) THEN
        RAISE EXCEPTION 'عملة السند غير مسموح بها لهذا الحساب' USING ERRCODE = '23514';
    END IF;
    IF NEW.cost_center_id IS NOT NULL THEN
        SELECT is_group, is_active INTO cc FROM erp.cost_centers WHERE id = NEW.cost_center_id;
        IF cc.is_group OR NOT cc.is_active THEN
            RAISE EXCEPTION 'مركز التكلفة رئيسي أو غير فعّال' USING ERRCODE = '23514';
        END IF;
    END IF;

    -- اتجاه السطر حسب نوع السند
    IF h.kind = 'receipt' AND NEW.debit_fc > 0 THEN
        RAISE EXCEPTION 'سند القبض يقبل أسطراً دائنة فقط (الصندوق/البنك في الرأس)' USING ERRCODE = '23514';
    END IF;
    IF h.kind = 'payment' AND NEW.credit_fc > 0 THEN
        RAISE EXCEPTION 'سند الصرف يقبل أسطراً مدينة فقط (الصندوق/البنك في الرأس)' USING ERRCODE = '23514';
    END IF;
    IF h.treasury_account_id IS NOT NULL AND NEW.account_id = h.treasury_account_id THEN
        RAISE EXCEPTION 'لا يمكن استخدام حساب الصندوق/البنك كطرف مقابل في نفس السند' USING ERRCODE = '23514';
    END IF;

    NEW.debit_fc  := round(NEW.debit_fc,  h.cur_dp);
    NEW.credit_fc := round(NEW.credit_fc, h.cur_dp);
    IF NEW.line_no IS NULL THEN
        SELECT COALESCE(MAX(line_no), 0) + 1 INTO NEW.line_no FROM erp.voucher_details WHERE voucher_id = NEW.voucher_id;
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_vd_biud() OWNER TO postgres;

--
-- TOC entry 801 (class 1255 OID 45263)
-- Name: fn_trg_vd_totals(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_vd_totals() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE v_id bigint;
BEGIN
    v_id := COALESCE(NEW.voucher_id, OLD.voucher_id);
    UPDATE erp.financial_vouchers v
       SET total_fc = COALESCE((SELECT GREATEST(SUM(debit_fc), SUM(credit_fc)) FROM erp.voucher_details WHERE voucher_id = v_id), 0)
     WHERE v.id = v_id AND v.status = 'draft';
    RETURN NULL;
END $$;


ALTER FUNCTION erp.fn_trg_vd_totals() OWNER TO postgres;

--
-- TOC entry 588 (class 1255 OID 45048)
-- Name: fn_trg_voucher_types_biu(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_voucher_types_biu() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE a record;
BEGIN
    IF NEW.default_treasury_account_id IS NOT NULL THEN
        SELECT subtype, is_group INTO a FROM erp.accounts WHERE id = NEW.default_treasury_account_id;
        IF a.is_group OR a.subtype NOT IN ('cash', 'bank') THEN
            RAISE EXCEPTION 'الحساب الافتراضي للسند يجب أن يكون صندوقاً أو بنكاً (فرعي)' USING ERRCODE = '23514';
        END IF;
    END IF;
    IF TG_OP = 'UPDATE' AND NEW.kind <> OLD.kind
       AND EXISTS (SELECT 1 FROM erp.financial_vouchers WHERE voucher_type_id = OLD.id) THEN
        RAISE EXCEPTION 'لا يمكن تغيير نوع سند عليه مستندات' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_voucher_types_biu() OWNER TO postgres;

--
-- TOC entry 648 (class 1255 OID 43365)
-- Name: fn_trg_warehouses_account(); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trg_warehouses_account() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE a record;
BEGIN
    SELECT subtype, is_group INTO a FROM erp.accounts WHERE id = NEW.account_id;
    IF a.is_group OR a.subtype <> 'inventory' THEN
        RAISE EXCEPTION 'حساب المخزن يجب أن يكون حساباً فرعياً من نوع (مخزن/inventory)' USING ERRCODE = '23514';
    END IF;
    IF TG_OP = 'UPDATE' AND NEW.account_id <> OLD.account_id
       AND EXISTS (SELECT 1 FROM erp.stock_movements WHERE warehouse_id = OLD.id) THEN
        RAISE EXCEPTION 'لا يمكن تغيير حساب مخزن عليه حركات' USING ERRCODE = '23514';
    END IF;
    RETURN NEW;
END $$;


ALTER FUNCTION erp.fn_trg_warehouses_account() OWNER TO postgres;

--
-- TOC entry 400 (class 1255 OID 49152)
-- Name: fn_trial_balance(bigint, date, date, bigint, bigint, integer, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trial_balance(p_company bigint, p_from date, p_to date, p_branch bigint DEFAULT NULL::bigint, p_cost_center bigint DEFAULT NULL::bigint, p_level integer DEFAULT NULL::integer, p_include_zero boolean DEFAULT false) RETURNS TABLE(account_id bigint, code character varying, name_ar character varying, level smallint, is_group boolean, category erp.account_category, nature erp.account_nature, opening_debit numeric, opening_credit numeric, period_debit numeric, period_credit numeric, closing_debit numeric, closing_credit numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT * FROM erp.fn_trial_balance_x(p_company, p_from, p_to, p_branch, p_cost_center, p_level, p_include_zero, false)
$$;


ALTER FUNCTION erp.fn_trial_balance(p_company bigint, p_from date, p_to date, p_branch bigint, p_cost_center bigint, p_level integer, p_include_zero boolean) OWNER TO postgres;

--
-- TOC entry 782 (class 1255 OID 57353)
-- Name: fn_trial_balance_x(bigint, date, date, bigint, bigint, integer, boolean, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_trial_balance_x(p_company bigint, p_from date, p_to date, p_branch bigint, p_cost_center bigint, p_level integer, p_include_zero boolean, p_exclude_closing boolean) RETURNS TABLE(account_id bigint, code character varying, name_ar character varying, level smallint, is_group boolean, category erp.account_category, nature erp.account_nature, opening_debit numeric, opening_credit numeric, period_debit numeric, period_credit numeric, closing_debit numeric, closing_credit numeric)
    LANGUAGE sql STABLE
    AS $$
    WITH mov AS (
        SELECT l.account_id,
               COALESCE(SUM(l.debit_local)  FILTER (WHERE e.entry_date <  p_from), 0) AS od,
               COALESCE(SUM(l.credit_local) FILTER (WHERE e.entry_date <  p_from), 0) AS oc,
               COALESCE(SUM(l.debit_local)  FILTER (WHERE e.entry_date >= p_from), 0) AS pd,
               COALESCE(SUM(l.credit_local) FILTER (WHERE e.entry_date >= p_from), 0) AS pc
          FROM erp.journal_entry_lines l
          JOIN erp.journal_entries e ON e.id = l.entry_id AND e.status <> 'draft'
         WHERE l.company_id = p_company AND e.entry_date <= p_to
           AND (p_branch IS NULL OR e.branch_id = p_branch)
           AND (p_cost_center IS NULL OR l.cost_center_id = p_cost_center)
           AND (NOT p_exclude_closing OR e.entry_type <> 'closing')
         GROUP BY l.account_id
    ), agg AS (
        SELECT a.id, a.code, a.name_ar, a.level, a.is_group, a.category, a.nature,
               COALESCE(SUM(m.od), 0) AS od, COALESCE(SUM(m.oc), 0) AS oc,
               COALESCE(SUM(m.pd), 0) AS pd, COALESCE(SUM(m.pc), 0) AS pc
          FROM erp.accounts a
          LEFT JOIN erp.accounts d ON d.company_id = a.company_id AND d.path LIKE a.path || '%'
          LEFT JOIN mov m ON m.account_id = d.id
         WHERE a.company_id = p_company AND (p_level IS NULL OR a.level <= p_level)
         GROUP BY a.id, a.code, a.name_ar, a.level, a.is_group, a.category, a.nature
    )
    SELECT id, code, name_ar, level, is_group, category, nature,
           GREATEST(od - oc, 0), GREATEST(oc - od, 0), pd, pc,
           GREATEST((od + pd) - (oc + pc), 0), GREATEST((oc + pc) - (od + pd), 0)
      FROM agg
     WHERE p_include_zero OR od <> 0 OR oc <> 0 OR pd <> 0 OR pc <> 0
     ORDER BY code
$$;


ALTER FUNCTION erp.fn_trial_balance_x(p_company bigint, p_from date, p_to date, p_branch bigint, p_cost_center bigint, p_level integer, p_include_zero boolean, p_exclude_closing boolean) OWNER TO postgres;

--
-- TOC entry 515 (class 1255 OID 49163)
-- Name: fn_vat_report(bigint, date, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_vat_report(p_company bigint, p_from date, p_to date, p_branch bigint DEFAULT NULL::bigint) RETURNS TABLE(output_tax numeric, input_tax numeric, net_payable numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT x.o, x.i, x.o - x.i
      FROM (SELECT COALESCE((SELECT SUM(CASE WHEN d.doc_type = 'invoice' THEN d.tax_local ELSE -d.tax_local END)
                               FROM erp.sales_documents d
                              WHERE d.company_id = p_company AND d.status = 'posted' AND d.doc_type IN ('invoice', 'return')
                                AND d.doc_date BETWEEN p_from AND p_to AND (p_branch IS NULL OR d.branch_id = p_branch)), 0) AS o,
                   COALESCE((SELECT SUM(CASE WHEN d.doc_type = 'invoice' THEN d.tax_local ELSE -d.tax_local END)
                               FROM erp.purchase_documents d
                              WHERE d.company_id = p_company AND d.status = 'posted' AND d.doc_type IN ('invoice', 'return')
                                AND d.doc_date BETWEEN p_from AND p_to AND (p_branch IS NULL OR d.branch_id = p_branch)), 0) AS i) x
$$;


ALTER FUNCTION erp.fn_vat_report(p_company bigint, p_from date, p_to date, p_branch bigint) OWNER TO postgres;

--
-- TOC entry 659 (class 1255 OID 57354)
-- Name: fn_year_close_issues(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_year_close_issues(p_fy bigint) RETURNS TABLE(severity text, issue text, cnt bigint)
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    fy     record;
    v_base bigint;
    v_re   record;
    v_per  record;
    v_n    bigint;
BEGIN
    SELECT * INTO fy FROM erp.fiscal_years WHERE id = p_fy;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'السنة المالية غير موجودة' USING ERRCODE = '23503';
    END IF;
    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = fy.company_id;

    IF fy.is_closed THEN
        RETURN QUERY SELECT 'error'::text, 'السنة المالية مقفلة مسبقاً'::text, 1::bigint;
    END IF;

    SELECT count(*) INTO v_n FROM erp.fiscal_years y
     WHERE y.company_id = fy.company_id AND y.end_date < fy.start_date AND NOT y.is_closed;
    IF v_n > 0 THEN
        RETURN QUERY SELECT 'error'::text, 'توجد سنوات سابقة غير مقفلة (أقفلها أولاً)'::text, v_n;
    END IF;

    SELECT a.id, a.category, a.is_group, a.is_active, a.require_cost_center, a.allow_all_currencies INTO v_re
      FROM erp.company_settings cs
      LEFT JOIN erp.accounts a ON a.id = cs.retained_earnings_account_id
     WHERE cs.company_id = fy.company_id;
    IF NOT FOUND OR v_re.id IS NULL THEN
        RETURN QUERY SELECT 'error'::text,
            'لم يُحدَّد حساب الأرباح المحتجزة (company_settings.retained_earnings_account_id)'::text, 1::bigint;
    ELSIF v_re.category <> 'equity' OR v_re.is_group OR NOT v_re.is_active OR v_re.require_cost_center THEN
        RETURN QUERY SELECT 'error'::text,
            'حساب الأرباح المحتجزة غير صالح (حقوق ملكية، فرعي، فعّال، دون مركز تكلفة إلزامي)'::text, 1::bigint;
    ELSIF NOT v_re.allow_all_currencies AND NOT EXISTS (
            SELECT 1 FROM erp.account_currencies ac WHERE ac.account_id = v_re.id AND ac.currency_id = v_base) THEN
        RETURN QUERY SELECT 'error'::text, 'حساب الأرباح المحتجزة لا يسمح بالعملة المحلية'::text, 1::bigint;
    END IF;

    SELECT count(*) INTO v_n FROM erp.journal_entries e
     WHERE e.company_id = fy.company_id AND e.status = 'draft' AND e.entry_date BETWEEN fy.start_date AND fy.end_date;
    IF v_n > 0 THEN
        RETURN QUERY SELECT 'error'::text, 'قيود يومية مسودة ضمن السنة (رحّلها أو احذفها)'::text, v_n;
    END IF;

    SELECT count(*) INTO v_n FROM erp.financial_vouchers v
     WHERE v.company_id = fy.company_id AND v.status = 'draft' AND v.voucher_date BETWEEN fy.start_date AND fy.end_date;
    IF v_n > 0 THEN
        RETURN QUERY SELECT 'error'::text, 'سندات مالية مسودة ضمن السنة (رحّلها أو احذفها)'::text, v_n;
    END IF;

    SELECT count(*) INTO v_n FROM erp.pos_sessions s
     WHERE s.company_id = fy.company_id AND s.status = 'open' AND s.opened_at::date <= fy.end_date;
    IF v_n > 0 THEN
        RETURN QUERY SELECT 'error'::text, 'ورديات نقاط بيع مفتوحة (أغلقها أولاً)'::text, v_n;
    END IF;

    SELECT count(*) INTO v_n FROM erp.journal_entries e
     WHERE e.company_id = fy.company_id AND e.entry_type = 'closing' AND e.source_type = 'fiscal_year'
       AND e.source_id = fy.id AND e.status = 'posted' AND e.reversed_entry_id IS NULL;
    IF v_n > 0 THEN
        RETURN QUERY SELECT 'error'::text, 'يوجد قيد إقفال مُرحّل لهذه السنة'::text, v_n;
    END IF;

    SELECT p.status INTO v_per FROM erp.fiscal_periods p
     WHERE p.company_id = fy.company_id AND fy.end_date BETWEEN p.start_date AND p.end_date;
    IF NOT FOUND THEN
        RETURN QUERY SELECT 'error'::text, 'لا توجد فترة مالية تغطي تاريخ نهاية السنة'::text, 1::bigint;
    ELSIF v_per.status <> 'open' THEN
        RETURN QUERY SELECT 'error'::text, 'فترة نهاية السنة ليست مفتوحة (افتحها لترحيل قيد الإقفال)'::text, 1::bigint;
    END IF;

    SELECT count(DISTINCT a.id) INTO v_n
      FROM erp.journal_entry_lines l
      JOIN erp.journal_entries e ON e.id = l.entry_id AND e.status <> 'draft'
      JOIN erp.accounts a ON a.id = l.account_id AND a.category IN ('revenue', 'expense') AND NOT a.allow_all_currencies
     WHERE l.company_id = fy.company_id AND e.entry_date BETWEEN fy.start_date AND fy.end_date
       AND NOT EXISTS (SELECT 1 FROM erp.account_currencies ac WHERE ac.account_id = a.id AND ac.currency_id = v_base);
    IF v_n > 0 THEN
        RETURN QUERY SELECT 'error'::text, 'حسابات إيراد/مصروف لا تسمح بالعملة المحلية فلا يمكن إقفالها'::text, v_n;
    END IF;
END $$;


ALTER FUNCTION erp.fn_year_close_issues(p_fy bigint) OWNER TO postgres;

--
-- TOC entry 512 (class 1255 OID 57355)
-- Name: fn_year_close_preview(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.fn_year_close_preview(p_fy bigint) RETURNS TABLE(branch_id bigint, total_revenue numeric, total_expense numeric, net_income numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT e.branch_id,
           COALESCE(SUM(l.credit_local - l.debit_local) FILTER (WHERE a.category = 'revenue'), 0),
           COALESCE(SUM(l.debit_local - l.credit_local) FILTER (WHERE a.category = 'expense'), 0),
           COALESCE(SUM(l.credit_local - l.debit_local), 0)
      FROM erp.fiscal_years fy
      JOIN erp.journal_entries e ON e.company_id = fy.company_id AND e.status <> 'draft' AND e.entry_type <> 'closing'
                                AND e.entry_date BETWEEN fy.start_date AND fy.end_date
      JOIN erp.journal_entry_lines l ON l.entry_id = e.id
      JOIN erp.accounts a ON a.id = l.account_id AND a.category IN ('revenue', 'expense')
     WHERE fy.id = p_fy
     GROUP BY e.branch_id
     ORDER BY e.branch_id
$$;


ALTER FUNCTION erp.fn_year_close_preview(p_fy bigint) OWNER TO postgres;

--
-- TOC entry 474 (class 1255 OID 45515)
-- Name: has_permission(bigint, text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.has_permission(p_company bigint, p_code text, p_branch bigint DEFAULT NULL::bigint) RETURNS boolean
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_user bigint := erp.current_user_id();
    u      record;
BEGIN
    IF v_user IS NULL THEN
        RETURN false;
    END IF;
    SELECT is_active, is_superadmin INTO u FROM erp.app_users WHERE id = v_user;
    IF NOT FOUND OR NOT u.is_active THEN
        RETURN false;
    END IF;
    IF u.is_superadmin THEN
        RETURN true;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.user_roles ur JOIN erp.role_permissions rp ON rp.role_id = ur.role_id
                    WHERE ur.user_id = v_user AND ur.company_id = p_company AND rp.permission_code = p_code) THEN
        RETURN false;
    END IF;
    IF p_branch IS NOT NULL
       AND EXISTS (SELECT 1 FROM erp.user_branches WHERE user_id = v_user AND company_id = p_company)
       AND NOT EXISTS (SELECT 1 FROM erp.user_branches WHERE user_id = v_user AND company_id = p_company AND branch_id = p_branch) THEN
        RETURN false;
    END IF;
    RETURN true;
END $$;


ALTER FUNCTION erp.has_permission(p_company bigint, p_code text, p_branch bigint) OWNER TO postgres;

--
-- TOC entry 459 (class 1255 OID 44973)
-- Name: open_pos_session(bigint, bigint, numeric); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.open_pos_session(p_register bigint, p_cashier bigint DEFAULT NULL::bigint, p_opening_cash numeric DEFAULT 0) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE v_id bigint;
BEGIN
    INSERT INTO erp.pos_sessions (company_id, register_id, cashier_id, opening_cash)
    SELECT company_id, id, p_cashier, p_opening_cash FROM erp.pos_registers WHERE id = p_register AND is_active
    RETURNING id INTO v_id;
    IF v_id IS NULL THEN
        RAISE EXCEPTION 'نقطة البيع غير موجودة أو غير فعّالة' USING ERRCODE = '23514';
    END IF;
    RETURN v_id;
END $$;


ALTER FUNCTION erp.open_pos_session(p_register bigint, p_cashier bigint, p_opening_cash numeric) OWNER TO postgres;

--
-- TOC entry 444 (class 1255 OID 45267)
-- Name: post_financial_voucher(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.post_financial_voucher(p_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    h        record;
    l        record;
    al       record;
    o        record;
    fx       record;
    v_dp     smallint;
    v_base   bigint;
    v_entry  bigint;
    v_desc   text;
    v_ldesc  text;
    v_dr numeric := 0;  v_cr numeric := 0;
    v_cum_d numeric := 0;  v_prev_d numeric := 0;
    v_cum_c numeric := 0;  v_prev_c numeric := 0;
    v_tot_d numeric;  v_tot_c numeric;  v_t_fc numeric;
    v_side char;  v_amt numeric;
    v_alloc numeric;  v_unalloc numeric;  v_line_local numeric;  v_piece numeric;  v_rl numeric;
    v_settled numeric;  v_eff numeric;  v_diff numeric;
BEGIN
    SELECT * INTO h FROM erp.financial_vouchers WHERE id = p_id FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'السند غير موجود' USING ERRCODE = '23503';
    END IF;
    IF h.status <> 'draft' THEN
        RAISE EXCEPTION 'السند مُرحّل/ملغى مسبقاً' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.voucher_details WHERE voucher_id = h.id) THEN
        RAISE EXCEPTION 'السند بلا أسطر' USING ERRCODE = '23514';
    END IF;

    SELECT COALESCE(SUM(debit_fc), 0), COALESCE(SUM(credit_fc), 0) INTO v_tot_d, v_tot_c
      FROM erp.voucher_details WHERE voucher_id = h.id;
    IF h.kind = 'journal' THEN
        IF v_tot_d <> v_tot_c OR v_tot_d <= 0 THEN
            RAISE EXCEPTION 'القيد غير متوازن: مدين % ≠ دائن %', v_tot_d, v_tot_c USING ERRCODE = '23514';
        END IF;
        v_t_fc := v_tot_d;
    ELSE
        v_t_fc := CASE h.kind WHEN 'receipt' THEN v_tot_c ELSE v_tot_d END;
        IF v_t_fc <= 0 THEN
            RAISE EXCEPTION 'إجمالي السند يجب أن يكون أكبر من صفر' USING ERRCODE = '23514';
        END IF;
    END IF;

    v_dp := erp.fn_base_decimals(h.company_id);
    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = h.company_id;
    PERFORM set_config('erp.voucher_write', 'on', true);

    v_desc := (SELECT name_ar FROM erp.voucher_types WHERE id = h.voucher_type_id) || ' رقم ' || h.voucher_ref
              || COALESCE(' - ' || h.counterparty_name, '');
    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (h.company_id, h.branch_id, h.voucher_date, 'voucher', 'financial_voucher', h.id,
            COALESCE(h.reference, h.voucher_ref), COALESCE(h.description, v_desc), p_user_id)
    RETURNING id INTO v_entry;

    FOR l IN SELECT * FROM erp.voucher_details WHERE voucher_id = h.id ORDER BY line_no LOOP
        v_side := CASE WHEN l.debit_fc > 0 THEN 'D' ELSE 'C' END;
        v_amt  := GREATEST(l.debit_fc, l.credit_fc);
        v_ldesc := COALESCE(l.description, v_desc);
        v_line_local := 0;  v_alloc := 0;

        -- (أ) الأجزاء المُسوّاة: تُرحَّل بقيمتها المحلية الأصلية (سعر الفاتورة)
        FOR al IN SELECT * FROM erp.voucher_allocations WHERE voucher_detail_id = l.id AND NOT reversed ORDER BY id LOOP
            IF al.customer_ledger_id IS NOT NULL THEN
                PERFORM 1 FROM erp.customer_ledger WHERE id = al.customer_ledger_id FOR UPDATE;
                SELECT * INTO o FROM erp.fn_item_open('customer', al.customer_ledger_id);
            ELSE
                PERFORM 1 FROM erp.supplier_ledger WHERE id = al.supplier_ledger_id FOR UPDATE;
                SELECT * INTO o FROM erp.fn_item_open('supplier', al.supplier_ledger_id);
            END IF;
            IF al.amount_fc > o.o_open_fc THEN
                RAISE EXCEPTION 'المبلغ المخصص % يتجاوز المتبقي المفتوح % (تغيّر الرصيد منذ إدخال التسوية)', al.amount_fc, o.o_open_fc USING ERRCODE = '23514';
            END IF;
            v_settled := CASE WHEN al.amount_fc = o.o_open_fc THEN o.o_open_local
                              ELSE round(al.amount_fc * o.o_open_local / o.o_open_fc, v_dp) END;
            UPDATE erp.voucher_allocations SET settled_local = v_settled WHERE id = al.id;
            v_eff := round(v_settled / al.amount_fc, 8);
            PERFORM erp.fn_pur_je_line(v_entry, h.company_id, l.account_id, l.cost_center_id, h.currency_id, v_side,
                                       al.amount_fc, v_settled, v_eff, 'تسوية - ' || v_ldesc);
            IF v_side = 'D' THEN v_dr := v_dr + v_settled; ELSE v_cr := v_cr + v_settled; END IF;
            v_line_local := v_line_local + v_settled;
            v_alloc := v_alloc + al.amount_fc;
        END LOOP;

        -- (ب) الباقي غير المُسوّى: بسعر السند بتقريب تراكمي لكل اتجاه
        v_unalloc := v_amt - v_alloc;
        IF v_unalloc < 0 THEN
            RAISE EXCEPTION 'السطر %: التسويات تتجاوز مبلغ السطر', l.line_no USING ERRCODE = '23514';
        END IF;
        IF v_unalloc > 0 THEN
            IF v_side = 'D' THEN
                v_cum_d := v_cum_d + v_unalloc;  v_rl := round(v_cum_d * h.exchange_rate, v_dp);
                v_piece := v_rl - v_prev_d;      v_prev_d := v_rl;      v_dr := v_dr + v_piece;
            ELSE
                v_cum_c := v_cum_c + v_unalloc;  v_rl := round(v_cum_c * h.exchange_rate, v_dp);
                v_piece := v_rl - v_prev_c;      v_prev_c := v_rl;      v_cr := v_cr + v_piece;
            END IF;
            PERFORM erp.fn_pur_je_line(v_entry, h.company_id, l.account_id, l.cost_center_id, h.currency_id, v_side,
                                       v_unalloc, v_piece, h.exchange_rate, v_ldesc);
            v_line_local := v_line_local + v_piece;
        END IF;

        UPDATE erp.voucher_details
           SET debit_local  = CASE WHEN v_side = 'D' THEN v_line_local ELSE 0 END,
               credit_local = CASE WHEN v_side = 'C' THEN v_line_local ELSE 0 END
         WHERE id = l.id;

        -- دفتر العميل/المورد (سطر واحد لكل سطر سند)
        IF l.customer_id IS NOT NULL THEN
            INSERT INTO erp.customer_ledger (company_id, customer_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                             currency_id, exchange_rate, debit_fc, credit_fc, debit_local, credit_local,
                                             description, voucher_detail_id)
            VALUES (h.company_id, l.customer_id, h.voucher_date, h.voucher_date, 'voucher', h.id, v_entry,
                    h.currency_id, h.exchange_rate,
                    CASE WHEN v_side = 'D' THEN v_amt ELSE 0 END, CASE WHEN v_side = 'C' THEN v_amt ELSE 0 END,
                    CASE WHEN v_side = 'D' THEN v_line_local ELSE 0 END, CASE WHEN v_side = 'C' THEN v_line_local ELSE 0 END,
                    v_ldesc, l.id);
        ELSIF l.supplier_id IS NOT NULL THEN
            INSERT INTO erp.supplier_ledger (company_id, supplier_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                             currency_id, exchange_rate, debit_fc, credit_fc, debit_local, credit_local,
                                             description, voucher_detail_id)
            VALUES (h.company_id, l.supplier_id, h.voucher_date, h.voucher_date, 'voucher', h.id, v_entry,
                    h.currency_id, h.exchange_rate,
                    CASE WHEN v_side = 'D' THEN v_amt ELSE 0 END, CASE WHEN v_side = 'C' THEN v_amt ELSE 0 END,
                    CASE WHEN v_side = 'D' THEN v_line_local ELSE 0 END, CASE WHEN v_side = 'C' THEN v_line_local ELSE 0 END,
                    v_ldesc, l.id);
        END IF;
    END LOOP;

    -- (ج) سطر الصندوق/البنك (قبض: مدين | صرف: دائن)
    IF h.kind <> 'journal' THEN
        v_side := CASE h.kind WHEN 'receipt' THEN 'D' ELSE 'C' END;
        v_rl   := round(v_t_fc * h.exchange_rate, v_dp);
        PERFORM erp.fn_pur_je_line(v_entry, h.company_id, h.treasury_account_id, h.cost_center_id, h.currency_id, v_side,
                                   v_t_fc, v_rl, h.exchange_rate, v_desc);
        IF v_side = 'D' THEN v_dr := v_dr + v_rl; ELSE v_cr := v_cr + v_rl; END IF;
    END IF;

    -- (د) فروقات العملة المحققة: ما يزيد في أحد الجانبين يُرحَّل لحساب الربح/الخسارة
    v_diff := v_dr - v_cr;
    IF v_diff <> 0 THEN
        SELECT fx_realized_gain_account_id AS gain, fx_realized_loss_account_id AS loss INTO fx
          FROM erp.company_settings WHERE company_id = h.company_id;
        IF NOT FOUND OR (v_diff > 0 AND fx.gain IS NULL) OR (v_diff < 0 AND fx.loss IS NULL) THEN
            RAISE EXCEPTION 'حسابا فروقات العملة المحققة غير معرّفين في company_settings (الفرق %)', v_diff USING ERRCODE = '23514';
        END IF;
        IF v_diff > 0 THEN
            PERFORM erp.fn_pur_je_line(v_entry, h.company_id, fx.gain, NULL, v_base, 'C', v_diff, NULL, NULL, 'ربح فروقات عملة محققة - ' || v_desc);
        ELSE
            PERFORM erp.fn_pur_je_line(v_entry, h.company_id, fx.loss, NULL, v_base, 'D', -v_diff, NULL, NULL, 'خسارة فروقات عملة محققة - ' || v_desc);
        END IF;
    END IF;

    PERFORM erp.post_journal_entry(v_entry, p_user_id);

    UPDATE erp.financial_vouchers
       SET status = 'posted', journal_entry_id = v_entry, posted_by = p_user_id, posted_at = now(),
           total_fc = v_t_fc, fx_difference_local = v_diff
     WHERE id = h.id;

    PERFORM set_config('erp.voucher_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.post_financial_voucher(p_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 706 (class 1255 OID 43097)
-- Name: post_journal_entry(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.post_journal_entry(p_entry_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE erp.journal_entries SET status = 'posted', posted_by = p_user_id
     WHERE id = p_entry_id AND status = 'draft';
    IF NOT FOUND THEN
        RAISE EXCEPTION 'القيد غير موجود أو ليس مسودة' USING ERRCODE = '23514';
    END IF;
END $$;


ALTER FUNCTION erp.post_journal_entry(p_entry_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 621 (class 1255 OID 44202)
-- Name: post_purchase_invoice(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.post_purchase_invoice(p_doc_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    d          record;
    s          record;
    wh         record;
    ps         record;
    l          record;
    lc         record;
    r          record;
    v_dp       smallint;
    v_base     bigint;
    v_cum_net  numeric := 0;  v_cum_tax numeric := 0;
    v_r_net    numeric;       v_r_tax   numeric;
    v_prev_net numeric := 0;  v_prev_tax numeric := 0;
    v_cum      numeric;       v_prev    numeric;     v_r numeric;   v_tot numeric;
    v_net_local   numeric;    v_tax_local numeric;   v_gross_local numeric;
    v_landed_local numeric := 0;
    v_credit_acc  bigint;
    v_sdoc  bigint;  v_sline bigint;  v_batch bigint;  v_val numeric;  v_cost_total numeric := 0;
    v_entry bigint;  v_desc text;     v_acc bigint;
BEGIN
    SELECT * INTO d FROM erp.purchase_documents WHERE id = p_doc_id FOR UPDATE;
    IF NOT FOUND OR d.doc_type <> 'invoice' THEN
        RAISE EXCEPTION 'فاتورة المشتريات غير موجودة' USING ERRCODE = '23503';
    END IF;
    IF d.status <> 'draft' THEN
        RAISE EXCEPTION 'الفاتورة مُرحّلة مسبقاً' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.purchase_document_lines WHERE document_id = d.id) THEN
        RAISE EXCEPTION 'الفاتورة بلا أسطر' USING ERRCODE = '23514';
    END IF;

    SELECT * INTO s FROM erp.suppliers WHERE id = d.supplier_id FOR UPDATE;   -- قفل لفحص حد الائتمان
    IF NOT s.is_active THEN
        RAISE EXCEPTION 'المورد غير فعّال' USING ERRCODE = '23514';
    END IF;
    SELECT * INTO wh FROM erp.warehouses WHERE id = d.warehouse_id;
    SELECT vat_input_account_id INTO ps FROM erp.purchasing_settings WHERE company_id = d.company_id;
    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = d.company_id;
    v_dp := erp.fn_base_decimals(d.company_id);

    PERFORM set_config('erp.purch_write', 'on', true);
    PERFORM set_config('erp.stock_write', 'on', true);

    -- (1) المبالغ المحلية للأسطر بالتقريب التراكمي (مجموع الأسطر = تقريب المجموع)
    FOR l IN SELECT id, net_fc, tax_fc FROM erp.purchase_document_lines WHERE document_id = d.id ORDER BY line_no LOOP
        v_cum_net := v_cum_net + l.net_fc;  v_r_net := round(v_cum_net * d.exchange_rate, v_dp);
        v_cum_tax := v_cum_tax + l.tax_fc;  v_r_tax := round(v_cum_tax * d.exchange_rate, v_dp);
        UPDATE erp.purchase_document_lines
           SET net_local = v_r_net - v_prev_net, tax_local = v_r_tax - v_prev_tax WHERE id = l.id;
        v_prev_net := v_r_net;  v_prev_tax := v_r_tax;
    END LOOP;
    v_net_local := v_prev_net;  v_tax_local := v_prev_tax;
    v_gross_local := v_net_local + v_tax_local;
    IF v_gross_local <= 0 THEN
        RAISE EXCEPTION 'قيمة الفاتورة يجب أن تكون أكبر من صفر' USING ERRCODE = '23514';
    END IF;
    IF v_tax_local > 0 AND ps.vat_input_account_id IS NULL THEN
        RAISE EXCEPTION 'حساب ضريبة المدخلات غير معرّف في purchasing_settings' USING ERRCODE = '23514';
    END IF;

    -- (2) توزيع المصاريف الإضافية على الأسطر (بالقيمة أو الكمية) بتقريب تراكمي، والباقي مضمون الدقة
    FOR lc IN SELECT * FROM erp.purchase_landed_costs WHERE document_id = d.id ORDER BY id LOOP
        v_landed_local := v_landed_local + lc.amount_local;
        SELECT SUM(CASE lc.allocation_method WHEN 'value' THEN net_local ELSE qty_base END) INTO v_tot
          FROM erp.purchase_document_lines WHERE document_id = d.id;
        IF COALESCE(v_tot, 0) <= 0 THEN
            RAISE EXCEPTION 'لا يمكن توزيع المصروف الإضافي: أساس التوزيع (%) = صفر', lc.allocation_method USING ERRCODE = '23514';
        END IF;
        v_cum := 0;  v_prev := 0;
        FOR l IN SELECT id, net_local, qty_base FROM erp.purchase_document_lines WHERE document_id = d.id ORDER BY line_no LOOP
            v_cum := v_cum + CASE lc.allocation_method WHEN 'value' THEN l.net_local ELSE l.qty_base END;
            v_r   := round(lc.amount_local * v_cum / v_tot, v_dp);
            INSERT INTO erp.purchase_landed_allocations (landed_cost_id, line_id, amount_local) VALUES (lc.id, l.id, v_r - v_prev);
            v_prev := v_r;
        END LOOP;
    END LOOP;
    UPDATE erp.purchase_document_lines pl
       SET landed_local = COALESCE((SELECT SUM(a.amount_local) FROM erp.purchase_landed_allocations a WHERE a.line_id = pl.id), 0)
     WHERE pl.document_id = d.id;
    UPDATE erp.purchase_document_lines SET cost_local = net_local + landed_local WHERE document_id = d.id;

    -- (3) حد الائتمان (للآجل)
    IF d.payment_type = 'credit' AND s.credit_limit IS NOT NULL
       AND erp.fn_supplier_balance(s.id) + v_gross_local > s.credit_limit THEN
        RAISE EXCEPTION 'تجاوز حد الائتمان للمورد: الرصيد % + الفاتورة % > الحد %',
            erp.fn_supplier_balance(s.id), v_gross_local, s.credit_limit USING ERRCODE = '23514';
    END IF;

    v_credit_acc := CASE d.payment_type WHEN 'credit' THEN s.account_id ELSE d.payment_account_id END;

    -- (4) مستند التوريد المخزني + الحركات + WAC (بتكلفة السطر الفعلية شاملة المصاريف)
    INSERT INTO erp.stock_documents (company_id, branch_id, doc_type, doc_date, warehouse_id, counter_account_id,
                                     cost_center_id, notes, created_by)
    VALUES (d.company_id, d.branch_id, 'receipt', d.doc_date, d.warehouse_id, v_credit_acc,
            d.cost_center_id, 'توريد تلقائي - فاتورة مشتريات رقم ' || d.doc_no, p_user_id)
    RETURNING id INTO v_sdoc;

    FOR l IN SELECT * FROM erp.purchase_document_lines WHERE document_id = d.id ORDER BY item_id, line_no LOOP
        v_batch := erp.fn_resolve_batch(d.company_id, l.item_id, l.batch_id, l.batch_no, l.manufacture_date, l.expiry_date, true, l.line_no);

        INSERT INTO erp.stock_document_lines (company_id, document_id, item_id, item_unit_id, quantity, unit_cost, batch_id, notes)
        VALUES (d.company_id, v_sdoc, l.item_id, l.item_unit_id, l.quantity, round(l.cost_local / l.quantity, 6), v_batch,
                'فاتورة مشتريات ' || d.doc_no)
        RETURNING id INTO v_sline;

        v_val := erp.fn_apply_stock_movement(v_sdoc, v_sline, d.company_id, d.doc_date, d.warehouse_id, l.item_id, v_batch,
                                             l.qty_base, l.cost_local, true, v_dp);
        UPDATE erp.stock_document_lines SET line_value = v_val WHERE id = v_sline;
        UPDATE erp.purchase_document_lines SET batch_id = v_batch WHERE id = l.id;
        UPDATE erp.item_units SET purchase_price = round(l.cost_local / l.quantity, 4) WHERE id = l.item_unit_id;
        v_cost_total := v_cost_total + v_val;

        IF l.order_line_id IS NOT NULL THEN
            UPDATE erp.purchase_document_lines SET settled_qty_base = settled_qty_base + l.qty_base WHERE id = l.order_line_id;
        END IF;
    END LOOP;

    -- (5) القيد المحاسبي
    v_desc := 'فاتورة مشتريات رقم ' || d.doc_no || ' - ' || s.name_ar;
    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (d.company_id, d.branch_id, d.doc_date, 'purchase', 'purchase_document', d.id,
            COALESCE(d.supplier_invoice_no, 'PUR-INV-' || d.doc_no), v_desc, p_user_id)
    RETURNING id INTO v_entry;

    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, wh.account_id, d.cost_center_id, v_base, 'D', v_cost_total, NULL, NULL, v_desc);
    IF v_tax_local > 0 THEN
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, ps.vat_input_account_id, d.cost_center_id, v_base, 'D', v_tax_local, NULL, NULL, 'ضريبة مدخلات - ' || v_desc);
    END IF;
    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, v_credit_acc, d.cost_center_id, d.currency_id, 'C',
                               d.total_fc, v_gross_local, d.exchange_rate, v_desc);

    FOR lc IN SELECT * FROM erp.purchase_landed_costs WHERE document_id = d.id ORDER BY id LOOP
        v_acc := COALESCE(lc.credit_account_id, (SELECT account_id FROM erp.suppliers WHERE id = lc.payee_supplier_id));
        IF v_acc IS NULL THEN
            RAISE EXCEPTION 'لا يوجد حساب دائن للمصروف الإضافي رقم %', lc.id USING ERRCODE = '23514';
        END IF;
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, v_acc, d.cost_center_id, lc.currency_id, 'C',
                                   lc.amount_fc, lc.amount_local, lc.exchange_rate, 'مصاريف إضافية - ' || v_desc);
        IF lc.payee_supplier_id IS NOT NULL THEN
            INSERT INTO erp.supplier_ledger (company_id, supplier_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                             currency_id, exchange_rate, credit_fc, credit_local, description)
            VALUES (d.company_id, lc.payee_supplier_id, d.doc_date, d.doc_date, 'landed_cost', lc.id, v_entry,
                    lc.currency_id, lc.exchange_rate, lc.amount_fc, lc.amount_local, 'مصاريف إضافية - فاتورة ' || d.doc_no);
        END IF;
    END LOOP;

    PERFORM erp.post_journal_entry(v_entry, p_user_id);

    -- (6) دفتر المورد (الآجل فقط)
    IF d.payment_type = 'credit' THEN
        INSERT INTO erp.supplier_ledger (company_id, supplier_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                         currency_id, exchange_rate, credit_fc, credit_local, description)
        VALUES (d.company_id, d.supplier_id, d.doc_date, d.due_date, 'purchase_invoice', d.id, v_entry,
                d.currency_id, d.exchange_rate, d.total_fc, v_gross_local, v_desc);
    END IF;

    -- (7) إقفال المستندات
    UPDATE erp.stock_documents
       SET status = 'posted', total_value = v_cost_total, journal_entry_id = v_entry, posted_at = now(), posted_by = p_user_id
     WHERE id = v_sdoc;

    UPDATE erp.purchase_documents
       SET status = 'posted', subtotal_local = v_net_local, tax_local = v_tax_local, total_local = v_gross_local,
           landed_cost_local = v_landed_local, journal_entry_id = v_entry, stock_document_id = v_sdoc,
           posted_at = now(), posted_by = p_user_id
     WHERE id = d.id;

    FOR r IN SELECT DISTINCT ol.document_id AS order_id
               FROM erp.purchase_document_lines il
               JOIN erp.purchase_document_lines ol ON ol.id = il.order_line_id
              WHERE il.document_id = d.id LOOP
        PERFORM erp.fn_refresh_order_status(r.order_id);
    END LOOP;

    PERFORM set_config('erp.purch_write', 'off', true);
    PERFORM set_config('erp.stock_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.post_purchase_invoice(p_doc_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 747 (class 1255 OID 44204)
-- Name: post_purchase_return(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.post_purchase_return(p_doc_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    d          record;
    s          record;
    wh         record;
    ps         record;
    l          record;
    v_dp       smallint;
    v_base     bigint;
    v_cum_net  numeric := 0;  v_cum_tax numeric := 0;
    v_r_net    numeric;       v_r_tax   numeric;
    v_prev_net numeric := 0;  v_prev_tax numeric := 0;
    v_net_local   numeric;    v_tax_local numeric;   v_gross_local numeric;
    v_acc     bigint;
    v_sdoc    bigint;  v_sline bigint;  v_batch bigint;  v_val numeric;  v_stock_total numeric := 0;
    v_diff    numeric; v_entry bigint;  v_desc text;
BEGIN
    SELECT * INTO d FROM erp.purchase_documents WHERE id = p_doc_id FOR UPDATE;
    IF NOT FOUND OR d.doc_type <> 'return' THEN
        RAISE EXCEPTION 'مردود المشتريات غير موجود' USING ERRCODE = '23503';
    END IF;
    IF d.status <> 'draft' THEN
        RAISE EXCEPTION 'المردود مُرحّل مسبقاً' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.purchase_document_lines WHERE document_id = d.id) THEN
        RAISE EXCEPTION 'المردود بلا أسطر' USING ERRCODE = '23514';
    END IF;

    SELECT * INTO s FROM erp.suppliers WHERE id = d.supplier_id FOR UPDATE;
    SELECT * INTO wh FROM erp.warehouses WHERE id = d.warehouse_id;
    SELECT vat_input_account_id, purchase_variance_account_id INTO ps FROM erp.purchasing_settings WHERE company_id = d.company_id;
    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = d.company_id;
    v_dp := erp.fn_base_decimals(d.company_id);

    PERFORM set_config('erp.purch_write', 'on', true);
    PERFORM set_config('erp.stock_write', 'on', true);

    FOR l IN SELECT id, net_fc, tax_fc FROM erp.purchase_document_lines WHERE document_id = d.id ORDER BY line_no LOOP
        v_cum_net := v_cum_net + l.net_fc;  v_r_net := round(v_cum_net * d.exchange_rate, v_dp);
        v_cum_tax := v_cum_tax + l.tax_fc;  v_r_tax := round(v_cum_tax * d.exchange_rate, v_dp);
        UPDATE erp.purchase_document_lines
           SET net_local = v_r_net - v_prev_net, tax_local = v_r_tax - v_prev_tax, cost_local = v_r_net - v_prev_net
         WHERE id = l.id;
        v_prev_net := v_r_net;  v_prev_tax := v_r_tax;
    END LOOP;
    v_net_local := v_prev_net;  v_tax_local := v_prev_tax;
    v_gross_local := v_net_local + v_tax_local;
    IF v_gross_local <= 0 THEN
        RAISE EXCEPTION 'قيمة المردود يجب أن تكون أكبر من صفر' USING ERRCODE = '23514';
    END IF;
    IF v_tax_local > 0 AND ps.vat_input_account_id IS NULL THEN
        RAISE EXCEPTION 'حساب ضريبة المدخلات غير معرّف في purchasing_settings' USING ERRCODE = '23514';
    END IF;

    v_acc := CASE d.payment_type WHEN 'credit' THEN s.account_id ELSE d.payment_account_id END;

    INSERT INTO erp.stock_documents (company_id, branch_id, doc_type, doc_date, warehouse_id, counter_account_id,
                                     cost_center_id, notes, created_by)
    VALUES (d.company_id, d.branch_id, 'issue', d.doc_date, d.warehouse_id, v_acc,
            d.cost_center_id, 'صرف تلقائي - مردود مشتريات رقم ' || d.doc_no, p_user_id)
    RETURNING id INTO v_sdoc;

    FOR l IN SELECT * FROM erp.purchase_document_lines WHERE document_id = d.id ORDER BY item_id, line_no LOOP
        v_batch := erp.fn_resolve_batch(d.company_id, l.item_id, l.batch_id, l.batch_no, NULL, NULL, false, l.line_no);

        INSERT INTO erp.stock_document_lines (company_id, document_id, item_id, item_unit_id, quantity, batch_id, notes)
        VALUES (d.company_id, v_sdoc, l.item_id, l.item_unit_id, l.quantity, v_batch, 'مردود مشتريات ' || d.doc_no)
        RETURNING id INTO v_sline;

        -- لا يُمنع مردود تشغيلة منتهية الصلاحية (عكس الصرف العادي)
        v_val := erp.fn_apply_stock_movement(v_sdoc, v_sline, d.company_id, d.doc_date, d.warehouse_id, l.item_id, v_batch,
                                             -l.qty_base, NULL, wh.allow_negative_stock, v_dp);
        UPDATE erp.stock_document_lines SET line_value = v_val WHERE id = v_sline;
        UPDATE erp.purchase_document_lines SET batch_id = v_batch WHERE id = l.id;
        v_stock_total := v_stock_total + v_val;

        IF l.source_line_id IS NOT NULL THEN
            UPDATE erp.purchase_document_lines SET settled_qty_base = settled_qty_base + l.qty_base WHERE id = l.source_line_id;
        END IF;
    END LOOP;

    v_diff := v_net_local - v_stock_total;                       -- + = دائن فروقات | − = مدين فروقات
    IF v_diff <> 0 AND ps.purchase_variance_account_id IS NULL THEN
        RAISE EXCEPTION 'حساب فروقات المشتريات غير معرّف في purchasing_settings (الفرق %)', v_diff USING ERRCODE = '23514';
    END IF;

    v_desc := 'مردود مشتريات رقم ' || d.doc_no || ' - ' || s.name_ar;
    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (d.company_id, d.branch_id, d.doc_date, 'purchase', 'purchase_document', d.id,
            COALESCE(d.supplier_invoice_no, 'PUR-RET-' || d.doc_no), v_desc, p_user_id)
    RETURNING id INTO v_entry;

    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, v_acc, d.cost_center_id, d.currency_id, 'D',
                               d.total_fc, v_gross_local, d.exchange_rate, v_desc);
    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, wh.account_id, d.cost_center_id, v_base, 'C', v_stock_total, NULL, NULL, v_desc);
    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, ps.vat_input_account_id, d.cost_center_id, v_base, 'C', v_tax_local, NULL, NULL, 'عكس ضريبة مدخلات - ' || v_desc);
    IF v_diff > 0 THEN
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, ps.purchase_variance_account_id, d.cost_center_id, v_base, 'C', v_diff, NULL, NULL, 'فروقات مشتريات - ' || v_desc);
    ELSIF v_diff < 0 THEN
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, ps.purchase_variance_account_id, d.cost_center_id, v_base, 'D', -v_diff, NULL, NULL, 'فروقات مشتريات - ' || v_desc);
    END IF;

    PERFORM erp.post_journal_entry(v_entry, p_user_id);

    IF d.payment_type = 'credit' THEN
        INSERT INTO erp.supplier_ledger (company_id, supplier_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                         currency_id, exchange_rate, debit_fc, debit_local, description)
        VALUES (d.company_id, d.supplier_id, d.doc_date, d.doc_date, 'purchase_return', d.id, v_entry,
                d.currency_id, d.exchange_rate, d.total_fc, v_gross_local, v_desc);
    END IF;

    UPDATE erp.stock_documents
       SET status = 'posted', total_value = v_stock_total, journal_entry_id = v_entry, posted_at = now(), posted_by = p_user_id
     WHERE id = v_sdoc;

    UPDATE erp.purchase_documents
       SET status = 'posted', subtotal_local = v_net_local, tax_local = v_tax_local, total_local = v_gross_local,
           journal_entry_id = v_entry, stock_document_id = v_sdoc, posted_at = now(), posted_by = p_user_id
     WHERE id = d.id;

    PERFORM set_config('erp.purch_write', 'off', true);
    PERFORM set_config('erp.stock_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.post_purchase_return(p_doc_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 726 (class 1255 OID 44969)
-- Name: post_sales_invoice(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.post_sales_invoice(p_doc_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    d          record;
    c          record;
    wh         record;
    ss         record;
    l          record;
    b          record;
    pay        record;
    r          record;
    v_dp       smallint;
    v_base     bigint;
    v_pos_cash bigint;
    v_sess_status erp.pos_session_status;
    v_net_fc numeric;  v_tax_fc numeric;  v_total_fc numeric;
    v_cum_net numeric := 0;  v_cum_tax numeric := 0;
    v_r_net numeric;  v_r_tax numeric;
    v_prev_net numeric := 0;  v_prev_tax numeric := 0;
    v_last_line bigint;
    v_gross_local numeric;  v_tax_target numeric;
    v_paid_fc numeric;  v_credit_fc numeric;  v_paid_local numeric;  v_credit_local numeric;
    v_sdoc bigint;  v_sline bigint;  v_bu bigint;
    v_remaining numeric;  v_take numeric;  v_val numeric;  v_line_cogs numeric;  v_cogs_total numeric := 0;
    v_batch bigint;  v_exp date;  v_n int;
    v_entry bigint;  v_desc text;  v_acc bigint;
    v_cum_p numeric := 0;  v_prev_p numeric := 0;  v_rp numeric;
BEGIN
    SELECT * INTO d FROM erp.sales_documents WHERE id = p_doc_id FOR UPDATE;
    IF NOT FOUND OR d.doc_type <> 'invoice' THEN
        RAISE EXCEPTION 'فاتورة المبيعات غير موجودة' USING ERRCODE = '23503';
    END IF;
    IF d.status <> 'draft' THEN
        RAISE EXCEPTION 'الفاتورة مُرحّلة مسبقاً' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.sales_document_lines WHERE document_id = d.id) THEN
        RAISE EXCEPTION 'الفاتورة بلا أسطر' USING ERRCODE = '23514';
    END IF;

    -- يُنفَّذ دائماً: عند البيع بلا عميل يصبح c سجلاً بقيم NULL (وإلا يفشل الوصول لحقوله)
    SELECT * INTO c FROM erp.customers WHERE id = d.customer_id FOR UPDATE;      -- قفل لفحص حد الائتمان
    IF d.customer_id IS NOT NULL AND NOT c.is_active THEN
        RAISE EXCEPTION 'العميل غير فعّال' USING ERRCODE = '23514';
    END IF;
    SELECT * INTO wh FROM erp.warehouses WHERE id = d.warehouse_id;
    SELECT * INTO ss FROM erp.sales_settings WHERE company_id = d.company_id;
    IF NOT FOUND OR ss.default_revenue_account_id IS NULL OR ss.default_cogs_account_id IS NULL THEN
        RAISE EXCEPTION 'أكمل إعدادات المبيعات (حساب الإيراد وتكلفة المبيعات الافتراضيان)' USING ERRCODE = '23514';
    END IF;
    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = d.company_id;
    v_dp := erp.fn_base_decimals(d.company_id);

    IF d.pos_session_id IS NOT NULL THEN
        SELECT s.status, r2.cash_account_id INTO v_sess_status, v_pos_cash
          FROM erp.pos_sessions s JOIN erp.pos_registers r2 ON r2.id = s.register_id WHERE s.id = d.pos_session_id;
        IF v_sess_status <> 'open' THEN
            RAISE EXCEPTION 'وردية نقطة البيع مغلقة' USING ERRCODE = '23514';
        END IF;
    END IF;

    PERFORM set_config('erp.sales_write', 'on', true);
    PERFORM set_config('erp.stock_write', 'on', true);

    -- (1) المبالغ المحلية: الإجمالي بتقريب واحد، والصافي تراكمياً، والضريبة = الفرق
    SELECT SUM(net_fc), SUM(tax_fc) INTO v_net_fc, v_tax_fc FROM erp.sales_document_lines WHERE document_id = d.id;
    v_total_fc    := v_net_fc + v_tax_fc;
    IF v_total_fc <= 0 THEN
        RAISE EXCEPTION 'قيمة الفاتورة يجب أن تكون أكبر من صفر' USING ERRCODE = '23514';
    END IF;
    v_gross_local := round(v_total_fc * d.exchange_rate, v_dp);

    FOR l IN SELECT id, net_fc, tax_fc FROM erp.sales_document_lines WHERE document_id = d.id ORDER BY line_no LOOP
        v_cum_net := v_cum_net + l.net_fc;  v_r_net := round(v_cum_net * d.exchange_rate, v_dp);
        v_cum_tax := v_cum_tax + l.tax_fc;  v_r_tax := round(v_cum_tax * d.exchange_rate, v_dp);
        UPDATE erp.sales_document_lines SET net_local = v_r_net - v_prev_net, tax_local = v_r_tax - v_prev_tax WHERE id = l.id;
        v_prev_net := v_r_net;  v_prev_tax := v_r_tax;  v_last_line := l.id;
    END LOOP;
    v_tax_target := v_gross_local - v_prev_net;
    IF v_tax_target <> v_prev_tax THEN
        UPDATE erp.sales_document_lines SET tax_local = tax_local + (v_tax_target - v_prev_tax) WHERE id = v_last_line;
    END IF;
    IF v_tax_target > 0 AND ss.vat_output_account_id IS NULL THEN
        RAISE EXCEPTION 'حساب ضريبة المخرجات غير معرّف في sales_settings' USING ERRCODE = '23514';
    END IF;

    -- (2) الدفع: أسطر الدفع + الباقي آجل على العميل
    SELECT COALESCE(SUM(amount_fc), 0) INTO v_paid_fc FROM erp.sales_document_payments WHERE document_id = d.id;
    IF v_paid_fc > v_total_fc THEN
        RAISE EXCEPTION 'المدفوع % أكبر من إجمالي الفاتورة %', v_paid_fc, v_total_fc USING ERRCODE = '23514';
    END IF;
    v_credit_fc    := v_total_fc - v_paid_fc;
    v_paid_local   := round(v_paid_fc * d.exchange_rate, v_dp);
    v_credit_local := v_gross_local - v_paid_local;
    IF v_credit_fc > 0 AND d.customer_id IS NULL THEN
        RAISE EXCEPTION 'البيع بدون عميل يجب أن يُسدَّد بالكامل (المتبقي %)', v_credit_fc USING ERRCODE = '23514';
    END IF;
    IF v_credit_fc > 0 AND c.credit_limit IS NOT NULL
       AND erp.fn_customer_balance(c.id) + v_credit_local > c.credit_limit THEN
        RAISE EXCEPTION 'تجاوز حد الائتمان للعميل: الرصيد % + الآجل % > الحد %',
            erp.fn_customer_balance(c.id), v_credit_local, c.credit_limit USING ERRCODE = '23514';
    END IF;

    -- (3) مستند الصرف المخزني + FEFO + COGS بالمتوسط المرجح
    INSERT INTO erp.stock_documents (company_id, branch_id, doc_type, doc_date, warehouse_id, counter_account_id,
                                     cost_center_id, notes, created_by)
    VALUES (d.company_id, d.branch_id, 'issue', d.doc_date, d.warehouse_id, ss.default_cogs_account_id,
            d.cost_center_id, 'صرف تلقائي - فاتورة مبيعات رقم ' || d.doc_no, p_user_id)
    RETURNING id INTO v_sdoc;

    FOR l IN SELECT sl.*, i.track_batch, i.track_expiry
               FROM erp.sales_document_lines sl JOIN erp.items i ON i.id = sl.item_id
              WHERE sl.document_id = d.id ORDER BY sl.item_id, sl.line_no LOOP
        SELECT id INTO v_bu FROM erp.item_units WHERE item_id = l.item_id AND is_base;
        v_line_cogs := 0;  v_batch := NULL;

        IF l.track_batch AND l.batch_id IS NULL AND l.batch_no IS NULL THEN
            -- FEFO: الأقرب انتهاءً أولاً، مع تجاهل المنتهي
            v_remaining := l.qty_base;  v_n := 0;
            FOR b IN SELECT bb.batch_id, bb.qty_on_hand
                       FROM erp.stock_batch_balances bb JOIN erp.item_batches ib ON ib.id = bb.batch_id
                      WHERE bb.warehouse_id = d.warehouse_id AND bb.item_id = l.item_id AND bb.qty_on_hand > 0
                        AND ib.is_active AND (ib.expiry_date IS NULL OR ib.expiry_date >= d.doc_date)
                      ORDER BY ib.expiry_date NULLS LAST, bb.batch_id
                        FOR UPDATE OF bb LOOP
                v_take := LEAST(v_remaining, b.qty_on_hand);
                INSERT INTO erp.stock_document_lines (company_id, document_id, item_id, item_unit_id, quantity, batch_id, notes)
                VALUES (d.company_id, v_sdoc, l.item_id, v_bu, v_take, b.batch_id, 'FEFO - فاتورة ' || d.doc_no)
                RETURNING id INTO v_sline;
                v_val := erp.fn_apply_stock_movement(v_sdoc, v_sline, d.company_id, d.doc_date, d.warehouse_id, l.item_id,
                                                     b.batch_id, -v_take, NULL, wh.allow_negative_stock, v_dp);
                UPDATE erp.stock_document_lines SET line_value = v_val WHERE id = v_sline;
                v_line_cogs := v_line_cogs + v_val;  v_remaining := v_remaining - v_take;
                v_n := v_n + 1;  v_batch := b.batch_id;
                EXIT WHEN v_remaining <= 0;
            END LOOP;
            IF v_remaining > 0 THEN
                RAISE EXCEPTION 'السطر %: رصيد التشغيلات الصالحة غير كافٍ (ناقص %)', l.line_no, v_remaining USING ERRCODE = '23514';
            END IF;
            IF v_n > 1 THEN
                v_batch := NULL;               -- السطر وُزّع على أكثر من تشغيلة (التفصيل في stock_movements)
            END IF;
        ELSE
            IF l.track_batch THEN
                v_batch := erp.fn_resolve_batch(d.company_id, l.item_id, l.batch_id, l.batch_no, NULL, NULL, false, l.line_no);
                IF l.track_expiry THEN
                    SELECT expiry_date INTO v_exp FROM erp.item_batches WHERE id = v_batch;
                    IF v_exp < d.doc_date THEN
                        RAISE EXCEPTION 'السطر %: التشغيلة منتهية الصلاحية (%)', l.line_no, v_exp USING ERRCODE = '23514';
                    END IF;
                END IF;
            END IF;
            INSERT INTO erp.stock_document_lines (company_id, document_id, item_id, item_unit_id, quantity, batch_id, notes)
            VALUES (d.company_id, v_sdoc, l.item_id, v_bu, l.qty_base, v_batch, 'فاتورة مبيعات ' || d.doc_no)
            RETURNING id INTO v_sline;
            v_val := erp.fn_apply_stock_movement(v_sdoc, v_sline, d.company_id, d.doc_date, d.warehouse_id, l.item_id,
                                                 v_batch, -l.qty_base, NULL, wh.allow_negative_stock, v_dp);   -- يتحقق من توفر الرصيد
            UPDATE erp.stock_document_lines SET line_value = v_val WHERE id = v_sline;
            v_line_cogs := v_val;
        END IF;

        UPDATE erp.sales_document_lines SET cogs_local = v_line_cogs, batch_id = v_batch WHERE id = l.id;
        v_cogs_total := v_cogs_total + v_line_cogs;
        IF l.order_line_id IS NOT NULL THEN
            UPDATE erp.sales_document_lines SET settled_qty_base = settled_qty_base + l.qty_base WHERE id = l.order_line_id;
        END IF;
    END LOOP;

    -- (4) القيد المحاسبي
    v_desc := 'فاتورة مبيعات رقم ' || d.doc_no || COALESCE(' - ' || c.name_ar, ' - بيع نقدي');
    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (d.company_id, d.branch_id, d.doc_date, 'sales', 'sales_document', d.id,
            COALESCE(d.customer_po_no, 'SAL-INV-' || d.doc_no), v_desc, p_user_id)
    RETURNING id INTO v_entry;

    IF v_credit_fc > 0 THEN
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, c.account_id, d.cost_center_id, d.currency_id, 'D',
                                   v_credit_fc, v_credit_local, d.exchange_rate, v_desc);
    END IF;
    FOR pay IN SELECT p.id, p.amount_fc, m.kind, m.account_id AS m_acc
                 FROM erp.sales_document_payments p JOIN erp.payment_methods m ON m.id = p.payment_method_id
                WHERE p.document_id = d.id ORDER BY p.id LOOP
        v_cum_p := v_cum_p + pay.amount_fc;
        v_rp    := round(v_cum_p * d.exchange_rate, v_dp);
        v_acc   := CASE WHEN pay.kind = 'cash' AND v_pos_cash IS NOT NULL THEN v_pos_cash ELSE pay.m_acc END;   -- النقد يدخل درج الكاشير
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, v_acc, d.cost_center_id, d.currency_id, 'D',
                                   pay.amount_fc, v_rp - v_prev_p, d.exchange_rate, v_desc);
        UPDATE erp.sales_document_payments SET amount_local = v_rp - v_prev_p WHERE id = pay.id;
        v_prev_p := v_rp;
    END LOOP;

    FOR r IN SELECT COALESCE(ia.revenue_account_id, ss.default_revenue_account_id) AS acc, SUM(sl.net_local) AS amt
               FROM erp.sales_document_lines sl LEFT JOIN erp.item_accounts ia ON ia.item_id = sl.item_id
              WHERE sl.document_id = d.id GROUP BY 1 LOOP
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, r.acc, d.cost_center_id, v_base, 'C', r.amt, NULL, NULL, 'إيراد مبيعات - ' || v_desc);
    END LOOP;
    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, ss.vat_output_account_id, d.cost_center_id, v_base, 'C',
                               v_tax_target, NULL, NULL, 'ضريبة مخرجات - ' || v_desc);

    FOR r IN SELECT COALESCE(ia.cogs_account_id, ss.default_cogs_account_id) AS acc, SUM(sl.cogs_local) AS amt
               FROM erp.sales_document_lines sl LEFT JOIN erp.item_accounts ia ON ia.item_id = sl.item_id
              WHERE sl.document_id = d.id GROUP BY 1 LOOP
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, r.acc, d.cost_center_id, v_base, 'D', r.amt, NULL, NULL, 'تكلفة مبيعات - ' || v_desc);
    END LOOP;
    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, wh.account_id, d.cost_center_id, v_base, 'C', v_cogs_total, NULL, NULL, 'مخزون - ' || v_desc);

    PERFORM erp.post_journal_entry(v_entry, p_user_id);

    IF v_credit_fc > 0 THEN
        INSERT INTO erp.customer_ledger (company_id, customer_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                         currency_id, exchange_rate, debit_fc, debit_local, description)
        VALUES (d.company_id, d.customer_id, d.doc_date, d.due_date, 'sales_invoice', d.id, v_entry,
                d.currency_id, d.exchange_rate, v_credit_fc, v_credit_local, v_desc);
    END IF;

    -- (5) إقفال المستندات
    UPDATE erp.stock_documents
       SET status = 'posted', total_value = v_cogs_total, journal_entry_id = v_entry, posted_at = now(), posted_by = p_user_id
     WHERE id = v_sdoc;

    UPDATE erp.sales_documents
       SET status = 'posted', subtotal_local = v_prev_net, tax_local = v_tax_target, total_local = v_gross_local,
           paid_fc = v_paid_fc, credit_fc = v_credit_fc, cogs_local = v_cogs_total,
           journal_entry_id = v_entry, stock_document_id = v_sdoc, posted_at = now(), posted_by = p_user_id
     WHERE id = d.id;

    FOR r IN SELECT DISTINCT ol.document_id AS order_id
               FROM erp.sales_document_lines il JOIN erp.sales_document_lines ol ON ol.id = il.order_line_id
              WHERE il.document_id = d.id LOOP
        PERFORM erp.fn_refresh_sales_order_status(r.order_id);
    END LOOP;

    PERFORM set_config('erp.sales_write', 'off', true);
    PERFORM set_config('erp.stock_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.post_sales_invoice(p_doc_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 476 (class 1255 OID 44971)
-- Name: post_sales_return(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.post_sales_return(p_doc_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    d          record;
    c          record;
    wh         record;
    ss         record;
    l          record;
    pay        record;
    r          record;
    src        record;
    v_dp       smallint;
    v_base     bigint;
    v_pos_cash bigint;
    v_sess_status erp.pos_session_status;
    v_net_fc numeric;  v_tax_fc numeric;  v_total_fc numeric;
    v_cum_net numeric := 0;  v_cum_tax numeric := 0;
    v_r_net numeric;  v_r_tax numeric;
    v_prev_net numeric := 0;  v_prev_tax numeric := 0;
    v_last_line bigint;
    v_gross_local numeric;  v_tax_target numeric;
    v_paid_fc numeric;  v_credit_fc numeric;  v_paid_local numeric;  v_credit_local numeric;
    v_sdoc bigint;  v_sline bigint;  v_bu bigint;  v_batch bigint;  v_src_batch bigint;
    v_avg numeric;  v_val numeric;  v_cogs_total numeric := 0;
    v_entry bigint;  v_desc text;  v_acc bigint;  v_ret_acc bigint;
    v_cum_p numeric := 0;  v_prev_p numeric := 0;  v_rp numeric;
BEGIN
    SELECT * INTO d FROM erp.sales_documents WHERE id = p_doc_id FOR UPDATE;
    IF NOT FOUND OR d.doc_type <> 'return' THEN
        RAISE EXCEPTION 'مردود المبيعات غير موجود' USING ERRCODE = '23503';
    END IF;
    IF d.status <> 'draft' THEN
        RAISE EXCEPTION 'المردود مُرحّل مسبقاً' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.sales_document_lines WHERE document_id = d.id) THEN
        RAISE EXCEPTION 'المردود بلا أسطر' USING ERRCODE = '23514';
    END IF;

    SELECT * INTO c FROM erp.customers WHERE id = d.customer_id FOR UPDATE;      -- c = NULLs عند عدم وجود عميل
    SELECT * INTO wh FROM erp.warehouses WHERE id = d.warehouse_id;
    SELECT * INTO ss FROM erp.sales_settings WHERE company_id = d.company_id;
    IF NOT FOUND OR ss.default_revenue_account_id IS NULL OR ss.default_cogs_account_id IS NULL THEN
        RAISE EXCEPTION 'أكمل إعدادات المبيعات (حساب الإيراد وتكلفة المبيعات الافتراضيان)' USING ERRCODE = '23514';
    END IF;
    SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = d.company_id;
    v_dp := erp.fn_base_decimals(d.company_id);

    IF d.pos_session_id IS NOT NULL THEN
        SELECT s.status, r2.cash_account_id INTO v_sess_status, v_pos_cash
          FROM erp.pos_sessions s JOIN erp.pos_registers r2 ON r2.id = s.register_id WHERE s.id = d.pos_session_id;
        IF v_sess_status <> 'open' THEN
            RAISE EXCEPTION 'وردية نقطة البيع مغلقة' USING ERRCODE = '23514';
        END IF;
    END IF;

    PERFORM set_config('erp.sales_write', 'on', true);
    PERFORM set_config('erp.stock_write', 'on', true);

    -- المبالغ المحلية (نفس منهج الفاتورة)
    SELECT SUM(net_fc), SUM(tax_fc) INTO v_net_fc, v_tax_fc FROM erp.sales_document_lines WHERE document_id = d.id;
    v_total_fc    := v_net_fc + v_tax_fc;
    IF v_total_fc <= 0 THEN
        RAISE EXCEPTION 'قيمة المردود يجب أن تكون أكبر من صفر' USING ERRCODE = '23514';
    END IF;
    v_gross_local := round(v_total_fc * d.exchange_rate, v_dp);

    FOR l IN SELECT id, net_fc, tax_fc FROM erp.sales_document_lines WHERE document_id = d.id ORDER BY line_no LOOP
        v_cum_net := v_cum_net + l.net_fc;  v_r_net := round(v_cum_net * d.exchange_rate, v_dp);
        v_cum_tax := v_cum_tax + l.tax_fc;  v_r_tax := round(v_cum_tax * d.exchange_rate, v_dp);
        UPDATE erp.sales_document_lines SET net_local = v_r_net - v_prev_net, tax_local = v_r_tax - v_prev_tax WHERE id = l.id;
        v_prev_net := v_r_net;  v_prev_tax := v_r_tax;  v_last_line := l.id;
    END LOOP;
    v_tax_target := v_gross_local - v_prev_net;
    IF v_tax_target <> v_prev_tax THEN
        UPDATE erp.sales_document_lines SET tax_local = tax_local + (v_tax_target - v_prev_tax) WHERE id = v_last_line;
    END IF;
    IF v_tax_target > 0 AND ss.vat_output_account_id IS NULL THEN
        RAISE EXCEPTION 'حساب ضريبة المخرجات غير معرّف في sales_settings' USING ERRCODE = '23514';
    END IF;

    -- الاسترداد: أسطر الدفع (نقدي/شبكة) والباقي رصيد دائن للعميل
    SELECT COALESCE(SUM(amount_fc), 0) INTO v_paid_fc FROM erp.sales_document_payments WHERE document_id = d.id;
    IF v_paid_fc > v_total_fc THEN
        RAISE EXCEPTION 'المبلغ المسترد % أكبر من إجمالي المردود %', v_paid_fc, v_total_fc USING ERRCODE = '23514';
    END IF;
    v_credit_fc    := v_total_fc - v_paid_fc;
    v_paid_local   := round(v_paid_fc * d.exchange_rate, v_dp);
    v_credit_local := v_gross_local - v_paid_local;
    IF v_credit_fc > 0 AND d.customer_id IS NULL THEN
        RAISE EXCEPTION 'مردود بدون عميل يجب أن يُسترد بالكامل (المتبقي %)', v_credit_fc USING ERRCODE = '23514';
    END IF;

    -- مستند الإدخال المخزني
    INSERT INTO erp.stock_documents (company_id, branch_id, doc_type, doc_date, warehouse_id, counter_account_id,
                                     cost_center_id, notes, created_by)
    VALUES (d.company_id, d.branch_id, 'receipt', d.doc_date, d.warehouse_id, ss.default_cogs_account_id,
            d.cost_center_id, 'إدخال تلقائي - مردود مبيعات رقم ' || d.doc_no, p_user_id)
    RETURNING id INTO v_sdoc;

    FOR l IN SELECT * FROM erp.sales_document_lines WHERE document_id = d.id ORDER BY item_id, line_no LOOP
        SELECT id INTO v_bu FROM erp.item_units WHERE item_id = l.item_id AND is_base;

        -- تكلفة المردود: تكلفة البيع الأصلية، وإلا المتوسط الحالي
        v_src_batch := NULL;  v_val := NULL;
        IF l.source_line_id IS NOT NULL THEN
            SELECT cogs_local, qty_base, batch_id INTO src FROM erp.sales_document_lines WHERE id = l.source_line_id;
            IF src.qty_base > 0 THEN
                v_val := round(l.qty_base * src.cogs_local / src.qty_base, v_dp);
            END IF;
            v_src_batch := src.batch_id;
        END IF;
        IF v_val IS NULL THEN
            SELECT CASE WHEN qty_on_hand > 0 THEN total_value / qty_on_hand ELSE last_avg_cost END INTO v_avg
              FROM erp.stock_balances WHERE warehouse_id = d.warehouse_id AND item_id = l.item_id;
            v_val := round(l.qty_base * COALESCE(v_avg, 0), v_dp);
        END IF;

        v_batch := erp.fn_resolve_batch(d.company_id, l.item_id, COALESCE(l.batch_id, v_src_batch), l.batch_no,
                                        NULL, NULL, false, l.line_no);

        INSERT INTO erp.stock_document_lines (company_id, document_id, item_id, item_unit_id, quantity, unit_cost, batch_id, notes)
        VALUES (d.company_id, v_sdoc, l.item_id, v_bu, l.qty_base, round(v_val / l.qty_base, 6), v_batch,
                'مردود مبيعات ' || d.doc_no)
        RETURNING id INTO v_sline;

        PERFORM erp.fn_apply_stock_movement(v_sdoc, v_sline, d.company_id, d.doc_date, d.warehouse_id, l.item_id,
                                            v_batch, l.qty_base, v_val, true, v_dp);
        UPDATE erp.stock_document_lines SET line_value = v_val WHERE id = v_sline;
        UPDATE erp.sales_document_lines SET cogs_local = v_val, batch_id = v_batch WHERE id = l.id;
        v_cogs_total := v_cogs_total + v_val;

        IF l.source_line_id IS NOT NULL THEN
            UPDATE erp.sales_document_lines SET settled_qty_base = settled_qty_base + l.qty_base WHERE id = l.source_line_id;
        END IF;
    END LOOP;

    -- القيد
    v_desc := 'مردود مبيعات رقم ' || d.doc_no || COALESCE(' - ' || c.name_ar, ' - بيع نقدي');
    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (d.company_id, d.branch_id, d.doc_date, 'sales', 'sales_document', d.id,
            COALESCE(d.customer_po_no, 'SAL-RET-' || d.doc_no), v_desc, p_user_id)
    RETURNING id INTO v_entry;

    FOR r IN SELECT COALESCE(ss.sales_returns_account_id, ia.revenue_account_id, ss.default_revenue_account_id) AS acc,
                    SUM(sl.net_local) AS amt
               FROM erp.sales_document_lines sl LEFT JOIN erp.item_accounts ia ON ia.item_id = sl.item_id
              WHERE sl.document_id = d.id GROUP BY 1 LOOP
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, r.acc, d.cost_center_id, v_base, 'D', r.amt, NULL, NULL, 'مردود إيراد - ' || v_desc);
    END LOOP;
    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, ss.vat_output_account_id, d.cost_center_id, v_base, 'D',
                               v_tax_target, NULL, NULL, 'عكس ضريبة مخرجات - ' || v_desc);

    IF v_credit_fc > 0 THEN
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, c.account_id, d.cost_center_id, d.currency_id, 'C',
                                   v_credit_fc, v_credit_local, d.exchange_rate, v_desc);
    END IF;
    FOR pay IN SELECT p.id, p.amount_fc, m.kind, m.account_id AS m_acc
                 FROM erp.sales_document_payments p JOIN erp.payment_methods m ON m.id = p.payment_method_id
                WHERE p.document_id = d.id ORDER BY p.id LOOP
        v_cum_p := v_cum_p + pay.amount_fc;
        v_rp    := round(v_cum_p * d.exchange_rate, v_dp);
        v_acc   := CASE WHEN pay.kind = 'cash' AND v_pos_cash IS NOT NULL THEN v_pos_cash ELSE pay.m_acc END;
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, v_acc, d.cost_center_id, d.currency_id, 'C',
                                   pay.amount_fc, v_rp - v_prev_p, d.exchange_rate, v_desc);
        UPDATE erp.sales_document_payments SET amount_local = v_rp - v_prev_p WHERE id = pay.id;
        v_prev_p := v_rp;
    END LOOP;

    PERFORM erp.fn_pur_je_line(v_entry, d.company_id, wh.account_id, d.cost_center_id, v_base, 'D', v_cogs_total, NULL, NULL, 'مخزون - ' || v_desc);
    FOR r IN SELECT COALESCE(ia.cogs_account_id, ss.default_cogs_account_id) AS acc, SUM(sl.cogs_local) AS amt
               FROM erp.sales_document_lines sl LEFT JOIN erp.item_accounts ia ON ia.item_id = sl.item_id
              WHERE sl.document_id = d.id GROUP BY 1 LOOP
        PERFORM erp.fn_pur_je_line(v_entry, d.company_id, r.acc, d.cost_center_id, v_base, 'C', r.amt, NULL, NULL, 'عكس تكلفة مبيعات - ' || v_desc);
    END LOOP;

    PERFORM erp.post_journal_entry(v_entry, p_user_id);

    IF v_credit_fc > 0 THEN
        INSERT INTO erp.customer_ledger (company_id, customer_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                         currency_id, exchange_rate, credit_fc, credit_local, description)
        VALUES (d.company_id, d.customer_id, d.doc_date, d.doc_date, 'sales_return', d.id, v_entry,
                d.currency_id, d.exchange_rate, v_credit_fc, v_credit_local, v_desc);
    END IF;

    UPDATE erp.stock_documents
       SET status = 'posted', total_value = v_cogs_total, journal_entry_id = v_entry, posted_at = now(), posted_by = p_user_id
     WHERE id = v_sdoc;

    UPDATE erp.sales_documents
       SET status = 'posted', subtotal_local = v_prev_net, tax_local = v_tax_target, total_local = v_gross_local,
           paid_fc = v_paid_fc, credit_fc = v_credit_fc, cogs_local = v_cogs_total,
           journal_entry_id = v_entry, stock_document_id = v_sdoc, posted_at = now(), posted_by = p_user_id
     WHERE id = d.id;

    PERFORM set_config('erp.sales_write', 'off', true);
    PERFORM set_config('erp.stock_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.post_sales_return(p_doc_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 434 (class 1255 OID 43584)
-- Name: post_stock_document(bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.post_stock_document(p_doc_id bigint, p_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    d         record;
    l         record;
    v_wh      record;
    v_to      record;
    v_dp      smallint;
    v_batch   bigint;
    v_exp     date;
    v_val     numeric;
    v_total   numeric := 0;
    v_base    bigint;
    v_entry   bigint;
    v_dr      bigint;
    v_cr      bigint;
    v_desc    text;
BEGIN
    SELECT * INTO d FROM erp.stock_documents WHERE id = p_doc_id FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'المستند غير موجود' USING ERRCODE = '23503';
    END IF;
    IF d.status <> 'draft' THEN
        RAISE EXCEPTION 'المستند مُرحّل مسبقاً' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.stock_document_lines WHERE document_id = p_doc_id) THEN
        RAISE EXCEPTION 'المستند بلا أسطر' USING ERRCODE = '23514';
    END IF;

    PERFORM set_config('erp.stock_write', 'on', true);
    v_dp := erp.fn_base_decimals(d.company_id);
    SELECT * INTO v_wh FROM erp.warehouses WHERE id = d.warehouse_id;
    IF d.doc_type = 'transfer' THEN
        SELECT * INTO v_to FROM erp.warehouses WHERE id = d.to_warehouse_id;
        IF NOT v_to.is_active THEN
            RAISE EXCEPTION 'المخزن المستلم غير فعّال' USING ERRCODE = '23514';
        END IF;
    END IF;

    -- الترتيب حسب الصنف يقلل احتمال deadlock بين مستندات متزامنة
    FOR l IN
        SELECT sl.*, i.track_batch, i.track_expiry
          FROM erp.stock_document_lines sl JOIN erp.items i ON i.id = sl.item_id
         WHERE sl.document_id = p_doc_id
         ORDER BY sl.item_id, sl.line_no
    LOOP
        -- (أ) حل التشغيلة والصلاحية
        v_batch := l.batch_id;
        IF l.track_batch THEN
            IF v_batch IS NULL THEN
                IF l.batch_no IS NULL THEN
                    RAISE EXCEPTION 'السطر %: الصنف يتطلب رقم تشغيلة', l.line_no USING ERRCODE = '23514';
                END IF;
                SELECT id INTO v_batch FROM erp.item_batches
                 WHERE company_id = l.company_id AND item_id = l.item_id AND batch_no = l.batch_no;
                IF v_batch IS NULL THEN
                    IF d.doc_type <> 'receipt' THEN
                        RAISE EXCEPTION 'السطر %: التشغيلة % غير موجودة', l.line_no, l.batch_no USING ERRCODE = '23514';
                    END IF;
                    INSERT INTO erp.item_batches (company_id, item_id, batch_no, manufacture_date, expiry_date)
                    VALUES (l.company_id, l.item_id, l.batch_no, l.manufacture_date, l.expiry_date)
                    RETURNING id INTO v_batch;
                END IF;
            END IF;
            IF l.track_expiry THEN
                SELECT expiry_date INTO v_exp FROM erp.item_batches WHERE id = v_batch;
                IF v_exp IS NULL THEN
                    RAISE EXCEPTION 'السطر %: تاريخ انتهاء الصلاحية مطلوب', l.line_no USING ERRCODE = '23514';
                END IF;
                IF d.doc_type = 'issue' AND v_exp < d.doc_date THEN
                    RAISE EXCEPTION 'السطر %: التشغيلة منتهية الصلاحية (%)', l.line_no, v_exp USING ERRCODE = '23514';
                END IF;
            END IF;
        ELSE
            v_batch := NULL;
        END IF;

        -- (ب) تطبيق الحركة
        IF d.doc_type = 'receipt' THEN
            v_val := erp.fn_apply_stock_movement(d.id, l.id, d.company_id, d.doc_date, d.warehouse_id, l.item_id, v_batch,
                        l.qty_base, round(l.quantity * l.unit_cost, v_dp), true, v_dp);
            -- التوريد يُسمح له دائماً (تغطية رصيد سالب سابق)
        ELSIF d.doc_type = 'issue' THEN
            v_val := erp.fn_apply_stock_movement(d.id, l.id, d.company_id, d.doc_date, d.warehouse_id, l.item_id, v_batch,
                        -l.qty_base, NULL, v_wh.allow_negative_stock, v_dp);
        ELSE
            -- تحويل: صرف من المصدر بالمتوسط المرجح ثم إدخال في الوجهة بنفس القيمة
            v_val := erp.fn_apply_stock_movement(d.id, l.id, d.company_id, d.doc_date, d.warehouse_id, l.item_id, v_batch,
                        -l.qty_base, NULL, v_wh.allow_negative_stock, v_dp);
            PERFORM erp.fn_apply_stock_movement(d.id, l.id, d.company_id, d.doc_date, d.to_warehouse_id, l.item_id, v_batch,
                        l.qty_base, v_val, true, v_dp);
        END IF;

        UPDATE erp.stock_document_lines SET batch_id = v_batch, line_value = v_val WHERE id = l.id;
        v_total := v_total + v_val;
    END LOOP;

    -- (ج) القيد المحاسبي الآلي
    IF v_total > 0 THEN
        IF d.doc_type = 'receipt' THEN
            v_dr := v_wh.account_id;  v_cr := d.counter_account_id;
        ELSIF d.doc_type = 'issue' THEN
            v_dr := d.counter_account_id;  v_cr := v_wh.account_id;
        ELSE
            v_dr := v_to.account_id;  v_cr := v_wh.account_id;
        END IF;

        SELECT base_currency_id INTO v_base FROM erp.companies WHERE id = d.company_id;
        v_desc := CASE d.doc_type WHEN 'receipt' THEN 'توريد مخزني' WHEN 'issue' THEN 'صرف مخزني' ELSE 'تحويل بين المخازن' END
                  || ' رقم ' || d.doc_no;

        INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                         reference, description, created_by)
        VALUES (d.company_id, d.branch_id, d.doc_date, 'inventory', 'stock_document', d.id,
                'STK-' || d.doc_no, v_desc, p_user_id)
        RETURNING id INTO v_entry;

        INSERT INTO erp.journal_entry_lines (company_id, entry_id, account_id, cost_center_id, currency_id, debit_fc, credit_fc, description)
        VALUES (d.company_id, v_entry, v_dr, d.cost_center_id, v_base, v_total, 0, v_desc),
               (d.company_id, v_entry, v_cr, d.cost_center_id, v_base, 0, v_total, v_desc);

        PERFORM erp.post_journal_entry(v_entry, p_user_id);
    END IF;

    UPDATE erp.stock_documents
       SET status = 'posted', total_value = v_total, journal_entry_id = v_entry,
           posted_at = now(), posted_by = p_user_id
     WHERE id = p_doc_id;

    PERFORM set_config('erp.stock_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.post_stock_document(p_doc_id bigint, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 674 (class 1255 OID 44974)
-- Name: record_pos_cash_movement(bigint, character varying, numeric, text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.record_pos_cash_movement(p_session bigint, p_type character varying, p_amount numeric, p_reason text DEFAULT NULL::text, p_user_id bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE v_id bigint;
BEGIN
    INSERT INTO erp.pos_cash_movements (company_id, session_id, movement_type, amount, reason, created_by)
    SELECT company_id, id, p_type, p_amount, p_reason, p_user_id FROM erp.pos_sessions WHERE id = p_session
    RETURNING id INTO v_id;
    IF v_id IS NULL THEN
        RAISE EXCEPTION 'الوردية غير موجودة' USING ERRCODE = '23503';
    END IF;
    RETURN v_id;
END $$;


ALTER FUNCTION erp.record_pos_cash_movement(p_session bigint, p_type character varying, p_amount numeric, p_reason text, p_user_id bigint) OWNER TO postgres;

--
-- TOC entry 438 (class 1255 OID 57459)
-- Name: register_cheque(bigint, character varying, character varying, date, text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.register_cheque(p_voucher bigint, p_cheque_no character varying, p_bank character varying, p_due date, p_notes text DEFAULT NULL::text, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    v      record;
    s      record;
    m      record;
    t      record;
    v_dir  erp.cheque_direction;
    v_id   bigint;
BEGIN
    SELECT * INTO v FROM erp.financial_vouchers WHERE id = p_voucher FOR UPDATE;
    IF NOT FOUND OR v.status <> 'posted' OR v.kind NOT IN ('receipt', 'payment') THEN
        RAISE EXCEPTION 'السند غير موجود أو ليس سند قبض/صرف مُرحّلاً' USING ERRCODE = '23514';
    END IF;
    PERFORM erp.require_permission(v.company_id, 'accounting.cheque.manage', v.branch_id);

    v_dir := CASE v.kind WHEN 'receipt' THEN 'receipt'::erp.cheque_direction ELSE 'payment'::erp.cheque_direction END;
    SELECT notes_receivable_account_id AS rec, notes_payable_account_id AS pay INTO s
      FROM erp.company_settings WHERE company_id = v.company_id;
    IF v.treasury_account_id IS DISTINCT FROM (CASE v_dir WHEN 'receipt' THEN s.rec ELSE s.pay END) THEN
        RAISE EXCEPTION 'حساب الصندوق/البنك في السند يجب أن يكون حساب أوراق القبض/الدفع المعرّف في company_settings'
            USING ERRCODE = '23514';
    END IF;

    SELECT count(DISTINCT customer_id) AS nc, count(DISTINCT supplier_id) AS ns,
           min(customer_id) AS cid, min(supplier_id) AS sid INTO m
      FROM erp.voucher_details WHERE voucher_id = v.id;
    IF v_dir = 'receipt' AND (m.nc <> 1 OR m.ns <> 0) THEN
        RAISE EXCEPTION 'سند القبض يجب أن يخص عميلاً واحداً فقط ليُسجَّل شيكاً' USING ERRCODE = '23514';
    ELSIF v_dir = 'payment' AND (m.ns <> 1 OR m.nc <> 0) THEN
        RAISE EXCEPTION 'سند الصرف يجب أن يخص مورداً واحداً فقط ليُسجَّل شيكاً' USING ERRCODE = '23514';
    END IF;

    SELECT COALESCE(SUM(debit_fc + credit_fc), 0) AS fc, COALESCE(SUM(debit_local + credit_local), 0) AS loc INTO t
      FROM erp.journal_entry_lines WHERE entry_id = v.journal_entry_id AND account_id = v.treasury_account_id;
    IF t.fc <= 0 THEN
        RAISE EXCEPTION 'تعذّر تحديد مبلغ الشيك من قيد السند' USING ERRCODE = '23514';
    END IF;

    PERFORM set_config('erp.cheque_write', 'on', true);
    INSERT INTO erp.cheques (company_id, branch_id, direction, cheque_no, bank_name, due_date, voucher_id,
                             customer_id, supplier_id, currency_id, amount_fc, exchange_rate, amount_local,
                             notes, created_by)
    VALUES (v.company_id, v.branch_id, v_dir, p_cheque_no, p_bank, p_due, v.id,
            m.cid, m.sid, v.currency_id, t.fc, v.exchange_rate, t.loc, p_notes, p_user)
    RETURNING id INTO v_id;
    PERFORM set_config('erp.cheque_write', 'off', true);
    RETURN v_id;
END $$;


ALTER FUNCTION erp.register_cheque(p_voucher bigint, p_cheque_no character varying, p_bank character varying, p_due date, p_notes text, p_user bigint) OWNER TO postgres;

--
-- TOC entry 653 (class 1255 OID 57360)
-- Name: reopen_fiscal_period(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.reopen_fiscal_period(p_period bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    p record;
BEGIN
    SELECT * INTO p FROM erp.fiscal_periods WHERE id = p_period FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الفترة المالية غير موجودة' USING ERRCODE = '23503';
    END IF;
    IF p.status = 'locked' THEN
        RAISE EXCEPTION 'الفترة مقفلة نهائياً ضمن سنة مقفلة؛ استخدم reopen_fiscal_year' USING ERRCODE = '23514';
    END IF;
    IF p.status <> 'closed' THEN
        RAISE EXCEPTION 'الفترة مفتوحة أصلاً' USING ERRCODE = '23514';
    END IF;
    IF EXISTS (SELECT 1 FROM erp.fiscal_years y WHERE y.id = p.fiscal_year_id AND y.is_closed) THEN
        RAISE EXCEPTION 'السنة المالية مقفلة؛ استخدم reopen_fiscal_year' USING ERRCODE = '23514';
    END IF;
    UPDATE erp.fiscal_periods SET status = 'open' WHERE id = p.id;
END $$;


ALTER FUNCTION erp.reopen_fiscal_period(p_period bigint) OWNER TO postgres;

--
-- TOC entry 720 (class 1255 OID 57358)
-- Name: reopen_fiscal_year(bigint, bigint, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.reopen_fiscal_year(p_fy bigint, p_user_id bigint DEFAULT NULL::bigint, p_reason text DEFAULT NULL::text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    fy    record;
    ce    record;
    v_new bigint;
    v_n   integer := 0;
BEGIN
    IF p_reason IS NULL OR btrim(p_reason) = '' THEN
        RAISE EXCEPTION 'سبب إعادة الفتح مطلوب' USING ERRCODE = '23514';
    END IF;
    SELECT * INTO fy FROM erp.fiscal_years WHERE id = p_fy FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'السنة المالية غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(fy.company_id, 'accounting.year.reopen');
    IF NOT fy.is_closed THEN
        RAISE EXCEPTION 'السنة المالية ليست مقفلة' USING ERRCODE = '23514';
    END IF;
    IF EXISTS (SELECT 1 FROM erp.fiscal_years y
                WHERE y.company_id = fy.company_id AND y.start_date > fy.end_date AND y.is_closed) THEN
        RAISE EXCEPTION 'توجد سنة لاحقة مقفلة؛ أعد فتحها أولاً' USING ERRCODE = '23514';
    END IF;

    LOCK TABLE erp.journal_entries IN SHARE ROW EXCLUSIVE MODE;

    UPDATE erp.fiscal_periods SET status = 'open' WHERE fiscal_year_id = fy.id AND status <> 'open';

    FOR ce IN
        SELECT e.id, e.branch_id FROM erp.journal_entries e
         WHERE e.company_id = fy.company_id AND e.entry_type = 'closing' AND e.source_type = 'fiscal_year'
           AND e.source_id = fy.id AND e.status = 'posted' AND e.reversed_entry_id IS NULL
         ORDER BY e.id
    LOOP
        INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                         reference, description, reversed_entry_id, created_by)
        VALUES (fy.company_id, ce.branch_id, fy.end_date, 'closing', 'fiscal_year', fy.id,
                'REV-CLOSE-' || fy.name, 'عكس قيد إقفال السنة المالية ' || fy.name || ' - ' || p_reason,
                ce.id, p_user_id)
        RETURNING id INTO v_new;

        INSERT INTO erp.journal_entry_lines (company_id, entry_id, account_id, cost_center_id, currency_id,
                                             debit_fc, credit_fc, exchange_rate, debit_local, credit_local, description)
        SELECT company_id, v_new, account_id, cost_center_id, currency_id,
               credit_fc, debit_fc, exchange_rate, credit_local, debit_local, 'عكس - ' || COALESCE(description, '')
          FROM erp.journal_entry_lines WHERE entry_id = ce.id ORDER BY line_no;

        PERFORM erp.post_journal_entry(v_new, p_user_id);
        UPDATE erp.journal_entries SET status = 'reversed' WHERE id = ce.id;
        v_n := v_n + 1;
    END LOOP;

    UPDATE erp.fiscal_years
       SET is_closed = false, closed_at = NULL, closed_by = NULL,
           reopened_at = now(), reopened_by = COALESCE(p_user_id, erp.current_user_id()), reopen_reason = p_reason
     WHERE id = fy.id;
    RETURN v_n;
END $$;


ALTER FUNCTION erp.reopen_fiscal_year(p_fy bigint, p_user_id bigint, p_reason text) OWNER TO postgres;

--
-- TOC entry 602 (class 1255 OID 45516)
-- Name: require_permission(bigint, text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.require_permission(p_company bigint, p_code text, p_branch bigint DEFAULT NULL::bigint) RETURNS void
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    IF NOT erp.fn_enforcing(p_company) THEN
        RETURN;
    END IF;
    IF erp.current_user_id() IS NULL THEN
        RAISE EXCEPTION 'لم يُحدَّد المستخدم الحالي (استدعِ erp.set_current_user بعد تسجيل الدخول)' USING ERRCODE = '42501';
    END IF;
    IF NOT erp.has_permission(p_company, p_code, p_branch) THEN
        RAISE EXCEPTION 'لا تملك صلاحية: %', p_code USING ERRCODE = '42501';
    END IF;
END $$;


ALTER FUNCTION erp.require_permission(p_company bigint, p_code text, p_branch bigint) OWNER TO postgres;

--
-- TOC entry 718 (class 1255 OID 57462)
-- Name: return_cheque(bigint, date, text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.return_cheque(p_cheque bigint, p_date date DEFAULT CURRENT_DATE, p_reason text DEFAULT NULL::text, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    c       record;
    s       record;
    v_party bigint;
    v_notes bigint;
    v_entry bigint;
    v_desc  text;
BEGIN
    SELECT * INTO c FROM erp.cheques WHERE id = p_cheque FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الشيك غير موجود' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'accounting.cheque.manage', c.branch_id);
    IF c.status NOT IN ('in_hand', 'deposited') THEN
        RAISE EXCEPTION 'يُرتجع الشيك قبل تحصيله/صرفه فقط (الحالة: %)', c.status USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.financial_vouchers WHERE id = c.voucher_id AND status = 'posted') THEN
        RAISE EXCEPTION 'سند الشيك ملغى' USING ERRCODE = '23514';
    END IF;

    SELECT notes_receivable_account_id AS rec, notes_payable_account_id AS pay INTO s
      FROM erp.company_settings WHERE company_id = c.company_id;
    v_notes := CASE c.direction WHEN 'receipt' THEN s.rec ELSE s.pay END;
    IF c.direction = 'receipt' THEN
        SELECT account_id INTO v_party FROM erp.customers WHERE id = c.customer_id;
    ELSE
        SELECT account_id INTO v_party FROM erp.suppliers WHERE id = c.supplier_id;
    END IF;

    v_desc := 'ارتجاع شيك رقم ' || c.cheque_no || COALESCE(' - ' || p_reason, '');
    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (c.company_id, c.branch_id, p_date, 'cheque', 'cheque', c.id, 'CHQ-RET-' || c.cheque_no, v_desc, p_user)
    RETURNING id INTO v_entry;

    IF c.direction = 'receipt' THEN
        -- مدين العميل (يعود الدين) / دائن أوراق القبض
        PERFORM erp.fn_pur_je_line(v_entry, c.company_id, v_party, NULL, c.currency_id, 'D', c.amount_fc, c.amount_local, c.exchange_rate, v_desc);
        PERFORM erp.fn_pur_je_line(v_entry, c.company_id, v_notes, NULL, c.currency_id, 'C', c.amount_fc, c.amount_local, c.exchange_rate, v_desc);
    ELSE
        -- مدين أوراق الدفع / دائن المورد (يعود الالتزام)
        PERFORM erp.fn_pur_je_line(v_entry, c.company_id, v_notes, NULL, c.currency_id, 'D', c.amount_fc, c.amount_local, c.exchange_rate, v_desc);
        PERFORM erp.fn_pur_je_line(v_entry, c.company_id, v_party, NULL, c.currency_id, 'C', c.amount_fc, c.amount_local, c.exchange_rate, v_desc);
    END IF;
    PERFORM erp.post_journal_entry(v_entry, p_user);

    IF c.direction = 'receipt' THEN
        INSERT INTO erp.customer_ledger (company_id, customer_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                         currency_id, exchange_rate, debit_fc, credit_fc, debit_local, credit_local, description)
        VALUES (c.company_id, c.customer_id, p_date, p_date, 'cheque_return', c.id, v_entry,
                c.currency_id, c.exchange_rate, c.amount_fc, 0, c.amount_local, 0, v_desc);
    ELSE
        INSERT INTO erp.supplier_ledger (company_id, supplier_id, entry_date, due_date, doc_type, doc_id, journal_entry_id,
                                         currency_id, exchange_rate, debit_fc, credit_fc, debit_local, credit_local, description)
        VALUES (c.company_id, c.supplier_id, p_date, p_date, 'cheque_return', c.id, v_entry,
                c.currency_id, c.exchange_rate, 0, c.amount_fc, 0, c.amount_local, v_desc);
    END IF;

    PERFORM set_config('erp.cheque_write', 'on', true);
    UPDATE erp.cheques SET status = 'returned', return_entry_id = v_entry, return_reason = p_reason WHERE id = c.id;
    PERFORM set_config('erp.cheque_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.return_cheque(p_cheque bigint, p_date date, p_reason text, p_user bigint) OWNER TO postgres;

--
-- TOC entry 545 (class 1255 OID 45521)
-- Name: seed_default_roles(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.seed_default_roles(p_company bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO erp.roles (company_id, code, name_ar, is_system) VALUES
        (p_company, 'ADMIN',       'مدير النظام',  true),
        (p_company, 'ACCOUNTANT',  'محاسب',        true),
        (p_company, 'SALES',       'مبيعات',       true),
        (p_company, 'PURCHASING',  'مشتريات',      true),
        (p_company, 'STOREKEEPER', 'أمين مستودع',  true),
        (p_company, 'CASHIER',     'كاشير',        true)
    ON CONFLICT (company_id, code) DO NOTHING;

    INSERT INTO erp.role_permissions (role_id, permission_code)
    SELECT r.id, p.code FROM erp.roles r CROSS JOIN erp.permissions p
     WHERE r.company_id = p_company AND r.code = 'ADMIN'
    ON CONFLICT DO NOTHING;

    INSERT INTO erp.role_permissions (role_id, permission_code)
    SELECT r.id, x.perm
      FROM erp.roles r
      JOIN (VALUES
        ('ACCOUNTANT', 'accounting.journal.post'), ('ACCOUNTANT', 'accounting.voucher.post'),
        ('ACCOUNTANT', 'accounting.voucher.cancel'), ('ACCOUNTANT', 'accounting.settings.manage'),
        ('ACCOUNTANT', 'admin.audit.view'),
        ('SALES', 'sales.order.approve'), ('SALES', 'sales.order.cancel'), ('SALES', 'sales.invoice.post'),
        ('SALES', 'sales.return.post'), ('SALES', 'sales.customer.manage'),
        ('PURCHASING', 'purchases.request.approve'), ('PURCHASING', 'purchases.order.approve'),
        ('PURCHASING', 'purchases.order.cancel'), ('PURCHASING', 'purchases.invoice.post'),
        ('PURCHASING', 'purchases.return.post'), ('PURCHASING', 'purchases.supplier.manage'),
        ('STOREKEEPER', 'inventory.item.manage'), ('STOREKEEPER', 'inventory.warehouse.manage'),
        ('CASHIER', 'pos.session.open'), ('CASHIER', 'pos.session.close'),
        ('CASHIER', 'sales.invoice.post'), ('CASHIER', 'sales.return.post')
      ) AS x(role_code, perm) ON x.role_code = r.code
     WHERE r.company_id = p_company
    ON CONFLICT DO NOTHING;

    -- سقوف الخصم الافتراضية (نسبة مئوية)
    INSERT INTO erp.role_limits (role_id, limit_code, value)
    SELECT r.id, x.lim, x.val
      FROM erp.roles r
      JOIN (VALUES
        ('SALES',   'sales.max_line_discount_pct',    15), ('SALES',   'sales.max_invoice_discount_pct', 10),
        ('CASHIER', 'sales.max_line_discount_pct',     5), ('CASHIER', 'sales.max_invoice_discount_pct',  0)
      ) AS x(role_code, lim, val) ON x.role_code = r.code
     WHERE r.company_id = p_company
    ON CONFLICT DO NOTHING;

    PERFORM erp.seed_inventory_count_permissions(p_company);
    PERFORM erp.seed_fixed_asset_permissions(p_company);
END $$;


ALTER FUNCTION erp.seed_default_roles(p_company bigint) OWNER TO postgres;

--
-- TOC entry 766 (class 1255 OID 62452)
-- Name: seed_fixed_asset_permissions(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.seed_fixed_asset_permissions(p_company bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO erp.role_permissions (role_id, permission_code)
    SELECT r.id, x.perm
      FROM erp.roles r
      JOIN (VALUES
        ('ADMIN',      'assets.fixed.manage'),
        ('ADMIN',      'assets.fixed.depreciate'),
        ('ADMIN',      'assets.fixed.dispose'),
        ('ACCOUNTANT', 'assets.fixed.manage'),
        ('ACCOUNTANT', 'assets.fixed.depreciate'),
        ('ACCOUNTANT', 'assets.fixed.dispose')
      ) AS x(role_code, perm) ON x.role_code = r.code
     WHERE r.company_id = p_company
    ON CONFLICT DO NOTHING;
END $$;


ALTER FUNCTION erp.seed_fixed_asset_permissions(p_company bigint) OWNER TO postgres;

--
-- TOC entry 561 (class 1255 OID 62125)
-- Name: seed_inventory_count_permissions(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.seed_inventory_count_permissions(p_company bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO erp.role_permissions (role_id, permission_code)
    SELECT r.id, x.perm
      FROM erp.roles r
      JOIN (VALUES
        ('ADMIN',       'inventory.count.manage'),
        ('ADMIN',       'inventory.count.approve'),
        ('ADMIN',       'inventory.count.post'),
        ('STOREKEEPER', 'inventory.count.manage'),
        ('ACCOUNTANT',  'inventory.count.approve'),
        ('ACCOUNTANT',  'inventory.count.post')
      ) AS x(role_code, perm) ON x.role_code = r.code
     WHERE r.company_id = p_company
    ON CONFLICT DO NOTHING;
END $$;


ALTER FUNCTION erp.seed_inventory_count_permissions(p_company bigint) OWNER TO postgres;

--
-- TOC entry 417 (class 1255 OID 45050)
-- Name: seed_voucher_types(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.seed_voucher_types(p_company bigint) RETURNS void
    LANGUAGE sql
    AS $$
    INSERT INTO erp.voucher_types (company_id, code, kind, name_ar, name_en, prefix)
    VALUES (p_company, 'RC', 'receipt', 'سند قبض',  'Receipt Voucher', 'RC'),
           (p_company, 'PY', 'payment', 'سند صرف',  'Payment Voucher', 'PY'),
           (p_company, 'JV', 'journal', 'قيد يومية', 'Journal Voucher', 'JV')
    ON CONFLICT (company_id, code) DO NOTHING
$$;


ALTER FUNCTION erp.seed_voucher_types(p_company bigint) OWNER TO postgres;

--
-- TOC entry 692 (class 1255 OID 45513)
-- Name: set_current_user(bigint, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.set_current_user(p_user bigint, p_local boolean DEFAULT false) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF p_user IS NOT NULL AND NOT EXISTS (SELECT 1 FROM erp.app_users WHERE id = p_user AND is_active) THEN
        RAISE EXCEPTION 'المستخدم غير موجود أو غير فعّال' USING ERRCODE = '42501';
    END IF;
    PERFORM set_config('erp.current_user_id', COALESCE(p_user::text, ''), p_local);
END $$;


ALTER FUNCTION erp.set_current_user(p_user bigint, p_local boolean) OWNER TO postgres;

--
-- TOC entry 505 (class 1255 OID 61971)
-- Name: set_inventory_adjustment_accounts(bigint, character varying, character varying); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.set_inventory_adjustment_accounts(p_company bigint, p_gain_code character varying, p_loss_code character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_gain bigint;
    v_loss bigint;
BEGIN
    PERFORM erp.require_permission(p_company, 'accounting.settings.manage');
    SELECT id INTO v_gain FROM erp.accounts
     WHERE company_id = p_company AND code = p_gain_code AND NOT is_group AND is_active;
    IF v_gain IS NULL THEN
        RAISE EXCEPTION 'حساب أرباح الجرد غير موجود أو ليس حساباً تفصيلياً فعّالاً: %', p_gain_code USING ERRCODE = '23503';
    END IF;
    SELECT id INTO v_loss FROM erp.accounts
     WHERE company_id = p_company AND code = p_loss_code AND NOT is_group AND is_active;
    IF v_loss IS NULL THEN
        RAISE EXCEPTION 'حساب خسائر الجرد غير موجود أو ليس حساباً تفصيلياً فعّالاً: %', p_loss_code USING ERRCODE = '23503';
    END IF;

    UPDATE erp.inventory_settings
       SET adjustment_gain_account_id = v_gain, adjustment_loss_account_id = v_loss
     WHERE company_id = p_company;
    IF NOT FOUND THEN
        INSERT INTO erp.inventory_settings (company_id, adjustment_gain_account_id, adjustment_loss_account_id)
        VALUES (p_company, v_gain, v_loss);
    END IF;
END $$;


ALTER FUNCTION erp.set_inventory_adjustment_accounts(p_company bigint, p_gain_code character varying, p_loss_code character varying) OWNER TO postgres;

--
-- TOC entry 732 (class 1255 OID 57461)
-- Name: settle_cheque(bigint, bigint, date, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.settle_cheque(p_cheque bigint, p_bank bigint DEFAULT NULL::bigint, p_date date DEFAULT CURRENT_DATE, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    c       record;
    s       record;
    v_bank  bigint;
    v_notes bigint;
    v_entry bigint;
    v_desc  text;
BEGIN
    SELECT * INTO c FROM erp.cheques WHERE id = p_cheque FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الشيك غير موجود' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'accounting.cheque.manage', c.branch_id);
    IF c.status NOT IN ('in_hand', 'deposited') THEN
        RAISE EXCEPTION 'حالة الشيك لا تسمح بالتحصيل/الصرف (%)', c.status USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.financial_vouchers WHERE id = c.voucher_id AND status = 'posted') THEN
        RAISE EXCEPTION 'سند الشيك ملغى' USING ERRCODE = '23514';
    END IF;

    SELECT notes_receivable_account_id AS rec, notes_payable_account_id AS pay INTO s
      FROM erp.company_settings WHERE company_id = c.company_id;
    v_notes := CASE c.direction WHEN 'receipt' THEN s.rec ELSE s.pay END;
    v_bank  := COALESCE(p_bank, c.bank_account_id);
    IF v_bank IS NULL OR NOT EXISTS (SELECT 1 FROM erp.accounts a WHERE a.id = v_bank AND a.company_id = c.company_id
                                        AND a.subtype = 'bank' AND NOT a.is_group AND a.is_active) THEN
        RAISE EXCEPTION 'حدد حساب بنك فرعياً فعّالاً' USING ERRCODE = '23514';
    END IF;
    IF v_bank = v_notes THEN
        RAISE EXCEPTION 'حساب البنك لا يمكن أن يكون حساب الأوراق نفسه' USING ERRCODE = '23514';
    END IF;

    v_desc := CASE c.direction WHEN 'receipt' THEN 'تحصيل شيك قبض رقم ' ELSE 'صرف شيك دفع رقم ' END || c.cheque_no;
    INSERT INTO erp.journal_entries (company_id, branch_id, entry_date, entry_type, source_type, source_id,
                                     reference, description, created_by)
    VALUES (c.company_id, c.branch_id, p_date, 'cheque', 'cheque', c.id, 'CHQ-' || c.cheque_no, v_desc, p_user)
    RETURNING id INTO v_entry;

    IF c.direction = 'receipt' THEN
        PERFORM erp.fn_pur_je_line(v_entry, c.company_id, v_bank,  NULL, c.currency_id, 'D', c.amount_fc, c.amount_local, c.exchange_rate, v_desc);
        PERFORM erp.fn_pur_je_line(v_entry, c.company_id, v_notes, NULL, c.currency_id, 'C', c.amount_fc, c.amount_local, c.exchange_rate, v_desc);
    ELSE
        PERFORM erp.fn_pur_je_line(v_entry, c.company_id, v_notes, NULL, c.currency_id, 'D', c.amount_fc, c.amount_local, c.exchange_rate, v_desc);
        PERFORM erp.fn_pur_je_line(v_entry, c.company_id, v_bank,  NULL, c.currency_id, 'C', c.amount_fc, c.amount_local, c.exchange_rate, v_desc);
    END IF;
    PERFORM erp.post_journal_entry(v_entry, p_user);

    PERFORM set_config('erp.cheque_write', 'on', true);
    UPDATE erp.cheques
       SET status = 'cleared', bank_account_id = v_bank, settled_at = p_date, settle_entry_id = v_entry
     WHERE id = c.id;
    PERFORM set_config('erp.cheque_write', 'off', true);
    RETURN v_entry;
END $$;


ALTER FUNCTION erp.settle_cheque(p_cheque bigint, p_bank bigint, p_date date, p_user bigint) OWNER TO postgres;

--
-- TOC entry 618 (class 1255 OID 62135)
-- Name: stock_adjust_item(bigint, bigint, numeric, date, text, bigint, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_adjust_item(p_warehouse bigint, p_item bigint, p_new_qty numeric, p_date date DEFAULT CURRENT_DATE, p_reason text DEFAULT NULL::text, p_batch bigint DEFAULT NULL::bigint, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_count bigint;
BEGIN
    v_count := erp.stock_count_create(p_warehouse, p_date, 'adjustment', NULL, COALESCE(p_reason, 'تسوية مخزنية'), p_user);
    PERFORM erp.stock_count_start(v_count);
    PERFORM erp.stock_count_set_qty(v_count, p_item, p_new_qty, NULL, p_batch, NULL, NULL, p_reason, p_user);
    PERFORM erp.stock_count_approve(v_count, false, p_user);
    PERFORM * FROM erp.stock_count_post(v_count, false, p_user);
    RETURN v_count;
END $$;


ALTER FUNCTION erp.stock_adjust_item(p_warehouse bigint, p_item bigint, p_new_qty numeric, p_date date, p_reason text, p_batch bigint, p_user bigint) OWNER TO postgres;

--
-- TOC entry 772 (class 1255 OID 62130)
-- Name: stock_count_approve(bigint, boolean, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_count_approve(p_count bigint, p_treat_uncounted_as_zero boolean DEFAULT false, p_user bigint DEFAULT NULL::bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    c record;
BEGIN
    SELECT * INTO c FROM erp.stock_counts WHERE id = p_count FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'جلسة الجرد غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'inventory.count.approve', c.branch_id);
    IF c.status <> 'counting' THEN
        RAISE EXCEPTION 'الاعتماد من حالة "قيد الجرد" فقط (الحالة الحالية: %)', c.status USING ERRCODE = '23514';
    END IF;

    PERFORM set_config('erp.count_write', 'on', true);
    IF p_treat_uncounted_as_zero THEN
        UPDATE erp.stock_count_lines
           SET counted_qty = 0, counted_by = COALESCE(p_user, erp.current_user_id()), counted_at = now()
         WHERE count_id = c.id AND counted_qty IS NULL;
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.stock_count_lines WHERE count_id = c.id AND counted_qty IS NOT NULL) THEN
        PERFORM set_config('erp.count_write', 'off', true);
        RAISE EXCEPTION 'لا توجد أسطر معدودة في هذه الجلسة' USING ERRCODE = '23514';
    END IF;

    UPDATE erp.stock_counts
       SET status = 'approved', approved_by = COALESCE(p_user, erp.current_user_id()), approved_at = now()
     WHERE id = c.id;
    PERFORM set_config('erp.count_write', 'off', true);
END $$;


ALTER FUNCTION erp.stock_count_approve(p_count bigint, p_treat_uncounted_as_zero boolean, p_user bigint) OWNER TO postgres;

--
-- TOC entry 541 (class 1255 OID 62132)
-- Name: stock_count_cancel(bigint, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_count_cancel(p_count bigint, p_reason text DEFAULT NULL::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    c record;
BEGIN
    SELECT * INTO c FROM erp.stock_counts WHERE id = p_count FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'جلسة الجرد غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'inventory.count.manage', c.branch_id);
    IF c.status NOT IN ('draft', 'counting', 'approved') THEN
        RAISE EXCEPTION 'لا يمكن إلغاء جلسة جرد في حالة %', c.status USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.count_write', 'on', true);
    UPDATE erp.stock_counts
       SET status = 'cancelled', cancelled_at = now(),
           notes = CASE WHEN p_reason IS NULL THEN notes
                        ELSE COALESCE(notes || E'\n', '') || 'سبب الإلغاء: ' || p_reason END
     WHERE id = c.id;
    PERFORM set_config('erp.count_write', 'off', true);
END $$;


ALTER FUNCTION erp.stock_count_cancel(p_count bigint, p_reason text) OWNER TO postgres;

--
-- TOC entry 601 (class 1255 OID 62126)
-- Name: stock_count_create(bigint, date, erp.stock_count_type, bigint, text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_count_create(p_warehouse bigint, p_date date DEFAULT CURRENT_DATE, p_type erp.stock_count_type DEFAULT 'full'::erp.stock_count_type, p_category bigint DEFAULT NULL::bigint, p_reason text DEFAULT NULL::text, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_w  record;
    v_id bigint;
BEGIN
    SELECT company_id, branch_id INTO v_w FROM erp.warehouses WHERE id = p_warehouse;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'المخزن غير موجود' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(v_w.company_id, 'inventory.count.manage', v_w.branch_id);
    IF p_category IS NOT NULL AND NOT EXISTS (
            SELECT 1 FROM erp.item_categories WHERE id = p_category AND company_id = v_w.company_id) THEN
        RAISE EXCEPTION 'تصنيف الأصناف غير موجود' USING ERRCODE = '23503';
    END IF;

    INSERT INTO erp.stock_counts (company_id, warehouse_id, count_date, count_type, category_id, reason, created_by)
    VALUES (v_w.company_id, p_warehouse, p_date, p_type, p_category, p_reason, p_user)
    RETURNING id INTO v_id;
    RETURN v_id;
END $$;


ALTER FUNCTION erp.stock_count_create(p_warehouse bigint, p_date date, p_type erp.stock_count_type, p_category bigint, p_reason text, p_user bigint) OWNER TO postgres;

--
-- TOC entry 763 (class 1255 OID 62133)
-- Name: stock_count_post(bigint, boolean, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_count_post(p_count bigint, p_force boolean DEFAULT false, p_user bigint DEFAULT NULL::bigint) RETURNS TABLE(o_receipt_doc bigint, o_issue_doc bigint, o_surplus_value numeric, o_shortage_value numeric)
    LANGUAGE plpgsql
    AS $$
DECLARE
    c          record;
    s          record;
    l          record;
    v_gain     bigint;
    v_loss     bigint;
    v_rec      bigint;
    v_iss      bigint;
    v_unit     bigint;
    v_cost     numeric;
    v_dl       bigint;
    v_stale    integer;
    v_surplus  numeric := 0;
    v_short    numeric := 0;
BEGIN
    SELECT * INTO c FROM erp.stock_counts WHERE id = p_count FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'جلسة الجرد غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'inventory.count.post', c.branch_id);
    IF c.status <> 'approved' THEN
        RAISE EXCEPTION 'الترحيل من حالة "معتمد" فقط (الحالة الحالية: %)', c.status USING ERRCODE = '23514';
    END IF;

    IF NOT p_force THEN
        SELECT count(*) INTO v_stale FROM erp.stock_count_stale_items(p_count);
        IF v_stale > 0 THEN
            RAISE EXCEPTION 'تحرّك رصيد % صنف/تشغيلة بعد لقطة الجرد. راجع erp.stock_count_stale_items(%) أو أعد الترحيل بـ p_force = true',
                v_stale, p_count USING ERRCODE = '23514';
        END IF;
    END IF;

    SELECT adjustment_gain_account_id, adjustment_loss_account_id,
           default_receipt_account_id, default_cogs_account_id
      INTO s FROM erp.inventory_settings WHERE company_id = c.company_id;
    v_gain := COALESCE(s.adjustment_gain_account_id, s.default_receipt_account_id);
    v_loss := COALESCE(s.adjustment_loss_account_id, s.default_cogs_account_id);

    -- ---- الزيادات: مستند توريد بتكلفة المتوسط المرجح الحالي ----
    IF EXISTS (SELECT 1 FROM erp.stock_count_lines WHERE count_id = c.id AND diff_qty > 0) THEN
        IF v_gain IS NULL THEN
            RAISE EXCEPTION 'حساب أرباح الجرد غير محدد: استخدم erp.set_inventory_adjustment_accounts' USING ERRCODE = '23514';
        END IF;
        INSERT INTO erp.stock_documents (company_id, branch_id, doc_type, doc_date, warehouse_id, counter_account_id, notes)
        VALUES (c.company_id, c.branch_id, 'receipt', c.count_date, c.warehouse_id, v_gain,
                'تسوية زيادة جرد رقم ' || c.count_no)
        RETURNING id INTO v_rec;

        FOR l IN SELECT * FROM erp.stock_count_lines
                  WHERE count_id = c.id AND diff_qty > 0 ORDER BY line_no
        LOOP
            SELECT id INTO v_unit FROM erp.item_units WHERE item_id = l.item_id AND is_base;
            v_cost := round(erp.fn_item_live_cost(c.warehouse_id, l.item_id), 6);
            INSERT INTO erp.stock_document_lines (company_id, document_id, item_id, item_unit_id, quantity, unit_cost,
                                                  batch_id, batch_no, manufacture_date, expiry_date, notes)
            VALUES (c.company_id, v_rec, l.item_id, v_unit, l.diff_qty, v_cost,
                    l.batch_id, l.batch_no, l.manufacture_date, l.expiry_date, 'جرد رقم ' || c.count_no)
            RETURNING id INTO v_dl;
            PERFORM set_config('erp.count_write', 'on', true);
            UPDATE erp.stock_count_lines SET stock_document_line_id = v_dl, unit_cost = v_cost WHERE id = l.id;
            PERFORM set_config('erp.count_write', 'off', true);
        END LOOP;
        PERFORM erp.post_stock_document(v_rec, p_user);
    END IF;

    -- ---- النقص: مستند صرف بالمتوسط المرجح ----
    IF EXISTS (SELECT 1 FROM erp.stock_count_lines WHERE count_id = c.id AND diff_qty < 0) THEN
        IF v_loss IS NULL THEN
            RAISE EXCEPTION 'حساب خسائر الجرد غير محدد: استخدم erp.set_inventory_adjustment_accounts' USING ERRCODE = '23514';
        END IF;
        INSERT INTO erp.stock_documents (company_id, branch_id, doc_type, doc_date, warehouse_id, counter_account_id, notes)
        VALUES (c.company_id, c.branch_id, 'issue', c.count_date, c.warehouse_id, v_loss,
                'تسوية نقص جرد رقم ' || c.count_no)
        RETURNING id INTO v_iss;

        FOR l IN SELECT * FROM erp.stock_count_lines
                  WHERE count_id = c.id AND diff_qty < 0 ORDER BY line_no
        LOOP
            SELECT id INTO v_unit FROM erp.item_units WHERE item_id = l.item_id AND is_base;
            INSERT INTO erp.stock_document_lines (company_id, document_id, item_id, item_unit_id, quantity,
                                                  batch_id, notes)
            VALUES (c.company_id, v_iss, l.item_id, v_unit, -l.diff_qty, l.batch_id, 'جرد رقم ' || c.count_no)
            RETURNING id INTO v_dl;
            PERFORM set_config('erp.count_write', 'on', true);
            UPDATE erp.stock_count_lines SET stock_document_line_id = v_dl WHERE id = l.id;
            PERFORM set_config('erp.count_write', 'off', true);
        END LOOP;
        PERFORM erp.post_stock_document(v_iss, p_user);
    END IF;

    -- ---- تثبيت القيم الفعلية في أسطر الجرد ثم الترويسة ----
    PERFORM set_config('erp.count_write', 'on', true);

    UPDATE erp.stock_count_lines scl
       SET diff_value = CASE WHEN scl.diff_qty > 0 THEN dl.line_value ELSE -dl.line_value END,
           unit_cost  = CASE WHEN dl.qty_base > 0 THEN round(dl.line_value / dl.qty_base, 8) ELSE scl.unit_cost END
      FROM erp.stock_document_lines dl
     WHERE scl.count_id = c.id AND dl.id = scl.stock_document_line_id;

    UPDATE erp.stock_count_lines SET diff_value = 0 WHERE count_id = c.id AND diff_qty = 0;

    SELECT COALESCE(sum(diff_value) FILTER (WHERE diff_value > 0), 0),
           COALESCE(-sum(diff_value) FILTER (WHERE diff_value < 0), 0)
      INTO v_surplus, v_short
      FROM erp.stock_count_lines WHERE count_id = c.id;

    UPDATE erp.stock_counts
       SET status = 'posted', receipt_doc_id = v_rec, issue_doc_id = v_iss,
           surplus_value = v_surplus, shortage_value = v_short,
           posted_by = COALESCE(p_user, erp.current_user_id()), posted_at = now()
     WHERE id = c.id;

    PERFORM set_config('erp.count_write', 'off', true);
    RETURN QUERY SELECT v_rec, v_iss, v_surplus, v_short;
END $$;


ALTER FUNCTION erp.stock_count_post(p_count bigint, p_force boolean, p_user bigint) OWNER TO postgres;

--
-- TOC entry 768 (class 1255 OID 62131)
-- Name: stock_count_reopen(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_count_reopen(p_count bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    c record;
BEGIN
    SELECT * INTO c FROM erp.stock_counts WHERE id = p_count FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'جلسة الجرد غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'inventory.count.approve', c.branch_id);
    IF c.status <> 'approved' THEN
        RAISE EXCEPTION 'إعادة الفتح من حالة "معتمد" فقط' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.count_write', 'on', true);
    UPDATE erp.stock_counts SET status = 'counting', approved_by = NULL, approved_at = NULL WHERE id = c.id;
    PERFORM set_config('erp.count_write', 'off', true);
END $$;


ALTER FUNCTION erp.stock_count_reopen(p_count bigint) OWNER TO postgres;

--
-- TOC entry 651 (class 1255 OID 62128)
-- Name: stock_count_set_qty(bigint, bigint, numeric, bigint, bigint, character varying, date, text, bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_count_set_qty(p_count bigint, p_item bigint, p_qty numeric, p_item_unit bigint DEFAULT NULL::bigint, p_batch bigint DEFAULT NULL::bigint, p_batch_no character varying DEFAULT NULL::character varying, p_expiry date DEFAULT NULL::date, p_reason text DEFAULT NULL::text, p_user bigint DEFAULT NULL::bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $$
DECLARE
    c        record;
    it       record;
    v_f      numeric := 1;
    v_base   numeric;
    v_batch  bigint  := p_batch;
    v_bno    varchar := p_batch_no;
    v_line   bigint;
    v_sys    numeric;
BEGIN
    SELECT * INTO c FROM erp.stock_counts WHERE id = p_count;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'جلسة الجرد غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'inventory.count.manage', c.branch_id);
    IF c.status <> 'counting' THEN
        RAISE EXCEPTION 'إدخال العدّ مسموح في حالة "قيد الجرد" فقط (الحالة الحالية: %)', c.status USING ERRCODE = '23514';
    END IF;
    IF p_qty IS NULL OR p_qty < 0 THEN
        RAISE EXCEPTION 'الكمية المعدودة يجب أن تكون صفراً أو أكثر' USING ERRCODE = '23514';
    END IF;

    SELECT id, track_batch, track_expiry INTO it FROM erp.items WHERE id = p_item AND company_id = c.company_id;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الصنف غير موجود' USING ERRCODE = '23503';
    END IF;

    IF p_item_unit IS NOT NULL THEN
        SELECT factor_to_base INTO v_f FROM erp.item_units WHERE id = p_item_unit AND item_id = p_item;
        IF v_f IS NULL THEN
            RAISE EXCEPTION 'الوحدة المحددة لا تخص هذا الصنف' USING ERRCODE = '23514';
        END IF;
    END IF;
    v_base := round(p_qty * v_f, 6);

    IF it.track_batch AND v_batch IS NULL AND v_bno IS NOT NULL THEN
        SELECT id INTO v_batch FROM erp.item_batches
         WHERE company_id = c.company_id AND item_id = p_item AND batch_no = v_bno;
        IF v_batch IS NOT NULL THEN
            v_bno := NULL;      -- تشغيلة موجودة
        END IF;
    END IF;

    SELECT id INTO v_line FROM erp.stock_count_lines
     WHERE count_id = p_count AND item_id = p_item
       AND COALESCE(batch_id, 0) = COALESCE(v_batch, 0)
       AND COALESCE(batch_no, '') = COALESCE(v_bno, '')
       FOR UPDATE;

    IF v_line IS NOT NULL THEN
        UPDATE erp.stock_count_lines
           SET counted_qty = v_base,
               reason      = COALESCE(p_reason, reason),
               expiry_date = COALESCE(p_expiry, expiry_date),
               counted_by  = COALESCE(p_user, erp.current_user_id()),
               counted_at  = now()
         WHERE id = v_line;
    ELSE
        v_sys := erp.fn_item_live_qty(c.warehouse_id, p_item, v_batch);
        INSERT INTO erp.stock_count_lines (count_id, item_id, batch_id, batch_no, expiry_date,
                                           system_qty, counted_qty, unit_cost, reason, counted_by, counted_at)
        VALUES (p_count, p_item, v_batch, v_bno, p_expiry,
                v_sys, v_base, erp.fn_item_live_cost(c.warehouse_id, p_item), p_reason,
                COALESCE(p_user, erp.current_user_id()), now())
        RETURNING id INTO v_line;
    END IF;
    RETURN v_line;
END $$;


ALTER FUNCTION erp.stock_count_set_qty(p_count bigint, p_item bigint, p_qty numeric, p_item_unit bigint, p_batch bigint, p_batch_no character varying, p_expiry date, p_reason text, p_user bigint) OWNER TO postgres;

--
-- TOC entry 605 (class 1255 OID 62129)
-- Name: stock_count_stale_items(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_count_stale_items(p_count bigint) RETURNS TABLE(o_item_id bigint, o_batch_id bigint, o_snapshot_qty numeric, o_live_qty numeric)
    LANGUAGE sql STABLE
    AS $$
    SELECT scl.item_id, scl.batch_id, scl.system_qty,
           erp.fn_item_live_qty(sc.warehouse_id, scl.item_id, scl.batch_id)
      FROM erp.stock_count_lines scl
      JOIN erp.stock_counts sc ON sc.id = scl.count_id
     WHERE scl.count_id = p_count
       AND scl.counted_qty IS NOT NULL
       AND erp.fn_item_live_qty(sc.warehouse_id, scl.item_id, scl.batch_id) <> scl.system_qty
$$;


ALTER FUNCTION erp.stock_count_stale_items(p_count bigint) OWNER TO postgres;

--
-- TOC entry 715 (class 1255 OID 62127)
-- Name: stock_count_start(bigint, boolean); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.stock_count_start(p_count bigint, p_include_zero boolean DEFAULT false) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    c    record;
    v_n  integer := 0;
    v_m  integer := 0;
BEGIN
    SELECT * INTO c FROM erp.stock_counts WHERE id = p_count FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'جلسة الجرد غير موجودة' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'inventory.count.manage', c.branch_id);
    IF c.status <> 'draft' THEN
        RAISE EXCEPTION 'يمكن بدء الجرد من حالة المسودة فقط (الحالة الحالية: %)', c.status USING ERRCODE = '23514';
    END IF;

    PERFORM set_config('erp.count_write', 'on', true);

    IF c.count_type <> 'adjustment' THEN
        -- أصناف بلا تشغيلات
        INSERT INTO erp.stock_count_lines (count_id, line_no, item_id, system_qty, unit_cost)
        SELECT c.id,
               (row_number() OVER (ORDER BY i.code))::integer,
               i.id,
               COALESCE(sb.qty_on_hand, 0),
               COALESCE(CASE WHEN sb.qty_on_hand > 0 THEN round(sb.total_value / sb.qty_on_hand, 8)
                             ELSE sb.last_avg_cost END, 0)
          FROM erp.items i
          LEFT JOIN erp.stock_balances sb ON sb.item_id = i.id AND sb.warehouse_id = c.warehouse_id
         WHERE i.company_id = c.company_id AND i.is_active AND i.is_stockable AND NOT i.track_batch
           AND (c.category_id IS NULL OR i.category_id = c.category_id)
           AND (p_include_zero OR COALESCE(sb.qty_on_hand, 0) <> 0)
         ORDER BY i.code;
        GET DIAGNOSTICS v_n = ROW_COUNT;

        -- أصناف بتشغيلات: سطر لكل تشغيلة
        INSERT INTO erp.stock_count_lines (count_id, line_no, item_id, batch_id, system_qty, unit_cost)
        SELECT c.id,
               v_n + (row_number() OVER (ORDER BY i.code, bb.batch_id))::integer,
               i.id, bb.batch_id, bb.qty_on_hand,
               COALESCE(CASE WHEN sb.qty_on_hand > 0 THEN round(sb.total_value / sb.qty_on_hand, 8)
                             ELSE sb.last_avg_cost END, 0)
          FROM erp.stock_batch_balances bb
          JOIN erp.items i ON i.id = bb.item_id
          LEFT JOIN erp.stock_balances sb ON sb.item_id = bb.item_id AND sb.warehouse_id = bb.warehouse_id
         WHERE bb.warehouse_id = c.warehouse_id AND i.is_active AND i.is_stockable AND i.track_batch
           AND (c.category_id IS NULL OR i.category_id = c.category_id)
           AND (p_include_zero OR bb.qty_on_hand <> 0)
         ORDER BY i.code, bb.batch_id;
        GET DIAGNOSTICS v_m = ROW_COUNT;
    END IF;

    UPDATE erp.stock_counts SET status = 'counting', snapshot_at = now() WHERE id = c.id;
    PERFORM set_config('erp.count_write', 'off', true);
    RETURN v_n + v_m;
END $$;


ALTER FUNCTION erp.stock_count_start(p_count bigint, p_include_zero boolean) OWNER TO postgres;

--
-- TOC entry 771 (class 1255 OID 45517)
-- Name: user_limit(bigint, text); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.user_limit(p_company bigint, p_limit_code text) RETURNS numeric
    LANGUAGE plpgsql STABLE
    AS $$
DECLARE
    v_user bigint := erp.current_user_id();
    v_super boolean;
    v_max numeric;
BEGIN
    SELECT is_superadmin INTO v_super FROM erp.app_users WHERE id = v_user;
    IF COALESCE(v_super, false) THEN
        RETURN NULL;
    END IF;
    IF EXISTS (SELECT 1 FROM erp.user_roles ur
                WHERE ur.user_id = v_user AND ur.company_id = p_company
                  AND NOT EXISTS (SELECT 1 FROM erp.role_limits rl WHERE rl.role_id = ur.role_id AND rl.limit_code = p_limit_code)) THEN
        RETURN NULL;                         -- دور واحد على الأقل بلا حد معرّف = بلا سقف
    END IF;
    SELECT MAX(rl.value) INTO v_max
      FROM erp.user_roles ur JOIN erp.role_limits rl ON rl.role_id = ur.role_id
     WHERE ur.user_id = v_user AND ur.company_id = p_company AND rl.limit_code = p_limit_code;
    RETURN v_max;
END $$;


ALTER FUNCTION erp.user_limit(p_company bigint, p_limit_code text) OWNER TO postgres;

--
-- TOC entry 677 (class 1255 OID 57463)
-- Name: void_cheque(bigint); Type: FUNCTION; Schema: erp; Owner: postgres
--

CREATE FUNCTION erp.void_cheque(p_cheque bigint) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE c record;
BEGIN
    SELECT * INTO c FROM erp.cheques WHERE id = p_cheque FOR UPDATE;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'الشيك غير موجود' USING ERRCODE = '23503';
    END IF;
    PERFORM erp.require_permission(c.company_id, 'accounting.cheque.manage', c.branch_id);
    IF c.status <> 'in_hand' THEN
        RAISE EXCEPTION 'يُلغى الشيك وهو في الصندوق فقط' USING ERRCODE = '23514';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM erp.financial_vouchers WHERE id = c.voucher_id AND status = 'cancelled') THEN
        RAISE EXCEPTION 'ألغِ سند الشيك أولاً (cancel_financial_voucher)' USING ERRCODE = '23514';
    END IF;
    PERFORM set_config('erp.cheque_write', 'on', true);
    UPDATE erp.cheques SET status = 'void' WHERE id = c.id;
    PERFORM set_config('erp.cheque_write', 'off', true);
END $$;


ALTER FUNCTION erp.void_cheque(p_cheque bigint) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 240 (class 1259 OID 42875)
-- Name: account_currencies; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.account_currencies (
    account_id bigint NOT NULL,
    company_id bigint NOT NULL,
    currency_id bigint NOT NULL
);


ALTER TABLE erp.account_currencies OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 42825)
-- Name: accounts; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.accounts (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    parent_id bigint,
    code character varying(30) NOT NULL,
    name_ar character varying(200) NOT NULL,
    name_en character varying(200),
    level smallint NOT NULL,
    path text NOT NULL,
    is_group boolean DEFAULT false NOT NULL,
    category erp.account_category NOT NULL,
    nature erp.account_nature NOT NULL,
    subtype erp.account_subtype DEFAULT 'general'::erp.account_subtype NOT NULL,
    allow_all_currencies boolean DEFAULT true NOT NULL,
    default_currency_id bigint,
    require_cost_center boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.accounts OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 42824)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.accounts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 227 (class 1259 OID 42657)
-- Name: activities; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.activities (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    name_en character varying(150),
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE erp.activities OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 42656)
-- Name: activities_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.activities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 343 (class 1259 OID 45326)
-- Name: app_users; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.app_users (
    id bigint NOT NULL,
    username character varying(60) NOT NULL,
    full_name character varying(150) NOT NULL,
    email character varying(150),
    phone character varying(50),
    password_hash text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    is_superadmin boolean DEFAULT false NOT NULL,
    default_company_id bigint,
    must_change_password boolean DEFAULT false NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    locked_until timestamp with time zone,
    last_login_at timestamp with time zone,
    password_changed_at timestamp with time zone DEFAULT now() NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_users_username CHECK (((username)::text ~ '^[A-Za-z0-9_.@-]{3,60}$'::text))
);


ALTER TABLE erp.app_users OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 45325)
-- Name: app_users_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.app_users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.app_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 355 (class 1259 OID 45490)
-- Name: audit_log; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.audit_log (
    id bigint NOT NULL,
    company_id bigint,
    user_id bigint,
    table_name character varying(63) NOT NULL,
    record_id text,
    action character varying(10) NOT NULL,
    old_data jsonb,
    new_data jsonb,
    txid bigint,
    changed_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT audit_log_action_check CHECK (((action)::text = ANY ((ARRAY['INSERT'::character varying, 'UPDATE'::character varying, 'DELETE'::character varying])::text[])))
);


ALTER TABLE erp.audit_log OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 45489)
-- Name: audit_log_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.audit_log ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.audit_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 368 (class 1259 OID 57619)
-- Name: bank_reconciliation_matches; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.bank_reconciliation_matches (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    reconciliation_id bigint NOT NULL,
    statement_line_id bigint NOT NULL,
    journal_entry_line_id bigint NOT NULL,
    matched_amount_fc numeric(20,4) NOT NULL,
    matched_amount_local numeric(20,4) NOT NULL,
    method erp.bank_match_method DEFAULT 'manual'::erp.bank_match_method NOT NULL,
    matched_by bigint,
    matched_at timestamp with time zone DEFAULT now() NOT NULL,
    notes text,
    reversed_at timestamp with time zone,
    reversal_reason text,
    CONSTRAINT ck_bank_match_amounts CHECK (((matched_amount_fc > (0)::numeric) AND (matched_amount_local > (0)::numeric)))
);


ALTER TABLE erp.bank_reconciliation_matches OWNER TO postgres;

--
-- TOC entry 367 (class 1259 OID 57618)
-- Name: bank_reconciliation_matches_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.bank_reconciliation_matches ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.bank_reconciliation_matches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 366 (class 1259 OID 57579)
-- Name: bank_reconciliations; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.bank_reconciliations (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    statement_id bigint NOT NULL,
    bank_account_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    reconciliation_date date NOT NULL,
    status erp.bank_reconciliation_status DEFAULT 'draft'::erp.bank_reconciliation_status NOT NULL,
    statement_balance numeric(20,4),
    ledger_balance numeric(20,4),
    difference numeric(20,4),
    notes text,
    created_by bigint,
    completed_by bigint,
    completed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.bank_reconciliations OWNER TO postgres;

--
-- TOC entry 365 (class 1259 OID 57578)
-- Name: bank_reconciliations_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.bank_reconciliations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.bank_reconciliations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 364 (class 1259 OID 57546)
-- Name: bank_statement_lines; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.bank_statement_lines (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    statement_id bigint NOT NULL,
    line_no integer NOT NULL,
    transaction_date date NOT NULL,
    value_date date,
    description text,
    bank_reference character varying(200),
    direction erp.bank_line_direction NOT NULL,
    amount numeric(20,4) NOT NULL,
    balance_after numeric(20,4),
    fingerprint text NOT NULL,
    raw_data jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_bank_statement_line_amount CHECK ((amount > (0)::numeric)),
    CONSTRAINT ck_bank_statement_line_no CHECK ((line_no > 0))
);


ALTER TABLE erp.bank_statement_lines OWNER TO postgres;

--
-- TOC entry 363 (class 1259 OID 57545)
-- Name: bank_statement_lines_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.bank_statement_lines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.bank_statement_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 362 (class 1259 OID 57506)
-- Name: bank_statements; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.bank_statements (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    bank_account_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    statement_no character varying(100),
    statement_start date NOT NULL,
    statement_end date NOT NULL,
    opening_balance numeric(20,4),
    closing_balance numeric(20,4),
    source_file_name text,
    source_file_hash text,
    status erp.bank_statement_status DEFAULT 'draft'::erp.bank_statement_status NOT NULL,
    notes text,
    created_by bigint,
    reviewed_by bigint,
    reviewed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_bank_statement_dates CHECK ((statement_end >= statement_start))
);


ALTER TABLE erp.bank_statements OWNER TO postgres;

--
-- TOC entry 361 (class 1259 OID 57505)
-- Name: bank_statements_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.bank_statements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.bank_statements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 229 (class 1259 OID 42678)
-- Name: branches; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.branches (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    activity_id bigint,
    code character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    name_en character varying(150),
    is_main boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.branches OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 42677)
-- Name: branches_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.branches ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.branches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 359 (class 1259 OID 57390)
-- Name: cheques; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.cheques (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    direction erp.cheque_direction NOT NULL,
    cheque_no character varying(40) NOT NULL,
    bank_name character varying(100),
    due_date date NOT NULL,
    voucher_id bigint NOT NULL,
    customer_id bigint,
    supplier_id bigint,
    currency_id bigint NOT NULL,
    amount_fc numeric(20,4) NOT NULL,
    exchange_rate numeric(20,8) NOT NULL,
    amount_local numeric(20,4) NOT NULL,
    status erp.cheque_status DEFAULT 'in_hand'::erp.cheque_status NOT NULL,
    bank_account_id bigint,
    deposited_at date,
    settled_at date,
    settle_entry_id bigint,
    return_entry_id bigint,
    return_reason text,
    notes text,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_cheque_amount CHECK (((amount_fc > (0)::numeric) AND (amount_local > (0)::numeric) AND (exchange_rate > (0)::numeric))),
    CONSTRAINT ck_cheque_party CHECK ((((direction = 'receipt'::erp.cheque_direction) AND (customer_id IS NOT NULL) AND (supplier_id IS NULL)) OR ((direction = 'payment'::erp.cheque_direction) AND (supplier_id IS NOT NULL) AND (customer_id IS NULL))))
);


ALTER TABLE erp.cheques OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 57389)
-- Name: cheques_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.cheques ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.cheques_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 225 (class 1259 OID 42634)
-- Name: companies; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.companies (
    id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(200) NOT NULL,
    name_en character varying(200),
    tax_no character varying(50),
    base_currency_id bigint NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.companies OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 42633)
-- Name: companies_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.companies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 42710)
-- Name: company_currencies; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.company_currencies (
    company_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    default_rate numeric(20,8) NOT NULL,
    min_rate numeric(20,8) NOT NULL,
    max_rate numeric(20,8) NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT ck_company_currency_rates CHECK (((min_rate > (0)::numeric) AND (min_rate <= default_rate) AND (default_rate <= max_rate)))
);


ALTER TABLE erp.company_currencies OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 42939)
-- Name: company_settings; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.company_settings (
    company_id bigint NOT NULL,
    fx_realized_gain_account_id bigint,
    fx_realized_loss_account_id bigint,
    fx_unrealized_gain_account_id bigint,
    fx_unrealized_loss_account_id bigint,
    rounding_account_id bigint,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    retained_earnings_account_id bigint,
    notes_receivable_account_id bigint,
    notes_payable_account_id bigint
);


ALTER TABLE erp.company_settings OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 42898)
-- Name: cost_centers; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.cost_centers (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    parent_id bigint,
    code character varying(30) NOT NULL,
    name_ar character varying(200) NOT NULL,
    name_en character varying(200),
    level smallint NOT NULL,
    path text NOT NULL,
    is_group boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.cost_centers OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 42897)
-- Name: cost_centers_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.cost_centers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.cost_centers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 42618)
-- Name: currencies; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.currencies (
    id bigint NOT NULL,
    code character(3) NOT NULL,
    name_ar character varying(100) NOT NULL,
    name_en character varying(100),
    symbol character varying(10),
    decimal_places smallint DEFAULT 2 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT currencies_decimal_places_check CHECK (((decimal_places >= 0) AND (decimal_places <= 4)))
);


ALTER TABLE erp.currencies OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 42617)
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.currencies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 309 (class 1259 OID 44528)
-- Name: customer_currencies; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.customer_currencies (
    customer_id bigint NOT NULL,
    company_id bigint NOT NULL,
    currency_id bigint NOT NULL
);


ALTER TABLE erp.customer_currencies OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 44445)
-- Name: customer_groups; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.customer_groups (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    name_en character varying(150)
);


ALTER TABLE erp.customer_groups OWNER TO postgres;

--
-- TOC entry 305 (class 1259 OID 44444)
-- Name: customer_groups_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.customer_groups ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 311 (class 1259 OID 44547)
-- Name: customer_ledger; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.customer_ledger (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    entry_date date NOT NULL,
    due_date date,
    doc_type character varying(30) NOT NULL,
    doc_id bigint NOT NULL,
    journal_entry_id bigint,
    currency_id bigint NOT NULL,
    exchange_rate numeric(20,8) NOT NULL,
    debit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    credit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    debit_local numeric(20,4) DEFAULT 0 NOT NULL,
    credit_local numeric(20,4) DEFAULT 0 NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    voucher_detail_id bigint,
    CONSTRAINT customer_ledger_credit_fc_check CHECK ((credit_fc >= (0)::numeric)),
    CONSTRAINT customer_ledger_credit_local_check CHECK ((credit_local >= (0)::numeric)),
    CONSTRAINT customer_ledger_debit_fc_check CHECK ((debit_fc >= (0)::numeric)),
    CONSTRAINT customer_ledger_debit_local_check CHECK ((debit_local >= (0)::numeric)),
    CONSTRAINT customer_ledger_exchange_rate_check CHECK ((exchange_rate > (0)::numeric))
);


ALTER TABLE erp.customer_ledger OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 44546)
-- Name: customer_ledger_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.customer_ledger ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.customer_ledger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 308 (class 1259 OID 44464)
-- Name: customers; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.customers (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    group_id bigint,
    code character varying(30) NOT NULL,
    name_ar character varying(250) NOT NULL,
    name_en character varying(250),
    tax_no character varying(50),
    contact_person character varying(150),
    phone character varying(50),
    email character varying(150),
    address text,
    default_currency_id bigint,
    allow_all_currencies boolean DEFAULT true NOT NULL,
    credit_limit numeric(20,4),
    payment_days integer DEFAULT 0 NOT NULL,
    price_list_id bigint,
    default_discount_pct numeric(7,4) DEFAULT 0 NOT NULL,
    is_tax_exempt boolean DEFAULT false NOT NULL,
    parent_account_id bigint,
    account_id bigint NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT customers_credit_limit_check CHECK ((credit_limit >= (0)::numeric)),
    CONSTRAINT customers_default_discount_pct_check CHECK (((default_discount_pct >= (0)::numeric) AND (default_discount_pct <= (100)::numeric))),
    CONSTRAINT customers_payment_days_check CHECK ((payment_days >= 0))
);


ALTER TABLE erp.customers OWNER TO postgres;

--
-- TOC entry 307 (class 1259 OID 44463)
-- Name: customers_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.customers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 389 (class 1259 OID 62395)
-- Name: depreciation_lines; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.depreciation_lines (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    run_id bigint NOT NULL,
    asset_id bigint NOT NULL,
    months integer NOT NULL,
    amount numeric(20,4) NOT NULL,
    prev_last_dep_date date,
    prev_months_done integer NOT NULL,
    accumulated_after numeric(20,4) NOT NULL,
    book_after numeric(20,4) NOT NULL,
    expense_account_id bigint NOT NULL,
    accum_account_id bigint NOT NULL,
    cost_center_id bigint,
    CONSTRAINT ck_dl_amount CHECK (((amount > (0)::numeric) AND (months > 0)))
);


ALTER TABLE erp.depreciation_lines OWNER TO postgres;

--
-- TOC entry 388 (class 1259 OID 62394)
-- Name: depreciation_lines_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.depreciation_lines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.depreciation_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 387 (class 1259 OID 62340)
-- Name: depreciation_runs; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.depreciation_runs (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    fiscal_year_id bigint NOT NULL,
    run_no bigint NOT NULL,
    period_end date NOT NULL,
    status erp.depreciation_run_status DEFAULT 'draft'::erp.depreciation_run_status NOT NULL,
    total_amount numeric(20,4) DEFAULT 0 NOT NULL,
    journal_entry_id bigint,
    reversal_entry_id bigint,
    notes text,
    created_by bigint,
    posted_by bigint,
    posted_at timestamp with time zone,
    reversed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.depreciation_runs OWNER TO postgres;

--
-- TOC entry 386 (class 1259 OID 62339)
-- Name: depreciation_runs_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.depreciation_runs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.depreciation_runs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 237 (class 1259 OID 42808)
-- Name: document_sequences; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.document_sequences (
    company_id bigint NOT NULL,
    doc_type character varying(20) NOT NULL,
    fiscal_year_id bigint NOT NULL,
    last_no bigint DEFAULT 0 NOT NULL,
    CONSTRAINT ck_docseq_last_no CHECK ((last_no >= 0))
);


ALTER TABLE erp.document_sequences OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 42734)
-- Name: exchange_rates; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.exchange_rates (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    rate_date date NOT NULL,
    rate numeric(20,8) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT exchange_rates_rate_check CHECK ((rate > (0)::numeric))
);


ALTER TABLE erp.exchange_rates OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 42733)
-- Name: exchange_rates_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.exchange_rates ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.exchange_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 333 (class 1259 OID 45052)
-- Name: financial_vouchers; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.financial_vouchers (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    voucher_type_id bigint NOT NULL,
    kind erp.voucher_kind NOT NULL,
    fiscal_year_id bigint NOT NULL,
    fiscal_period_id bigint NOT NULL,
    voucher_no bigint NOT NULL,
    voucher_ref character varying(40) NOT NULL,
    voucher_date date NOT NULL,
    currency_id bigint NOT NULL,
    exchange_rate numeric(20,8) NOT NULL,
    status erp.voucher_status DEFAULT 'draft'::erp.voucher_status NOT NULL,
    treasury_account_id bigint,
    cost_center_id bigint,
    counterparty_name character varying(150),
    reference character varying(60),
    description text,
    total_fc numeric(20,4) DEFAULT 0 NOT NULL,
    fx_difference_local numeric(20,4) DEFAULT 0 NOT NULL,
    journal_entry_id bigint,
    cancel_journal_entry_id bigint,
    posted_by bigint,
    posted_at timestamp with time zone,
    cancelled_by bigint,
    cancelled_at timestamp with time zone,
    cancel_reason text,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_vch_cancel CHECK (((status <> 'cancelled'::erp.voucher_status) OR ((cancel_journal_entry_id IS NOT NULL) AND (cancelled_at IS NOT NULL)))),
    CONSTRAINT ck_vch_posted CHECK (((status = 'draft'::erp.voucher_status) OR ((journal_entry_id IS NOT NULL) AND (total_fc > (0)::numeric)))),
    CONSTRAINT ck_vch_treasury CHECK ((((kind = 'journal'::erp.voucher_kind) AND (treasury_account_id IS NULL)) OR ((kind <> 'journal'::erp.voucher_kind) AND (treasury_account_id IS NOT NULL))))
);


ALTER TABLE erp.financial_vouchers OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 45051)
-- Name: financial_vouchers_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.financial_vouchers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.financial_vouchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 236 (class 1259 OID 42782)
-- Name: fiscal_periods; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.fiscal_periods (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    fiscal_year_id bigint NOT NULL,
    period_no smallint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    status erp.period_status DEFAULT 'open'::erp.period_status NOT NULL,
    CONSTRAINT fiscal_periods_check CHECK ((end_date >= start_date)),
    CONSTRAINT fiscal_periods_period_no_check CHECK (((period_no >= 1) AND (period_no <= 13)))
);


ALTER TABLE erp.fiscal_periods OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 42781)
-- Name: fiscal_periods_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.fiscal_periods ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.fiscal_periods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 234 (class 1259 OID 42759)
-- Name: fiscal_years; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.fiscal_years (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    name character varying(50) NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    closed_at timestamp with time zone,
    closed_by bigint,
    reopened_at timestamp with time zone,
    reopened_by bigint,
    reopen_reason text,
    CONSTRAINT fiscal_years_check CHECK ((end_date > start_date))
);


ALTER TABLE erp.fiscal_years OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 42758)
-- Name: fiscal_years_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.fiscal_years ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.fiscal_years_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 383 (class 1259 OID 62184)
-- Name: fixed_asset_categories; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.fixed_asset_categories (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    name_en character varying(150),
    cost_account_id bigint NOT NULL,
    accum_account_id bigint NOT NULL,
    expense_account_id bigint NOT NULL,
    gain_account_id bigint,
    loss_account_id bigint,
    method erp.depreciation_method DEFAULT 'straight_line'::erp.depreciation_method NOT NULL,
    life_months integer,
    salvage_pct numeric(7,4) DEFAULT 0 NOT NULL,
    declining_rate_pct numeric(7,4),
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_fac_method CHECK ((((method = 'straight_line'::erp.depreciation_method) AND (COALESCE(life_months, 0) > 0)) OR ((method = 'declining_balance'::erp.depreciation_method) AND (COALESCE(declining_rate_pct, (0)::numeric) > (0)::numeric) AND (declining_rate_pct <= (100)::numeric)))),
    CONSTRAINT ck_fac_salvage CHECK (((salvage_pct >= (0)::numeric) AND (salvage_pct < (100)::numeric)))
);


ALTER TABLE erp.fixed_asset_categories OWNER TO postgres;

--
-- TOC entry 382 (class 1259 OID 62183)
-- Name: fixed_asset_categories_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.fixed_asset_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.fixed_asset_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 385 (class 1259 OID 62243)
-- Name: fixed_assets; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.fixed_assets (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    category_id bigint NOT NULL,
    asset_no character varying(40) NOT NULL,
    name_ar character varying(250) NOT NULL,
    name_en character varying(250),
    serial_no character varying(60),
    location character varying(150),
    cost_center_id bigint,
    acquisition_date date NOT NULL,
    in_service_date date NOT NULL,
    cost numeric(20,4) NOT NULL,
    salvage_value numeric(20,4) DEFAULT 0 NOT NULL,
    method erp.depreciation_method NOT NULL,
    life_months integer,
    declining_rate_pct numeric(7,4),
    status erp.fixed_asset_status DEFAULT 'draft'::erp.fixed_asset_status NOT NULL,
    counter_account_id bigint,
    opening_accumulated numeric(20,4) DEFAULT 0 NOT NULL,
    opening_months integer DEFAULT 0 NOT NULL,
    accumulated_depreciation numeric(20,4) DEFAULT 0 NOT NULL,
    dep_months_done integer DEFAULT 0 NOT NULL,
    last_depreciation_date date,
    book_value numeric(20,4) GENERATED ALWAYS AS ((cost - accumulated_depreciation)) STORED,
    acquisition_entry_id bigint,
    activated_by bigint,
    activated_at timestamp with time zone,
    disposal_date date,
    disposal_proceeds numeric(20,4),
    disposal_account_id bigint,
    disposal_gain_loss numeric(20,4),
    disposal_entry_id bigint,
    disposed_by bigint,
    notes text,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_fa_accum CHECK (((accumulated_depreciation >= (0)::numeric) AND (accumulated_depreciation <= (cost - salvage_value)))),
    CONSTRAINT ck_fa_cost CHECK ((cost > (0)::numeric)),
    CONSTRAINT ck_fa_dates CHECK ((in_service_date >= acquisition_date)),
    CONSTRAINT ck_fa_method CHECK ((((method = 'straight_line'::erp.depreciation_method) AND (COALESCE(life_months, 0) > 0)) OR ((method = 'declining_balance'::erp.depreciation_method) AND (COALESCE(declining_rate_pct, (0)::numeric) > (0)::numeric) AND (declining_rate_pct <= (100)::numeric)))),
    CONSTRAINT ck_fa_opening CHECK (((opening_accumulated >= (0)::numeric) AND (opening_months >= 0))),
    CONSTRAINT ck_fa_salvage CHECK (((salvage_value >= (0)::numeric) AND (salvage_value < cost)))
);


ALTER TABLE erp.fixed_assets OWNER TO postgres;

--
-- TOC entry 384 (class 1259 OID 62242)
-- Name: fixed_assets_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.fixed_assets ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.fixed_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 263 (class 1259 OID 43344)
-- Name: inventory_settings; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.inventory_settings (
    company_id bigint NOT NULL,
    default_cogs_account_id bigint,
    default_receipt_account_id bigint,
    adjustment_gain_account_id bigint,
    adjustment_loss_account_id bigint
);


ALTER TABLE erp.inventory_settings OWNER TO postgres;

--
-- TOC entry 303 (class 1259 OID 44373)
-- Name: item_accounts; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.item_accounts (
    company_id bigint NOT NULL,
    item_id bigint NOT NULL,
    revenue_account_id bigint,
    cogs_account_id bigint
);


ALTER TABLE erp.item_accounts OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 43255)
-- Name: item_barcodes; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.item_barcodes (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    item_id bigint NOT NULL,
    item_unit_id bigint NOT NULL,
    barcode character varying(64) NOT NULL,
    is_primary boolean DEFAULT false NOT NULL
);


ALTER TABLE erp.item_barcodes OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 43254)
-- Name: item_barcodes_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.item_barcodes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.item_barcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 43281)
-- Name: item_batches; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.item_batches (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    item_id bigint NOT NULL,
    batch_no character varying(60) NOT NULL,
    manufacture_date date,
    expiry_date date,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT item_batches_check CHECK (((expiry_date IS NULL) OR (manufacture_date IS NULL) OR (expiry_date >= manufacture_date)))
);


ALTER TABLE erp.item_batches OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 43280)
-- Name: item_batches_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.item_batches ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.item_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 252 (class 1259 OID 43144)
-- Name: item_categories; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.item_categories (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    parent_id bigint,
    code character varying(30) NOT NULL,
    name_ar character varying(150) NOT NULL,
    name_en character varying(150)
);


ALTER TABLE erp.item_categories OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 43143)
-- Name: item_categories_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.item_categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.item_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 256 (class 1259 OID 43219)
-- Name: item_units; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.item_units (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    item_id bigint NOT NULL,
    unit_id bigint NOT NULL,
    factor_to_base numeric(20,6) NOT NULL,
    is_base boolean DEFAULT false NOT NULL,
    sale_price numeric(20,4) DEFAULT 0 NOT NULL,
    purchase_price numeric(20,4) DEFAULT 0 NOT NULL,
    CONSTRAINT ck_item_units_base CHECK (((NOT is_base) OR (factor_to_base = (1)::numeric))),
    CONSTRAINT item_units_factor_to_base_check CHECK ((factor_to_base > (0)::numeric)),
    CONSTRAINT item_units_purchase_price_check CHECK ((purchase_price >= (0)::numeric)),
    CONSTRAINT item_units_sale_price_check CHECK ((sale_price >= (0)::numeric))
);


ALTER TABLE erp.item_units OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 43218)
-- Name: item_units_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.item_units ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.item_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 254 (class 1259 OID 43168)
-- Name: items; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.items (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    category_id bigint,
    code character varying(40) NOT NULL,
    name_ar character varying(250) NOT NULL,
    name_en character varying(250),
    base_unit_id bigint NOT NULL,
    is_stockable boolean DEFAULT true NOT NULL,
    track_batch boolean DEFAULT false NOT NULL,
    track_expiry boolean DEFAULT false NOT NULL,
    min_stock numeric(20,6) DEFAULT 0 NOT NULL,
    reorder_level numeric(20,6) DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_items_expiry_needs_batch CHECK (((NOT track_expiry) OR track_batch)),
    CONSTRAINT items_min_stock_check CHECK ((min_stock >= (0)::numeric)),
    CONSTRAINT items_reorder_level_check CHECK ((reorder_level >= (0)::numeric))
);


ALTER TABLE erp.items OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 43167)
-- Name: items_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 245 (class 1259 OID 42978)
-- Name: journal_entries; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.journal_entries (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    fiscal_year_id bigint NOT NULL,
    fiscal_period_id bigint NOT NULL,
    entry_no bigint NOT NULL,
    entry_date date NOT NULL,
    entry_type character varying(20) DEFAULT 'manual'::character varying NOT NULL,
    source_type character varying(30),
    source_id bigint,
    reference character varying(100),
    description text,
    status erp.entry_status DEFAULT 'draft'::erp.entry_status NOT NULL,
    total_debit_local numeric(20,4) DEFAULT 0 NOT NULL,
    total_credit_local numeric(20,4) DEFAULT 0 NOT NULL,
    reversed_entry_id bigint,
    posted_at timestamp with time zone,
    posted_by bigint,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_je_posted_balanced CHECK (((status = 'draft'::erp.entry_status) OR ((total_debit_local = total_credit_local) AND (total_debit_local > (0)::numeric))))
);


ALTER TABLE erp.journal_entries OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 42977)
-- Name: journal_entries_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.journal_entries ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.journal_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 247 (class 1259 OID 43033)
-- Name: journal_entry_lines; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.journal_entry_lines (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    entry_id bigint NOT NULL,
    line_no integer NOT NULL,
    account_id bigint NOT NULL,
    cost_center_id bigint,
    currency_id bigint NOT NULL,
    debit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    credit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    exchange_rate numeric(20,8) NOT NULL,
    debit_local numeric(20,4) NOT NULL,
    credit_local numeric(20,4) NOT NULL,
    is_fx_difference boolean DEFAULT false NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_jel_non_negative CHECK (((debit_fc >= (0)::numeric) AND (credit_fc >= (0)::numeric) AND (debit_local >= (0)::numeric) AND (credit_local >= (0)::numeric))),
    CONSTRAINT ck_jel_one_side CHECK ((((debit_fc > (0)::numeric) AND (credit_fc = (0)::numeric)) OR ((credit_fc > (0)::numeric) AND (debit_fc = (0)::numeric)))),
    CONSTRAINT ck_jel_rate CHECK ((exchange_rate > (0)::numeric)),
    CONSTRAINT ck_jel_sides_match CHECK ((((debit_fc > (0)::numeric) = (debit_local > (0)::numeric)) AND ((credit_fc > (0)::numeric) = (credit_local > (0)::numeric))))
);


ALTER TABLE erp.journal_entry_lines OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 43032)
-- Name: journal_entry_lines_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.journal_entry_lines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.journal_entry_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 291 (class 1259 OID 44090)
-- Name: landed_cost_types; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.landed_cost_types (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(100) NOT NULL,
    default_account_id bigint,
    default_allocation_method erp.landed_alloc_method DEFAULT 'value'::erp.landed_alloc_method NOT NULL
);


ALTER TABLE erp.landed_cost_types OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 44089)
-- Name: landed_cost_types_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.landed_cost_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.landed_cost_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 302 (class 1259 OID 44344)
-- Name: payment_methods; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.payment_methods (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(100) NOT NULL,
    kind erp.payment_method_kind NOT NULL,
    account_id bigint NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE erp.payment_methods OWNER TO postgres;

--
-- TOC entry 301 (class 1259 OID 44343)
-- Name: payment_methods_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.payment_methods ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.payment_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 347 (class 1259 OID 45390)
-- Name: permissions; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.permissions (
    code character varying(60) NOT NULL,
    module character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    enforced boolean DEFAULT true NOT NULL
);


ALTER TABLE erp.permissions OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 44703)
-- Name: pos_cash_movements; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.pos_cash_movements (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    session_id bigint NOT NULL,
    movement_type character varying(10) NOT NULL,
    amount numeric(20,4) NOT NULL,
    reason text,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT pos_cash_movements_amount_check CHECK ((amount > (0)::numeric)),
    CONSTRAINT pos_cash_movements_movement_type_check CHECK (((movement_type)::text = ANY ((ARRAY['cash_in'::character varying, 'cash_out'::character varying])::text[])))
);


ALTER TABLE erp.pos_cash_movements OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 44702)
-- Name: pos_cash_movements_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.pos_cash_movements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.pos_cash_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 313 (class 1259 OID 44598)
-- Name: pos_registers; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.pos_registers (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    cash_account_id bigint NOT NULL,
    default_price_list_id bigint,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE erp.pos_registers OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 44597)
-- Name: pos_registers_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.pos_registers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.pos_registers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 317 (class 1259 OID 44682)
-- Name: pos_session_cash_counts; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.pos_session_cash_counts (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    session_id bigint NOT NULL,
    denomination numeric(20,4) NOT NULL,
    quantity integer NOT NULL,
    amount numeric(20,4) GENERATED ALWAYS AS ((denomination * (quantity)::numeric)) STORED,
    CONSTRAINT pos_session_cash_counts_denomination_check CHECK ((denomination > (0)::numeric)),
    CONSTRAINT pos_session_cash_counts_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE erp.pos_session_cash_counts OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 44681)
-- Name: pos_session_cash_counts_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.pos_session_cash_counts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.pos_session_cash_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 315 (class 1259 OID 44644)
-- Name: pos_sessions; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.pos_sessions (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    register_id bigint NOT NULL,
    session_no integer NOT NULL,
    cashier_id bigint,
    opened_at timestamp with time zone DEFAULT now() NOT NULL,
    opening_cash numeric(20,4) DEFAULT 0 NOT NULL,
    status erp.pos_session_status DEFAULT 'open'::erp.pos_session_status NOT NULL,
    closed_at timestamp with time zone,
    closed_by bigint,
    expected_cash numeric(20,4),
    counted_cash numeric(20,4),
    difference numeric(20,4),
    journal_entry_id bigint,
    notes text,
    CONSTRAINT ck_pos_closed CHECK (((status = 'open'::erp.pos_session_status) OR ((closed_at IS NOT NULL) AND (counted_cash IS NOT NULL) AND (expected_cash IS NOT NULL)))),
    CONSTRAINT pos_sessions_opening_cash_check CHECK ((opening_cash >= (0)::numeric))
);


ALTER TABLE erp.pos_sessions OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 44643)
-- Name: pos_sessions_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.pos_sessions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.pos_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 300 (class 1259 OID 44309)
-- Name: price_list_items; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.price_list_items (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    price_list_id bigint NOT NULL,
    item_id bigint NOT NULL,
    item_unit_id bigint NOT NULL,
    price numeric(20,6) NOT NULL,
    min_qty numeric(20,6) DEFAULT 1 NOT NULL,
    CONSTRAINT price_list_items_min_qty_check CHECK ((min_qty > (0)::numeric)),
    CONSTRAINT price_list_items_price_check CHECK ((price >= (0)::numeric))
);


ALTER TABLE erp.price_list_items OWNER TO postgres;

--
-- TOC entry 299 (class 1259 OID 44308)
-- Name: price_list_items_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.price_list_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.price_list_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 298 (class 1259 OID 44276)
-- Name: price_lists; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.price_lists (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    name_en character varying(150),
    kind erp.price_list_kind DEFAULT 'retail'::erp.price_list_kind NOT NULL,
    currency_id bigint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    valid_from date,
    valid_to date,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT price_lists_check CHECK (((valid_to IS NULL) OR (valid_from IS NULL) OR (valid_to >= valid_from)))
);


ALTER TABLE erp.price_lists OWNER TO postgres;

--
-- TOC entry 297 (class 1259 OID 44275)
-- Name: price_lists_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.price_lists ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.price_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 289 (class 1259 OID 44010)
-- Name: purchase_document_lines; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.purchase_document_lines (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    document_id bigint NOT NULL,
    line_no integer NOT NULL,
    item_id bigint NOT NULL,
    item_unit_id bigint NOT NULL,
    quantity numeric(20,6) NOT NULL,
    qty_base numeric(20,6) NOT NULL,
    unit_price numeric(20,6) NOT NULL,
    discount_pct numeric(7,4) DEFAULT 0 NOT NULL,
    tax_rate numeric(7,4) DEFAULT 0 NOT NULL,
    net_fc numeric(20,4) DEFAULT 0 NOT NULL,
    tax_fc numeric(20,4) DEFAULT 0 NOT NULL,
    net_local numeric(20,4) DEFAULT 0 NOT NULL,
    tax_local numeric(20,4) DEFAULT 0 NOT NULL,
    landed_local numeric(20,4) DEFAULT 0 NOT NULL,
    cost_local numeric(20,4) DEFAULT 0 NOT NULL,
    batch_id bigint,
    batch_no character varying(60),
    manufacture_date date,
    expiry_date date,
    settled_qty_base numeric(20,6) DEFAULT 0 NOT NULL,
    remaining_qty_base numeric(20,6) GENERATED ALWAYS AS ((qty_base - settled_qty_base)) STORED,
    request_line_id bigint,
    order_line_id bigint,
    source_line_id bigint,
    notes text,
    CONSTRAINT ck_pdl_settled CHECK (((settled_qty_base >= (0)::numeric) AND (settled_qty_base <= qty_base))),
    CONSTRAINT purchase_document_lines_discount_pct_check CHECK (((discount_pct >= (0)::numeric) AND (discount_pct <= (100)::numeric))),
    CONSTRAINT purchase_document_lines_quantity_check CHECK ((quantity > (0)::numeric)),
    CONSTRAINT purchase_document_lines_tax_rate_check CHECK (((tax_rate >= (0)::numeric) AND (tax_rate <= (100)::numeric))),
    CONSTRAINT purchase_document_lines_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE erp.purchase_document_lines OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 44009)
-- Name: purchase_document_lines_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.purchase_document_lines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.purchase_document_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 287 (class 1259 OID 43903)
-- Name: purchase_documents; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.purchase_documents (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    doc_type erp.purchase_doc_type NOT NULL,
    fiscal_year_id bigint NOT NULL,
    doc_no bigint NOT NULL,
    doc_date date NOT NULL,
    due_date date,
    expected_date date,
    supplier_id bigint NOT NULL,
    supplier_invoice_no character varying(60),
    warehouse_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    exchange_rate numeric(20,8) NOT NULL,
    payment_type erp.payment_type DEFAULT 'credit'::erp.payment_type NOT NULL,
    payment_account_id bigint,
    discount_pct numeric(7,4) DEFAULT 0 NOT NULL,
    cost_center_id bigint,
    order_id bigint,
    invoice_id bigint,
    status erp.purchase_doc_status DEFAULT 'draft'::erp.purchase_doc_status NOT NULL,
    subtotal_fc numeric(20,4) DEFAULT 0 NOT NULL,
    tax_fc numeric(20,4) DEFAULT 0 NOT NULL,
    total_fc numeric(20,4) DEFAULT 0 NOT NULL,
    subtotal_local numeric(20,4) DEFAULT 0 NOT NULL,
    tax_local numeric(20,4) DEFAULT 0 NOT NULL,
    total_local numeric(20,4) DEFAULT 0 NOT NULL,
    landed_cost_local numeric(20,4) DEFAULT 0 NOT NULL,
    journal_entry_id bigint,
    stock_document_id bigint,
    notes text,
    approved_by bigint,
    approved_at timestamp with time zone,
    posted_by bigint,
    posted_at timestamp with time zone,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_pdoc_links CHECK ((((order_id IS NULL) OR (doc_type = 'invoice'::erp.purchase_doc_type)) AND ((invoice_id IS NULL) OR (doc_type = 'return'::erp.purchase_doc_type)))),
    CONSTRAINT ck_pdoc_status CHECK ((((doc_type = 'order'::erp.purchase_doc_type) AND (status = ANY (ARRAY['draft'::erp.purchase_doc_status, 'approved'::erp.purchase_doc_status, 'partially_received'::erp.purchase_doc_status, 'received'::erp.purchase_doc_status, 'cancelled'::erp.purchase_doc_status]))) OR ((doc_type <> 'order'::erp.purchase_doc_type) AND (status = ANY (ARRAY['draft'::erp.purchase_doc_status, 'posted'::erp.purchase_doc_status]))))),
    CONSTRAINT purchase_documents_discount_pct_check CHECK (((discount_pct >= (0)::numeric) AND (discount_pct <= (100)::numeric)))
);


ALTER TABLE erp.purchase_documents OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 43902)
-- Name: purchase_documents_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.purchase_documents ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.purchase_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 294 (class 1259 OID 44165)
-- Name: purchase_landed_allocations; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.purchase_landed_allocations (
    landed_cost_id bigint NOT NULL,
    line_id bigint NOT NULL,
    amount_local numeric(20,4) NOT NULL
);


ALTER TABLE erp.purchase_landed_allocations OWNER TO postgres;

--
-- TOC entry 293 (class 1259 OID 44116)
-- Name: purchase_landed_costs; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.purchase_landed_costs (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    document_id bigint NOT NULL,
    cost_type_id bigint NOT NULL,
    description text,
    currency_id bigint NOT NULL,
    exchange_rate numeric(20,8) NOT NULL,
    amount_fc numeric(20,4) NOT NULL,
    amount_local numeric(20,4) NOT NULL,
    payee_supplier_id bigint,
    credit_account_id bigint,
    allocation_method erp.landed_alloc_method DEFAULT 'value'::erp.landed_alloc_method NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_plc_payee CHECK (((payee_supplier_id IS NULL) <> (credit_account_id IS NULL))),
    CONSTRAINT purchase_landed_costs_amount_fc_check CHECK ((amount_fc > (0)::numeric))
);


ALTER TABLE erp.purchase_landed_costs OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 44115)
-- Name: purchase_landed_costs_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.purchase_landed_costs ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.purchase_landed_costs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 285 (class 1259 OID 43856)
-- Name: purchase_request_lines; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.purchase_request_lines (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    request_id bigint NOT NULL,
    line_no integer NOT NULL,
    item_id bigint NOT NULL,
    item_unit_id bigint NOT NULL,
    quantity numeric(20,6) NOT NULL,
    qty_base numeric(20,6) NOT NULL,
    ordered_qty_base numeric(20,6) DEFAULT 0 NOT NULL,
    remaining_qty_base numeric(20,6) GENERATED ALWAYS AS ((qty_base - ordered_qty_base)) STORED,
    suggested_supplier_id bigint,
    notes text,
    CONSTRAINT ck_prl_ordered CHECK (((ordered_qty_base >= (0)::numeric) AND (ordered_qty_base <= qty_base))),
    CONSTRAINT purchase_request_lines_quantity_check CHECK ((quantity > (0)::numeric))
);


ALTER TABLE erp.purchase_request_lines OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 43855)
-- Name: purchase_request_lines_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.purchase_request_lines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.purchase_request_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 283 (class 1259 OID 43816)
-- Name: purchase_requests; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.purchase_requests (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    fiscal_year_id bigint NOT NULL,
    pr_no bigint NOT NULL,
    pr_date date NOT NULL,
    required_date date,
    warehouse_id bigint,
    requested_by bigint,
    status erp.purchase_request_status DEFAULT 'draft'::erp.purchase_request_status NOT NULL,
    notes text,
    approved_by bigint,
    approved_at timestamp with time zone,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT purchase_requests_check CHECK (((required_date IS NULL) OR (required_date >= pr_date)))
);


ALTER TABLE erp.purchase_requests OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 43815)
-- Name: purchase_requests_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.purchase_requests ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.purchase_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 274 (class 1259 OID 43646)
-- Name: purchasing_settings; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.purchasing_settings (
    company_id bigint NOT NULL,
    default_supplier_control_account_id bigint,
    vat_input_account_id bigint,
    purchase_variance_account_id bigint
);


ALTER TABLE erp.purchasing_settings OWNER TO postgres;

--
-- TOC entry 351 (class 1259 OID 45438)
-- Name: role_limits; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.role_limits (
    role_id bigint NOT NULL,
    limit_code character varying(60) NOT NULL,
    value numeric(20,4) NOT NULL,
    CONSTRAINT role_limits_value_check CHECK ((value >= (0)::numeric))
);


ALTER TABLE erp.role_limits OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 45421)
-- Name: role_permissions; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.role_permissions (
    role_id bigint NOT NULL,
    permission_code character varying(60) NOT NULL
);


ALTER TABLE erp.role_permissions OWNER TO postgres;

--
-- TOC entry 349 (class 1259 OID 45401)
-- Name: roles; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.roles (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(30) NOT NULL,
    name_ar character varying(100) NOT NULL,
    is_system boolean DEFAULT false NOT NULL
);


ALTER TABLE erp.roles OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 45400)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 323 (class 1259 OID 44850)
-- Name: sales_document_lines; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.sales_document_lines (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    document_id bigint NOT NULL,
    line_no integer NOT NULL,
    item_id bigint NOT NULL,
    item_unit_id bigint NOT NULL,
    quantity numeric(20,6) NOT NULL,
    qty_base numeric(20,6) NOT NULL,
    unit_price numeric(20,6) NOT NULL,
    discount_pct numeric(7,4) DEFAULT 0 NOT NULL,
    tax_rate numeric(7,4) NOT NULL,
    net_fc numeric(20,4) DEFAULT 0 NOT NULL,
    tax_fc numeric(20,4) DEFAULT 0 NOT NULL,
    net_local numeric(20,4) DEFAULT 0 NOT NULL,
    tax_local numeric(20,4) DEFAULT 0 NOT NULL,
    cogs_local numeric(20,4) DEFAULT 0 NOT NULL,
    batch_id bigint,
    batch_no character varying(60),
    settled_qty_base numeric(20,6) DEFAULT 0 NOT NULL,
    remaining_qty_base numeric(20,6) GENERATED ALWAYS AS ((qty_base - settled_qty_base)) STORED,
    quotation_line_id bigint,
    order_line_id bigint,
    source_line_id bigint,
    notes text,
    CONSTRAINT ck_sdl_settled CHECK (((settled_qty_base >= (0)::numeric) AND (settled_qty_base <= qty_base))),
    CONSTRAINT sales_document_lines_discount_pct_check CHECK (((discount_pct >= (0)::numeric) AND (discount_pct <= (100)::numeric))),
    CONSTRAINT sales_document_lines_quantity_check CHECK ((quantity > (0)::numeric)),
    CONSTRAINT sales_document_lines_tax_rate_check CHECK (((tax_rate >= (0)::numeric) AND (tax_rate <= (100)::numeric))),
    CONSTRAINT sales_document_lines_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE erp.sales_document_lines OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 44849)
-- Name: sales_document_lines_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.sales_document_lines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.sales_document_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 325 (class 1259 OID 44927)
-- Name: sales_document_payments; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.sales_document_payments (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    document_id bigint NOT NULL,
    payment_method_id bigint NOT NULL,
    amount_fc numeric(20,4) NOT NULL,
    amount_local numeric(20,4) DEFAULT 0 NOT NULL,
    reference character varying(60),
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT sales_document_payments_amount_fc_check CHECK ((amount_fc > (0)::numeric))
);


ALTER TABLE erp.sales_document_payments OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 44926)
-- Name: sales_document_payments_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.sales_document_payments ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.sales_document_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 321 (class 1259 OID 44729)
-- Name: sales_documents; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.sales_documents (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    doc_type erp.sales_doc_type NOT NULL,
    fiscal_year_id bigint NOT NULL,
    doc_no bigint NOT NULL,
    doc_date date NOT NULL,
    due_date date,
    valid_until date,
    expected_date date,
    customer_id bigint,
    warehouse_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    exchange_rate numeric(20,8) NOT NULL,
    price_list_id bigint,
    discount_pct numeric(7,4) NOT NULL,
    cost_center_id bigint,
    pos_session_id bigint,
    salesperson_id bigint,
    customer_po_no character varying(60),
    quotation_id bigint,
    order_id bigint,
    invoice_id bigint,
    status erp.sales_doc_status DEFAULT 'draft'::erp.sales_doc_status NOT NULL,
    subtotal_fc numeric(20,4) DEFAULT 0 NOT NULL,
    tax_fc numeric(20,4) DEFAULT 0 NOT NULL,
    total_fc numeric(20,4) DEFAULT 0 NOT NULL,
    subtotal_local numeric(20,4) DEFAULT 0 NOT NULL,
    tax_local numeric(20,4) DEFAULT 0 NOT NULL,
    total_local numeric(20,4) DEFAULT 0 NOT NULL,
    paid_fc numeric(20,4) DEFAULT 0 NOT NULL,
    credit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    cogs_local numeric(20,4) DEFAULT 0 NOT NULL,
    journal_entry_id bigint,
    stock_document_id bigint,
    notes text,
    approved_by bigint,
    approved_at timestamp with time zone,
    posted_by bigint,
    posted_at timestamp with time zone,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_sdoc_customer CHECK (((doc_type = ANY (ARRAY['invoice'::erp.sales_doc_type, 'return'::erp.sales_doc_type])) OR (customer_id IS NOT NULL))),
    CONSTRAINT ck_sdoc_links CHECK ((((quotation_id IS NULL) OR (doc_type = 'order'::erp.sales_doc_type)) AND ((order_id IS NULL) OR (doc_type = 'invoice'::erp.sales_doc_type)) AND ((invoice_id IS NULL) OR (doc_type = 'return'::erp.sales_doc_type)))),
    CONSTRAINT ck_sdoc_pos CHECK (((pos_session_id IS NULL) OR (doc_type = ANY (ARRAY['invoice'::erp.sales_doc_type, 'return'::erp.sales_doc_type])))),
    CONSTRAINT ck_sdoc_status CHECK ((((doc_type = 'quotation'::erp.sales_doc_type) AND (status = ANY (ARRAY['draft'::erp.sales_doc_status, 'approved'::erp.sales_doc_status, 'converted'::erp.sales_doc_status, 'cancelled'::erp.sales_doc_status]))) OR ((doc_type = 'order'::erp.sales_doc_type) AND (status = ANY (ARRAY['draft'::erp.sales_doc_status, 'approved'::erp.sales_doc_status, 'partially_delivered'::erp.sales_doc_status, 'delivered'::erp.sales_doc_status, 'cancelled'::erp.sales_doc_status]))) OR ((doc_type = ANY (ARRAY['invoice'::erp.sales_doc_type, 'return'::erp.sales_doc_type])) AND (status = ANY (ARRAY['draft'::erp.sales_doc_status, 'posted'::erp.sales_doc_status]))))),
    CONSTRAINT ck_sdoc_valid CHECK (((valid_until IS NULL) OR (valid_until >= doc_date))),
    CONSTRAINT sales_documents_discount_pct_check CHECK (((discount_pct >= (0)::numeric) AND (discount_pct <= (100)::numeric)))
);


ALTER TABLE erp.sales_documents OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 44728)
-- Name: sales_documents_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.sales_documents ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.sales_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 304 (class 1259 OID 44395)
-- Name: sales_settings; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.sales_settings (
    company_id bigint NOT NULL,
    default_customer_control_account_id bigint,
    default_revenue_account_id bigint,
    default_cogs_account_id bigint,
    vat_output_account_id bigint,
    sales_returns_account_id bigint,
    cash_over_short_account_id bigint,
    default_vat_rate numeric(7,4) DEFAULT 0 NOT NULL,
    default_price_list_id bigint,
    CONSTRAINT sales_settings_default_vat_rate_check CHECK (((default_vat_rate >= (0)::numeric) AND (default_vat_rate <= (100)::numeric)))
);


ALTER TABLE erp.sales_settings OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 45377)
-- Name: security_settings; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.security_settings (
    company_id bigint NOT NULL,
    enforce_permissions boolean DEFAULT false NOT NULL
);


ALTER TABLE erp.security_settings OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 43367)
-- Name: stock_balances; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.stock_balances (
    company_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    item_id bigint NOT NULL,
    qty_on_hand numeric(20,6) DEFAULT 0 NOT NULL,
    total_value numeric(20,4) DEFAULT 0 NOT NULL,
    last_avg_cost numeric(20,8) DEFAULT 0 NOT NULL,
    avg_cost numeric(20,8) GENERATED ALWAYS AS (
CASE
    WHEN (qty_on_hand <> (0)::numeric) THEN round((total_value / qty_on_hand), 8)
    ELSE (0)::numeric
END) STORED,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.stock_balances OWNER TO postgres;

--
-- TOC entry 265 (class 1259 OID 43394)
-- Name: stock_batch_balances; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.stock_batch_balances (
    company_id bigint NOT NULL,
    warehouse_id bigint NOT NULL,
    item_id bigint NOT NULL,
    batch_id bigint NOT NULL,
    qty_on_hand numeric(20,6) DEFAULT 0 NOT NULL
);


ALTER TABLE erp.stock_batch_balances OWNER TO postgres;

--
-- TOC entry 379 (class 1259 OID 62069)
-- Name: stock_count_lines; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.stock_count_lines (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    count_id bigint NOT NULL,
    line_no integer NOT NULL,
    item_id bigint NOT NULL,
    batch_id bigint,
    batch_no character varying(60),
    manufacture_date date,
    expiry_date date,
    system_qty numeric(20,6) DEFAULT 0 NOT NULL,
    counted_qty numeric(20,6),
    diff_qty numeric(20,6) GENERATED ALWAYS AS ((counted_qty - system_qty)) STORED,
    unit_cost numeric(20,8) DEFAULT 0 NOT NULL,
    diff_value numeric(20,4),
    reason text,
    counted_by bigint,
    counted_at timestamp with time zone,
    stock_document_line_id bigint,
    CONSTRAINT ck_scl_counted CHECK (((counted_qty IS NULL) OR (counted_qty >= (0)::numeric)))
);


ALTER TABLE erp.stock_count_lines OWNER TO postgres;

--
-- TOC entry 378 (class 1259 OID 62068)
-- Name: stock_count_lines_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.stock_count_lines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.stock_count_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 377 (class 1259 OID 61992)
-- Name: stock_counts; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.stock_counts (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    fiscal_year_id bigint NOT NULL,
    count_no bigint NOT NULL,
    count_date date NOT NULL,
    warehouse_id bigint NOT NULL,
    count_type erp.stock_count_type DEFAULT 'full'::erp.stock_count_type NOT NULL,
    category_id bigint,
    status erp.stock_count_status DEFAULT 'draft'::erp.stock_count_status NOT NULL,
    snapshot_at timestamp with time zone,
    reason text,
    notes text,
    receipt_doc_id bigint,
    issue_doc_id bigint,
    surplus_value numeric(20,4) DEFAULT 0 NOT NULL,
    shortage_value numeric(20,4) DEFAULT 0 NOT NULL,
    created_by bigint,
    approved_by bigint,
    approved_at timestamp with time zone,
    posted_by bigint,
    posted_at timestamp with time zone,
    cancelled_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.stock_counts OWNER TO postgres;

--
-- TOC entry 376 (class 1259 OID 61991)
-- Name: stock_counts_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.stock_counts ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.stock_counts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 269 (class 1259 OID 43482)
-- Name: stock_document_lines; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.stock_document_lines (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    document_id bigint NOT NULL,
    line_no integer NOT NULL,
    item_id bigint NOT NULL,
    item_unit_id bigint NOT NULL,
    quantity numeric(20,6) NOT NULL,
    qty_base numeric(20,6) NOT NULL,
    unit_cost numeric(20,6),
    batch_id bigint,
    batch_no character varying(60),
    manufacture_date date,
    expiry_date date,
    line_value numeric(20,4),
    notes text,
    CONSTRAINT stock_document_lines_quantity_check CHECK ((quantity > (0)::numeric)),
    CONSTRAINT stock_document_lines_unit_cost_check CHECK ((unit_cost >= (0)::numeric))
);


ALTER TABLE erp.stock_document_lines OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 43481)
-- Name: stock_document_lines_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.stock_document_lines ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.stock_document_lines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 267 (class 1259 OID 43419)
-- Name: stock_documents; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.stock_documents (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    doc_type erp.stock_doc_type NOT NULL,
    fiscal_year_id bigint NOT NULL,
    doc_no bigint NOT NULL,
    doc_date date NOT NULL,
    warehouse_id bigint NOT NULL,
    to_warehouse_id bigint,
    counter_account_id bigint,
    cost_center_id bigint,
    status erp.stock_doc_status DEFAULT 'draft'::erp.stock_doc_status NOT NULL,
    total_value numeric(20,4) DEFAULT 0 NOT NULL,
    journal_entry_id bigint,
    notes text,
    posted_at timestamp with time zone,
    posted_by bigint,
    created_by bigint,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_sdoc_transfer CHECK ((((doc_type = 'transfer'::erp.stock_doc_type) AND (to_warehouse_id IS NOT NULL) AND (to_warehouse_id <> warehouse_id)) OR ((doc_type <> 'transfer'::erp.stock_doc_type) AND (to_warehouse_id IS NULL))))
);


ALTER TABLE erp.stock_documents OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 43418)
-- Name: stock_documents_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.stock_documents ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.stock_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 271 (class 1259 OID 43523)
-- Name: stock_movements; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.stock_movements (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    document_id bigint NOT NULL,
    line_id bigint NOT NULL,
    movement_date date NOT NULL,
    warehouse_id bigint NOT NULL,
    item_id bigint NOT NULL,
    batch_id bigint,
    qty_signed numeric(20,6) NOT NULL,
    unit_cost numeric(20,8) NOT NULL,
    value_signed numeric(20,4) NOT NULL,
    qty_after numeric(20,6) NOT NULL,
    value_after numeric(20,4) NOT NULL,
    avg_cost_after numeric(20,8) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT stock_movements_qty_signed_check CHECK ((qty_signed <> (0)::numeric))
);


ALTER TABLE erp.stock_movements OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 43522)
-- Name: stock_movements_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.stock_movements ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.stock_movements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 279 (class 1259 OID 43746)
-- Name: supplier_currencies; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.supplier_currencies (
    supplier_id bigint NOT NULL,
    company_id bigint NOT NULL,
    currency_id bigint NOT NULL
);


ALTER TABLE erp.supplier_currencies OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 43673)
-- Name: supplier_groups; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.supplier_groups (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    name_en character varying(150)
);


ALTER TABLE erp.supplier_groups OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 43672)
-- Name: supplier_groups_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.supplier_groups ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.supplier_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 281 (class 1259 OID 43765)
-- Name: supplier_ledger; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.supplier_ledger (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    supplier_id bigint NOT NULL,
    entry_date date NOT NULL,
    due_date date,
    doc_type character varying(30) NOT NULL,
    doc_id bigint NOT NULL,
    journal_entry_id bigint,
    currency_id bigint NOT NULL,
    exchange_rate numeric(20,8) NOT NULL,
    debit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    credit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    debit_local numeric(20,4) DEFAULT 0 NOT NULL,
    credit_local numeric(20,4) DEFAULT 0 NOT NULL,
    description text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    voucher_detail_id bigint,
    CONSTRAINT supplier_ledger_credit_fc_check CHECK ((credit_fc >= (0)::numeric)),
    CONSTRAINT supplier_ledger_credit_local_check CHECK ((credit_local >= (0)::numeric)),
    CONSTRAINT supplier_ledger_debit_fc_check CHECK ((debit_fc >= (0)::numeric)),
    CONSTRAINT supplier_ledger_debit_local_check CHECK ((debit_local >= (0)::numeric)),
    CONSTRAINT supplier_ledger_exchange_rate_check CHECK ((exchange_rate > (0)::numeric))
);


ALTER TABLE erp.supplier_ledger OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 43764)
-- Name: supplier_ledger_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.supplier_ledger ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.supplier_ledger_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 278 (class 1259 OID 43692)
-- Name: suppliers; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.suppliers (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    group_id bigint,
    code character varying(30) NOT NULL,
    name_ar character varying(250) NOT NULL,
    name_en character varying(250),
    tax_no character varying(50),
    contact_person character varying(150),
    phone character varying(50),
    email character varying(150),
    address text,
    default_currency_id bigint,
    allow_all_currencies boolean DEFAULT true NOT NULL,
    credit_limit numeric(20,4),
    payment_days integer DEFAULT 0 NOT NULL,
    parent_account_id bigint,
    account_id bigint NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT suppliers_credit_limit_check CHECK ((credit_limit >= (0)::numeric)),
    CONSTRAINT suppliers_payment_days_check CHECK ((payment_days >= 0))
);


ALTER TABLE erp.suppliers OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 43691)
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.suppliers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 250 (class 1259 OID 43125)
-- Name: units; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.units (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(100) NOT NULL,
    name_en character varying(100)
);


ALTER TABLE erp.units OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 43124)
-- Name: units_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.units ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 353 (class 1259 OID 45471)
-- Name: user_branches; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.user_branches (
    user_id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL
);


ALTER TABLE erp.user_branches OWNER TO postgres;

--
-- TOC entry 345 (class 1259 OID 45361)
-- Name: user_login_log; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.user_login_log (
    id bigint NOT NULL,
    user_id bigint,
    username_attempted character varying(60),
    success boolean NOT NULL,
    reason character varying(30),
    ip character varying(64),
    logged_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.user_login_log OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 45360)
-- Name: user_login_log_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.user_login_log ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.user_login_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 352 (class 1259 OID 45452)
-- Name: user_roles; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.user_roles (
    user_id bigint NOT NULL,
    company_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE erp.user_roles OWNER TO postgres;

--
-- TOC entry 369 (class 1259 OID 57660)
-- Name: v_bank_reconciliation_candidates; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_bank_reconciliation_candidates AS
 SELECT r.id AS reconciliation_id,
    l.id AS statement_line_id,
    l.transaction_date,
    l.direction,
    l.amount AS statement_amount_fc,
    l.bank_reference,
    l.description AS statement_description,
    jel.id AS journal_entry_line_id,
    je.entry_date,
    je.entry_no,
    je.reference AS journal_reference,
    jel.debit_fc,
    jel.credit_fc,
    jel.debit_local,
    jel.credit_local,
    jel.description AS journal_description,
        CASE
            WHEN (l.direction = 'debit'::erp.bank_line_direction) THEN jel.debit_fc
            ELSE jel.credit_fc
        END AS candidate_amount_fc,
        CASE
            WHEN (l.direction = 'debit'::erp.bank_line_direction) THEN jel.debit_local
            ELSE jel.credit_local
        END AS candidate_amount_local,
    COALESCE(stmt_alloc.allocated_fc, (0)::numeric) AS statement_allocated_fc,
    (l.amount - COALESCE(stmt_alloc.allocated_fc, (0)::numeric)) AS statement_remaining_fc,
    (
        CASE
            WHEN (l.direction = 'debit'::erp.bank_line_direction) THEN jel.debit_fc
            ELSE jel.credit_fc
        END - COALESCE(ledger_alloc.allocated_fc, (0)::numeric)) AS ledger_remaining_fc
   FROM (((((erp.bank_reconciliations r
     JOIN erp.bank_statement_lines l ON (((l.company_id = r.company_id) AND (l.statement_id = r.statement_id))))
     JOIN erp.journal_entry_lines jel ON (((jel.company_id = r.company_id) AND (jel.account_id = r.bank_account_id) AND (jel.currency_id = r.currency_id))))
     JOIN erp.journal_entries je ON (((je.id = jel.entry_id) AND (je.company_id = jel.company_id) AND (je.status = 'posted'::erp.entry_status) AND (je.entry_date <= l.transaction_date))))
     LEFT JOIN ( SELECT bank_reconciliation_matches.statement_line_id,
            sum(bank_reconciliation_matches.matched_amount_fc) AS allocated_fc
           FROM erp.bank_reconciliation_matches
          WHERE (bank_reconciliation_matches.reversed_at IS NULL)
          GROUP BY bank_reconciliation_matches.statement_line_id) stmt_alloc ON ((stmt_alloc.statement_line_id = l.id)))
     LEFT JOIN ( SELECT bank_reconciliation_matches.journal_entry_line_id,
            sum(bank_reconciliation_matches.matched_amount_fc) AS allocated_fc
           FROM erp.bank_reconciliation_matches
          WHERE (bank_reconciliation_matches.reversed_at IS NULL)
          GROUP BY bank_reconciliation_matches.journal_entry_line_id) ledger_alloc ON ((ledger_alloc.journal_entry_line_id = jel.id)))
  WHERE ((r.status = ANY (ARRAY['draft'::erp.bank_reconciliation_status, 'in_progress'::erp.bank_reconciliation_status])) AND (((l.direction = 'debit'::erp.bank_line_direction) AND (jel.debit_fc > (0)::numeric)) OR ((l.direction = 'credit'::erp.bank_line_direction) AND (jel.credit_fc > (0)::numeric))) AND ((l.amount - COALESCE(stmt_alloc.allocated_fc, (0)::numeric)) > (0)::numeric) AND ((
        CASE
            WHEN (l.direction = 'debit'::erp.bank_line_direction) THEN jel.debit_fc
            ELSE jel.credit_fc
        END - COALESCE(ledger_alloc.allocated_fc, (0)::numeric)) > (0)::numeric));


ALTER VIEW erp.v_bank_reconciliation_candidates OWNER TO postgres;

--
-- TOC entry 373 (class 1259 OID 57690)
-- Name: v_bank_reconciliation_cheque_candidates; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_bank_reconciliation_cheque_candidates AS
 SELECT c.id AS cheque_id,
    c.company_id,
    c.branch_id,
    c.direction,
    c.cheque_no,
    c.bank_name,
    c.due_date,
    c.status AS cheque_status,
    c.bank_account_id,
    c.currency_id,
    c.amount_fc AS cheque_amount_fc,
    c.amount_local AS cheque_amount_local,
    c.settled_at,
    c.settle_entry_id,
    r.id AS reconciliation_id,
    r.statement_id,
    r.bank_account_id AS reconciliation_bank_account_id,
    r.currency_id AS reconciliation_currency_id,
    l.id AS statement_line_id,
    l.transaction_date,
    l.direction AS statement_direction,
    l.amount AS statement_amount_fc,
    l.bank_reference,
    l.description AS statement_description,
    jel.id AS settlement_journal_line_id,
    jel.debit_fc,
    jel.credit_fc,
    jel.debit_local,
    jel.credit_local,
    je.entry_date AS settlement_entry_date,
    je.entry_no AS settlement_entry_no,
    je.reference AS settlement_reference,
    COALESCE(stmt_alloc.statement_allocated_fc, (0)::numeric) AS statement_allocated_fc,
    (l.amount - COALESCE(stmt_alloc.statement_allocated_fc, (0)::numeric)) AS statement_remaining_fc,
    (
        CASE
            WHEN (l.direction = 'debit'::erp.bank_line_direction) THEN jel.debit_fc
            ELSE jel.credit_fc
        END - COALESCE(ledger_alloc.ledger_allocated_fc, (0)::numeric)) AS ledger_remaining_fc,
        CASE
            WHEN ((c.direction = 'receipt'::erp.cheque_direction) AND (l.direction = 'debit'::erp.bank_line_direction)) THEN 'possible_receipt_cheque_match'::text
            WHEN ((c.direction = 'payment'::erp.cheque_direction) AND (l.direction = 'credit'::erp.bank_line_direction)) THEN 'possible_payment_cheque_match'::text
            ELSE 'direction_mismatch'::text
        END AS match_direction_check
   FROM ((((((erp.cheques c
     JOIN erp.journal_entries je ON (((je.id = c.settle_entry_id) AND (je.company_id = c.company_id) AND (je.status = 'posted'::erp.entry_status))))
     JOIN erp.journal_entry_lines jel ON (((jel.entry_id = je.id) AND (jel.company_id = je.company_id) AND (jel.account_id = c.bank_account_id) AND (jel.currency_id = c.currency_id))))
     JOIN erp.bank_reconciliations r ON (((r.company_id = c.company_id) AND (r.bank_account_id = c.bank_account_id) AND (r.currency_id = c.currency_id) AND (r.status = ANY (ARRAY['draft'::erp.bank_reconciliation_status, 'in_progress'::erp.bank_reconciliation_status])))))
     JOIN erp.bank_statement_lines l ON (((l.statement_id = r.statement_id) AND (l.company_id = r.company_id) AND (l.transaction_date >= je.entry_date))))
     LEFT JOIN ( SELECT bank_reconciliation_matches.statement_line_id,
            sum(bank_reconciliation_matches.matched_amount_fc) AS statement_allocated_fc
           FROM erp.bank_reconciliation_matches
          WHERE (bank_reconciliation_matches.reversed_at IS NULL)
          GROUP BY bank_reconciliation_matches.statement_line_id) stmt_alloc ON ((stmt_alloc.statement_line_id = l.id)))
     LEFT JOIN ( SELECT bank_reconciliation_matches.journal_entry_line_id,
            sum(bank_reconciliation_matches.matched_amount_fc) AS ledger_allocated_fc
           FROM erp.bank_reconciliation_matches
          WHERE (bank_reconciliation_matches.reversed_at IS NULL)
          GROUP BY bank_reconciliation_matches.journal_entry_line_id) ledger_alloc ON ((ledger_alloc.journal_entry_line_id = jel.id)))
  WHERE ((c.status = 'cleared'::erp.cheque_status) AND (c.settle_entry_id IS NOT NULL) AND (((c.direction = 'receipt'::erp.cheque_direction) AND (l.direction = 'debit'::erp.bank_line_direction) AND (jel.debit_fc > (0)::numeric)) OR ((c.direction = 'payment'::erp.cheque_direction) AND (l.direction = 'credit'::erp.bank_line_direction) AND (jel.credit_fc > (0)::numeric))) AND ((l.amount - COALESCE(stmt_alloc.statement_allocated_fc, (0)::numeric)) > (0)::numeric) AND ((
        CASE
            WHEN (l.direction = 'debit'::erp.bank_line_direction) THEN jel.debit_fc
            ELSE jel.credit_fc
        END - COALESCE(ledger_alloc.ledger_allocated_fc, (0)::numeric)) > (0)::numeric));


ALTER VIEW erp.v_bank_reconciliation_cheque_candidates OWNER TO postgres;

--
-- TOC entry 375 (class 1259 OID 57700)
-- Name: v_bank_reconciliation_cheque_settlements; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_bank_reconciliation_cheque_settlements AS
 SELECT c.id AS cheque_id,
    c.company_id,
    c.branch_id,
    c.direction,
    c.cheque_no,
    c.bank_name,
    c.status,
    c.bank_account_id,
    c.currency_id,
    c.amount_fc AS cheque_amount_fc,
    c.amount_local AS cheque_amount_local,
    c.settled_at,
    c.settle_entry_id,
    je.entry_no,
    je.entry_date,
    je.reference,
    jel.id AS journal_entry_line_id,
    jel.debit_fc,
    jel.credit_fc,
    jel.debit_local,
    jel.credit_local
   FROM ((erp.cheques c
     JOIN erp.journal_entries je ON (((je.id = c.settle_entry_id) AND (je.company_id = c.company_id) AND (je.status = 'posted'::erp.entry_status))))
     JOIN erp.journal_entry_lines jel ON (((jel.entry_id = je.id) AND (jel.company_id = je.company_id) AND (jel.account_id = c.bank_account_id) AND (jel.currency_id = c.currency_id))))
  WHERE ((c.status = 'cleared'::erp.cheque_status) AND (c.settle_entry_id IS NOT NULL));


ALTER VIEW erp.v_bank_reconciliation_cheque_settlements OWNER TO postgres;

--
-- TOC entry 374 (class 1259 OID 57695)
-- Name: v_bank_reconciliation_cheques_outstanding; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_bank_reconciliation_cheques_outstanding AS
 SELECT id AS cheque_id,
    company_id,
    branch_id,
    direction,
    cheque_no,
    bank_name,
    due_date,
    (CURRENT_DATE - due_date) AS days_past_due,
    status,
    bank_account_id,
    currency_id,
    amount_fc,
    amount_local,
    customer_id,
    supplier_id,
    voucher_id,
    settle_entry_id,
    deposited_at,
    settled_at,
    return_reason
   FROM erp.cheques c
  WHERE (status = ANY (ARRAY['in_hand'::erp.cheque_status, 'deposited'::erp.cheque_status]));


ALTER VIEW erp.v_bank_reconciliation_cheques_outstanding OWNER TO postgres;

--
-- TOC entry 371 (class 1259 OID 57670)
-- Name: v_bank_reconciliation_line_report; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_bank_reconciliation_line_report AS
 SELECT r.id AS reconciliation_id,
    r.company_id,
    r.statement_id,
    r.bank_account_id,
    r.currency_id,
    r.status AS reconciliation_status,
    l.id AS statement_line_id,
    l.line_no,
    l.transaction_date,
    l.value_date,
    l.direction,
    l.amount AS statement_amount_fc,
    l.balance_after AS bank_reported_balance_after_fc,
    l.bank_reference,
    l.description AS statement_description,
    (COALESCE(a.matched_fc, (0)::numeric))::numeric(20,4) AS matched_amount_fc,
    (COALESCE(a.matched_local, (0)::numeric))::numeric(20,4) AS matched_amount_local,
    ((l.amount - COALESCE(a.matched_fc, (0)::numeric)))::numeric(20,4) AS unmatched_amount_fc,
        CASE
            WHEN ((l.amount - COALESCE(a.matched_fc, (0)::numeric)) = (0)::numeric) THEN 'matched'::text
            WHEN (COALESCE(a.matched_fc, (0)::numeric) > (0)::numeric) THEN 'partially_matched'::text
            ELSE 'unmatched'::text
        END AS match_status,
    COALESCE(a.match_count, (0)::bigint) AS active_match_count
   FROM ((erp.bank_reconciliations r
     JOIN erp.bank_statement_lines l ON (((l.company_id = r.company_id) AND (l.statement_id = r.statement_id))))
     LEFT JOIN ( SELECT m.company_id,
            m.statement_line_id,
            sum(m.matched_amount_fc) AS matched_fc,
            sum(m.matched_amount_local) AS matched_local,
            count(*) AS match_count
           FROM erp.bank_reconciliation_matches m
          WHERE (m.reversed_at IS NULL)
          GROUP BY m.company_id, m.statement_line_id) a ON (((a.company_id = l.company_id) AND (a.statement_line_id = l.id))));


ALTER VIEW erp.v_bank_reconciliation_line_report OWNER TO postgres;

--
-- TOC entry 372 (class 1259 OID 57675)
-- Name: v_bank_reconciliation_match_report; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_bank_reconciliation_match_report AS
 SELECT m.id AS match_id,
    m.company_id,
    m.reconciliation_id,
    m.statement_line_id,
    sl.line_no,
    sl.transaction_date AS bank_transaction_date,
    sl.direction,
    sl.amount AS statement_amount_fc,
    sl.bank_reference,
    m.journal_entry_line_id,
    je.id AS journal_entry_id,
    je.entry_no,
    je.entry_date,
    je.reference AS journal_reference,
    jel.line_no AS journal_line_no,
    jel.account_id,
    jel.currency_id,
    jel.debit_fc,
    jel.credit_fc,
    m.matched_amount_fc,
    m.matched_amount_local,
    m.method,
    m.matched_at,
    m.matched_by,
    m.notes,
    m.reversed_at,
    m.reversal_reason,
        CASE
            WHEN (m.reversed_at IS NULL) THEN 'active'::text
            ELSE 'reversed'::text
        END AS match_record_status
   FROM (((erp.bank_reconciliation_matches m
     JOIN erp.bank_statement_lines sl ON (((sl.company_id = m.company_id) AND (sl.id = m.statement_line_id))))
     JOIN erp.journal_entry_lines jel ON ((jel.id = m.journal_entry_line_id)))
     JOIN erp.journal_entries je ON (((je.company_id = jel.company_id) AND (je.id = jel.entry_id))));


ALTER VIEW erp.v_bank_reconciliation_match_report OWNER TO postgres;

--
-- TOC entry 370 (class 1259 OID 57665)
-- Name: v_bank_reconciliation_summary; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_bank_reconciliation_summary AS
 WITH statement_totals AS (
         SELECT l.company_id,
            l.statement_id,
            count(*) AS line_count,
            (COALESCE(sum(l.amount) FILTER (WHERE (l.direction = 'debit'::erp.bank_line_direction)), (0)::numeric))::numeric(20,4) AS statement_debits_fc,
            (COALESCE(sum(l.amount) FILTER (WHERE (l.direction = 'credit'::erp.bank_line_direction)), (0)::numeric))::numeric(20,4) AS statement_credits_fc,
            (COALESCE(sum(
                CASE
                    WHEN (l.direction = 'debit'::erp.bank_line_direction) THEN l.amount
                    ELSE (- l.amount)
                END), (0)::numeric))::numeric(20,4) AS statement_net_movement_fc
           FROM erp.bank_statement_lines l
          GROUP BY l.company_id, l.statement_id
        ), match_totals AS (
         SELECT m.company_id,
            m.reconciliation_id,
            count(*) FILTER (WHERE (m.reversed_at IS NULL)) AS active_match_count,
            (COALESCE(sum(m.matched_amount_fc) FILTER (WHERE (m.reversed_at IS NULL)), (0)::numeric))::numeric(20,4) AS matched_fc,
            (COALESCE(sum(m.matched_amount_local) FILTER (WHERE (m.reversed_at IS NULL)), (0)::numeric))::numeric(20,4) AS matched_local,
            count(*) FILTER (WHERE (m.reversed_at IS NOT NULL)) AS reversed_match_count
           FROM erp.bank_reconciliation_matches m
          GROUP BY m.company_id, m.reconciliation_id
        ), ledger_balance AS (
         SELECT r_1.company_id,
            r_1.id AS reconciliation_id,
            (COALESCE(sum((jel.debit_fc - jel.credit_fc)), (0)::numeric))::numeric(20,4) AS ledger_balance_fc,
            (COALESCE(sum((jel.debit_local - jel.credit_local)), (0)::numeric))::numeric(20,4) AS ledger_balance_local,
            (COALESCE(sum(jel.debit_fc), (0)::numeric))::numeric(20,4) AS ledger_debits_fc,
            (COALESCE(sum(jel.credit_fc), (0)::numeric))::numeric(20,4) AS ledger_credits_fc
           FROM ((erp.bank_reconciliations r_1
             LEFT JOIN erp.journal_entry_lines jel ON (((jel.company_id = r_1.company_id) AND (jel.account_id = r_1.bank_account_id) AND (jel.currency_id = r_1.currency_id))))
             LEFT JOIN erp.journal_entries je ON (((je.company_id = jel.company_id) AND (je.id = jel.entry_id) AND (je.status = 'posted'::erp.entry_status) AND (je.entry_date <= r_1.reconciliation_date))))
          WHERE ((jel.id IS NULL) OR (je.id IS NOT NULL))
          GROUP BY r_1.company_id, r_1.id
        ), line_remaining AS (
         SELECT l.company_id,
            r_1.id AS reconciliation_id,
            (COALESCE(sum(l.amount), (0)::numeric))::numeric(20,4) AS statement_lines_total_fc,
            (COALESCE(sum((l.amount - COALESCE(a.allocated_fc, (0)::numeric))), (0)::numeric))::numeric(20,4) AS statement_unmatched_fc,
            (COALESCE(sum(COALESCE(a.allocated_fc, (0)::numeric)), (0)::numeric))::numeric(20,4) AS statement_matched_fc
           FROM ((erp.bank_reconciliations r_1
             JOIN erp.bank_statement_lines l ON (((l.company_id = r_1.company_id) AND (l.statement_id = r_1.statement_id))))
             LEFT JOIN ( SELECT bank_reconciliation_matches.statement_line_id,
                    sum(bank_reconciliation_matches.matched_amount_fc) AS allocated_fc
                   FROM erp.bank_reconciliation_matches
                  WHERE (bank_reconciliation_matches.reversed_at IS NULL)
                  GROUP BY bank_reconciliation_matches.statement_line_id) a ON ((a.statement_line_id = l.id)))
          GROUP BY l.company_id, r_1.id
        )
 SELECT r.id AS reconciliation_id,
    r.company_id,
    r.statement_id,
    r.bank_account_id,
    r.currency_id,
    r.reconciliation_date,
    r.status AS reconciliation_status,
    s.statement_no,
    s.statement_start,
    s.statement_end,
    s.status AS statement_status,
    s.opening_balance AS statement_opening_balance_fc,
    s.closing_balance AS statement_closing_balance_fc,
    COALESCE(st.line_count, (0)::bigint) AS statement_line_count,
    COALESCE(st.statement_debits_fc, (0)::numeric) AS statement_debits_fc,
    COALESCE(st.statement_credits_fc, (0)::numeric) AS statement_credits_fc,
    COALESCE(st.statement_net_movement_fc, (0)::numeric) AS statement_net_movement_fc,
        CASE
            WHEN (s.opening_balance IS NOT NULL) THEN (s.opening_balance + COALESCE(st.statement_net_movement_fc, (0)::numeric))
            ELSE NULL::numeric
        END AS calculated_statement_closing_fc,
        CASE
            WHEN ((s.closing_balance IS NOT NULL) AND (s.opening_balance IS NOT NULL)) THEN (s.closing_balance - (s.opening_balance + COALESCE(st.statement_net_movement_fc, (0)::numeric)))
            ELSE NULL::numeric
        END AS statement_balance_check_difference_fc,
    COALESCE(lb.ledger_balance_fc, (0)::numeric) AS calculated_ledger_balance_fc,
    COALESCE(lb.ledger_balance_local, (0)::numeric) AS calculated_ledger_balance_local,
    COALESCE(lb.ledger_debits_fc, (0)::numeric) AS ledger_debits_fc_to_date,
    COALESCE(lb.ledger_credits_fc, (0)::numeric) AS ledger_credits_fc_to_date,
    COALESCE(mt.active_match_count, (0)::bigint) AS active_match_count,
    COALESCE(mt.reversed_match_count, (0)::bigint) AS reversed_match_count,
    COALESCE(mt.matched_fc, (0)::numeric) AS active_matched_fc,
    COALESCE(mt.matched_local, (0)::numeric) AS active_matched_local,
    COALESCE(lr.statement_lines_total_fc, (0)::numeric) AS statement_lines_total_fc,
    COALESCE(lr.statement_matched_fc, (0)::numeric) AS statement_lines_matched_fc,
    COALESCE(lr.statement_unmatched_fc, (0)::numeric) AS statement_lines_unmatched_fc,
        CASE
            WHEN (s.closing_balance IS NOT NULL) THEN (s.closing_balance - COALESCE(lb.ledger_balance_fc, (0)::numeric))
            ELSE NULL::numeric
        END AS closing_statement_vs_ledger_difference_fc,
    r.statement_balance AS saved_statement_balance_fc,
    r.ledger_balance AS saved_ledger_balance_fc,
    r.difference AS saved_difference_fc,
    r.notes
   FROM (((((erp.bank_reconciliations r
     JOIN erp.bank_statements s ON (((s.company_id = r.company_id) AND (s.id = r.statement_id))))
     LEFT JOIN statement_totals st ON (((st.company_id = r.company_id) AND (st.statement_id = r.statement_id))))
     LEFT JOIN match_totals mt ON (((mt.company_id = r.company_id) AND (mt.reconciliation_id = r.id))))
     LEFT JOIN ledger_balance lb ON (((lb.company_id = r.company_id) AND (lb.reconciliation_id = r.id))))
     LEFT JOIN line_remaining lr ON (((lr.company_id = r.company_id) AND (lr.reconciliation_id = r.id))));


ALTER VIEW erp.v_bank_reconciliation_summary OWNER TO postgres;

--
-- TOC entry 360 (class 1259 OID 57464)
-- Name: v_cheques_open; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_cheques_open AS
 SELECT c.id,
    c.company_id,
    c.branch_id,
    c.direction,
    c.cheque_no,
    c.bank_name,
    c.due_date,
    (c.due_date - CURRENT_DATE) AS days_to_due,
    c.status,
    COALESCE(cu.name_ar, su.name_ar) AS party_name,
    c.currency_id,
    c.amount_fc,
    c.amount_local
   FROM ((erp.cheques c
     LEFT JOIN erp.customers cu ON ((cu.id = c.customer_id)))
     LEFT JOIN erp.suppliers su ON ((su.id = c.supplier_id)))
  WHERE (c.status = ANY (ARRAY['in_hand'::erp.cheque_status, 'deposited'::erp.cheque_status]));


ALTER VIEW erp.v_cheques_open OWNER TO postgres;

--
-- TOC entry 337 (class 1259 OID 45203)
-- Name: voucher_allocations; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.voucher_allocations (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    voucher_id bigint NOT NULL,
    voucher_detail_id bigint NOT NULL,
    customer_ledger_id bigint,
    supplier_ledger_id bigint,
    amount_fc numeric(20,4) NOT NULL,
    settled_local numeric(20,4),
    reversed boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT ck_va_one_ledger CHECK (((customer_ledger_id IS NULL) <> (supplier_ledger_id IS NULL))),
    CONSTRAINT voucher_allocations_amount_fc_check CHECK ((amount_fc > (0)::numeric))
);


ALTER TABLE erp.voucher_allocations OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 45243)
-- Name: v_party_open_items; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_party_open_items AS
 SELECT 'customer'::text AS party_type,
    l.company_id,
    l.customer_id AS party_id,
    l.id AS ledger_id,
    l.entry_date,
    l.due_date,
    l.doc_type,
    l.doc_id,
    l.currency_id,
    l.exchange_rate,
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN 'D'::text
            ELSE 'C'::text
        END AS side,
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN l.debit_fc
            ELSE l.credit_fc
        END AS orig_fc,
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN l.debit_local
            ELSE l.credit_local
        END AS orig_local,
    (
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN l.debit_fc
            ELSE l.credit_fc
        END - x.afc) AS open_fc,
    (
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN l.debit_local
            ELSE l.credit_local
        END - x.alocal) AS open_local
   FROM (erp.customer_ledger l
     CROSS JOIN LATERAL ( SELECT COALESCE(sum(a.amount_fc), (0)::numeric) AS afc,
            COALESCE(sum(a.settled_local), (0)::numeric) AS alocal
           FROM erp.voucher_allocations a
          WHERE ((a.settled_local IS NOT NULL) AND (NOT a.reversed) AND ((a.customer_ledger_id = l.id) OR ((l.voucher_detail_id IS NOT NULL) AND (a.voucher_detail_id = l.voucher_detail_id))))) x)
  WHERE (NOT (((l.doc_type)::text = ANY ((ARRAY['voucher'::character varying, 'voucher_reversal'::character varying])::text[])) AND (EXISTS ( SELECT 1
           FROM erp.financial_vouchers fv
          WHERE ((fv.id = l.doc_id) AND (fv.status = 'cancelled'::erp.voucher_status))))))
UNION ALL
 SELECT 'supplier'::text AS party_type,
    l.company_id,
    l.supplier_id AS party_id,
    l.id AS ledger_id,
    l.entry_date,
    l.due_date,
    l.doc_type,
    l.doc_id,
    l.currency_id,
    l.exchange_rate,
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN 'D'::text
            ELSE 'C'::text
        END AS side,
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN l.debit_fc
            ELSE l.credit_fc
        END AS orig_fc,
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN l.debit_local
            ELSE l.credit_local
        END AS orig_local,
    (
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN l.debit_fc
            ELSE l.credit_fc
        END - x.afc) AS open_fc,
    (
        CASE
            WHEN (l.debit_fc > (0)::numeric) THEN l.debit_local
            ELSE l.credit_local
        END - x.alocal) AS open_local
   FROM (erp.supplier_ledger l
     CROSS JOIN LATERAL ( SELECT COALESCE(sum(a.amount_fc), (0)::numeric) AS afc,
            COALESCE(sum(a.settled_local), (0)::numeric) AS alocal
           FROM erp.voucher_allocations a
          WHERE ((a.settled_local IS NOT NULL) AND (NOT a.reversed) AND ((a.supplier_ledger_id = l.id) OR ((l.voucher_detail_id IS NOT NULL) AND (a.voucher_detail_id = l.voucher_detail_id))))) x)
  WHERE (NOT (((l.doc_type)::text = ANY ((ARRAY['voucher'::character varying, 'voucher_reversal'::character varying])::text[])) AND (EXISTS ( SELECT 1
           FROM erp.financial_vouchers fv
          WHERE ((fv.id = l.doc_id) AND (fv.status = 'cancelled'::erp.voucher_status))))));


ALTER VIEW erp.v_party_open_items OWNER TO postgres;

--
-- TOC entry 339 (class 1259 OID 45249)
-- Name: v_customer_aging; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_customer_aging AS
 SELECT i.company_id,
    i.party_id AS customer_id,
    c.code,
    c.name_ar,
    sum(i.signed_local) AS total_open_local,
    sum(i.signed_local) FILTER (WHERE (i.days_overdue <= 0)) AS current_local,
    sum(i.signed_local) FILTER (WHERE ((i.days_overdue >= 1) AND (i.days_overdue <= 30))) AS d1_30_local,
    sum(i.signed_local) FILTER (WHERE ((i.days_overdue >= 31) AND (i.days_overdue <= 60))) AS d31_60_local,
    sum(i.signed_local) FILTER (WHERE ((i.days_overdue >= 61) AND (i.days_overdue <= 90))) AS d61_90_local,
    sum(i.signed_local) FILTER (WHERE (i.days_overdue > 90)) AS over_90_local
   FROM (( SELECT v_party_open_items.party_type,
            v_party_open_items.company_id,
            v_party_open_items.party_id,
            v_party_open_items.ledger_id,
            v_party_open_items.entry_date,
            v_party_open_items.due_date,
            v_party_open_items.doc_type,
            v_party_open_items.doc_id,
            v_party_open_items.currency_id,
            v_party_open_items.exchange_rate,
            v_party_open_items.side,
            v_party_open_items.orig_fc,
            v_party_open_items.orig_local,
            v_party_open_items.open_fc,
            v_party_open_items.open_local,
                CASE
                    WHEN (v_party_open_items.side = 'D'::text) THEN v_party_open_items.open_local
                    ELSE (- v_party_open_items.open_local)
                END AS signed_local,
            (CURRENT_DATE - COALESCE(v_party_open_items.due_date, v_party_open_items.entry_date)) AS days_overdue
           FROM erp.v_party_open_items
          WHERE ((v_party_open_items.party_type = 'customer'::text) AND (v_party_open_items.open_fc > (0)::numeric))) i
     JOIN erp.customers c ON ((c.id = i.party_id)))
  GROUP BY i.company_id, i.party_id, c.code, c.name_ar;


ALTER VIEW erp.v_customer_aging OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 44977)
-- Name: v_customer_balances; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_customer_balances AS
 SELECT c.company_id,
    c.id AS customer_id,
    c.code,
    c.name_ar,
    c.credit_limit,
    COALESCE(sum((l.debit_local - l.credit_local)), (0)::numeric) AS balance_local,
        CASE
            WHEN (c.credit_limit IS NULL) THEN NULL::numeric
            ELSE (c.credit_limit - COALESCE(sum((l.debit_local - l.credit_local)), (0)::numeric))
        END AS available_credit
   FROM (erp.customers c
     LEFT JOIN erp.customer_ledger l ON ((l.customer_id = c.id)))
  GROUP BY c.company_id, c.id, c.code, c.name_ar, c.credit_limit;


ALTER VIEW erp.v_customer_balances OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 43306)
-- Name: warehouses; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.warehouses (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    branch_id bigint NOT NULL,
    code character varying(20) NOT NULL,
    name_ar character varying(150) NOT NULL,
    name_en character varying(150),
    account_id bigint NOT NULL,
    allow_negative_stock boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE erp.warehouses OWNER TO postgres;

--
-- TOC entry 273 (class 1259 OID 43593)
-- Name: v_expiring_batches; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_expiring_batches AS
 SELECT bb.company_id,
    w.code AS warehouse_code,
    i.code AS item_code,
    i.name_ar AS item_name,
    b.batch_no,
    b.expiry_date,
    (b.expiry_date - CURRENT_DATE) AS days_to_expiry,
    bb.qty_on_hand
   FROM (((erp.stock_batch_balances bb
     JOIN erp.item_batches b ON ((b.id = bb.batch_id)))
     JOIN erp.items i ON ((i.id = bb.item_id)))
     JOIN erp.warehouses w ON ((w.id = bb.warehouse_id)))
  WHERE ((bb.qty_on_hand > (0)::numeric) AND (b.expiry_date IS NOT NULL));


ALTER VIEW erp.v_expiring_batches OWNER TO postgres;

--
-- TOC entry 391 (class 1259 OID 62467)
-- Name: v_fixed_asset_depreciation; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_fixed_asset_depreciation AS
 SELECT r.company_id,
    r.id AS run_id,
    r.run_no,
    r.period_end,
    r.status AS run_status,
    a.id AS asset_id,
    a.asset_no,
    a.name_ar AS asset_name,
    dl.months,
    dl.amount,
    dl.accumulated_after,
    dl.book_after
   FROM ((erp.depreciation_lines dl
     JOIN erp.depreciation_runs r ON ((r.id = dl.run_id)))
     JOIN erp.fixed_assets a ON ((a.id = dl.asset_id)));


ALTER VIEW erp.v_fixed_asset_depreciation OWNER TO postgres;

--
-- TOC entry 390 (class 1259 OID 62462)
-- Name: v_fixed_assets; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_fixed_assets AS
 SELECT a.company_id,
    a.id AS asset_id,
    a.asset_no,
    a.name_ar AS asset_name,
    c.code AS category_code,
    c.name_ar AS category_name,
    b.code AS branch_code,
    a.status,
    a.acquisition_date,
    a.in_service_date,
    a.cost,
    a.salvage_value,
    a.accumulated_depreciation,
    a.book_value,
    a.method,
    a.life_months,
    a.declining_rate_pct,
    a.dep_months_done,
    a.last_depreciation_date,
    a.disposal_date,
    a.disposal_proceeds,
    a.disposal_gain_loss
   FROM ((erp.fixed_assets a
     JOIN erp.fixed_asset_categories c ON ((c.id = a.category_id)))
     JOIN erp.branches b ON ((b.id = a.branch_id)));


ALTER VIEW erp.v_fixed_assets OWNER TO postgres;

--
-- TOC entry 357 (class 1259 OID 45688)
-- Name: v_my_permissions; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_my_permissions AS
 SELECT ur.company_id,
    rp.permission_code,
    p.name_ar,
    p.enforced
   FROM ((erp.user_roles ur
     JOIN erp.role_permissions rp ON ((rp.role_id = ur.role_id)))
     JOIN erp.permissions p ON (((p.code)::text = (rp.permission_code)::text)))
  WHERE (ur.user_id = erp.current_user_id())
UNION
 SELECT c.id AS company_id,
    p.code AS permission_code,
    p.name_ar,
    p.enforced
   FROM (erp.companies c
     CROSS JOIN erp.permissions p)
  WHERE (EXISTS ( SELECT 1
           FROM erp.app_users u
          WHERE ((u.id = erp.current_user_id()) AND u.is_superadmin AND u.is_active)));


ALTER VIEW erp.v_my_permissions OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 44992)
-- Name: v_pos_session_summary; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_pos_session_summary AS
 SELECT s.company_id,
    s.id AS session_id,
    s.session_no,
    r.code AS register_code,
    s.cashier_id,
    s.status,
    s.opened_at,
    s.closed_at,
    s.opening_cash,
    ( SELECT COALESCE(sum(d.total_local), (0)::numeric) AS "coalesce"
           FROM erp.sales_documents d
          WHERE ((d.pos_session_id = s.id) AND (d.status = 'posted'::erp.sales_doc_status) AND (d.doc_type = 'invoice'::erp.sales_doc_type))) AS sales_local,
    ( SELECT COALESCE(sum(d.total_local), (0)::numeric) AS "coalesce"
           FROM erp.sales_documents d
          WHERE ((d.pos_session_id = s.id) AND (d.status = 'posted'::erp.sales_doc_status) AND (d.doc_type = 'return'::erp.sales_doc_type))) AS returns_local,
    ( SELECT COALESCE(sum(
                CASE d.doc_type
                    WHEN 'invoice'::erp.sales_doc_type THEN p.amount_local
                    ELSE (- p.amount_local)
                END), (0)::numeric) AS "coalesce"
           FROM ((erp.sales_document_payments p
             JOIN erp.sales_documents d ON ((d.id = p.document_id)))
             JOIN erp.payment_methods m ON ((m.id = p.payment_method_id)))
          WHERE ((d.pos_session_id = s.id) AND (d.status = 'posted'::erp.sales_doc_status) AND (m.kind = 'cash'::erp.payment_method_kind))) AS net_cash_local,
    ( SELECT COALESCE(sum(
                CASE d.doc_type
                    WHEN 'invoice'::erp.sales_doc_type THEN p.amount_local
                    ELSE (- p.amount_local)
                END), (0)::numeric) AS "coalesce"
           FROM ((erp.sales_document_payments p
             JOIN erp.sales_documents d ON ((d.id = p.document_id)))
             JOIN erp.payment_methods m ON ((m.id = p.payment_method_id)))
          WHERE ((d.pos_session_id = s.id) AND (d.status = 'posted'::erp.sales_doc_status) AND (m.kind = 'card'::erp.payment_method_kind))) AS net_card_local,
        CASE
            WHEN (s.status = 'open'::erp.pos_session_status) THEN erp.fn_pos_expected_cash(s.id)
            ELSE s.expected_cash
        END AS expected_cash,
    s.counted_cash,
    s.difference
   FROM (erp.pos_sessions s
     JOIN erp.pos_registers r ON ((r.id = s.register_id)));


ALTER VIEW erp.v_pos_session_summary OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 44987)
-- Name: v_price_list_items; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_price_list_items AS
 SELECT pl.company_id,
    pl.code AS price_list,
    pl.kind,
    pl.currency_id,
    i.code AS item_code,
    i.name_ar AS item_name,
    u.code AS unit_code,
    iu.factor_to_base,
    pli.min_qty,
    pli.price
   FROM ((((erp.price_list_items pli
     JOIN erp.price_lists pl ON ((pl.id = pli.price_list_id)))
     JOIN erp.items i ON ((i.id = pli.item_id)))
     JOIN erp.item_units iu ON ((iu.id = pli.item_unit_id)))
     JOIN erp.units u ON ((u.id = iu.unit_id)));


ALTER VIEW erp.v_price_list_items OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 44211)
-- Name: v_purchase_order_lines; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_purchase_order_lines AS
 SELECT d.company_id,
    d.id AS order_id,
    d.doc_no,
    d.doc_date,
    d.status,
    s.code AS supplier_code,
    s.name_ar AS supplier_name,
    l.id AS line_id,
    l.line_no,
    i.code AS item_code,
    i.name_ar AS item_name,
    l.qty_base AS ordered_qty_base,
    l.settled_qty_base AS received_qty_base,
    l.remaining_qty_base
   FROM (((erp.purchase_documents d
     JOIN erp.purchase_document_lines l ON ((l.document_id = d.id)))
     JOIN erp.suppliers s ON ((s.id = d.supplier_id)))
     JOIN erp.items i ON ((i.id = l.item_id)))
  WHERE (d.doc_type = 'order'::erp.purchase_doc_type);


ALTER VIEW erp.v_purchase_order_lines OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 44982)
-- Name: v_sales_order_lines; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_sales_order_lines AS
 SELECT d.company_id,
    d.id AS order_id,
    d.doc_no,
    d.doc_date,
    d.status,
    cu.code AS customer_code,
    cu.name_ar AS customer_name,
    l.id AS line_id,
    l.line_no,
    i.code AS item_code,
    i.name_ar AS item_name,
    l.qty_base AS ordered_qty_base,
    l.settled_qty_base AS delivered_qty_base,
    l.remaining_qty_base
   FROM (((erp.sales_documents d
     JOIN erp.sales_document_lines l ON ((l.document_id = d.id)))
     JOIN erp.customers cu ON ((cu.id = d.customer_id)))
     JOIN erp.items i ON ((i.id = l.item_id)))
  WHERE (d.doc_type = 'order'::erp.sales_doc_type);


ALTER VIEW erp.v_sales_order_lines OWNER TO postgres;

--
-- TOC entry 380 (class 1259 OID 62136)
-- Name: v_stock_count_variance; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_stock_count_variance AS
 SELECT sc.company_id,
    sc.id AS count_id,
    sc.count_no,
    sc.count_date,
    sc.status,
    sc.count_type,
    w.code AS warehouse_code,
    w.name_ar AS warehouse_name,
    i.code AS item_code,
    i.name_ar AS item_name,
    u.code AS base_unit,
    COALESCE(b.batch_no, scl.batch_no) AS batch_no,
    COALESCE(b.expiry_date, scl.expiry_date) AS expiry_date,
    scl.system_qty,
    scl.counted_qty,
    scl.diff_qty,
    scl.unit_cost,
    COALESCE(scl.diff_value, round((scl.diff_qty * scl.unit_cost), 4)) AS diff_value,
    scl.reason
   FROM (((((erp.stock_count_lines scl
     JOIN erp.stock_counts sc ON ((sc.id = scl.count_id)))
     JOIN erp.warehouses w ON ((w.id = sc.warehouse_id)))
     JOIN erp.items i ON ((i.id = scl.item_id)))
     JOIN erp.units u ON ((u.id = i.base_unit_id)))
     LEFT JOIN erp.item_batches b ON ((b.id = scl.batch_id)));


ALTER VIEW erp.v_stock_count_variance OWNER TO postgres;

--
-- TOC entry 381 (class 1259 OID 62141)
-- Name: v_stock_counts; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_stock_counts AS
SELECT
    NULL::bigint AS company_id,
    NULL::bigint AS count_id,
    NULL::bigint AS count_no,
    NULL::date AS count_date,
    NULL::erp.stock_count_type AS count_type,
    NULL::erp.stock_count_status AS status,
    NULL::character varying(20) AS warehouse_code,
    NULL::character varying(150) AS warehouse_name,
    NULL::bigint AS lines_total,
    NULL::bigint AS lines_counted,
    NULL::bigint AS lines_surplus,
    NULL::bigint AS lines_shortage,
    NULL::numeric AS surplus_value,
    NULL::numeric AS shortage_value,
    NULL::bigint AS receipt_doc_id,
    NULL::bigint AS issue_doc_id,
    NULL::text AS reason;


ALTER VIEW erp.v_stock_counts OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 43588)
-- Name: v_stock_on_hand; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_stock_on_hand AS
 SELECT sb.company_id,
    w.code AS warehouse_code,
    w.name_ar AS warehouse_name,
    i.code AS item_code,
    i.name_ar AS item_name,
    u.code AS base_unit,
    sb.qty_on_hand,
    sb.avg_cost,
    sb.total_value
   FROM (((erp.stock_balances sb
     JOIN erp.warehouses w ON ((w.id = sb.warehouse_id)))
     JOIN erp.items i ON ((i.id = sb.item_id)))
     JOIN erp.units u ON ((u.id = i.base_unit_id)));


ALTER VIEW erp.v_stock_on_hand OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 45254)
-- Name: v_supplier_aging; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_supplier_aging AS
 SELECT i.company_id,
    i.party_id AS supplier_id,
    s.code,
    s.name_ar,
    sum(i.signed_local) AS total_open_local,
    sum(i.signed_local) FILTER (WHERE (i.days_overdue <= 0)) AS current_local,
    sum(i.signed_local) FILTER (WHERE ((i.days_overdue >= 1) AND (i.days_overdue <= 30))) AS d1_30_local,
    sum(i.signed_local) FILTER (WHERE ((i.days_overdue >= 31) AND (i.days_overdue <= 60))) AS d31_60_local,
    sum(i.signed_local) FILTER (WHERE ((i.days_overdue >= 61) AND (i.days_overdue <= 90))) AS d61_90_local,
    sum(i.signed_local) FILTER (WHERE (i.days_overdue > 90)) AS over_90_local
   FROM (( SELECT v_party_open_items.party_type,
            v_party_open_items.company_id,
            v_party_open_items.party_id,
            v_party_open_items.ledger_id,
            v_party_open_items.entry_date,
            v_party_open_items.due_date,
            v_party_open_items.doc_type,
            v_party_open_items.doc_id,
            v_party_open_items.currency_id,
            v_party_open_items.exchange_rate,
            v_party_open_items.side,
            v_party_open_items.orig_fc,
            v_party_open_items.orig_local,
            v_party_open_items.open_fc,
            v_party_open_items.open_local,
                CASE
                    WHEN (v_party_open_items.side = 'C'::text) THEN v_party_open_items.open_local
                    ELSE (- v_party_open_items.open_local)
                END AS signed_local,
            (CURRENT_DATE - COALESCE(v_party_open_items.due_date, v_party_open_items.entry_date)) AS days_overdue
           FROM erp.v_party_open_items
          WHERE ((v_party_open_items.party_type = 'supplier'::text) AND (v_party_open_items.open_fc > (0)::numeric))) i
     JOIN erp.suppliers s ON ((s.id = i.party_id)))
  GROUP BY i.company_id, i.party_id, s.code, s.name_ar;


ALTER VIEW erp.v_supplier_aging OWNER TO postgres;

--
-- TOC entry 295 (class 1259 OID 44206)
-- Name: v_supplier_balances; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_supplier_balances AS
 SELECT s.company_id,
    s.id AS supplier_id,
    s.code,
    s.name_ar,
    s.credit_limit,
    COALESCE(sum((l.credit_local - l.debit_local)), (0)::numeric) AS balance_local,
        CASE
            WHEN (s.credit_limit IS NULL) THEN NULL::numeric
            ELSE (s.credit_limit - COALESCE(sum((l.credit_local - l.debit_local)), (0)::numeric))
        END AS available_credit
   FROM (erp.suppliers s
     LEFT JOIN erp.supplier_ledger l ON ((l.supplier_id = s.id)))
  GROUP BY s.company_id, s.id, s.code, s.name_ar, s.credit_limit;


ALTER VIEW erp.v_supplier_balances OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 43104)
-- Name: v_trial_balance; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_trial_balance AS
 SELECT e.company_id,
    a.id AS account_id,
    a.code AS account_code,
    a.name_ar,
    sum(l.debit_local) AS debit_local,
    sum(l.credit_local) AS credit_local,
    sum((l.debit_local - l.credit_local)) AS balance_local
   FROM ((erp.journal_entry_lines l
     JOIN erp.journal_entries e ON (((e.id = l.entry_id) AND (e.status <> 'draft'::erp.entry_status))))
     JOIN erp.accounts a ON ((a.id = l.account_id)))
  GROUP BY e.company_id, a.id, a.code, a.name_ar;


ALTER VIEW erp.v_trial_balance OWNER TO postgres;

--
-- TOC entry 356 (class 1259 OID 45683)
-- Name: v_user_access; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_user_access AS
 SELECT u.id AS user_id,
    u.username,
    u.full_name,
    u.is_active,
    u.is_superadmin,
    ur.company_id,
    r.code AS role_code,
    r.name_ar AS role_name
   FROM ((erp.app_users u
     LEFT JOIN erp.user_roles ur ON ((ur.user_id = u.id)))
     LEFT JOIN erp.roles r ON ((r.id = ur.role_id)));


ALTER VIEW erp.v_user_access OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 45018)
-- Name: voucher_types; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.voucher_types (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    code character varying(10) NOT NULL,
    kind erp.voucher_kind NOT NULL,
    name_ar character varying(100) NOT NULL,
    name_en character varying(100),
    prefix character varying(10),
    number_padding smallint DEFAULT 6 NOT NULL,
    default_treasury_account_id bigint,
    is_active boolean DEFAULT true NOT NULL,
    CONSTRAINT ck_vtype_treasury CHECK (((kind <> 'journal'::erp.voucher_kind) OR (default_treasury_account_id IS NULL))),
    CONSTRAINT voucher_types_number_padding_check CHECK (((number_padding >= 1) AND (number_padding <= 12)))
);


ALTER TABLE erp.voucher_types OWNER TO postgres;

--
-- TOC entry 341 (class 1259 OID 45271)
-- Name: v_voucher_register; Type: VIEW; Schema: erp; Owner: postgres
--

CREATE VIEW erp.v_voucher_register AS
 SELECT v.company_id,
    v.id AS voucher_id,
    v.voucher_ref,
    t.name_ar AS voucher_type,
    v.kind,
    v.voucher_date,
    v.status,
    v.currency_id,
    v.exchange_rate,
    v.total_fc,
    v.fx_difference_local,
    v.treasury_account_id,
    v.counterparty_name,
    v.reference,
    v.journal_entry_id
   FROM (erp.financial_vouchers v
     JOIN erp.voucher_types t ON ((t.id = v.voucher_type_id)));


ALTER VIEW erp.v_voucher_register OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 45202)
-- Name: voucher_allocations_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.voucher_allocations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.voucher_allocations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 335 (class 1259 OID 45136)
-- Name: voucher_details; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.voucher_details (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    voucher_id bigint NOT NULL,
    line_no integer NOT NULL,
    account_id bigint NOT NULL,
    cost_center_id bigint,
    customer_id bigint,
    supplier_id bigint,
    debit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    credit_fc numeric(20,4) DEFAULT 0 NOT NULL,
    debit_local numeric(20,4) DEFAULT 0 NOT NULL,
    credit_local numeric(20,4) DEFAULT 0 NOT NULL,
    reference character varying(60),
    description text,
    CONSTRAINT ck_vd_non_negative CHECK (((debit_fc >= (0)::numeric) AND (credit_fc >= (0)::numeric) AND (debit_local >= (0)::numeric) AND (credit_local >= (0)::numeric))),
    CONSTRAINT ck_vd_one_party CHECK (((customer_id IS NULL) OR (supplier_id IS NULL))),
    CONSTRAINT ck_vd_one_side CHECK ((((debit_fc > (0)::numeric) AND (credit_fc = (0)::numeric)) OR ((credit_fc > (0)::numeric) AND (debit_fc = (0)::numeric))))
);


ALTER TABLE erp.voucher_details OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 45135)
-- Name: voucher_details_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.voucher_details ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.voucher_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 330 (class 1259 OID 45017)
-- Name: voucher_types_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.voucher_types ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.voucher_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 261 (class 1259 OID 43305)
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

ALTER TABLE erp.warehouses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME erp.warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 7298 (class 0 OID 42875)
-- Dependencies: 240
-- Data for Name: account_currencies; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.account_currencies (account_id, company_id, currency_id) FROM stdin;
\.


--
-- TOC entry 7297 (class 0 OID 42825)
-- Dependencies: 239
-- Data for Name: accounts; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.accounts (id, company_id, parent_id, code, name_ar, name_en, level, path, is_group, category, nature, subtype, allow_all_currencies, default_currency_id, require_cost_center, is_active, created_at, updated_at) FROM stdin;
44	4	\N	1	الأصول	\N	1	/44/	t	asset	debit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
45	4	\N	2	الخصوم	\N	1	/45/	t	liability	credit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
46	4	\N	3	حقوق الملكية	\N	1	/46/	t	equity	credit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
47	4	\N	4	الإيرادات	\N	1	/47/	t	revenue	credit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
48	4	\N	5	المصروفات	\N	1	/48/	t	expense	debit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
49	4	44	1101	الصندوق	\N	2	/44/49/	f	asset	debit	cash	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
50	4	44	1201	مخزون المخزن الرئيسي	\N	2	/44/50/	f	asset	debit	inventory	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
51	4	46	3101	رأس المال	\N	2	/46/51/	f	equity	credit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
52	4	46	3201	الأرباح المحتجزة	\N	2	/46/52/	f	equity	credit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
53	4	47	4101	إيرادات المبيعات	\N	2	/47/53/	f	revenue	credit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
54	4	47	4201	أرباح فروقات الجرد	\N	2	/47/54/	f	revenue	credit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
55	4	48	5101	تكلفة البضاعة المباعة	\N	2	/48/55/	f	expense	debit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
56	4	48	5201	خسائر فروقات الجرد	\N	2	/48/56/	f	expense	debit	general	t	\N	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
\.


--
-- TOC entry 7285 (class 0 OID 42657)
-- Dependencies: 227
-- Data for Name: activities; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.activities (id, company_id, code, name_ar, name_en, is_active) FROM stdin;
\.


--
-- TOC entry 7388 (class 0 OID 45326)
-- Dependencies: 343
-- Data for Name: app_users; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.app_users (id, username, full_name, email, phone, password_hash, is_active, is_superadmin, default_company_id, must_change_password, failed_attempts, locked_until, last_login_at, password_changed_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7400 (class 0 OID 45490)
-- Dependencies: 355
-- Data for Name: audit_log; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.audit_log (id, company_id, user_id, table_name, record_id, action, old_data, new_data, txid, changed_at) FROM stdin;
165	\N	\N	currencies	6	INSERT	\N	{"id": 6, "code": "USD", "symbol": null, "name_ar": "دولار أمريكي", "name_en": null, "is_active": true, "decimal_places": 2}	3375	2026-11-20 00:28:51.702619+03
166	4	\N	company_currencies	4	INSERT	\N	{"max_rate": 1.00000000, "min_rate": 1.00000000, "is_active": true, "company_id": 4, "currency_id": 6, "default_rate": 1.00000000}	3375	2026-11-20 00:28:51.702619+03
167	4	\N	companies	4	INSERT	\N	{"id": 4, "code": "DEMO", "tax_no": null, "name_ar": "شركة تجريبية", "name_en": null, "is_active": true, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "base_currency_id": 6}	3375	2026-11-20 00:28:51.702619+03
168	4	\N	branches	5	INSERT	\N	{"id": 5, "code": "MAIN", "is_main": true, "name_ar": "الفرع الرئيسي", "name_en": null, "is_active": true, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "activity_id": null}	3375	2026-11-20 00:28:51.702619+03
169	4	\N	fiscal_years	5	INSERT	\N	{"id": 5, "name": "2026", "end_date": "2026-12-31", "closed_at": null, "closed_by": null, "is_closed": false, "company_id": 4, "start_date": "2026-01-01", "reopened_at": null, "reopened_by": null, "reopen_reason": null}	3375	2026-11-20 00:28:51.702619+03
170	4	\N	fiscal_periods	5	INSERT	\N	{"id": 5, "status": "open", "end_date": "2026-01-31", "period_no": 1, "company_id": 4, "start_date": "2026-01-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
171	4	\N	fiscal_periods	6	INSERT	\N	{"id": 6, "status": "open", "end_date": "2026-02-28", "period_no": 2, "company_id": 4, "start_date": "2026-02-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
172	4	\N	fiscal_periods	7	INSERT	\N	{"id": 7, "status": "open", "end_date": "2026-03-31", "period_no": 3, "company_id": 4, "start_date": "2026-03-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
173	4	\N	fiscal_periods	8	INSERT	\N	{"id": 8, "status": "open", "end_date": "2026-04-30", "period_no": 4, "company_id": 4, "start_date": "2026-04-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
174	4	\N	fiscal_periods	9	INSERT	\N	{"id": 9, "status": "open", "end_date": "2026-05-31", "period_no": 5, "company_id": 4, "start_date": "2026-05-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
175	4	\N	fiscal_periods	10	INSERT	\N	{"id": 10, "status": "open", "end_date": "2026-06-30", "period_no": 6, "company_id": 4, "start_date": "2026-06-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
176	4	\N	fiscal_periods	11	INSERT	\N	{"id": 11, "status": "open", "end_date": "2026-07-31", "period_no": 7, "company_id": 4, "start_date": "2026-07-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
177	4	\N	fiscal_periods	12	INSERT	\N	{"id": 12, "status": "open", "end_date": "2026-08-31", "period_no": 8, "company_id": 4, "start_date": "2026-08-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
178	4	\N	fiscal_periods	13	INSERT	\N	{"id": 13, "status": "open", "end_date": "2026-09-30", "period_no": 9, "company_id": 4, "start_date": "2026-09-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
179	4	\N	fiscal_periods	14	INSERT	\N	{"id": 14, "status": "open", "end_date": "2026-10-31", "period_no": 10, "company_id": 4, "start_date": "2026-10-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
180	4	\N	fiscal_periods	15	INSERT	\N	{"id": 15, "status": "open", "end_date": "2026-11-30", "period_no": 11, "company_id": 4, "start_date": "2026-11-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
181	4	\N	fiscal_periods	16	INSERT	\N	{"id": 16, "status": "open", "end_date": "2026-12-31", "period_no": 12, "company_id": 4, "start_date": "2026-12-01", "fiscal_year_id": 5}	3375	2026-11-20 00:28:51.702619+03
182	4	\N	accounts	44	INSERT	\N	{"id": 44, "code": "1", "path": "/44/", "level": 1, "nature": "debit", "name_ar": "الأصول", "name_en": null, "subtype": "general", "category": "asset", "is_group": true, "is_active": true, "parent_id": null, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
183	4	\N	accounts	45	INSERT	\N	{"id": 45, "code": "2", "path": "/45/", "level": 1, "nature": "credit", "name_ar": "الخصوم", "name_en": null, "subtype": "general", "category": "liability", "is_group": true, "is_active": true, "parent_id": null, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
184	4	\N	accounts	46	INSERT	\N	{"id": 46, "code": "3", "path": "/46/", "level": 1, "nature": "credit", "name_ar": "حقوق الملكية", "name_en": null, "subtype": "general", "category": "equity", "is_group": true, "is_active": true, "parent_id": null, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
185	4	\N	accounts	47	INSERT	\N	{"id": 47, "code": "4", "path": "/47/", "level": 1, "nature": "credit", "name_ar": "الإيرادات", "name_en": null, "subtype": "general", "category": "revenue", "is_group": true, "is_active": true, "parent_id": null, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
186	4	\N	accounts	48	INSERT	\N	{"id": 48, "code": "5", "path": "/48/", "level": 1, "nature": "debit", "name_ar": "المصروفات", "name_en": null, "subtype": "general", "category": "expense", "is_group": true, "is_active": true, "parent_id": null, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
187	4	\N	accounts	49	INSERT	\N	{"id": 49, "code": "1101", "path": "/44/49/", "level": 2, "nature": "debit", "name_ar": "الصندوق", "name_en": null, "subtype": "cash", "category": "asset", "is_group": false, "is_active": true, "parent_id": 44, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
188	4	\N	accounts	50	INSERT	\N	{"id": 50, "code": "1201", "path": "/44/50/", "level": 2, "nature": "debit", "name_ar": "مخزون المخزن الرئيسي", "name_en": null, "subtype": "inventory", "category": "asset", "is_group": false, "is_active": true, "parent_id": 44, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
189	4	\N	accounts	51	INSERT	\N	{"id": 51, "code": "3101", "path": "/46/51/", "level": 2, "nature": "credit", "name_ar": "رأس المال", "name_en": null, "subtype": "general", "category": "equity", "is_group": false, "is_active": true, "parent_id": 46, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
190	4	\N	accounts	52	INSERT	\N	{"id": 52, "code": "3201", "path": "/46/52/", "level": 2, "nature": "credit", "name_ar": "الأرباح المحتجزة", "name_en": null, "subtype": "general", "category": "equity", "is_group": false, "is_active": true, "parent_id": 46, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
191	4	\N	accounts	53	INSERT	\N	{"id": 53, "code": "4101", "path": "/47/53/", "level": 2, "nature": "credit", "name_ar": "إيرادات المبيعات", "name_en": null, "subtype": "general", "category": "revenue", "is_group": false, "is_active": true, "parent_id": 47, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
192	4	\N	accounts	54	INSERT	\N	{"id": 54, "code": "4201", "path": "/47/54/", "level": 2, "nature": "credit", "name_ar": "أرباح فروقات الجرد", "name_en": null, "subtype": "general", "category": "revenue", "is_group": false, "is_active": true, "parent_id": 47, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
193	4	\N	accounts	55	INSERT	\N	{"id": 55, "code": "5101", "path": "/48/55/", "level": 2, "nature": "debit", "name_ar": "تكلفة البضاعة المباعة", "name_en": null, "subtype": "general", "category": "expense", "is_group": false, "is_active": true, "parent_id": 48, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
194	4	\N	accounts	56	INSERT	\N	{"id": 56, "code": "5201", "path": "/48/56/", "level": 2, "nature": "debit", "name_ar": "خسائر فروقات الجرد", "name_en": null, "subtype": "general", "category": "expense", "is_group": false, "is_active": true, "parent_id": 48, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "default_currency_id": null, "require_cost_center": false, "allow_all_currencies": true}	3375	2026-11-20 00:28:51.702619+03
195	4	\N	company_settings	4	INSERT	\N	{"company_id": 4, "updated_at": "2026-11-20T00:28:51.702619+03:00", "rounding_account_id": null, "notes_payable_account_id": null, "fx_realized_gain_account_id": null, "fx_realized_loss_account_id": null, "notes_receivable_account_id": null, "retained_earnings_account_id": 52, "fx_unrealized_gain_account_id": null, "fx_unrealized_loss_account_id": null}	3375	2026-11-20 00:28:51.702619+03
196	4	\N	security_settings	4	INSERT	\N	{"company_id": 4, "enforce_permissions": false}	3375	2026-11-20 00:28:51.702619+03
197	4	\N	inventory_settings	4	INSERT	\N	{"company_id": 4, "default_cogs_account_id": 55, "adjustment_gain_account_id": 54, "adjustment_loss_account_id": 56, "default_receipt_account_id": 51}	3375	2026-11-20 00:28:51.702619+03
198	4	\N	units	5	INSERT	\N	{"id": 5, "code": "PCS", "name_ar": "قطعة", "name_en": null, "company_id": 4}	3375	2026-11-20 00:28:51.702619+03
199	4	\N	item_units	7	INSERT	\N	{"id": 7, "is_base": true, "item_id": 5, "unit_id": 5, "company_id": 4, "sale_price": 0.0000, "factor_to_base": 1.000000, "purchase_price": 0.0000}	3375	2026-11-20 00:28:51.702619+03
200	4	\N	items	5	INSERT	\N	{"id": 5, "code": "ITM-001", "name_ar": "صنف تجريبي", "name_en": null, "is_active": true, "min_stock": 0.000000, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "category_id": null, "track_batch": false, "base_unit_id": 5, "is_stockable": true, "track_expiry": false, "reorder_level": 0.000000}	3375	2026-11-20 00:28:51.702619+03
201	4	\N	warehouses	3	INSERT	\N	{"id": 3, "code": "WH-01", "name_ar": "المخزن الرئيسي", "name_en": null, "branch_id": 5, "is_active": true, "account_id": 50, "company_id": 4, "created_at": "2026-11-20T00:28:51.702619+03:00", "updated_at": "2026-11-20T00:28:51.702619+03:00", "allow_negative_stock": false}	3375	2026-11-20 00:28:51.702619+03
\.


--
-- TOC entry 7410 (class 0 OID 57619)
-- Dependencies: 368
-- Data for Name: bank_reconciliation_matches; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.bank_reconciliation_matches (id, company_id, reconciliation_id, statement_line_id, journal_entry_line_id, matched_amount_fc, matched_amount_local, method, matched_by, matched_at, notes, reversed_at, reversal_reason) FROM stdin;
\.


--
-- TOC entry 7408 (class 0 OID 57579)
-- Dependencies: 366
-- Data for Name: bank_reconciliations; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.bank_reconciliations (id, company_id, statement_id, bank_account_id, currency_id, reconciliation_date, status, statement_balance, ledger_balance, difference, notes, created_by, completed_by, completed_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7406 (class 0 OID 57546)
-- Dependencies: 364
-- Data for Name: bank_statement_lines; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.bank_statement_lines (id, company_id, statement_id, line_no, transaction_date, value_date, description, bank_reference, direction, amount, balance_after, fingerprint, raw_data, created_at) FROM stdin;
\.


--
-- TOC entry 7404 (class 0 OID 57506)
-- Dependencies: 362
-- Data for Name: bank_statements; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.bank_statements (id, company_id, bank_account_id, currency_id, statement_no, statement_start, statement_end, opening_balance, closing_balance, source_file_name, source_file_hash, status, notes, created_by, reviewed_by, reviewed_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7287 (class 0 OID 42678)
-- Dependencies: 229
-- Data for Name: branches; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.branches (id, company_id, activity_id, code, name_ar, name_en, is_main, is_active, created_at, updated_at) FROM stdin;
5	4	\N	MAIN	الفرع الرئيسي	\N	t	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
\.


--
-- TOC entry 7402 (class 0 OID 57390)
-- Dependencies: 359
-- Data for Name: cheques; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.cheques (id, company_id, branch_id, direction, cheque_no, bank_name, due_date, voucher_id, customer_id, supplier_id, currency_id, amount_fc, exchange_rate, amount_local, status, bank_account_id, deposited_at, settled_at, settle_entry_id, return_entry_id, return_reason, notes, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7283 (class 0 OID 42634)
-- Dependencies: 225
-- Data for Name: companies; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.companies (id, code, name_ar, name_en, tax_no, base_currency_id, is_active, created_at, updated_at) FROM stdin;
4	DEMO	شركة تجريبية	\N	\N	6	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
\.


--
-- TOC entry 7288 (class 0 OID 42710)
-- Dependencies: 230
-- Data for Name: company_currencies; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.company_currencies (company_id, currency_id, default_rate, min_rate, max_rate, is_active) FROM stdin;
4	6	1.00000000	1.00000000	1.00000000	t
\.


--
-- TOC entry 7301 (class 0 OID 42939)
-- Dependencies: 243
-- Data for Name: company_settings; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.company_settings (company_id, fx_realized_gain_account_id, fx_realized_loss_account_id, fx_unrealized_gain_account_id, fx_unrealized_loss_account_id, rounding_account_id, updated_at, retained_earnings_account_id, notes_receivable_account_id, notes_payable_account_id) FROM stdin;
4	\N	\N	\N	\N	\N	2026-11-20 00:28:51.702619+03	52	\N	\N
\.


--
-- TOC entry 7300 (class 0 OID 42898)
-- Dependencies: 242
-- Data for Name: cost_centers; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.cost_centers (id, company_id, parent_id, code, name_ar, name_en, level, path, is_group, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7281 (class 0 OID 42618)
-- Dependencies: 223
-- Data for Name: currencies; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.currencies (id, code, name_ar, name_en, symbol, decimal_places, is_active) FROM stdin;
6	USD	دولار أمريكي	\N	\N	2	t
\.


--
-- TOC entry 7362 (class 0 OID 44528)
-- Dependencies: 309
-- Data for Name: customer_currencies; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.customer_currencies (customer_id, company_id, currency_id) FROM stdin;
\.


--
-- TOC entry 7359 (class 0 OID 44445)
-- Dependencies: 306
-- Data for Name: customer_groups; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.customer_groups (id, company_id, code, name_ar, name_en) FROM stdin;
\.


--
-- TOC entry 7364 (class 0 OID 44547)
-- Dependencies: 311
-- Data for Name: customer_ledger; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.customer_ledger (id, company_id, customer_id, entry_date, due_date, doc_type, doc_id, journal_entry_id, currency_id, exchange_rate, debit_fc, credit_fc, debit_local, credit_local, description, created_at, voucher_detail_id) FROM stdin;
\.


--
-- TOC entry 7361 (class 0 OID 44464)
-- Dependencies: 308
-- Data for Name: customers; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.customers (id, company_id, group_id, code, name_ar, name_en, tax_no, contact_person, phone, email, address, default_currency_id, allow_all_currencies, credit_limit, payment_days, price_list_id, default_discount_pct, is_tax_exempt, parent_account_id, account_id, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7422 (class 0 OID 62395)
-- Dependencies: 389
-- Data for Name: depreciation_lines; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.depreciation_lines (id, company_id, run_id, asset_id, months, amount, prev_last_dep_date, prev_months_done, accumulated_after, book_after, expense_account_id, accum_account_id, cost_center_id) FROM stdin;
\.


--
-- TOC entry 7420 (class 0 OID 62340)
-- Dependencies: 387
-- Data for Name: depreciation_runs; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.depreciation_runs (id, company_id, branch_id, fiscal_year_id, run_no, period_end, status, total_amount, journal_entry_id, reversal_entry_id, notes, created_by, posted_by, posted_at, reversed_at, created_at) FROM stdin;
\.


--
-- TOC entry 7295 (class 0 OID 42808)
-- Dependencies: 237
-- Data for Name: document_sequences; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.document_sequences (company_id, doc_type, fiscal_year_id, last_no) FROM stdin;
\.


--
-- TOC entry 7290 (class 0 OID 42734)
-- Dependencies: 232
-- Data for Name: exchange_rates; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.exchange_rates (id, company_id, currency_id, rate_date, rate, created_at) FROM stdin;
\.


--
-- TOC entry 7382 (class 0 OID 45052)
-- Dependencies: 333
-- Data for Name: financial_vouchers; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.financial_vouchers (id, company_id, branch_id, voucher_type_id, kind, fiscal_year_id, fiscal_period_id, voucher_no, voucher_ref, voucher_date, currency_id, exchange_rate, status, treasury_account_id, cost_center_id, counterparty_name, reference, description, total_fc, fx_difference_local, journal_entry_id, cancel_journal_entry_id, posted_by, posted_at, cancelled_by, cancelled_at, cancel_reason, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7294 (class 0 OID 42782)
-- Dependencies: 236
-- Data for Name: fiscal_periods; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.fiscal_periods (id, company_id, fiscal_year_id, period_no, start_date, end_date, status) FROM stdin;
5	4	5	1	2026-01-01	2026-01-31	open
6	4	5	2	2026-02-01	2026-02-28	open
7	4	5	3	2026-03-01	2026-03-31	open
8	4	5	4	2026-04-01	2026-04-30	open
9	4	5	5	2026-05-01	2026-05-31	open
10	4	5	6	2026-06-01	2026-06-30	open
11	4	5	7	2026-07-01	2026-07-31	open
12	4	5	8	2026-08-01	2026-08-31	open
13	4	5	9	2026-09-01	2026-09-30	open
14	4	5	10	2026-10-01	2026-10-31	open
15	4	5	11	2026-11-01	2026-11-30	open
16	4	5	12	2026-12-01	2026-12-31	open
\.


--
-- TOC entry 7292 (class 0 OID 42759)
-- Dependencies: 234
-- Data for Name: fiscal_years; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.fiscal_years (id, company_id, name, start_date, end_date, is_closed, closed_at, closed_by, reopened_at, reopened_by, reopen_reason) FROM stdin;
5	4	2026	2026-01-01	2026-12-31	f	\N	\N	\N	\N	\N
\.


--
-- TOC entry 7416 (class 0 OID 62184)
-- Dependencies: 383
-- Data for Name: fixed_asset_categories; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.fixed_asset_categories (id, company_id, code, name_ar, name_en, cost_account_id, accum_account_id, expense_account_id, gain_account_id, loss_account_id, method, life_months, salvage_pct, declining_rate_pct, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7418 (class 0 OID 62243)
-- Dependencies: 385
-- Data for Name: fixed_assets; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.fixed_assets (id, company_id, branch_id, category_id, asset_no, name_ar, name_en, serial_no, location, cost_center_id, acquisition_date, in_service_date, cost, salvage_value, method, life_months, declining_rate_pct, status, counter_account_id, opening_accumulated, opening_months, accumulated_depreciation, dep_months_done, last_depreciation_date, acquisition_entry_id, activated_by, activated_at, disposal_date, disposal_proceeds, disposal_account_id, disposal_gain_loss, disposal_entry_id, disposed_by, notes, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7320 (class 0 OID 43344)
-- Dependencies: 263
-- Data for Name: inventory_settings; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.inventory_settings (company_id, default_cogs_account_id, default_receipt_account_id, adjustment_gain_account_id, adjustment_loss_account_id) FROM stdin;
4	55	51	54	56
\.


--
-- TOC entry 7356 (class 0 OID 44373)
-- Dependencies: 303
-- Data for Name: item_accounts; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.item_accounts (company_id, item_id, revenue_account_id, cogs_account_id) FROM stdin;
\.


--
-- TOC entry 7315 (class 0 OID 43255)
-- Dependencies: 258
-- Data for Name: item_barcodes; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.item_barcodes (id, company_id, item_id, item_unit_id, barcode, is_primary) FROM stdin;
\.


--
-- TOC entry 7317 (class 0 OID 43281)
-- Dependencies: 260
-- Data for Name: item_batches; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.item_batches (id, company_id, item_id, batch_no, manufacture_date, expiry_date, is_active, created_at) FROM stdin;
\.


--
-- TOC entry 7309 (class 0 OID 43144)
-- Dependencies: 252
-- Data for Name: item_categories; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.item_categories (id, company_id, parent_id, code, name_ar, name_en) FROM stdin;
\.


--
-- TOC entry 7313 (class 0 OID 43219)
-- Dependencies: 256
-- Data for Name: item_units; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.item_units (id, company_id, item_id, unit_id, factor_to_base, is_base, sale_price, purchase_price) FROM stdin;
7	4	5	5	1.000000	t	0.0000	0.0000
\.


--
-- TOC entry 7311 (class 0 OID 43168)
-- Dependencies: 254
-- Data for Name: items; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.items (id, company_id, category_id, code, name_ar, name_en, base_unit_id, is_stockable, track_batch, track_expiry, min_stock, reorder_level, is_active, created_at, updated_at) FROM stdin;
5	4	\N	ITM-001	صنف تجريبي	\N	5	t	f	f	0.000000	0.000000	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
\.


--
-- TOC entry 7303 (class 0 OID 42978)
-- Dependencies: 245
-- Data for Name: journal_entries; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.journal_entries (id, company_id, branch_id, fiscal_year_id, fiscal_period_id, entry_no, entry_date, entry_type, source_type, source_id, reference, description, status, total_debit_local, total_credit_local, reversed_entry_id, posted_at, posted_by, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7305 (class 0 OID 43033)
-- Dependencies: 247
-- Data for Name: journal_entry_lines; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.journal_entry_lines (id, company_id, entry_id, line_no, account_id, cost_center_id, currency_id, debit_fc, credit_fc, exchange_rate, debit_local, credit_local, is_fx_difference, description, created_at) FROM stdin;
\.


--
-- TOC entry 7346 (class 0 OID 44090)
-- Dependencies: 291
-- Data for Name: landed_cost_types; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.landed_cost_types (id, company_id, code, name_ar, default_account_id, default_allocation_method) FROM stdin;
\.


--
-- TOC entry 7355 (class 0 OID 44344)
-- Dependencies: 302
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.payment_methods (id, company_id, code, name_ar, kind, account_id, is_active) FROM stdin;
\.


--
-- TOC entry 7392 (class 0 OID 45390)
-- Dependencies: 347
-- Data for Name: permissions; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.permissions (code, module, name_ar, enforced) FROM stdin;
accounting.journal.post	accounting	ترحيل قيود اليومية اليدوية	t
accounting.voucher.post	accounting	ترحيل السندات المالية	t
accounting.voucher.cancel	accounting	إلغاء السندات المالية	t
accounting.period.manage	accounting	إنشاء الفترات المالية وفتحها وإغلاقها	t
accounting.settings.manage	accounting	إدارة إعدادات المحاسبة	f
inventory.item.manage	inventory	إدارة الأصناف والوحدات	f
inventory.warehouse.manage	inventory	إدارة المخازن	f
purchases.request.approve	purchases	اعتماد طلبات الشراء	t
purchases.order.approve	purchases	اعتماد أوامر الشراء	t
purchases.order.cancel	purchases	إلغاء أوامر الشراء	t
purchases.invoice.post	purchases	ترحيل فواتير المشتريات	t
purchases.return.post	purchases	ترحيل مردودات المشتريات	t
purchases.supplier.manage	purchases	إدارة الموردين	f
sales.order.approve	sales	اعتماد عروض الأسعار وأوامر البيع	t
sales.order.cancel	sales	إلغاء عروض الأسعار وأوامر البيع	t
sales.invoice.post	sales	ترحيل فواتير المبيعات	t
sales.return.post	sales	ترحيل مردودات المبيعات	t
sales.customer.manage	sales	إدارة العملاء	f
sales.pricelist.manage	sales	إدارة قوائم الأسعار	f
pos.session.open	pos	فتح ورديات نقاط البيع	t
pos.session.close	pos	إغلاق ورديات نقاط البيع	t
admin.users.manage	admin	إدارة المستخدمين	f
admin.roles.manage	admin	إدارة الأدوار والصلاحيات	f
admin.audit.view	admin	عرض سجل التدقيق	f
accounting.year.close	accounting	إقفال السنة المالية	t
accounting.year.reopen	accounting	إعادة فتح سنة مالية مقفلة	t
accounting.cheque.manage	accounting	إدارة الشيكات (تسجيل/إيداع/تحصيل/ارتجاع)	t
inventory.count.manage	inventory	إنشاء الجرد وإدخال العدّ	t
inventory.count.approve	inventory	اعتماد نتائج الجرد	t
inventory.count.post	inventory	ترحيل تسويات الجرد للمخزون والقيود	t
assets.fixed.manage	assets	إدارة الأصول الثابتة وفئاتها وتفعيلها	t
assets.fixed.depreciate	assets	إنشاء وترحيل وعكس دفعات الإهلاك	t
assets.fixed.dispose	assets	استبعاد وبيع الأصول الثابتة	t
\.


--
-- TOC entry 7372 (class 0 OID 44703)
-- Dependencies: 319
-- Data for Name: pos_cash_movements; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.pos_cash_movements (id, company_id, session_id, movement_type, amount, reason, created_by, created_at) FROM stdin;
\.


--
-- TOC entry 7366 (class 0 OID 44598)
-- Dependencies: 313
-- Data for Name: pos_registers; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.pos_registers (id, company_id, branch_id, warehouse_id, code, name_ar, cash_account_id, default_price_list_id, is_active) FROM stdin;
\.


--
-- TOC entry 7370 (class 0 OID 44682)
-- Dependencies: 317
-- Data for Name: pos_session_cash_counts; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.pos_session_cash_counts (id, company_id, session_id, denomination, quantity) FROM stdin;
\.


--
-- TOC entry 7368 (class 0 OID 44644)
-- Dependencies: 315
-- Data for Name: pos_sessions; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.pos_sessions (id, company_id, register_id, session_no, cashier_id, opened_at, opening_cash, status, closed_at, closed_by, expected_cash, counted_cash, difference, journal_entry_id, notes) FROM stdin;
\.


--
-- TOC entry 7353 (class 0 OID 44309)
-- Dependencies: 300
-- Data for Name: price_list_items; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.price_list_items (id, company_id, price_list_id, item_id, item_unit_id, price, min_qty) FROM stdin;
\.


--
-- TOC entry 7351 (class 0 OID 44276)
-- Dependencies: 298
-- Data for Name: price_lists; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.price_lists (id, company_id, code, name_ar, name_en, kind, currency_id, is_default, valid_from, valid_to, is_active) FROM stdin;
\.


--
-- TOC entry 7344 (class 0 OID 44010)
-- Dependencies: 289
-- Data for Name: purchase_document_lines; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.purchase_document_lines (id, company_id, document_id, line_no, item_id, item_unit_id, quantity, qty_base, unit_price, discount_pct, tax_rate, net_fc, tax_fc, net_local, tax_local, landed_local, cost_local, batch_id, batch_no, manufacture_date, expiry_date, settled_qty_base, request_line_id, order_line_id, source_line_id, notes) FROM stdin;
\.


--
-- TOC entry 7342 (class 0 OID 43903)
-- Dependencies: 287
-- Data for Name: purchase_documents; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.purchase_documents (id, company_id, branch_id, doc_type, fiscal_year_id, doc_no, doc_date, due_date, expected_date, supplier_id, supplier_invoice_no, warehouse_id, currency_id, exchange_rate, payment_type, payment_account_id, discount_pct, cost_center_id, order_id, invoice_id, status, subtotal_fc, tax_fc, total_fc, subtotal_local, tax_local, total_local, landed_cost_local, journal_entry_id, stock_document_id, notes, approved_by, approved_at, posted_by, posted_at, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7349 (class 0 OID 44165)
-- Dependencies: 294
-- Data for Name: purchase_landed_allocations; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.purchase_landed_allocations (landed_cost_id, line_id, amount_local) FROM stdin;
\.


--
-- TOC entry 7348 (class 0 OID 44116)
-- Dependencies: 293
-- Data for Name: purchase_landed_costs; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.purchase_landed_costs (id, company_id, document_id, cost_type_id, description, currency_id, exchange_rate, amount_fc, amount_local, payee_supplier_id, credit_account_id, allocation_method, created_at) FROM stdin;
\.


--
-- TOC entry 7340 (class 0 OID 43856)
-- Dependencies: 285
-- Data for Name: purchase_request_lines; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.purchase_request_lines (id, company_id, request_id, line_no, item_id, item_unit_id, quantity, qty_base, ordered_qty_base, suggested_supplier_id, notes) FROM stdin;
\.


--
-- TOC entry 7338 (class 0 OID 43816)
-- Dependencies: 283
-- Data for Name: purchase_requests; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.purchase_requests (id, company_id, branch_id, fiscal_year_id, pr_no, pr_date, required_date, warehouse_id, requested_by, status, notes, approved_by, approved_at, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7329 (class 0 OID 43646)
-- Dependencies: 274
-- Data for Name: purchasing_settings; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.purchasing_settings (company_id, default_supplier_control_account_id, vat_input_account_id, purchase_variance_account_id) FROM stdin;
\.


--
-- TOC entry 7396 (class 0 OID 45438)
-- Dependencies: 351
-- Data for Name: role_limits; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.role_limits (role_id, limit_code, value) FROM stdin;
\.


--
-- TOC entry 7395 (class 0 OID 45421)
-- Dependencies: 350
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.role_permissions (role_id, permission_code) FROM stdin;
\.


--
-- TOC entry 7394 (class 0 OID 45401)
-- Dependencies: 349
-- Data for Name: roles; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.roles (id, company_id, code, name_ar, is_system) FROM stdin;
\.


--
-- TOC entry 7376 (class 0 OID 44850)
-- Dependencies: 323
-- Data for Name: sales_document_lines; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.sales_document_lines (id, company_id, document_id, line_no, item_id, item_unit_id, quantity, qty_base, unit_price, discount_pct, tax_rate, net_fc, tax_fc, net_local, tax_local, cogs_local, batch_id, batch_no, settled_qty_base, quotation_line_id, order_line_id, source_line_id, notes) FROM stdin;
\.


--
-- TOC entry 7378 (class 0 OID 44927)
-- Dependencies: 325
-- Data for Name: sales_document_payments; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.sales_document_payments (id, company_id, document_id, payment_method_id, amount_fc, amount_local, reference, created_at) FROM stdin;
\.


--
-- TOC entry 7374 (class 0 OID 44729)
-- Dependencies: 321
-- Data for Name: sales_documents; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.sales_documents (id, company_id, branch_id, doc_type, fiscal_year_id, doc_no, doc_date, due_date, valid_until, expected_date, customer_id, warehouse_id, currency_id, exchange_rate, price_list_id, discount_pct, cost_center_id, pos_session_id, salesperson_id, customer_po_no, quotation_id, order_id, invoice_id, status, subtotal_fc, tax_fc, total_fc, subtotal_local, tax_local, total_local, paid_fc, credit_fc, cogs_local, journal_entry_id, stock_document_id, notes, approved_by, approved_at, posted_by, posted_at, created_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7357 (class 0 OID 44395)
-- Dependencies: 304
-- Data for Name: sales_settings; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.sales_settings (company_id, default_customer_control_account_id, default_revenue_account_id, default_cogs_account_id, vat_output_account_id, sales_returns_account_id, cash_over_short_account_id, default_vat_rate, default_price_list_id) FROM stdin;
\.


--
-- TOC entry 7391 (class 0 OID 45377)
-- Dependencies: 346
-- Data for Name: security_settings; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.security_settings (company_id, enforce_permissions) FROM stdin;
4	f
\.


--
-- TOC entry 7321 (class 0 OID 43367)
-- Dependencies: 264
-- Data for Name: stock_balances; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.stock_balances (company_id, warehouse_id, item_id, qty_on_hand, total_value, last_avg_cost, updated_at) FROM stdin;
\.


--
-- TOC entry 7322 (class 0 OID 43394)
-- Dependencies: 265
-- Data for Name: stock_batch_balances; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.stock_batch_balances (company_id, warehouse_id, item_id, batch_id, qty_on_hand) FROM stdin;
\.


--
-- TOC entry 7414 (class 0 OID 62069)
-- Dependencies: 379
-- Data for Name: stock_count_lines; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.stock_count_lines (id, company_id, count_id, line_no, item_id, batch_id, batch_no, manufacture_date, expiry_date, system_qty, counted_qty, unit_cost, diff_value, reason, counted_by, counted_at, stock_document_line_id) FROM stdin;
\.


--
-- TOC entry 7412 (class 0 OID 61992)
-- Dependencies: 377
-- Data for Name: stock_counts; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.stock_counts (id, company_id, branch_id, fiscal_year_id, count_no, count_date, warehouse_id, count_type, category_id, status, snapshot_at, reason, notes, receipt_doc_id, issue_doc_id, surplus_value, shortage_value, created_by, approved_by, approved_at, posted_by, posted_at, cancelled_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7326 (class 0 OID 43482)
-- Dependencies: 269
-- Data for Name: stock_document_lines; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.stock_document_lines (id, company_id, document_id, line_no, item_id, item_unit_id, quantity, qty_base, unit_cost, batch_id, batch_no, manufacture_date, expiry_date, line_value, notes) FROM stdin;
\.


--
-- TOC entry 7324 (class 0 OID 43419)
-- Dependencies: 267
-- Data for Name: stock_documents; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.stock_documents (id, company_id, branch_id, doc_type, fiscal_year_id, doc_no, doc_date, warehouse_id, to_warehouse_id, counter_account_id, cost_center_id, status, total_value, journal_entry_id, notes, posted_at, posted_by, created_by, created_at) FROM stdin;
\.


--
-- TOC entry 7328 (class 0 OID 43523)
-- Dependencies: 271
-- Data for Name: stock_movements; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.stock_movements (id, company_id, document_id, line_id, movement_date, warehouse_id, item_id, batch_id, qty_signed, unit_cost, value_signed, qty_after, value_after, avg_cost_after, created_at) FROM stdin;
\.


--
-- TOC entry 7334 (class 0 OID 43746)
-- Dependencies: 279
-- Data for Name: supplier_currencies; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.supplier_currencies (supplier_id, company_id, currency_id) FROM stdin;
\.


--
-- TOC entry 7331 (class 0 OID 43673)
-- Dependencies: 276
-- Data for Name: supplier_groups; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.supplier_groups (id, company_id, code, name_ar, name_en) FROM stdin;
\.


--
-- TOC entry 7336 (class 0 OID 43765)
-- Dependencies: 281
-- Data for Name: supplier_ledger; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.supplier_ledger (id, company_id, supplier_id, entry_date, due_date, doc_type, doc_id, journal_entry_id, currency_id, exchange_rate, debit_fc, credit_fc, debit_local, credit_local, description, created_at, voucher_detail_id) FROM stdin;
\.


--
-- TOC entry 7333 (class 0 OID 43692)
-- Dependencies: 278
-- Data for Name: suppliers; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.suppliers (id, company_id, group_id, code, name_ar, name_en, tax_no, contact_person, phone, email, address, default_currency_id, allow_all_currencies, credit_limit, payment_days, parent_account_id, account_id, is_active, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 7307 (class 0 OID 43125)
-- Dependencies: 250
-- Data for Name: units; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.units (id, company_id, code, name_ar, name_en) FROM stdin;
5	4	PCS	قطعة	\N
\.


--
-- TOC entry 7398 (class 0 OID 45471)
-- Dependencies: 353
-- Data for Name: user_branches; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.user_branches (user_id, company_id, branch_id) FROM stdin;
\.


--
-- TOC entry 7390 (class 0 OID 45361)
-- Dependencies: 345
-- Data for Name: user_login_log; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.user_login_log (id, user_id, username_attempted, success, reason, ip, logged_at) FROM stdin;
\.


--
-- TOC entry 7397 (class 0 OID 45452)
-- Dependencies: 352
-- Data for Name: user_roles; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.user_roles (user_id, company_id, role_id) FROM stdin;
\.


--
-- TOC entry 7386 (class 0 OID 45203)
-- Dependencies: 337
-- Data for Name: voucher_allocations; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.voucher_allocations (id, company_id, voucher_id, voucher_detail_id, customer_ledger_id, supplier_ledger_id, amount_fc, settled_local, reversed, created_at) FROM stdin;
\.


--
-- TOC entry 7384 (class 0 OID 45136)
-- Dependencies: 335
-- Data for Name: voucher_details; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.voucher_details (id, company_id, voucher_id, line_no, account_id, cost_center_id, customer_id, supplier_id, debit_fc, credit_fc, debit_local, credit_local, reference, description) FROM stdin;
\.


--
-- TOC entry 7380 (class 0 OID 45018)
-- Dependencies: 331
-- Data for Name: voucher_types; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.voucher_types (id, company_id, code, kind, name_ar, name_en, prefix, number_padding, default_treasury_account_id, is_active) FROM stdin;
\.


--
-- TOC entry 7319 (class 0 OID 43306)
-- Dependencies: 262
-- Data for Name: warehouses; Type: TABLE DATA; Schema: erp; Owner: postgres
--

COPY erp.warehouses (id, company_id, branch_id, code, name_ar, name_en, account_id, allow_negative_stock, is_active, created_at, updated_at) FROM stdin;
3	4	5	WH-01	المخزن الرئيسي	\N	50	f	t	2026-11-20 00:28:51.702619+03	2026-11-20 00:28:51.702619+03
\.


--
-- TOC entry 7430 (class 0 OID 0)
-- Dependencies: 238
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.accounts_id_seq', 56, true);


--
-- TOC entry 7431 (class 0 OID 0)
-- Dependencies: 226
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.activities_id_seq', 1, false);


--
-- TOC entry 7432 (class 0 OID 0)
-- Dependencies: 342
-- Name: app_users_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.app_users_id_seq', 4, true);


--
-- TOC entry 7433 (class 0 OID 0)
-- Dependencies: 354
-- Name: audit_log_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.audit_log_id_seq', 235, true);


--
-- TOC entry 7434 (class 0 OID 0)
-- Dependencies: 367
-- Name: bank_reconciliation_matches_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.bank_reconciliation_matches_id_seq', 1, false);


--
-- TOC entry 7435 (class 0 OID 0)
-- Dependencies: 365
-- Name: bank_reconciliations_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.bank_reconciliations_id_seq', 1, false);


--
-- TOC entry 7436 (class 0 OID 0)
-- Dependencies: 363
-- Name: bank_statement_lines_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.bank_statement_lines_id_seq', 1, false);


--
-- TOC entry 7437 (class 0 OID 0)
-- Dependencies: 361
-- Name: bank_statements_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.bank_statements_id_seq', 1, false);


--
-- TOC entry 7438 (class 0 OID 0)
-- Dependencies: 228
-- Name: branches_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.branches_id_seq', 5, true);


--
-- TOC entry 7439 (class 0 OID 0)
-- Dependencies: 358
-- Name: cheques_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.cheques_id_seq', 1, false);


--
-- TOC entry 7440 (class 0 OID 0)
-- Dependencies: 224
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.companies_id_seq', 4, true);


--
-- TOC entry 7441 (class 0 OID 0)
-- Dependencies: 241
-- Name: cost_centers_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.cost_centers_id_seq', 1, false);


--
-- TOC entry 7442 (class 0 OID 0)
-- Dependencies: 222
-- Name: currencies_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.currencies_id_seq', 6, true);


--
-- TOC entry 7443 (class 0 OID 0)
-- Dependencies: 305
-- Name: customer_groups_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.customer_groups_id_seq', 1, false);


--
-- TOC entry 7444 (class 0 OID 0)
-- Dependencies: 310
-- Name: customer_ledger_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.customer_ledger_id_seq', 6, true);


--
-- TOC entry 7445 (class 0 OID 0)
-- Dependencies: 307
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.customers_id_seq', 2, true);


--
-- TOC entry 7446 (class 0 OID 0)
-- Dependencies: 388
-- Name: depreciation_lines_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.depreciation_lines_id_seq', 1, false);


--
-- TOC entry 7447 (class 0 OID 0)
-- Dependencies: 386
-- Name: depreciation_runs_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.depreciation_runs_id_seq', 1, false);


--
-- TOC entry 7448 (class 0 OID 0)
-- Dependencies: 231
-- Name: exchange_rates_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.exchange_rates_id_seq', 1, false);


--
-- TOC entry 7449 (class 0 OID 0)
-- Dependencies: 332
-- Name: financial_vouchers_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.financial_vouchers_id_seq', 2, true);


--
-- TOC entry 7450 (class 0 OID 0)
-- Dependencies: 235
-- Name: fiscal_periods_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.fiscal_periods_id_seq', 16, true);


--
-- TOC entry 7451 (class 0 OID 0)
-- Dependencies: 233
-- Name: fiscal_years_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.fiscal_years_id_seq', 5, true);


--
-- TOC entry 7452 (class 0 OID 0)
-- Dependencies: 382
-- Name: fixed_asset_categories_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.fixed_asset_categories_id_seq', 1, false);


--
-- TOC entry 7453 (class 0 OID 0)
-- Dependencies: 384
-- Name: fixed_assets_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.fixed_assets_id_seq', 1, false);


--
-- TOC entry 7454 (class 0 OID 0)
-- Dependencies: 257
-- Name: item_barcodes_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.item_barcodes_id_seq', 1, false);


--
-- TOC entry 7455 (class 0 OID 0)
-- Dependencies: 259
-- Name: item_batches_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.item_batches_id_seq', 2, true);


--
-- TOC entry 7456 (class 0 OID 0)
-- Dependencies: 251
-- Name: item_categories_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.item_categories_id_seq', 1, false);


--
-- TOC entry 7457 (class 0 OID 0)
-- Dependencies: 255
-- Name: item_units_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.item_units_id_seq', 7, true);


--
-- TOC entry 7458 (class 0 OID 0)
-- Dependencies: 253
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.items_id_seq', 5, true);


--
-- TOC entry 7459 (class 0 OID 0)
-- Dependencies: 244
-- Name: journal_entries_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.journal_entries_id_seq', 19, true);


--
-- TOC entry 7460 (class 0 OID 0)
-- Dependencies: 246
-- Name: journal_entry_lines_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.journal_entry_lines_id_seq', 59, true);


--
-- TOC entry 7461 (class 0 OID 0)
-- Dependencies: 290
-- Name: landed_cost_types_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.landed_cost_types_id_seq', 2, true);


--
-- TOC entry 7462 (class 0 OID 0)
-- Dependencies: 301
-- Name: payment_methods_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.payment_methods_id_seq', 4, true);


--
-- TOC entry 7463 (class 0 OID 0)
-- Dependencies: 318
-- Name: pos_cash_movements_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.pos_cash_movements_id_seq', 1, false);


--
-- TOC entry 7464 (class 0 OID 0)
-- Dependencies: 312
-- Name: pos_registers_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.pos_registers_id_seq', 1, true);


--
-- TOC entry 7465 (class 0 OID 0)
-- Dependencies: 316
-- Name: pos_session_cash_counts_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.pos_session_cash_counts_id_seq', 1, false);


--
-- TOC entry 7466 (class 0 OID 0)
-- Dependencies: 314
-- Name: pos_sessions_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.pos_sessions_id_seq', 1, true);


--
-- TOC entry 7467 (class 0 OID 0)
-- Dependencies: 299
-- Name: price_list_items_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.price_list_items_id_seq', 2, true);


--
-- TOC entry 7468 (class 0 OID 0)
-- Dependencies: 297
-- Name: price_lists_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.price_lists_id_seq', 2, true);


--
-- TOC entry 7469 (class 0 OID 0)
-- Dependencies: 288
-- Name: purchase_document_lines_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.purchase_document_lines_id_seq', 4, true);


--
-- TOC entry 7470 (class 0 OID 0)
-- Dependencies: 286
-- Name: purchase_documents_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.purchase_documents_id_seq', 2, true);


--
-- TOC entry 7471 (class 0 OID 0)
-- Dependencies: 292
-- Name: purchase_landed_costs_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.purchase_landed_costs_id_seq', 2, true);


--
-- TOC entry 7472 (class 0 OID 0)
-- Dependencies: 284
-- Name: purchase_request_lines_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.purchase_request_lines_id_seq', 1, false);


--
-- TOC entry 7473 (class 0 OID 0)
-- Dependencies: 282
-- Name: purchase_requests_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.purchase_requests_id_seq', 1, false);


--
-- TOC entry 7474 (class 0 OID 0)
-- Dependencies: 348
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.roles_id_seq', 6, true);


--
-- TOC entry 7475 (class 0 OID 0)
-- Dependencies: 322
-- Name: sales_document_lines_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.sales_document_lines_id_seq', 7, true);


--
-- TOC entry 7476 (class 0 OID 0)
-- Dependencies: 324
-- Name: sales_document_payments_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.sales_document_payments_id_seq', 5, true);


--
-- TOC entry 7477 (class 0 OID 0)
-- Dependencies: 320
-- Name: sales_documents_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.sales_documents_id_seq', 5, true);


--
-- TOC entry 7478 (class 0 OID 0)
-- Dependencies: 378
-- Name: stock_count_lines_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.stock_count_lines_id_seq', 4, true);


--
-- TOC entry 7479 (class 0 OID 0)
-- Dependencies: 376
-- Name: stock_counts_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.stock_counts_id_seq', 5, true);


--
-- TOC entry 7480 (class 0 OID 0)
-- Dependencies: 268
-- Name: stock_document_lines_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.stock_document_lines_id_seq', 15, true);


--
-- TOC entry 7481 (class 0 OID 0)
-- Dependencies: 266
-- Name: stock_documents_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.stock_documents_id_seq', 11, true);


--
-- TOC entry 7482 (class 0 OID 0)
-- Dependencies: 270
-- Name: stock_movements_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.stock_movements_id_seq', 15, true);


--
-- TOC entry 7483 (class 0 OID 0)
-- Dependencies: 275
-- Name: supplier_groups_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.supplier_groups_id_seq', 1, false);


--
-- TOC entry 7484 (class 0 OID 0)
-- Dependencies: 280
-- Name: supplier_ledger_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.supplier_ledger_id_seq', 3, true);


--
-- TOC entry 7485 (class 0 OID 0)
-- Dependencies: 277
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.suppliers_id_seq', 2, true);


--
-- TOC entry 7486 (class 0 OID 0)
-- Dependencies: 249
-- Name: units_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.units_id_seq', 5, true);


--
-- TOC entry 7487 (class 0 OID 0)
-- Dependencies: 344
-- Name: user_login_log_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.user_login_log_id_seq', 11, true);


--
-- TOC entry 7488 (class 0 OID 0)
-- Dependencies: 336
-- Name: voucher_allocations_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.voucher_allocations_id_seq', 2, true);


--
-- TOC entry 7489 (class 0 OID 0)
-- Dependencies: 334
-- Name: voucher_details_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.voucher_details_id_seq', 2, true);


--
-- TOC entry 7490 (class 0 OID 0)
-- Dependencies: 330
-- Name: voucher_types_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.voucher_types_id_seq', 3, true);


--
-- TOC entry 7491 (class 0 OID 0)
-- Dependencies: 261
-- Name: warehouses_id_seq; Type: SEQUENCE SET; Schema: erp; Owner: postgres
--

SELECT pg_catalog.setval('erp.warehouses_id_seq', 3, true);


--
-- TOC entry 6302 (class 2606 OID 42882)
-- Name: account_currencies account_currencies_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.account_currencies
    ADD CONSTRAINT account_currencies_pkey PRIMARY KEY (account_id, currency_id);


--
-- TOC entry 6294 (class 2606 OID 42855)
-- Name: accounts accounts_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.accounts
    ADD CONSTRAINT accounts_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6296 (class 2606 OID 42857)
-- Name: accounts accounts_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.accounts
    ADD CONSTRAINT accounts_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6298 (class 2606 OID 42853)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 6259 (class 2606 OID 42669)
-- Name: activities activities_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.activities
    ADD CONSTRAINT activities_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6261 (class 2606 OID 42671)
-- Name: activities activities_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.activities
    ADD CONSTRAINT activities_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6263 (class 2606 OID 42667)
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- TOC entry 6560 (class 2606 OID 45351)
-- Name: app_users app_users_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.app_users
    ADD CONSTRAINT app_users_pkey PRIMARY KEY (id);


--
-- TOC entry 6585 (class 2606 OID 45502)
-- Name: audit_log audit_log_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.audit_log
    ADD CONSTRAINT audit_log_pkey PRIMARY KEY (id);


--
-- TOC entry 6619 (class 2606 OID 57637)
-- Name: bank_reconciliation_matches bank_reconciliation_matches_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliation_matches
    ADD CONSTRAINT bank_reconciliation_matches_pkey PRIMARY KEY (id);


--
-- TOC entry 6612 (class 2606 OID 57597)
-- Name: bank_reconciliations bank_reconciliations_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliations
    ADD CONSTRAINT bank_reconciliations_pkey PRIMARY KEY (id);


--
-- TOC entry 6602 (class 2606 OID 57564)
-- Name: bank_statement_lines bank_statement_lines_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statement_lines
    ADD CONSTRAINT bank_statement_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 6596 (class 2606 OID 57525)
-- Name: bank_statements bank_statements_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statements
    ADD CONSTRAINT bank_statements_pkey PRIMARY KEY (id);


--
-- TOC entry 6265 (class 2606 OID 42696)
-- Name: branches branches_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.branches
    ADD CONSTRAINT branches_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6267 (class 2606 OID 42698)
-- Name: branches branches_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.branches
    ADD CONSTRAINT branches_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6269 (class 2606 OID 42694)
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (id);


--
-- TOC entry 6590 (class 2606 OID 57415)
-- Name: cheques cheques_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_pkey PRIMARY KEY (id);


--
-- TOC entry 6592 (class 2606 OID 57417)
-- Name: cheques cheques_voucher_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_voucher_id_key UNIQUE (voucher_id);


--
-- TOC entry 6255 (class 2606 OID 42650)
-- Name: companies companies_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.companies
    ADD CONSTRAINT companies_code_key UNIQUE (code);


--
-- TOC entry 6257 (class 2606 OID 42648)
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- TOC entry 6272 (class 2606 OID 42722)
-- Name: company_currencies company_currencies_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_currencies
    ADD CONSTRAINT company_currencies_pkey PRIMARY KEY (company_id, currency_id);


--
-- TOC entry 6312 (class 2606 OID 42946)
-- Name: company_settings company_settings_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_pkey PRIMARY KEY (company_id);


--
-- TOC entry 6304 (class 2606 OID 42920)
-- Name: cost_centers cost_centers_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cost_centers
    ADD CONSTRAINT cost_centers_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6306 (class 2606 OID 42922)
-- Name: cost_centers cost_centers_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cost_centers
    ADD CONSTRAINT cost_centers_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6308 (class 2606 OID 42918)
-- Name: cost_centers cost_centers_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cost_centers
    ADD CONSTRAINT cost_centers_pkey PRIMARY KEY (id);


--
-- TOC entry 6251 (class 2606 OID 42632)
-- Name: currencies currencies_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.currencies
    ADD CONSTRAINT currencies_code_key UNIQUE (code);


--
-- TOC entry 6253 (class 2606 OID 42630)
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- TOC entry 6487 (class 2606 OID 44535)
-- Name: customer_currencies customer_currencies_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_currencies
    ADD CONSTRAINT customer_currencies_pkey PRIMARY KEY (customer_id, currency_id);


--
-- TOC entry 6474 (class 2606 OID 44455)
-- Name: customer_groups customer_groups_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_groups
    ADD CONSTRAINT customer_groups_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6476 (class 2606 OID 44457)
-- Name: customer_groups customer_groups_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_groups
    ADD CONSTRAINT customer_groups_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6478 (class 2606 OID 44453)
-- Name: customer_groups customer_groups_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_groups
    ADD CONSTRAINT customer_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 6489 (class 2606 OID 44576)
-- Name: customer_ledger customer_ledger_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_ledger
    ADD CONSTRAINT customer_ledger_pkey PRIMARY KEY (id);


--
-- TOC entry 6480 (class 2606 OID 44494)
-- Name: customers customers_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6482 (class 2606 OID 44496)
-- Name: customers customers_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6484 (class 2606 OID 44492)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- TOC entry 6659 (class 2606 OID 62411)
-- Name: depreciation_lines depreciation_lines_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_lines
    ADD CONSTRAINT depreciation_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 6652 (class 2606 OID 62358)
-- Name: depreciation_runs depreciation_runs_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT depreciation_runs_pkey PRIMARY KEY (id);


--
-- TOC entry 6292 (class 2606 OID 42817)
-- Name: document_sequences document_sequences_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.document_sequences
    ADD CONSTRAINT document_sequences_pkey PRIMARY KEY (company_id, doc_type, fiscal_year_id);


--
-- TOC entry 6284 (class 2606 OID 42802)
-- Name: fiscal_periods ex_fiscal_periods_no_overlap; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_periods
    ADD CONSTRAINT ex_fiscal_periods_no_overlap EXCLUDE USING gist (company_id WITH =, daterange(start_date, end_date, '[]'::text) WITH &&);


--
-- TOC entry 6274 (class 2606 OID 42748)
-- Name: exchange_rates exchange_rates_company_id_currency_id_rate_date_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.exchange_rates
    ADD CONSTRAINT exchange_rates_company_id_currency_id_rate_date_key UNIQUE (company_id, currency_id, rate_date);


--
-- TOC entry 6276 (class 2606 OID 42746)
-- Name: exchange_rates exchange_rates_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.exchange_rates
    ADD CONSTRAINT exchange_rates_pkey PRIMARY KEY (id);


--
-- TOC entry 6536 (class 2606 OID 45085)
-- Name: financial_vouchers financial_vouchers_company_id_fiscal_year_id_voucher_type_i_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_fiscal_year_id_voucher_type_i_key UNIQUE (company_id, fiscal_year_id, voucher_type_id, voucher_no);


--
-- TOC entry 6538 (class 2606 OID 45087)
-- Name: financial_vouchers financial_vouchers_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6540 (class 2606 OID 45083)
-- Name: financial_vouchers financial_vouchers_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 6286 (class 2606 OID 42800)
-- Name: fiscal_periods fiscal_periods_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_periods
    ADD CONSTRAINT fiscal_periods_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6288 (class 2606 OID 42798)
-- Name: fiscal_periods fiscal_periods_fiscal_year_id_period_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_periods
    ADD CONSTRAINT fiscal_periods_fiscal_year_id_period_no_key UNIQUE (fiscal_year_id, period_no);


--
-- TOC entry 6290 (class 2606 OID 42796)
-- Name: fiscal_periods fiscal_periods_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_periods
    ADD CONSTRAINT fiscal_periods_pkey PRIMARY KEY (id);


--
-- TOC entry 6278 (class 2606 OID 42775)
-- Name: fiscal_years fiscal_years_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_years
    ADD CONSTRAINT fiscal_years_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6280 (class 2606 OID 42773)
-- Name: fiscal_years fiscal_years_company_id_name_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_years
    ADD CONSTRAINT fiscal_years_company_id_name_key UNIQUE (company_id, name);


--
-- TOC entry 6282 (class 2606 OID 42771)
-- Name: fiscal_years fiscal_years_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_years
    ADD CONSTRAINT fiscal_years_pkey PRIMARY KEY (id);


--
-- TOC entry 6638 (class 2606 OID 62207)
-- Name: fixed_asset_categories fixed_asset_categories_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT fixed_asset_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 6644 (class 2606 OID 62282)
-- Name: fixed_assets fixed_assets_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fixed_assets_pkey PRIMARY KEY (id);


--
-- TOC entry 6373 (class 2606 OID 43349)
-- Name: inventory_settings inventory_settings_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.inventory_settings
    ADD CONSTRAINT inventory_settings_pkey PRIMARY KEY (company_id);


--
-- TOC entry 6470 (class 2606 OID 44379)
-- Name: item_accounts item_accounts_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_accounts
    ADD CONSTRAINT item_accounts_pkey PRIMARY KEY (item_id);


--
-- TOC entry 6355 (class 2606 OID 43268)
-- Name: item_barcodes item_barcodes_company_id_barcode_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_barcodes
    ADD CONSTRAINT item_barcodes_company_id_barcode_key UNIQUE (company_id, barcode);


--
-- TOC entry 6357 (class 2606 OID 43266)
-- Name: item_barcodes item_barcodes_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_barcodes
    ADD CONSTRAINT item_barcodes_pkey PRIMARY KEY (id);


--
-- TOC entry 6360 (class 2606 OID 43296)
-- Name: item_batches item_batches_company_id_item_id_batch_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_batches
    ADD CONSTRAINT item_batches_company_id_item_id_batch_no_key UNIQUE (company_id, item_id, batch_no);


--
-- TOC entry 6362 (class 2606 OID 43298)
-- Name: item_batches item_batches_item_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_batches
    ADD CONSTRAINT item_batches_item_id_id_key UNIQUE (item_id, id);


--
-- TOC entry 6364 (class 2606 OID 43294)
-- Name: item_batches item_batches_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_batches
    ADD CONSTRAINT item_batches_pkey PRIMARY KEY (id);


--
-- TOC entry 6336 (class 2606 OID 43154)
-- Name: item_categories item_categories_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_categories
    ADD CONSTRAINT item_categories_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6338 (class 2606 OID 43156)
-- Name: item_categories item_categories_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_categories
    ADD CONSTRAINT item_categories_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6340 (class 2606 OID 43152)
-- Name: item_categories item_categories_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_categories
    ADD CONSTRAINT item_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 6348 (class 2606 OID 43242)
-- Name: item_units item_units_item_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_units
    ADD CONSTRAINT item_units_item_id_id_key UNIQUE (item_id, id);


--
-- TOC entry 6350 (class 2606 OID 43240)
-- Name: item_units item_units_item_id_unit_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_units
    ADD CONSTRAINT item_units_item_id_unit_id_key UNIQUE (item_id, unit_id);


--
-- TOC entry 6352 (class 2606 OID 43238)
-- Name: item_units item_units_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_units
    ADD CONSTRAINT item_units_pkey PRIMARY KEY (id);


--
-- TOC entry 6342 (class 2606 OID 43200)
-- Name: items items_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.items
    ADD CONSTRAINT items_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6344 (class 2606 OID 43202)
-- Name: items items_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.items
    ADD CONSTRAINT items_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6346 (class 2606 OID 43198)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 6317 (class 2606 OID 43006)
-- Name: journal_entries journal_entries_company_id_fiscal_year_id_entry_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT journal_entries_company_id_fiscal_year_id_entry_no_key UNIQUE (company_id, fiscal_year_id, entry_no);


--
-- TOC entry 6319 (class 2606 OID 43008)
-- Name: journal_entries journal_entries_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT journal_entries_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6321 (class 2606 OID 43004)
-- Name: journal_entries journal_entries_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT journal_entries_pkey PRIMARY KEY (id);


--
-- TOC entry 6326 (class 2606 OID 43062)
-- Name: journal_entry_lines journal_entry_lines_entry_id_line_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entry_lines
    ADD CONSTRAINT journal_entry_lines_entry_id_line_no_key UNIQUE (entry_id, line_no);


--
-- TOC entry 6328 (class 2606 OID 43060)
-- Name: journal_entry_lines journal_entry_lines_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entry_lines
    ADD CONSTRAINT journal_entry_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 6439 (class 2606 OID 44102)
-- Name: landed_cost_types landed_cost_types_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.landed_cost_types
    ADD CONSTRAINT landed_cost_types_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6441 (class 2606 OID 44104)
-- Name: landed_cost_types landed_cost_types_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.landed_cost_types
    ADD CONSTRAINT landed_cost_types_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6443 (class 2606 OID 44100)
-- Name: landed_cost_types landed_cost_types_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.landed_cost_types
    ADD CONSTRAINT landed_cost_types_pkey PRIMARY KEY (id);


--
-- TOC entry 6464 (class 2606 OID 44358)
-- Name: payment_methods payment_methods_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.payment_methods
    ADD CONSTRAINT payment_methods_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6466 (class 2606 OID 44360)
-- Name: payment_methods payment_methods_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.payment_methods
    ADD CONSTRAINT payment_methods_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6468 (class 2606 OID 44356)
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- TOC entry 6568 (class 2606 OID 45399)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (code);


--
-- TOC entry 6510 (class 2606 OID 44718)
-- Name: pos_cash_movements pos_cash_movements_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_cash_movements
    ADD CONSTRAINT pos_cash_movements_pkey PRIMARY KEY (id);


--
-- TOC entry 6492 (class 2606 OID 44613)
-- Name: pos_registers pos_registers_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_registers
    ADD CONSTRAINT pos_registers_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6494 (class 2606 OID 44615)
-- Name: pos_registers pos_registers_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_registers
    ADD CONSTRAINT pos_registers_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6496 (class 2606 OID 44611)
-- Name: pos_registers pos_registers_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_registers
    ADD CONSTRAINT pos_registers_pkey PRIMARY KEY (id);


--
-- TOC entry 6506 (class 2606 OID 44694)
-- Name: pos_session_cash_counts pos_session_cash_counts_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_session_cash_counts
    ADD CONSTRAINT pos_session_cash_counts_pkey PRIMARY KEY (id);


--
-- TOC entry 6508 (class 2606 OID 44696)
-- Name: pos_session_cash_counts pos_session_cash_counts_session_id_denomination_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_session_cash_counts
    ADD CONSTRAINT pos_session_cash_counts_session_id_denomination_key UNIQUE (session_id, denomination);


--
-- TOC entry 6498 (class 2606 OID 44666)
-- Name: pos_sessions pos_sessions_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_sessions
    ADD CONSTRAINT pos_sessions_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6500 (class 2606 OID 44662)
-- Name: pos_sessions pos_sessions_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_sessions
    ADD CONSTRAINT pos_sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 6502 (class 2606 OID 44664)
-- Name: pos_sessions pos_sessions_register_id_session_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_sessions
    ADD CONSTRAINT pos_sessions_register_id_session_no_key UNIQUE (register_id, session_no);


--
-- TOC entry 6460 (class 2606 OID 44323)
-- Name: price_list_items price_list_items_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_list_items
    ADD CONSTRAINT price_list_items_pkey PRIMARY KEY (id);


--
-- TOC entry 6462 (class 2606 OID 44325)
-- Name: price_list_items price_list_items_price_list_id_item_unit_id_min_qty_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_list_items
    ADD CONSTRAINT price_list_items_price_list_id_item_unit_id_min_qty_key UNIQUE (price_list_id, item_unit_id, min_qty);


--
-- TOC entry 6452 (class 2606 OID 44294)
-- Name: price_lists price_lists_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_lists
    ADD CONSTRAINT price_lists_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6454 (class 2606 OID 44296)
-- Name: price_lists price_lists_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_lists
    ADD CONSTRAINT price_lists_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6456 (class 2606 OID 44292)
-- Name: price_lists price_lists_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_lists
    ADD CONSTRAINT price_lists_pkey PRIMARY KEY (id);


--
-- TOC entry 6435 (class 2606 OID 44051)
-- Name: purchase_document_lines purchase_document_lines_document_id_line_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_document_id_line_no_key UNIQUE (document_id, line_no);


--
-- TOC entry 6437 (class 2606 OID 44049)
-- Name: purchase_document_lines purchase_document_lines_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 6427 (class 2606 OID 43949)
-- Name: purchase_documents purchase_documents_company_id_fiscal_year_id_doc_type_doc_n_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_fiscal_year_id_doc_type_doc_n_key UNIQUE (company_id, fiscal_year_id, doc_type, doc_no);


--
-- TOC entry 6429 (class 2606 OID 43951)
-- Name: purchase_documents purchase_documents_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6431 (class 2606 OID 43947)
-- Name: purchase_documents purchase_documents_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 6450 (class 2606 OID 44172)
-- Name: purchase_landed_allocations purchase_landed_allocations_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_allocations
    ADD CONSTRAINT purchase_landed_allocations_pkey PRIMARY KEY (landed_cost_id, line_id);


--
-- TOC entry 6446 (class 2606 OID 44138)
-- Name: purchase_landed_costs purchase_landed_costs_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_costs
    ADD CONSTRAINT purchase_landed_costs_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6448 (class 2606 OID 44136)
-- Name: purchase_landed_costs purchase_landed_costs_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_costs
    ADD CONSTRAINT purchase_landed_costs_pkey PRIMARY KEY (id);


--
-- TOC entry 6421 (class 2606 OID 43875)
-- Name: purchase_request_lines purchase_request_lines_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_request_lines
    ADD CONSTRAINT purchase_request_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 6423 (class 2606 OID 43877)
-- Name: purchase_request_lines purchase_request_lines_request_id_line_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_request_lines
    ADD CONSTRAINT purchase_request_lines_request_id_line_no_key UNIQUE (request_id, line_no);


--
-- TOC entry 6415 (class 2606 OID 43837)
-- Name: purchase_requests purchase_requests_company_id_fiscal_year_id_pr_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_requests
    ADD CONSTRAINT purchase_requests_company_id_fiscal_year_id_pr_no_key UNIQUE (company_id, fiscal_year_id, pr_no);


--
-- TOC entry 6417 (class 2606 OID 43839)
-- Name: purchase_requests purchase_requests_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_requests
    ADD CONSTRAINT purchase_requests_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6419 (class 2606 OID 43835)
-- Name: purchase_requests purchase_requests_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_requests
    ADD CONSTRAINT purchase_requests_pkey PRIMARY KEY (id);


--
-- TOC entry 6395 (class 2606 OID 43651)
-- Name: purchasing_settings purchasing_settings_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchasing_settings
    ADD CONSTRAINT purchasing_settings_pkey PRIMARY KEY (company_id);


--
-- TOC entry 6578 (class 2606 OID 45446)
-- Name: role_limits role_limits_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.role_limits
    ADD CONSTRAINT role_limits_pkey PRIMARY KEY (role_id, limit_code);


--
-- TOC entry 6576 (class 2606 OID 45427)
-- Name: role_permissions role_permissions_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (role_id, permission_code);


--
-- TOC entry 6570 (class 2606 OID 45413)
-- Name: roles roles_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.roles
    ADD CONSTRAINT roles_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6572 (class 2606 OID 45415)
-- Name: roles roles_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.roles
    ADD CONSTRAINT roles_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6574 (class 2606 OID 45411)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 6523 (class 2606 OID 44888)
-- Name: sales_document_lines sales_document_lines_document_id_line_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_document_id_line_no_key UNIQUE (document_id, line_no);


--
-- TOC entry 6525 (class 2606 OID 44886)
-- Name: sales_document_lines sales_document_lines_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 6528 (class 2606 OID 44941)
-- Name: sales_document_payments sales_document_payments_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_payments
    ADD CONSTRAINT sales_document_payments_pkey PRIMARY KEY (id);


--
-- TOC entry 6515 (class 2606 OID 44778)
-- Name: sales_documents sales_documents_company_id_fiscal_year_id_doc_type_doc_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_fiscal_year_id_doc_type_doc_no_key UNIQUE (company_id, fiscal_year_id, doc_type, doc_no);


--
-- TOC entry 6517 (class 2606 OID 44780)
-- Name: sales_documents sales_documents_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6519 (class 2606 OID 44776)
-- Name: sales_documents sales_documents_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 6472 (class 2606 OID 44403)
-- Name: sales_settings sales_settings_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_pkey PRIMARY KEY (company_id);


--
-- TOC entry 6566 (class 2606 OID 45384)
-- Name: security_settings security_settings_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.security_settings
    ADD CONSTRAINT security_settings_pkey PRIMARY KEY (company_id);


--
-- TOC entry 6375 (class 2606 OID 43383)
-- Name: stock_balances stock_balances_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_balances
    ADD CONSTRAINT stock_balances_pkey PRIMARY KEY (warehouse_id, item_id);


--
-- TOC entry 6377 (class 2606 OID 43404)
-- Name: stock_batch_balances stock_batch_balances_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_batch_balances
    ADD CONSTRAINT stock_batch_balances_pkey PRIMARY KEY (warehouse_id, item_id, batch_id);


--
-- TOC entry 6633 (class 2606 OID 62086)
-- Name: stock_count_lines stock_count_lines_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_count_lines
    ADD CONSTRAINT stock_count_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 6626 (class 2606 OID 62017)
-- Name: stock_counts stock_counts_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT stock_counts_pkey PRIMARY KEY (id);


--
-- TOC entry 6387 (class 2606 OID 43500)
-- Name: stock_document_lines stock_document_lines_document_id_line_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_document_lines
    ADD CONSTRAINT stock_document_lines_document_id_line_no_key UNIQUE (document_id, line_no);


--
-- TOC entry 6389 (class 2606 OID 43498)
-- Name: stock_document_lines stock_document_lines_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_document_lines
    ADD CONSTRAINT stock_document_lines_pkey PRIMARY KEY (id);


--
-- TOC entry 6380 (class 2606 OID 43442)
-- Name: stock_documents stock_documents_company_id_fiscal_year_id_doc_type_doc_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_fiscal_year_id_doc_type_doc_no_key UNIQUE (company_id, fiscal_year_id, doc_type, doc_no);


--
-- TOC entry 6382 (class 2606 OID 43444)
-- Name: stock_documents stock_documents_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6384 (class 2606 OID 43440)
-- Name: stock_documents stock_documents_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_pkey PRIMARY KEY (id);


--
-- TOC entry 6393 (class 2606 OID 43543)
-- Name: stock_movements stock_movements_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_movements
    ADD CONSTRAINT stock_movements_pkey PRIMARY KEY (id);


--
-- TOC entry 6410 (class 2606 OID 43753)
-- Name: supplier_currencies supplier_currencies_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_currencies
    ADD CONSTRAINT supplier_currencies_pkey PRIMARY KEY (supplier_id, currency_id);


--
-- TOC entry 6397 (class 2606 OID 43683)
-- Name: supplier_groups supplier_groups_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_groups
    ADD CONSTRAINT supplier_groups_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6399 (class 2606 OID 43685)
-- Name: supplier_groups supplier_groups_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_groups
    ADD CONSTRAINT supplier_groups_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6401 (class 2606 OID 43681)
-- Name: supplier_groups supplier_groups_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_groups
    ADD CONSTRAINT supplier_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 6413 (class 2606 OID 43794)
-- Name: supplier_ledger supplier_ledger_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_ledger
    ADD CONSTRAINT supplier_ledger_pkey PRIMARY KEY (id);


--
-- TOC entry 6404 (class 2606 OID 43717)
-- Name: suppliers suppliers_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.suppliers
    ADD CONSTRAINT suppliers_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6406 (class 2606 OID 43719)
-- Name: suppliers suppliers_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.suppliers
    ADD CONSTRAINT suppliers_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6408 (class 2606 OID 43715)
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- TOC entry 6330 (class 2606 OID 43135)
-- Name: units units_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.units
    ADD CONSTRAINT units_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6332 (class 2606 OID 43137)
-- Name: units units_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.units
    ADD CONSTRAINT units_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6334 (class 2606 OID 43133)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);


--
-- TOC entry 6615 (class 2606 OID 57599)
-- Name: bank_reconciliations uq_bank_reconciliation_company_id; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliations
    ADD CONSTRAINT uq_bank_reconciliation_company_id UNIQUE (company_id, id);


--
-- TOC entry 6617 (class 2606 OID 57601)
-- Name: bank_reconciliations uq_bank_reconciliation_statement; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliations
    ADD CONSTRAINT uq_bank_reconciliation_statement UNIQUE (statement_id);


--
-- TOC entry 6599 (class 2606 OID 57527)
-- Name: bank_statements uq_bank_statement_company_id; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statements
    ADD CONSTRAINT uq_bank_statement_company_id UNIQUE (company_id, id);


--
-- TOC entry 6606 (class 2606 OID 57566)
-- Name: bank_statement_lines uq_bank_statement_line_company_id; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statement_lines
    ADD CONSTRAINT uq_bank_statement_line_company_id UNIQUE (company_id, id);


--
-- TOC entry 6608 (class 2606 OID 57570)
-- Name: bank_statement_lines uq_bank_statement_line_fingerprint; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statement_lines
    ADD CONSTRAINT uq_bank_statement_line_fingerprint UNIQUE (statement_id, fingerprint);


--
-- TOC entry 6610 (class 2606 OID 57568)
-- Name: bank_statement_lines uq_bank_statement_line_no; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statement_lines
    ADD CONSTRAINT uq_bank_statement_line_no UNIQUE (statement_id, line_no);


--
-- TOC entry 6662 (class 2606 OID 62413)
-- Name: depreciation_lines uq_dl_run_asset; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_lines
    ADD CONSTRAINT uq_dl_run_asset UNIQUE (run_id, asset_id);


--
-- TOC entry 6654 (class 2606 OID 62360)
-- Name: depreciation_runs uq_dr_company_id; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT uq_dr_company_id UNIQUE (company_id, id);


--
-- TOC entry 6656 (class 2606 OID 62362)
-- Name: depreciation_runs uq_dr_no; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT uq_dr_no UNIQUE (company_id, fiscal_year_id, run_no);


--
-- TOC entry 6648 (class 2606 OID 62286)
-- Name: fixed_assets uq_fa_company_id; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT uq_fa_company_id UNIQUE (company_id, id);


--
-- TOC entry 6650 (class 2606 OID 62284)
-- Name: fixed_assets uq_fa_no; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT uq_fa_no UNIQUE (company_id, asset_no);


--
-- TOC entry 6640 (class 2606 OID 62209)
-- Name: fixed_asset_categories uq_fac_code; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT uq_fac_code UNIQUE (company_id, code);


--
-- TOC entry 6642 (class 2606 OID 62211)
-- Name: fixed_asset_categories uq_fac_company_id; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT uq_fac_company_id UNIQUE (company_id, id);


--
-- TOC entry 6628 (class 2606 OID 62019)
-- Name: stock_counts uq_sc_company_id; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT uq_sc_company_id UNIQUE (company_id, id);


--
-- TOC entry 6630 (class 2606 OID 62021)
-- Name: stock_counts uq_sc_no; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT uq_sc_no UNIQUE (company_id, fiscal_year_id, count_no);


--
-- TOC entry 6635 (class 2606 OID 62088)
-- Name: stock_count_lines uq_scl_line_no; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_count_lines
    ADD CONSTRAINT uq_scl_line_no UNIQUE (count_id, line_no);


--
-- TOC entry 6583 (class 2606 OID 45478)
-- Name: user_branches user_branches_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.user_branches
    ADD CONSTRAINT user_branches_pkey PRIMARY KEY (user_id, branch_id);


--
-- TOC entry 6564 (class 2606 OID 45369)
-- Name: user_login_log user_login_log_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.user_login_log
    ADD CONSTRAINT user_login_log_pkey PRIMARY KEY (id);


--
-- TOC entry 6581 (class 2606 OID 45459)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 6558 (class 2606 OID 45218)
-- Name: voucher_allocations voucher_allocations_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_allocations
    ADD CONSTRAINT voucher_allocations_pkey PRIMARY KEY (id);


--
-- TOC entry 6548 (class 2606 OID 45158)
-- Name: voucher_details voucher_details_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_details
    ADD CONSTRAINT voucher_details_pkey PRIMARY KEY (id);


--
-- TOC entry 6550 (class 2606 OID 45162)
-- Name: voucher_details voucher_details_voucher_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_details
    ADD CONSTRAINT voucher_details_voucher_id_id_key UNIQUE (voucher_id, id);


--
-- TOC entry 6552 (class 2606 OID 45160)
-- Name: voucher_details voucher_details_voucher_id_line_no_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_details
    ADD CONSTRAINT voucher_details_voucher_id_line_no_key UNIQUE (voucher_id, line_no);


--
-- TOC entry 6530 (class 2606 OID 45035)
-- Name: voucher_types voucher_types_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_types
    ADD CONSTRAINT voucher_types_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6532 (class 2606 OID 45037)
-- Name: voucher_types voucher_types_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_types
    ADD CONSTRAINT voucher_types_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6534 (class 2606 OID 45033)
-- Name: voucher_types voucher_types_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_types
    ADD CONSTRAINT voucher_types_pkey PRIMARY KEY (id);


--
-- TOC entry 6367 (class 2606 OID 43326)
-- Name: warehouses warehouses_company_id_code_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.warehouses
    ADD CONSTRAINT warehouses_company_id_code_key UNIQUE (company_id, code);


--
-- TOC entry 6369 (class 2606 OID 43328)
-- Name: warehouses warehouses_company_id_id_key; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.warehouses
    ADD CONSTRAINT warehouses_company_id_id_key UNIQUE (company_id, id);


--
-- TOC entry 6371 (class 2606 OID 43324)
-- Name: warehouses warehouses_pkey; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.warehouses
    ADD CONSTRAINT warehouses_pkey PRIMARY KEY (id);


--
-- TOC entry 6299 (class 1259 OID 42873)
-- Name: ix_accounts_parent; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_accounts_parent ON erp.accounts USING btree (company_id, parent_id);


--
-- TOC entry 6300 (class 1259 OID 42874)
-- Name: ix_accounts_path; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_accounts_path ON erp.accounts USING btree (path text_pattern_ops);


--
-- TOC entry 6586 (class 1259 OID 45509)
-- Name: ix_audit_company; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_audit_company ON erp.audit_log USING btree (company_id, changed_at DESC);


--
-- TOC entry 6587 (class 1259 OID 45508)
-- Name: ix_audit_record; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_audit_record ON erp.audit_log USING btree (table_name, record_id);


--
-- TOC entry 6588 (class 1259 OID 45510)
-- Name: ix_audit_user; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_audit_user ON erp.audit_log USING btree (user_id, changed_at DESC);


--
-- TOC entry 6620 (class 1259 OID 57656)
-- Name: ix_bank_matches_active_ledger_line; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_bank_matches_active_ledger_line ON erp.bank_reconciliation_matches USING btree (journal_entry_line_id) WHERE (reversed_at IS NULL);


--
-- TOC entry 6621 (class 1259 OID 57655)
-- Name: ix_bank_matches_active_line; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_bank_matches_active_line ON erp.bank_reconciliation_matches USING btree (company_id, statement_line_id) WHERE (reversed_at IS NULL);


--
-- TOC entry 6622 (class 1259 OID 57654)
-- Name: ix_bank_matches_journal_line; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_bank_matches_journal_line ON erp.bank_reconciliation_matches USING btree (journal_entry_line_id);


--
-- TOC entry 6623 (class 1259 OID 57653)
-- Name: ix_bank_matches_statement_line; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_bank_matches_statement_line ON erp.bank_reconciliation_matches USING btree (company_id, statement_line_id);


--
-- TOC entry 6613 (class 1259 OID 57617)
-- Name: ix_bank_reconciliations_account_date; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_bank_reconciliations_account_date ON erp.bank_reconciliations USING btree (company_id, bank_account_id, reconciliation_date);


--
-- TOC entry 6603 (class 1259 OID 57576)
-- Name: ix_bank_statement_lines_date; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_bank_statement_lines_date ON erp.bank_statement_lines USING btree (company_id, statement_id, transaction_date);


--
-- TOC entry 6604 (class 1259 OID 57577)
-- Name: ix_bank_statement_lines_reference; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_bank_statement_lines_reference ON erp.bank_statement_lines USING btree (company_id, bank_reference) WHERE (bank_reference IS NOT NULL);


--
-- TOC entry 6597 (class 1259 OID 57543)
-- Name: ix_bank_statements_account_dates; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_bank_statements_account_dates ON erp.bank_statements USING btree (company_id, bank_account_id, statement_start, statement_end);


--
-- TOC entry 6593 (class 1259 OID 57454)
-- Name: ix_cheques_due; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_cheques_due ON erp.cheques USING btree (company_id, status, due_date);


--
-- TOC entry 6309 (class 1259 OID 42933)
-- Name: ix_cost_centers_parent; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_cost_centers_parent ON erp.cost_centers USING btree (company_id, parent_id);


--
-- TOC entry 6310 (class 1259 OID 42934)
-- Name: ix_cost_centers_path; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_cost_centers_path ON erp.cost_centers USING btree (path text_pattern_ops);


--
-- TOC entry 6490 (class 1259 OID 44592)
-- Name: ix_customer_ledger_cust; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_customer_ledger_cust ON erp.customer_ledger USING btree (customer_id, entry_date);


--
-- TOC entry 6485 (class 1259 OID 44527)
-- Name: ix_customers_account; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_customers_account ON erp.customers USING btree (account_id);


--
-- TOC entry 6660 (class 1259 OID 62434)
-- Name: ix_dl_asset; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_dl_asset ON erp.depreciation_lines USING btree (asset_id);


--
-- TOC entry 6645 (class 1259 OID 62337)
-- Name: ix_fa_branch_status; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_fa_branch_status ON erp.fixed_assets USING btree (company_id, branch_id, status);


--
-- TOC entry 6646 (class 1259 OID 62338)
-- Name: ix_fa_category; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_fa_category ON erp.fixed_assets USING btree (category_id);


--
-- TOC entry 6358 (class 1259 OID 43279)
-- Name: ix_item_barcodes_item; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_item_barcodes_item ON erp.item_barcodes USING btree (item_id);


--
-- TOC entry 6365 (class 1259 OID 43304)
-- Name: ix_item_batches_expiry; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_item_batches_expiry ON erp.item_batches USING btree (company_id, expiry_date) WHERE (expiry_date IS NOT NULL);


--
-- TOC entry 6313 (class 1259 OID 43030)
-- Name: ix_je_branch; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_je_branch ON erp.journal_entries USING btree (company_id, branch_id);


--
-- TOC entry 6314 (class 1259 OID 43029)
-- Name: ix_je_company_date; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_je_company_date ON erp.journal_entries USING btree (company_id, entry_date);


--
-- TOC entry 6315 (class 1259 OID 43031)
-- Name: ix_je_source; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_je_source ON erp.journal_entries USING btree (source_type, source_id);


--
-- TOC entry 6322 (class 1259 OID 43084)
-- Name: ix_jel_account; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_jel_account ON erp.journal_entry_lines USING btree (company_id, account_id);


--
-- TOC entry 6323 (class 1259 OID 43085)
-- Name: ix_jel_cc; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_jel_cc ON erp.journal_entry_lines USING btree (company_id, cost_center_id) WHERE (cost_center_id IS NOT NULL);


--
-- TOC entry 6324 (class 1259 OID 43083)
-- Name: ix_jel_entry; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_jel_entry ON erp.journal_entry_lines USING btree (entry_id);


--
-- TOC entry 6562 (class 1259 OID 45375)
-- Name: ix_login_log_user; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_login_log_user ON erp.user_login_log USING btree (user_id, logged_at DESC);


--
-- TOC entry 6432 (class 1259 OID 44087)
-- Name: ix_pdl_doc; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_pdl_doc ON erp.purchase_document_lines USING btree (document_id);


--
-- TOC entry 6433 (class 1259 OID 44088)
-- Name: ix_pdl_item; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_pdl_item ON erp.purchase_document_lines USING btree (item_id);


--
-- TOC entry 6424 (class 1259 OID 44007)
-- Name: ix_pdoc_supplier; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_pdoc_supplier ON erp.purchase_documents USING btree (company_id, supplier_id, doc_date);


--
-- TOC entry 6425 (class 1259 OID 44008)
-- Name: ix_pdoc_type; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_pdoc_type ON erp.purchase_documents USING btree (company_id, doc_type, status);


--
-- TOC entry 6444 (class 1259 OID 44164)
-- Name: ix_plc_doc; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_plc_doc ON erp.purchase_landed_costs USING btree (document_id);


--
-- TOC entry 6458 (class 1259 OID 44341)
-- Name: ix_pli_lookup; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_pli_lookup ON erp.price_list_items USING btree (price_list_id, item_unit_id, min_qty DESC);


--
-- TOC entry 6520 (class 1259 OID 44924)
-- Name: ix_sal_lines_doc; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sal_lines_doc ON erp.sales_document_lines USING btree (document_id);


--
-- TOC entry 6521 (class 1259 OID 44925)
-- Name: ix_sal_lines_item; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sal_lines_item ON erp.sales_document_lines USING btree (item_id);


--
-- TOC entry 6511 (class 1259 OID 44846)
-- Name: ix_sales_docs_customer; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sales_docs_customer ON erp.sales_documents USING btree (company_id, customer_id, doc_date);


--
-- TOC entry 6512 (class 1259 OID 44848)
-- Name: ix_sales_docs_session; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sales_docs_session ON erp.sales_documents USING btree (pos_session_id) WHERE (pos_session_id IS NOT NULL);


--
-- TOC entry 6513 (class 1259 OID 44847)
-- Name: ix_sales_docs_type; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sales_docs_type ON erp.sales_documents USING btree (company_id, doc_type, status);


--
-- TOC entry 6624 (class 1259 OID 62067)
-- Name: ix_sc_wh_date; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sc_wh_date ON erp.stock_counts USING btree (company_id, warehouse_id, count_date);


--
-- TOC entry 6631 (class 1259 OID 62115)
-- Name: ix_scl_item; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_scl_item ON erp.stock_count_lines USING btree (item_id);


--
-- TOC entry 6385 (class 1259 OID 43521)
-- Name: ix_sdl_item; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sdl_item ON erp.stock_document_lines USING btree (item_id);


--
-- TOC entry 6378 (class 1259 OID 43480)
-- Name: ix_sdoc_date; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sdoc_date ON erp.stock_documents USING btree (company_id, doc_date);


--
-- TOC entry 6526 (class 1259 OID 44952)
-- Name: ix_sdp_doc; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sdp_doc ON erp.sales_document_payments USING btree (document_id);


--
-- TOC entry 6390 (class 1259 OID 43569)
-- Name: ix_sm_card; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sm_card ON erp.stock_movements USING btree (warehouse_id, item_id, id);


--
-- TOC entry 6391 (class 1259 OID 43570)
-- Name: ix_sm_doc; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_sm_doc ON erp.stock_movements USING btree (document_id);


--
-- TOC entry 6411 (class 1259 OID 43810)
-- Name: ix_supplier_ledger_sup; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_supplier_ledger_sup ON erp.supplier_ledger USING btree (supplier_id, entry_date);


--
-- TOC entry 6402 (class 1259 OID 43745)
-- Name: ix_suppliers_account; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_suppliers_account ON erp.suppliers USING btree (account_id);


--
-- TOC entry 6579 (class 1259 OID 45470)
-- Name: ix_user_roles_user; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_user_roles_user ON erp.user_roles USING btree (user_id, company_id);


--
-- TOC entry 6553 (class 1259 OID 45241)
-- Name: ix_va_cust_ledger; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_va_cust_ledger ON erp.voucher_allocations USING btree (customer_ledger_id) WHERE (customer_ledger_id IS NOT NULL);


--
-- TOC entry 6554 (class 1259 OID 45242)
-- Name: ix_va_supp_ledger; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_va_supp_ledger ON erp.voucher_allocations USING btree (supplier_ledger_id) WHERE (supplier_ledger_id IS NOT NULL);


--
-- TOC entry 6541 (class 1259 OID 45133)
-- Name: ix_vch_date; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_vch_date ON erp.financial_vouchers USING btree (company_id, voucher_date);


--
-- TOC entry 6542 (class 1259 OID 45134)
-- Name: ix_vch_status; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_vch_status ON erp.financial_vouchers USING btree (company_id, status, kind);


--
-- TOC entry 6543 (class 1259 OID 45189)
-- Name: ix_vd_account; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_vd_account ON erp.voucher_details USING btree (company_id, account_id);


--
-- TOC entry 6544 (class 1259 OID 45190)
-- Name: ix_vd_customer; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_vd_customer ON erp.voucher_details USING btree (customer_id) WHERE (customer_id IS NOT NULL);


--
-- TOC entry 6545 (class 1259 OID 45191)
-- Name: ix_vd_supplier; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_vd_supplier ON erp.voucher_details USING btree (supplier_id) WHERE (supplier_id IS NOT NULL);


--
-- TOC entry 6546 (class 1259 OID 45188)
-- Name: ix_vd_voucher; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE INDEX ix_vd_voucher ON erp.voucher_details USING btree (voucher_id);


--
-- TOC entry 6561 (class 1259 OID 45357)
-- Name: ux_app_users_username; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_app_users_username ON erp.app_users USING btree (lower((username)::text));


--
-- TOC entry 6600 (class 1259 OID 57544)
-- Name: ux_bank_statement_file_hash; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_bank_statement_file_hash ON erp.bank_statements USING btree (company_id, bank_account_id, source_file_hash) WHERE (source_file_hash IS NOT NULL);


--
-- TOC entry 6270 (class 1259 OID 42709)
-- Name: ux_branches_one_main; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_branches_one_main ON erp.branches USING btree (company_id) WHERE is_main;


--
-- TOC entry 6594 (class 1259 OID 57453)
-- Name: ux_cheques_no; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_cheques_no ON erp.cheques USING btree (company_id, direction, cheque_no, COALESCE(bank_name, ''::character varying));


--
-- TOC entry 6657 (class 1259 OID 62393)
-- Name: ux_dr_branch_month; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_dr_branch_month ON erp.depreciation_runs USING btree (company_id, branch_id, period_end) WHERE (status <> 'reversed'::erp.depreciation_run_status);


--
-- TOC entry 6353 (class 1259 OID 43253)
-- Name: ux_item_units_one_base; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_item_units_one_base ON erp.item_units USING btree (item_id) WHERE is_base;


--
-- TOC entry 6503 (class 1259 OID 44678)
-- Name: ux_pos_one_open_per_cashier; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_pos_one_open_per_cashier ON erp.pos_sessions USING btree (cashier_id) WHERE ((status = 'open'::erp.pos_session_status) AND (cashier_id IS NOT NULL));


--
-- TOC entry 6504 (class 1259 OID 44677)
-- Name: ux_pos_one_open_per_register; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_pos_one_open_per_register ON erp.pos_sessions USING btree (register_id) WHERE (status = 'open'::erp.pos_session_status);


--
-- TOC entry 6457 (class 1259 OID 44307)
-- Name: ux_price_lists_one_default; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_price_lists_one_default ON erp.price_lists USING btree (company_id) WHERE is_default;


--
-- TOC entry 6636 (class 1259 OID 62114)
-- Name: ux_scl_key; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_scl_key ON erp.stock_count_lines USING btree (count_id, item_id, COALESCE(batch_id, (0)::bigint), COALESCE(batch_no, ''::character varying));


--
-- TOC entry 6555 (class 1259 OID 45239)
-- Name: ux_va_detail_cust; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_va_detail_cust ON erp.voucher_allocations USING btree (voucher_detail_id, customer_ledger_id) WHERE (customer_ledger_id IS NOT NULL);


--
-- TOC entry 6556 (class 1259 OID 45240)
-- Name: ux_va_detail_supp; Type: INDEX; Schema: erp; Owner: postgres
--

CREATE UNIQUE INDEX ux_va_detail_supp ON erp.voucher_allocations USING btree (voucher_detail_id, supplier_ledger_id) WHERE (supplier_ledger_id IS NOT NULL);


--
-- TOC entry 7277 (class 2618 OID 62144)
-- Name: v_stock_counts _RETURN; Type: RULE; Schema: erp; Owner: postgres
--

CREATE OR REPLACE VIEW erp.v_stock_counts AS
 SELECT sc.company_id,
    sc.id AS count_id,
    sc.count_no,
    sc.count_date,
    sc.count_type,
    sc.status,
    w.code AS warehouse_code,
    w.name_ar AS warehouse_name,
    count(scl.id) AS lines_total,
    count(scl.counted_qty) AS lines_counted,
    count(*) FILTER (WHERE (scl.diff_qty > (0)::numeric)) AS lines_surplus,
    count(*) FILTER (WHERE (scl.diff_qty < (0)::numeric)) AS lines_shortage,
    COALESCE(sum(COALESCE(scl.diff_value, round((scl.diff_qty * scl.unit_cost), 4))) FILTER (WHERE (scl.diff_qty > (0)::numeric)), (0)::numeric) AS surplus_value,
    COALESCE((- sum(COALESCE(scl.diff_value, round((scl.diff_qty * scl.unit_cost), 4))) FILTER (WHERE (scl.diff_qty < (0)::numeric))), (0)::numeric) AS shortage_value,
    sc.receipt_doc_id,
    sc.issue_doc_id,
    sc.reason
   FROM ((erp.stock_counts sc
     JOIN erp.warehouses w ON ((w.id = sc.warehouse_id)))
     LEFT JOIN erp.stock_count_lines scl ON ((scl.count_id = sc.id)))
  GROUP BY sc.id, w.code, w.name_ar;


--
-- TOC entry 6978 (class 2620 OID 43095)
-- Name: journal_entries ctrg_je_balance; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ctrg_je_balance AFTER INSERT OR UPDATE OF status ON erp.journal_entries DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_balance_guard();


--
-- TOC entry 6985 (class 2620 OID 43093)
-- Name: journal_entry_lines ctrg_jel_balance; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE CONSTRAINT TRIGGER ctrg_jel_balance AFTER INSERT OR DELETE OR UPDATE ON erp.journal_entry_lines DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_balance_guard();


--
-- TOC entry 6967 (class 2620 OID 42896)
-- Name: accounts trg_accounts_subtree; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_accounts_subtree AFTER UPDATE OF parent_id ON erp.accounts FOR EACH ROW WHEN ((old.path IS DISTINCT FROM new.path)) EXECUTE FUNCTION erp.fn_trg_accounts_subtree();


--
-- TOC entry 6968 (class 2620 OID 42895)
-- Name: accounts trg_accounts_tree; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_accounts_tree BEFORE INSERT OR UPDATE ON erp.accounts FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_accounts_tree();


--
-- TOC entry 6969 (class 2620 OID 43100)
-- Name: accounts trg_accounts_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_accounts_updated_at BEFORE UPDATE ON erp.accounts FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7074 (class 2620 OID 45358)
-- Name: app_users trg_app_users_no_delete; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_app_users_no_delete BEFORE DELETE ON erp.app_users FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_deny_change();


--
-- TOC entry 7075 (class 2620 OID 45359)
-- Name: app_users trg_app_users_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_app_users_updated_at BEFORE UPDATE ON erp.app_users FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7084 (class 2620 OID 45511)
-- Name: audit_log trg_audit_log_immutable; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_audit_log_immutable BEFORE DELETE OR UPDATE ON erp.audit_log FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_deny_change();


--
-- TOC entry 7089 (class 2620 OID 57684)
-- Name: bank_statement_lines trg_bank_statement_line_guard; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_bank_statement_line_guard BEFORE INSERT OR DELETE OR UPDATE ON erp.bank_statement_lines FOR EACH ROW EXECUTE FUNCTION erp.bank_statement_line_guard();


--
-- TOC entry 7088 (class 2620 OID 57682)
-- Name: bank_statements trg_bank_statement_status_guard; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_bank_statement_status_guard BEFORE UPDATE ON erp.bank_statements FOR EACH ROW EXECUTE FUNCTION erp.bank_statement_guard_status();


--
-- TOC entry 6960 (class 2620 OID 43099)
-- Name: branches trg_branches_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_branches_updated_at BEFORE UPDATE ON erp.branches FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7085 (class 2620 OID 61948)
-- Name: cheques trg_cheques_guard; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_cheques_guard BEFORE DELETE OR UPDATE ON erp.cheques FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_cheques_guard();


--
-- TOC entry 7086 (class 2620 OID 61949)
-- Name: cheques trg_cheques_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_cheques_updated_at BEFORE UPDATE ON erp.cheques FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 6956 (class 2620 OID 42756)
-- Name: companies trg_companies_base_guard; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_companies_base_guard BEFORE UPDATE OF base_currency_id ON erp.companies FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_company_base_currency();


--
-- TOC entry 6957 (class 2620 OID 42757)
-- Name: companies trg_companies_base_row; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_companies_base_row AFTER INSERT OR UPDATE OF base_currency_id ON erp.companies FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_company_base_currency_row();


--
-- TOC entry 6958 (class 2620 OID 43098)
-- Name: companies trg_companies_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_companies_updated_at BEFORE UPDATE ON erp.companies FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 6975 (class 2620 OID 61957)
-- Name: company_settings trg_company_settings_re; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_company_settings_re BEFORE INSERT OR UPDATE OF retained_earnings_account_id ON erp.company_settings FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_company_settings_re();


--
-- TOC entry 6976 (class 2620 OID 43103)
-- Name: company_settings trg_company_settings_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_company_settings_updated_at BEFORE UPDATE ON erp.company_settings FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 6971 (class 2620 OID 42938)
-- Name: cost_centers trg_cost_centers_subtree; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_cost_centers_subtree AFTER UPDATE OF parent_id ON erp.cost_centers FOR EACH ROW WHEN ((old.path IS DISTINCT FROM new.path)) EXECUTE FUNCTION erp.fn_trg_cost_centers_subtree();


--
-- TOC entry 6972 (class 2620 OID 42937)
-- Name: cost_centers trg_cost_centers_tree; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_cost_centers_tree BEFORE INSERT OR UPDATE ON erp.cost_centers FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_cost_centers_tree();


--
-- TOC entry 6973 (class 2620 OID 43101)
-- Name: cost_centers trg_cost_centers_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_cost_centers_updated_at BEFORE UPDATE ON erp.cost_centers FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7039 (class 2620 OID 44593)
-- Name: customer_ledger trg_customer_ledger_immutable; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_customer_ledger_immutable BEFORE DELETE OR UPDATE ON erp.customer_ledger FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_deny_change();


--
-- TOC entry 7036 (class 2620 OID 44596)
-- Name: customers trg_customers_biu; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_customers_biu BEFORE INSERT OR UPDATE ON erp.customers FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_customers_biu();


--
-- TOC entry 7037 (class 2620 OID 44997)
-- Name: customers trg_customers_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_customers_updated_at BEFORE UPDATE ON erp.customers FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7105 (class 2620 OID 62451)
-- Name: depreciation_lines trg_dl_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_dl_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.depreciation_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_dl_biud();


--
-- TOC entry 7102 (class 2620 OID 62448)
-- Name: depreciation_runs trg_dr_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_dr_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.depreciation_runs FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_dr_biud();


--
-- TOC entry 7098 (class 2620 OID 62444)
-- Name: fixed_assets trg_fa_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_fa_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.fixed_assets FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_fa_biud();


--
-- TOC entry 7099 (class 2620 OID 62445)
-- Name: fixed_assets trg_fa_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_fa_updated_at BEFORE UPDATE ON erp.fixed_assets FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7095 (class 2620 OID 62441)
-- Name: fixed_asset_categories trg_fac_biu; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_fac_biu BEFORE INSERT OR UPDATE ON erp.fixed_asset_categories FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_fac_biu();


--
-- TOC entry 7096 (class 2620 OID 62442)
-- Name: fixed_asset_categories trg_fac_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_fac_updated_at BEFORE UPDATE ON erp.fixed_asset_categories FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7065 (class 2620 OID 45276)
-- Name: financial_vouchers trg_financial_vouchers_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_financial_vouchers_updated_at BEFORE UPDATE ON erp.financial_vouchers FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 6992 (class 2620 OID 43578)
-- Name: item_units trg_item_units_lock; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_item_units_lock BEFORE DELETE OR UPDATE ON erp.item_units FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_item_units_lock();


--
-- TOC entry 6988 (class 2620 OID 43574)
-- Name: items trg_items_base_unit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_items_base_unit AFTER INSERT ON erp.items FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_items_base_unit();


--
-- TOC entry 6989 (class 2620 OID 43576)
-- Name: items trg_items_lock; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_items_lock BEFORE UPDATE ON erp.items FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_items_lock();


--
-- TOC entry 6990 (class 2620 OID 43598)
-- Name: items trg_items_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_items_updated_at BEFORE UPDATE ON erp.items FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 6979 (class 2620 OID 43088)
-- Name: journal_entries trg_je_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_je_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.journal_entries FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_je_biud();


--
-- TOC entry 6986 (class 2620 OID 43090)
-- Name: journal_entry_lines trg_jel_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_jel_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.journal_entry_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_jel_biud();


--
-- TOC entry 6980 (class 2620 OID 43102)
-- Name: journal_entries trg_journal_entries_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_journal_entries_updated_at BEFORE UPDATE ON erp.journal_entries FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7077 (class 2620 OID 45376)
-- Name: user_login_log trg_login_log_immutable; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_login_log_immutable BEFORE DELETE OR UPDATE ON erp.user_login_log FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_deny_change();


--
-- TOC entry 7033 (class 2620 OID 44372)
-- Name: payment_methods trg_payment_methods_account; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_payment_methods_account BEFORE INSERT OR UPDATE OF account_id ON erp.payment_methods FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_payment_methods_account();


--
-- TOC entry 7026 (class 2620 OID 44194)
-- Name: purchase_document_lines trg_pdl_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pdl_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.purchase_document_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_pdl_biud();


--
-- TOC entry 7027 (class 2620 OID 44197)
-- Name: purchase_document_lines trg_pdl_totals; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pdl_totals AFTER INSERT OR DELETE OR UPDATE ON erp.purchase_document_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_pdl_totals();


--
-- TOC entry 7018 (class 2620 OID 44190)
-- Name: purchase_documents trg_pdoc_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pdoc_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.purchase_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_pdoc_biud();


--
-- TOC entry 7019 (class 2620 OID 44192)
-- Name: purchase_documents trg_pdoc_refresh_lines; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pdoc_refresh_lines AFTER UPDATE OF discount_pct, currency_id ON erp.purchase_documents FOR EACH ROW WHEN (((old.discount_pct IS DISTINCT FROM new.discount_pct) OR (old.currency_id IS DISTINCT FROM new.currency_id))) EXECUTE FUNCTION erp.fn_trg_pdoc_refresh_lines();


--
-- TOC entry 7030 (class 2620 OID 44187)
-- Name: purchase_landed_allocations trg_pla_immutable; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pla_immutable BEFORE UPDATE ON erp.purchase_landed_allocations FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_deny_change();


--
-- TOC entry 7028 (class 2620 OID 44184)
-- Name: purchase_landed_costs trg_plc_biu; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_plc_biu BEFORE INSERT OR UPDATE ON erp.purchase_landed_costs FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_plc_biu();


--
-- TOC entry 7029 (class 2620 OID 44186)
-- Name: purchase_landed_costs trg_plc_delete_guard; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_plc_delete_guard BEFORE DELETE ON erp.purchase_landed_costs FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_plc_delete_guard();


--
-- TOC entry 7046 (class 2620 OID 44725)
-- Name: pos_session_cash_counts trg_pos_counts_open; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pos_counts_open BEFORE INSERT OR DELETE OR UPDATE ON erp.pos_session_cash_counts FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_pos_open_only();


--
-- TOC entry 7047 (class 2620 OID 44727)
-- Name: pos_cash_movements trg_pos_moves_immutable; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pos_moves_immutable BEFORE DELETE OR UPDATE ON erp.pos_cash_movements FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_deny_change();


--
-- TOC entry 7048 (class 2620 OID 44726)
-- Name: pos_cash_movements trg_pos_moves_open; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pos_moves_open BEFORE INSERT ON erp.pos_cash_movements FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_pos_open_only();


--
-- TOC entry 7040 (class 2620 OID 44642)
-- Name: pos_registers trg_pos_registers_biu; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pos_registers_biu BEFORE INSERT OR UPDATE ON erp.pos_registers FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_pos_registers_biu();


--
-- TOC entry 7042 (class 2620 OID 44680)
-- Name: pos_sessions trg_pos_sessions_biu; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pos_sessions_biu BEFORE INSERT OR UPDATE ON erp.pos_sessions FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_pos_sessions_biu();


--
-- TOC entry 7011 (class 2620 OID 43899)
-- Name: purchase_requests trg_pr_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_pr_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.purchase_requests FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_pr_biud();


--
-- TOC entry 7017 (class 2620 OID 43901)
-- Name: purchase_request_lines trg_prl_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_prl_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.purchase_request_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_prl_biud();


--
-- TOC entry 7020 (class 2620 OID 44218)
-- Name: purchase_documents trg_purchase_documents_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_purchase_documents_updated_at BEFORE UPDATE ON erp.purchase_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7012 (class 2620 OID 44217)
-- Name: purchase_requests trg_purchase_requests_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_purchase_requests_updated_at BEFORE UPDATE ON erp.purchase_requests FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7050 (class 2620 OID 44955)
-- Name: sales_documents trg_sal_doc_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sal_doc_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.sales_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_sal_doc_biud();


--
-- TOC entry 7051 (class 2620 OID 44957)
-- Name: sales_documents trg_sal_doc_refresh_lines; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sal_doc_refresh_lines AFTER UPDATE OF discount_pct, currency_id ON erp.sales_documents FOR EACH ROW WHEN (((old.discount_pct IS DISTINCT FROM new.discount_pct) OR (old.currency_id IS DISTINCT FROM new.currency_id))) EXECUTE FUNCTION erp.fn_trg_sal_doc_refresh_lines();


--
-- TOC entry 7059 (class 2620 OID 44959)
-- Name: sales_document_lines trg_sal_line_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sal_line_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.sales_document_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_sal_line_biud();


--
-- TOC entry 7060 (class 2620 OID 44962)
-- Name: sales_document_lines trg_sal_line_totals; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sal_line_totals AFTER INSERT OR DELETE OR UPDATE ON erp.sales_document_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_sal_line_totals();


--
-- TOC entry 7062 (class 2620 OID 44964)
-- Name: sales_document_payments trg_sal_pay_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sal_pay_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.sales_document_payments FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_sal_pay_biud();


--
-- TOC entry 7052 (class 2620 OID 44998)
-- Name: sales_documents trg_sales_documents_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sales_documents_updated_at BEFORE UPDATE ON erp.sales_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7090 (class 2620 OID 62151)
-- Name: stock_counts trg_sc_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sc_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.stock_counts FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_sc_biud();


--
-- TOC entry 7091 (class 2620 OID 62152)
-- Name: stock_counts trg_sc_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sc_updated_at BEFORE UPDATE ON erp.stock_counts FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7094 (class 2620 OID 62155)
-- Name: stock_count_lines trg_scl_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_scl_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.stock_count_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_scl_biud();


--
-- TOC entry 7004 (class 2620 OID 43582)
-- Name: stock_document_lines trg_sdl_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sdl_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.stock_document_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_sdl_biud();


--
-- TOC entry 7000 (class 2620 OID 43580)
-- Name: stock_documents trg_sdoc_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sdoc_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.stock_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_sdoc_biud();


--
-- TOC entry 7005 (class 2620 OID 43572)
-- Name: stock_movements trg_sm_immutable; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_sm_immutable BEFORE DELETE OR UPDATE ON erp.stock_movements FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_deny_change();


--
-- TOC entry 6998 (class 2620 OID 43416)
-- Name: stock_balances trg_stock_balances_guard; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_stock_balances_guard BEFORE INSERT OR DELETE OR UPDATE ON erp.stock_balances FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_stock_write_guard();


--
-- TOC entry 6999 (class 2620 OID 43417)
-- Name: stock_batch_balances trg_stock_batch_balances_guard; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_stock_batch_balances_guard BEFORE INSERT OR DELETE OR UPDATE ON erp.stock_batch_balances FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_stock_write_guard();


--
-- TOC entry 7010 (class 2620 OID 43811)
-- Name: supplier_ledger trg_supplier_ledger_immutable; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_supplier_ledger_immutable BEFORE DELETE OR UPDATE ON erp.supplier_ledger FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_deny_change();


--
-- TOC entry 7007 (class 2620 OID 43814)
-- Name: suppliers trg_suppliers_biu; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_suppliers_biu BEFORE INSERT OR UPDATE ON erp.suppliers FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_suppliers_biu();


--
-- TOC entry 7008 (class 2620 OID 44216)
-- Name: suppliers trg_suppliers_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_suppliers_updated_at BEFORE UPDATE ON erp.suppliers FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 7073 (class 2620 OID 45266)
-- Name: voucher_allocations trg_va_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_va_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.voucher_allocations FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_va_biud();


--
-- TOC entry 7066 (class 2620 OID 45260)
-- Name: financial_vouchers trg_vch_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_vch_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.financial_vouchers FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_vch_biud();


--
-- TOC entry 7071 (class 2620 OID 45262)
-- Name: voucher_details trg_vd_biud; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_vd_biud BEFORE INSERT OR DELETE OR UPDATE ON erp.voucher_details FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_vd_biud();


--
-- TOC entry 7072 (class 2620 OID 45264)
-- Name: voucher_details trg_vd_totals; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_vd_totals AFTER INSERT OR DELETE OR UPDATE OF debit_fc, credit_fc ON erp.voucher_details FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_vd_totals();


--
-- TOC entry 7063 (class 2620 OID 45049)
-- Name: voucher_types trg_voucher_types_biu; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_voucher_types_biu BEFORE INSERT OR UPDATE ON erp.voucher_types FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_voucher_types_biu();


--
-- TOC entry 6994 (class 2620 OID 43366)
-- Name: warehouses trg_warehouses_account; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_warehouses_account BEFORE INSERT OR UPDATE OF account_id ON erp.warehouses FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_warehouses_account();


--
-- TOC entry 6995 (class 2620 OID 43599)
-- Name: warehouses trg_warehouses_updated_at; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_warehouses_updated_at BEFORE UPDATE ON erp.warehouses FOR EACH ROW EXECUTE FUNCTION erp.fn_set_updated_at();


--
-- TOC entry 6970 (class 2620 OID 45652)
-- Name: accounts trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.accounts FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7076 (class 2620 OID 45676)
-- Name: app_users trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.app_users FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6961 (class 2620 OID 45646)
-- Name: branches trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.branches FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7087 (class 2620 OID 61950)
-- Name: cheques trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.cheques FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6959 (class 2620 OID 45645)
-- Name: companies trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.companies FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6962 (class 2620 OID 45648)
-- Name: company_currencies trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.company_currencies FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6977 (class 2620 OID 45654)
-- Name: company_settings trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.company_settings FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6974 (class 2620 OID 45653)
-- Name: cost_centers trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.cost_centers FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6955 (class 2620 OID 45647)
-- Name: currencies trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.currencies FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7038 (class 2620 OID 45662)
-- Name: customers trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.customers FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7103 (class 2620 OID 62450)
-- Name: depreciation_runs trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.depreciation_runs FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6963 (class 2620 OID 45649)
-- Name: exchange_rates trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.exchange_rates FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7067 (class 2620 OID 45674)
-- Name: financial_vouchers trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.financial_vouchers FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6965 (class 2620 OID 45651)
-- Name: fiscal_periods trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.fiscal_periods FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6964 (class 2620 OID 45650)
-- Name: fiscal_years trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.fiscal_years FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7097 (class 2620 OID 62443)
-- Name: fixed_asset_categories trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.fixed_asset_categories FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7100 (class 2620 OID 62447)
-- Name: fixed_assets trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.fixed_assets FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6997 (class 2620 OID 45659)
-- Name: inventory_settings trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.inventory_settings FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6993 (class 2620 OID 45657)
-- Name: item_units trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.item_units FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6991 (class 2620 OID 45656)
-- Name: items trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.items FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6981 (class 2620 OID 45669)
-- Name: journal_entries trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.journal_entries FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7034 (class 2620 OID 45666)
-- Name: payment_methods trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.payment_methods FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7041 (class 2620 OID 45667)
-- Name: pos_registers trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.pos_registers FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7043 (class 2620 OID 45675)
-- Name: pos_sessions trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.pos_sessions FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7032 (class 2620 OID 45665)
-- Name: price_list_items trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.price_list_items FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7031 (class 2620 OID 45664)
-- Name: price_lists trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.price_lists FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7021 (class 2620 OID 45672)
-- Name: purchase_documents trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.purchase_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7013 (class 2620 OID 45671)
-- Name: purchase_requests trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.purchase_requests FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7006 (class 2620 OID 45661)
-- Name: purchasing_settings trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.purchasing_settings FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7081 (class 2620 OID 45679)
-- Name: role_limits trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.role_limits FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7080 (class 2620 OID 45678)
-- Name: role_permissions trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.role_permissions FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7079 (class 2620 OID 45677)
-- Name: roles trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.roles FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7053 (class 2620 OID 45673)
-- Name: sales_documents trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.sales_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7035 (class 2620 OID 45663)
-- Name: sales_settings trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.sales_settings FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7078 (class 2620 OID 45682)
-- Name: security_settings trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.security_settings FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7092 (class 2620 OID 62154)
-- Name: stock_counts trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.stock_counts FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7001 (class 2620 OID 45670)
-- Name: stock_documents trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.stock_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7009 (class 2620 OID 45660)
-- Name: suppliers trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.suppliers FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6987 (class 2620 OID 45655)
-- Name: units trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.units FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7083 (class 2620 OID 45681)
-- Name: user_branches trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.user_branches FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7082 (class 2620 OID 45680)
-- Name: user_roles trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.user_roles FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7064 (class 2620 OID 45668)
-- Name: voucher_types trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.voucher_types FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 6996 (class 2620 OID 45658)
-- Name: warehouses trg_zz_audit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_audit AFTER INSERT OR DELETE OR UPDATE ON erp.warehouses FOR EACH ROW EXECUTE FUNCTION erp.fn_audit();


--
-- TOC entry 7061 (class 2620 OID 45643)
-- Name: sales_document_lines trg_zz_discount_limit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_discount_limit BEFORE INSERT OR UPDATE OF discount_pct ON erp.sales_document_lines FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_discount_limit();


--
-- TOC entry 7054 (class 2620 OID 45642)
-- Name: sales_documents trg_zz_discount_limit; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_discount_limit BEFORE INSERT OR UPDATE OF discount_pct ON erp.sales_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_discount_limit();


--
-- TOC entry 7068 (class 2620 OID 45635)
-- Name: financial_vouchers trg_zz_perm; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_perm BEFORE UPDATE OF status ON erp.financial_vouchers FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_require_status_permission();


--
-- TOC entry 6966 (class 2620 OID 45640)
-- Name: fiscal_periods trg_zz_perm; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_perm BEFORE INSERT OR UPDATE OF status ON erp.fiscal_periods FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_require_status_permission();


--
-- TOC entry 6982 (class 2620 OID 45634)
-- Name: journal_entries trg_zz_perm; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_perm BEFORE UPDATE OF status ON erp.journal_entries FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_require_status_permission();


--
-- TOC entry 7044 (class 2620 OID 45639)
-- Name: pos_sessions trg_zz_perm; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_perm BEFORE INSERT OR UPDATE OF status ON erp.pos_sessions FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_require_status_permission();


--
-- TOC entry 7022 (class 2620 OID 45637)
-- Name: purchase_documents trg_zz_perm; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_perm BEFORE UPDATE OF status ON erp.purchase_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_require_status_permission();


--
-- TOC entry 7014 (class 2620 OID 45636)
-- Name: purchase_requests trg_zz_perm; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_perm BEFORE UPDATE OF status ON erp.purchase_requests FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_require_status_permission();


--
-- TOC entry 7055 (class 2620 OID 45638)
-- Name: sales_documents trg_zz_perm; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_perm BEFORE UPDATE OF status ON erp.sales_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_require_status_permission();


--
-- TOC entry 7023 (class 2620 OID 45629)
-- Name: purchase_documents trg_zz_set_approved_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_approved_by BEFORE UPDATE OF status ON erp.purchase_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_approved_by();


--
-- TOC entry 7015 (class 2620 OID 45628)
-- Name: purchase_requests trg_zz_set_approved_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_approved_by BEFORE UPDATE OF status ON erp.purchase_requests FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_approved_by();


--
-- TOC entry 7056 (class 2620 OID 45630)
-- Name: sales_documents trg_zz_set_approved_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_approved_by BEFORE UPDATE OF status ON erp.sales_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_approved_by();


--
-- TOC entry 7045 (class 2620 OID 45631)
-- Name: pos_sessions trg_zz_set_closed_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_closed_by BEFORE UPDATE OF status ON erp.pos_sessions FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_closed_by();


--
-- TOC entry 7104 (class 2620 OID 62449)
-- Name: depreciation_runs trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.depreciation_runs FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7069 (class 2620 OID 45621)
-- Name: financial_vouchers trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.financial_vouchers FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7101 (class 2620 OID 62446)
-- Name: fixed_assets trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.fixed_assets FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 6983 (class 2620 OID 45616)
-- Name: journal_entries trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.journal_entries FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7049 (class 2620 OID 45622)
-- Name: pos_cash_movements trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.pos_cash_movements FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7024 (class 2620 OID 45619)
-- Name: purchase_documents trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.purchase_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7016 (class 2620 OID 45618)
-- Name: purchase_requests trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.purchase_requests FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7057 (class 2620 OID 45620)
-- Name: sales_documents trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.sales_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7093 (class 2620 OID 62153)
-- Name: stock_counts trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.stock_counts FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7002 (class 2620 OID 45617)
-- Name: stock_documents trg_zz_set_created_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_created_by BEFORE INSERT ON erp.stock_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_created_by();


--
-- TOC entry 7070 (class 2620 OID 45627)
-- Name: financial_vouchers trg_zz_set_posted_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_posted_by BEFORE UPDATE OF status ON erp.financial_vouchers FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_posted_by();


--
-- TOC entry 6984 (class 2620 OID 45623)
-- Name: journal_entries trg_zz_set_posted_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_posted_by BEFORE UPDATE OF status ON erp.journal_entries FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_posted_by();


--
-- TOC entry 7025 (class 2620 OID 45625)
-- Name: purchase_documents trg_zz_set_posted_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_posted_by BEFORE UPDATE OF status ON erp.purchase_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_posted_by();


--
-- TOC entry 7058 (class 2620 OID 45626)
-- Name: sales_documents trg_zz_set_posted_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_posted_by BEFORE UPDATE OF status ON erp.sales_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_posted_by();


--
-- TOC entry 7003 (class 2620 OID 45624)
-- Name: stock_documents trg_zz_set_posted_by; Type: TRIGGER; Schema: erp; Owner: postgres
--

CREATE TRIGGER trg_zz_set_posted_by BEFORE UPDATE OF status ON erp.stock_documents FOR EACH ROW EXECUTE FUNCTION erp.fn_trg_set_posted_by();


--
-- TOC entry 6676 (class 2606 OID 42883)
-- Name: account_currencies account_currencies_company_id_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.account_currencies
    ADD CONSTRAINT account_currencies_company_id_account_id_fkey FOREIGN KEY (company_id, account_id) REFERENCES erp.accounts(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6677 (class 2606 OID 42888)
-- Name: account_currencies account_currencies_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.account_currencies
    ADD CONSTRAINT account_currencies_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6673 (class 2606 OID 42868)
-- Name: accounts accounts_company_id_default_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.accounts
    ADD CONSTRAINT accounts_company_id_default_currency_id_fkey FOREIGN KEY (company_id, default_currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6674 (class 2606 OID 42858)
-- Name: accounts accounts_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.accounts
    ADD CONSTRAINT accounts_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6675 (class 2606 OID 42863)
-- Name: accounts accounts_company_id_parent_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.accounts
    ADD CONSTRAINT accounts_company_id_parent_id_fkey FOREIGN KEY (company_id, parent_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6664 (class 2606 OID 42672)
-- Name: activities activities_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.activities
    ADD CONSTRAINT activities_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6886 (class 2606 OID 45352)
-- Name: app_users app_users_default_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.app_users
    ADD CONSTRAINT app_users_default_company_id_fkey FOREIGN KEY (default_company_id) REFERENCES erp.companies(id);


--
-- TOC entry 6897 (class 2606 OID 45503)
-- Name: audit_log audit_log_user_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.audit_log
    ADD CONSTRAINT audit_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES erp.app_users(id);


--
-- TOC entry 6912 (class 2606 OID 57638)
-- Name: bank_reconciliation_matches bank_reconciliation_matches_journal_entry_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliation_matches
    ADD CONSTRAINT bank_reconciliation_matches_journal_entry_line_id_fkey FOREIGN KEY (journal_entry_line_id) REFERENCES erp.journal_entry_lines(id);


--
-- TOC entry 6909 (class 2606 OID 57602)
-- Name: bank_reconciliations bank_reconciliations_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliations
    ADD CONSTRAINT bank_reconciliations_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES erp.currencies(id);


--
-- TOC entry 6905 (class 2606 OID 57528)
-- Name: bank_statements bank_statements_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statements
    ADD CONSTRAINT bank_statements_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id);


--
-- TOC entry 6906 (class 2606 OID 57533)
-- Name: bank_statements bank_statements_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statements
    ADD CONSTRAINT bank_statements_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES erp.currencies(id);


--
-- TOC entry 6665 (class 2606 OID 42704)
-- Name: branches branches_company_id_activity_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.branches
    ADD CONSTRAINT branches_company_id_activity_id_fkey FOREIGN KEY (company_id, activity_id) REFERENCES erp.activities(company_id, id);


--
-- TOC entry 6666 (class 2606 OID 42699)
-- Name: branches branches_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.branches
    ADD CONSTRAINT branches_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6898 (class 2606 OID 57438)
-- Name: cheques cheques_bank_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_bank_account_id_fkey FOREIGN KEY (bank_account_id) REFERENCES erp.accounts(id);


--
-- TOC entry 6899 (class 2606 OID 57418)
-- Name: cheques cheques_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id);


--
-- TOC entry 6900 (class 2606 OID 57428)
-- Name: cheques cheques_customer_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES erp.customers(id);


--
-- TOC entry 6901 (class 2606 OID 57448)
-- Name: cheques cheques_return_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_return_entry_id_fkey FOREIGN KEY (return_entry_id) REFERENCES erp.journal_entries(id);


--
-- TOC entry 6902 (class 2606 OID 57443)
-- Name: cheques cheques_settle_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_settle_entry_id_fkey FOREIGN KEY (settle_entry_id) REFERENCES erp.journal_entries(id);


--
-- TOC entry 6903 (class 2606 OID 57433)
-- Name: cheques cheques_supplier_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_supplier_id_fkey FOREIGN KEY (supplier_id) REFERENCES erp.suppliers(id);


--
-- TOC entry 6904 (class 2606 OID 57423)
-- Name: cheques cheques_voucher_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cheques
    ADD CONSTRAINT cheques_voucher_id_fkey FOREIGN KEY (voucher_id) REFERENCES erp.financial_vouchers(id);


--
-- TOC entry 6663 (class 2606 OID 42651)
-- Name: companies companies_base_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.companies
    ADD CONSTRAINT companies_base_currency_id_fkey FOREIGN KEY (base_currency_id) REFERENCES erp.currencies(id);


--
-- TOC entry 6667 (class 2606 OID 42723)
-- Name: company_currencies company_currencies_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_currencies
    ADD CONSTRAINT company_currencies_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6668 (class 2606 OID 42728)
-- Name: company_currencies company_currencies_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_currencies
    ADD CONSTRAINT company_currencies_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES erp.currencies(id);


--
-- TOC entry 6680 (class 2606 OID 42947)
-- Name: company_settings company_settings_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6681 (class 2606 OID 42952)
-- Name: company_settings company_settings_company_id_fx_realized_gain_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_company_id_fx_realized_gain_account_id_fkey FOREIGN KEY (company_id, fx_realized_gain_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6682 (class 2606 OID 42957)
-- Name: company_settings company_settings_company_id_fx_realized_loss_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_company_id_fx_realized_loss_account_id_fkey FOREIGN KEY (company_id, fx_realized_loss_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6683 (class 2606 OID 42962)
-- Name: company_settings company_settings_company_id_fx_unrealized_gain_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_company_id_fx_unrealized_gain_account_id_fkey FOREIGN KEY (company_id, fx_unrealized_gain_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6684 (class 2606 OID 42967)
-- Name: company_settings company_settings_company_id_fx_unrealized_loss_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_company_id_fx_unrealized_loss_account_id_fkey FOREIGN KEY (company_id, fx_unrealized_loss_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6685 (class 2606 OID 42972)
-- Name: company_settings company_settings_company_id_rounding_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_company_id_rounding_account_id_fkey FOREIGN KEY (company_id, rounding_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6686 (class 2606 OID 61943)
-- Name: company_settings company_settings_notes_pay_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_notes_pay_fkey FOREIGN KEY (company_id, notes_payable_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6687 (class 2606 OID 61938)
-- Name: company_settings company_settings_notes_rec_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_notes_rec_fkey FOREIGN KEY (company_id, notes_receivable_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6688 (class 2606 OID 61952)
-- Name: company_settings company_settings_retained_earnings_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.company_settings
    ADD CONSTRAINT company_settings_retained_earnings_fkey FOREIGN KEY (company_id, retained_earnings_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6678 (class 2606 OID 42923)
-- Name: cost_centers cost_centers_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cost_centers
    ADD CONSTRAINT cost_centers_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6679 (class 2606 OID 42928)
-- Name: cost_centers cost_centers_company_id_parent_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cost_centers
    ADD CONSTRAINT cost_centers_company_id_parent_id_fkey FOREIGN KEY (company_id, parent_id) REFERENCES erp.cost_centers(company_id, id);


--
-- TOC entry 6820 (class 2606 OID 44541)
-- Name: customer_currencies customer_currencies_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_currencies
    ADD CONSTRAINT customer_currencies_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6821 (class 2606 OID 44536)
-- Name: customer_currencies customer_currencies_company_id_customer_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_currencies
    ADD CONSTRAINT customer_currencies_company_id_customer_id_fkey FOREIGN KEY (company_id, customer_id) REFERENCES erp.customers(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6813 (class 2606 OID 44458)
-- Name: customer_groups customer_groups_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_groups
    ADD CONSTRAINT customer_groups_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6822 (class 2606 OID 44587)
-- Name: customer_ledger customer_ledger_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_ledger
    ADD CONSTRAINT customer_ledger_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6823 (class 2606 OID 44577)
-- Name: customer_ledger customer_ledger_company_id_customer_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_ledger
    ADD CONSTRAINT customer_ledger_company_id_customer_id_fkey FOREIGN KEY (company_id, customer_id) REFERENCES erp.customers(company_id, id);


--
-- TOC entry 6824 (class 2606 OID 44582)
-- Name: customer_ledger customer_ledger_company_id_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_ledger
    ADD CONSTRAINT customer_ledger_company_id_journal_entry_id_fkey FOREIGN KEY (company_id, journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6814 (class 2606 OID 44522)
-- Name: customers customers_company_id_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_company_id_account_id_fkey FOREIGN KEY (company_id, account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6815 (class 2606 OID 44507)
-- Name: customers customers_company_id_default_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_company_id_default_currency_id_fkey FOREIGN KEY (company_id, default_currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6816 (class 2606 OID 44497)
-- Name: customers customers_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6817 (class 2606 OID 44502)
-- Name: customers customers_company_id_group_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_company_id_group_id_fkey FOREIGN KEY (company_id, group_id) REFERENCES erp.customer_groups(company_id, id);


--
-- TOC entry 6818 (class 2606 OID 44517)
-- Name: customers customers_company_id_parent_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_company_id_parent_account_id_fkey FOREIGN KEY (company_id, parent_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6819 (class 2606 OID 44512)
-- Name: customers customers_company_id_price_list_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customers
    ADD CONSTRAINT customers_company_id_price_list_id_fkey FOREIGN KEY (company_id, price_list_id) REFERENCES erp.price_lists(company_id, id);


--
-- TOC entry 6945 (class 2606 OID 62363)
-- Name: depreciation_runs depreciation_runs_created_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT depreciation_runs_created_by_fkey FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6946 (class 2606 OID 62368)
-- Name: depreciation_runs depreciation_runs_posted_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT depreciation_runs_posted_by_fkey FOREIGN KEY (posted_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6672 (class 2606 OID 42818)
-- Name: document_sequences document_sequences_company_id_fiscal_year_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.document_sequences
    ADD CONSTRAINT document_sequences_company_id_fiscal_year_id_fkey FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6669 (class 2606 OID 42749)
-- Name: exchange_rates exchange_rates_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.exchange_rates
    ADD CONSTRAINT exchange_rates_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6865 (class 2606 OID 45088)
-- Name: financial_vouchers financial_vouchers_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6866 (class 2606 OID 45128)
-- Name: financial_vouchers financial_vouchers_company_id_cancel_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_cancel_journal_entry_id_fkey FOREIGN KEY (company_id, cancel_journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6867 (class 2606 OID 45118)
-- Name: financial_vouchers financial_vouchers_company_id_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_cost_center_id_fkey FOREIGN KEY (company_id, cost_center_id) REFERENCES erp.cost_centers(company_id, id);


--
-- TOC entry 6868 (class 2606 OID 45108)
-- Name: financial_vouchers financial_vouchers_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6869 (class 2606 OID 45103)
-- Name: financial_vouchers financial_vouchers_company_id_fiscal_period_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_fiscal_period_id_fkey FOREIGN KEY (company_id, fiscal_period_id) REFERENCES erp.fiscal_periods(company_id, id);


--
-- TOC entry 6870 (class 2606 OID 45098)
-- Name: financial_vouchers financial_vouchers_company_id_fiscal_year_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_fiscal_year_id_fkey FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id);


--
-- TOC entry 6871 (class 2606 OID 45123)
-- Name: financial_vouchers financial_vouchers_company_id_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_journal_entry_id_fkey FOREIGN KEY (company_id, journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6872 (class 2606 OID 45113)
-- Name: financial_vouchers financial_vouchers_company_id_treasury_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_treasury_account_id_fkey FOREIGN KEY (company_id, treasury_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6873 (class 2606 OID 45093)
-- Name: financial_vouchers financial_vouchers_company_id_voucher_type_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT financial_vouchers_company_id_voucher_type_id_fkey FOREIGN KEY (company_id, voucher_type_id) REFERENCES erp.voucher_types(company_id, id);


--
-- TOC entry 6671 (class 2606 OID 42803)
-- Name: fiscal_periods fiscal_periods_company_id_fiscal_year_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_periods
    ADD CONSTRAINT fiscal_periods_company_id_fiscal_year_id_fkey FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6670 (class 2606 OID 42776)
-- Name: fiscal_years fiscal_years_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fiscal_years
    ADD CONSTRAINT fiscal_years_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6929 (class 2606 OID 62212)
-- Name: fixed_asset_categories fixed_asset_categories_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT fixed_asset_categories_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6935 (class 2606 OID 62287)
-- Name: fixed_assets fixed_assets_activated_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fixed_assets_activated_by_fkey FOREIGN KEY (activated_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6936 (class 2606 OID 62297)
-- Name: fixed_assets fixed_assets_created_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fixed_assets_created_by_fkey FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6937 (class 2606 OID 62292)
-- Name: fixed_assets fixed_assets_disposed_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fixed_assets_disposed_by_fkey FOREIGN KEY (disposed_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6913 (class 2606 OID 57643)
-- Name: bank_reconciliation_matches fk_bank_match_reconciliation; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliation_matches
    ADD CONSTRAINT fk_bank_match_reconciliation FOREIGN KEY (company_id, reconciliation_id) REFERENCES erp.bank_reconciliations(company_id, id);


--
-- TOC entry 6914 (class 2606 OID 57648)
-- Name: bank_reconciliation_matches fk_bank_match_statement_line; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliation_matches
    ADD CONSTRAINT fk_bank_match_statement_line FOREIGN KEY (company_id, statement_line_id) REFERENCES erp.bank_statement_lines(company_id, id);


--
-- TOC entry 6910 (class 2606 OID 57612)
-- Name: bank_reconciliations fk_bank_reconciliation_account; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliations
    ADD CONSTRAINT fk_bank_reconciliation_account FOREIGN KEY (company_id, bank_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6911 (class 2606 OID 57607)
-- Name: bank_reconciliations fk_bank_reconciliation_statement; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_reconciliations
    ADD CONSTRAINT fk_bank_reconciliation_statement FOREIGN KEY (company_id, statement_id) REFERENCES erp.bank_statements(company_id, id);


--
-- TOC entry 6907 (class 2606 OID 57538)
-- Name: bank_statements fk_bank_statement_account_company; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statements
    ADD CONSTRAINT fk_bank_statement_account_company FOREIGN KEY (company_id, bank_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6908 (class 2606 OID 57571)
-- Name: bank_statement_lines fk_bank_statement_line_statement; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.bank_statement_lines
    ADD CONSTRAINT fk_bank_statement_line_statement FOREIGN KEY (company_id, statement_id) REFERENCES erp.bank_statements(company_id, id);


--
-- TOC entry 6825 (class 2606 OID 45192)
-- Name: customer_ledger fk_cust_ledger_voucher_detail; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.customer_ledger
    ADD CONSTRAINT fk_cust_ledger_voucher_detail FOREIGN KEY (voucher_detail_id) REFERENCES erp.voucher_details(id);


--
-- TOC entry 6951 (class 2606 OID 62429)
-- Name: depreciation_lines fk_dl_acc; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_lines
    ADD CONSTRAINT fk_dl_acc FOREIGN KEY (company_id, accum_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6952 (class 2606 OID 62419)
-- Name: depreciation_lines fk_dl_asset; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_lines
    ADD CONSTRAINT fk_dl_asset FOREIGN KEY (company_id, asset_id) REFERENCES erp.fixed_assets(company_id, id);


--
-- TOC entry 6953 (class 2606 OID 62424)
-- Name: depreciation_lines fk_dl_exp; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_lines
    ADD CONSTRAINT fk_dl_exp FOREIGN KEY (company_id, expense_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6954 (class 2606 OID 62414)
-- Name: depreciation_lines fk_dl_run; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_lines
    ADD CONSTRAINT fk_dl_run FOREIGN KEY (company_id, run_id) REFERENCES erp.depreciation_runs(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6947 (class 2606 OID 62373)
-- Name: depreciation_runs fk_dr_branch; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT fk_dr_branch FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6948 (class 2606 OID 62378)
-- Name: depreciation_runs fk_dr_fy; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT fk_dr_fy FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id);


--
-- TOC entry 6949 (class 2606 OID 62383)
-- Name: depreciation_runs fk_dr_je; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT fk_dr_je FOREIGN KEY (company_id, journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6950 (class 2606 OID 62388)
-- Name: depreciation_runs fk_dr_rev_je; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.depreciation_runs
    ADD CONSTRAINT fk_dr_rev_je FOREIGN KEY (company_id, reversal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6938 (class 2606 OID 62327)
-- Name: fixed_assets fk_fa_acq_je; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fk_fa_acq_je FOREIGN KEY (company_id, acquisition_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6939 (class 2606 OID 62302)
-- Name: fixed_assets fk_fa_branch; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fk_fa_branch FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6940 (class 2606 OID 62307)
-- Name: fixed_assets fk_fa_category; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fk_fa_category FOREIGN KEY (company_id, category_id) REFERENCES erp.fixed_asset_categories(company_id, id);


--
-- TOC entry 6941 (class 2606 OID 62312)
-- Name: fixed_assets fk_fa_cc; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fk_fa_cc FOREIGN KEY (company_id, cost_center_id) REFERENCES erp.cost_centers(company_id, id);


--
-- TOC entry 6942 (class 2606 OID 62317)
-- Name: fixed_assets fk_fa_counter; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fk_fa_counter FOREIGN KEY (company_id, counter_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6943 (class 2606 OID 62322)
-- Name: fixed_assets fk_fa_disp_acc; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fk_fa_disp_acc FOREIGN KEY (company_id, disposal_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6944 (class 2606 OID 62332)
-- Name: fixed_assets fk_fa_disp_je; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_assets
    ADD CONSTRAINT fk_fa_disp_je FOREIGN KEY (company_id, disposal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6930 (class 2606 OID 62222)
-- Name: fixed_asset_categories fk_fac_accum; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT fk_fac_accum FOREIGN KEY (company_id, accum_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6931 (class 2606 OID 62217)
-- Name: fixed_asset_categories fk_fac_cost; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT fk_fac_cost FOREIGN KEY (company_id, cost_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6932 (class 2606 OID 62227)
-- Name: fixed_asset_categories fk_fac_expense; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT fk_fac_expense FOREIGN KEY (company_id, expense_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6933 (class 2606 OID 62232)
-- Name: fixed_asset_categories fk_fac_gain; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT fk_fac_gain FOREIGN KEY (company_id, gain_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6934 (class 2606 OID 62237)
-- Name: fixed_asset_categories fk_fac_loss; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fixed_asset_categories
    ADD CONSTRAINT fk_fac_loss FOREIGN KEY (company_id, loss_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6874 (class 2606 OID 45592)
-- Name: financial_vouchers fk_financial_vouchers_cancelled_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT fk_financial_vouchers_cancelled_by_user FOREIGN KEY (cancelled_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6875 (class 2606 OID 45582)
-- Name: financial_vouchers fk_financial_vouchers_created_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT fk_financial_vouchers_created_by_user FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6876 (class 2606 OID 45587)
-- Name: financial_vouchers fk_financial_vouchers_posted_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.financial_vouchers
    ADD CONSTRAINT fk_financial_vouchers_posted_by_user FOREIGN KEY (posted_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6713 (class 2606 OID 61961)
-- Name: inventory_settings fk_invset_adj_gain; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.inventory_settings
    ADD CONSTRAINT fk_invset_adj_gain FOREIGN KEY (company_id, adjustment_gain_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6714 (class 2606 OID 61966)
-- Name: inventory_settings fk_invset_adj_loss; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.inventory_settings
    ADD CONSTRAINT fk_invset_adj_loss FOREIGN KEY (company_id, adjustment_loss_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6689 (class 2606 OID 45522)
-- Name: journal_entries fk_journal_entries_created_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT fk_journal_entries_created_by_user FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6690 (class 2606 OID 45527)
-- Name: journal_entries fk_journal_entries_posted_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT fk_journal_entries_posted_by_user FOREIGN KEY (posted_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6836 (class 2606 OID 45607)
-- Name: pos_cash_movements fk_pos_cash_movements_created_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_cash_movements
    ADD CONSTRAINT fk_pos_cash_movements_created_by_user FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6831 (class 2606 OID 45597)
-- Name: pos_sessions fk_pos_sessions_cashier_id_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_sessions
    ADD CONSTRAINT fk_pos_sessions_cashier_id_user FOREIGN KEY (cashier_id) REFERENCES erp.app_users(id);


--
-- TOC entry 6832 (class 2606 OID 45602)
-- Name: pos_sessions fk_pos_sessions_closed_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_sessions
    ADD CONSTRAINT fk_pos_sessions_closed_by_user FOREIGN KEY (closed_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6765 (class 2606 OID 45557)
-- Name: purchase_documents fk_purchase_documents_approved_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT fk_purchase_documents_approved_by_user FOREIGN KEY (approved_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6766 (class 2606 OID 45552)
-- Name: purchase_documents fk_purchase_documents_created_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT fk_purchase_documents_created_by_user FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6767 (class 2606 OID 45562)
-- Name: purchase_documents fk_purchase_documents_posted_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT fk_purchase_documents_posted_by_user FOREIGN KEY (posted_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6756 (class 2606 OID 45547)
-- Name: purchase_requests fk_purchase_requests_approved_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_requests
    ADD CONSTRAINT fk_purchase_requests_approved_by_user FOREIGN KEY (approved_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6757 (class 2606 OID 45542)
-- Name: purchase_requests fk_purchase_requests_created_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_requests
    ADD CONSTRAINT fk_purchase_requests_created_by_user FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6838 (class 2606 OID 45572)
-- Name: sales_documents fk_sales_documents_approved_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT fk_sales_documents_approved_by_user FOREIGN KEY (approved_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6839 (class 2606 OID 45567)
-- Name: sales_documents fk_sales_documents_created_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT fk_sales_documents_created_by_user FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6840 (class 2606 OID 45577)
-- Name: sales_documents fk_sales_documents_posted_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT fk_sales_documents_posted_by_user FOREIGN KEY (posted_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6915 (class 2606 OID 62037)
-- Name: stock_counts fk_sc_branch; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT fk_sc_branch FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6916 (class 2606 OID 62052)
-- Name: stock_counts fk_sc_category; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT fk_sc_category FOREIGN KEY (company_id, category_id) REFERENCES erp.item_categories(company_id, id);


--
-- TOC entry 6917 (class 2606 OID 62042)
-- Name: stock_counts fk_sc_fy; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT fk_sc_fy FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id);


--
-- TOC entry 6918 (class 2606 OID 62062)
-- Name: stock_counts fk_sc_issue; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT fk_sc_issue FOREIGN KEY (company_id, issue_doc_id) REFERENCES erp.stock_documents(company_id, id);


--
-- TOC entry 6919 (class 2606 OID 62057)
-- Name: stock_counts fk_sc_receipt; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT fk_sc_receipt FOREIGN KEY (company_id, receipt_doc_id) REFERENCES erp.stock_documents(company_id, id);


--
-- TOC entry 6920 (class 2606 OID 62047)
-- Name: stock_counts fk_sc_warehouse; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT fk_sc_warehouse FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6924 (class 2606 OID 62109)
-- Name: stock_count_lines fk_scl_batch; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_count_lines
    ADD CONSTRAINT fk_scl_batch FOREIGN KEY (item_id, batch_id) REFERENCES erp.item_batches(item_id, id);


--
-- TOC entry 6925 (class 2606 OID 62099)
-- Name: stock_count_lines fk_scl_count; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_count_lines
    ADD CONSTRAINT fk_scl_count FOREIGN KEY (company_id, count_id) REFERENCES erp.stock_counts(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6926 (class 2606 OID 62104)
-- Name: stock_count_lines fk_scl_item; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_count_lines
    ADD CONSTRAINT fk_scl_item FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id);


--
-- TOC entry 6722 (class 2606 OID 45532)
-- Name: stock_documents fk_stock_documents_created_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT fk_stock_documents_created_by_user FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6723 (class 2606 OID 45537)
-- Name: stock_documents fk_stock_documents_posted_by_user; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT fk_stock_documents_posted_by_user FOREIGN KEY (posted_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6752 (class 2606 OID 45197)
-- Name: supplier_ledger fk_supp_ledger_voucher_detail; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_ledger
    ADD CONSTRAINT fk_supp_ledger_voucher_detail FOREIGN KEY (voucher_detail_id) REFERENCES erp.voucher_details(id);


--
-- TOC entry 6715 (class 2606 OID 43355)
-- Name: inventory_settings inventory_settings_company_id_default_cogs_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.inventory_settings
    ADD CONSTRAINT inventory_settings_company_id_default_cogs_account_id_fkey FOREIGN KEY (company_id, default_cogs_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6716 (class 2606 OID 43360)
-- Name: inventory_settings inventory_settings_company_id_default_receipt_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.inventory_settings
    ADD CONSTRAINT inventory_settings_company_id_default_receipt_account_id_fkey FOREIGN KEY (company_id, default_receipt_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6717 (class 2606 OID 43350)
-- Name: inventory_settings inventory_settings_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.inventory_settings
    ADD CONSTRAINT inventory_settings_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6802 (class 2606 OID 44390)
-- Name: item_accounts item_accounts_company_id_cogs_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_accounts
    ADD CONSTRAINT item_accounts_company_id_cogs_account_id_fkey FOREIGN KEY (company_id, cogs_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6803 (class 2606 OID 44380)
-- Name: item_accounts item_accounts_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_accounts
    ADD CONSTRAINT item_accounts_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6804 (class 2606 OID 44385)
-- Name: item_accounts item_accounts_company_id_revenue_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_accounts
    ADD CONSTRAINT item_accounts_company_id_revenue_account_id_fkey FOREIGN KEY (company_id, revenue_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6707 (class 2606 OID 43269)
-- Name: item_barcodes item_barcodes_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_barcodes
    ADD CONSTRAINT item_barcodes_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6708 (class 2606 OID 43274)
-- Name: item_barcodes item_barcodes_item_id_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_barcodes
    ADD CONSTRAINT item_barcodes_item_id_item_unit_id_fkey FOREIGN KEY (item_id, item_unit_id) REFERENCES erp.item_units(item_id, id) ON DELETE CASCADE;


--
-- TOC entry 6709 (class 2606 OID 43299)
-- Name: item_batches item_batches_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_batches
    ADD CONSTRAINT item_batches_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6700 (class 2606 OID 43157)
-- Name: item_categories item_categories_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_categories
    ADD CONSTRAINT item_categories_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6701 (class 2606 OID 43162)
-- Name: item_categories item_categories_company_id_parent_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_categories
    ADD CONSTRAINT item_categories_company_id_parent_id_fkey FOREIGN KEY (company_id, parent_id) REFERENCES erp.item_categories(company_id, id);


--
-- TOC entry 6705 (class 2606 OID 43243)
-- Name: item_units item_units_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_units
    ADD CONSTRAINT item_units_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6706 (class 2606 OID 43248)
-- Name: item_units item_units_company_id_unit_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.item_units
    ADD CONSTRAINT item_units_company_id_unit_id_fkey FOREIGN KEY (company_id, unit_id) REFERENCES erp.units(company_id, id);


--
-- TOC entry 6702 (class 2606 OID 43213)
-- Name: items items_company_id_base_unit_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.items
    ADD CONSTRAINT items_company_id_base_unit_id_fkey FOREIGN KEY (company_id, base_unit_id) REFERENCES erp.units(company_id, id);


--
-- TOC entry 6703 (class 2606 OID 43208)
-- Name: items items_company_id_category_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.items
    ADD CONSTRAINT items_company_id_category_id_fkey FOREIGN KEY (company_id, category_id) REFERENCES erp.item_categories(company_id, id);


--
-- TOC entry 6704 (class 2606 OID 43203)
-- Name: items items_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.items
    ADD CONSTRAINT items_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6691 (class 2606 OID 43009)
-- Name: journal_entries journal_entries_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT journal_entries_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6692 (class 2606 OID 43019)
-- Name: journal_entries journal_entries_company_id_fiscal_period_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT journal_entries_company_id_fiscal_period_id_fkey FOREIGN KEY (company_id, fiscal_period_id) REFERENCES erp.fiscal_periods(company_id, id);


--
-- TOC entry 6693 (class 2606 OID 43014)
-- Name: journal_entries journal_entries_company_id_fiscal_year_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT journal_entries_company_id_fiscal_year_id_fkey FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id);


--
-- TOC entry 6694 (class 2606 OID 43024)
-- Name: journal_entries journal_entries_company_id_reversed_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entries
    ADD CONSTRAINT journal_entries_company_id_reversed_entry_id_fkey FOREIGN KEY (company_id, reversed_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6695 (class 2606 OID 43068)
-- Name: journal_entry_lines journal_entry_lines_company_id_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entry_lines
    ADD CONSTRAINT journal_entry_lines_company_id_account_id_fkey FOREIGN KEY (company_id, account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6696 (class 2606 OID 43073)
-- Name: journal_entry_lines journal_entry_lines_company_id_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entry_lines
    ADD CONSTRAINT journal_entry_lines_company_id_cost_center_id_fkey FOREIGN KEY (company_id, cost_center_id) REFERENCES erp.cost_centers(company_id, id);


--
-- TOC entry 6697 (class 2606 OID 43078)
-- Name: journal_entry_lines journal_entry_lines_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entry_lines
    ADD CONSTRAINT journal_entry_lines_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6698 (class 2606 OID 43063)
-- Name: journal_entry_lines journal_entry_lines_company_id_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.journal_entry_lines
    ADD CONSTRAINT journal_entry_lines_company_id_entry_id_fkey FOREIGN KEY (company_id, entry_id) REFERENCES erp.journal_entries(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6786 (class 2606 OID 44110)
-- Name: landed_cost_types landed_cost_types_company_id_default_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.landed_cost_types
    ADD CONSTRAINT landed_cost_types_company_id_default_account_id_fkey FOREIGN KEY (company_id, default_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6787 (class 2606 OID 44105)
-- Name: landed_cost_types landed_cost_types_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.landed_cost_types
    ADD CONSTRAINT landed_cost_types_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6800 (class 2606 OID 44366)
-- Name: payment_methods payment_methods_company_id_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.payment_methods
    ADD CONSTRAINT payment_methods_company_id_account_id_fkey FOREIGN KEY (company_id, account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6801 (class 2606 OID 44361)
-- Name: payment_methods payment_methods_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.payment_methods
    ADD CONSTRAINT payment_methods_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6837 (class 2606 OID 44719)
-- Name: pos_cash_movements pos_cash_movements_company_id_session_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_cash_movements
    ADD CONSTRAINT pos_cash_movements_company_id_session_id_fkey FOREIGN KEY (company_id, session_id) REFERENCES erp.pos_sessions(company_id, id);


--
-- TOC entry 6826 (class 2606 OID 44621)
-- Name: pos_registers pos_registers_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_registers
    ADD CONSTRAINT pos_registers_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6827 (class 2606 OID 44631)
-- Name: pos_registers pos_registers_company_id_cash_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_registers
    ADD CONSTRAINT pos_registers_company_id_cash_account_id_fkey FOREIGN KEY (company_id, cash_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6828 (class 2606 OID 44636)
-- Name: pos_registers pos_registers_company_id_default_price_list_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_registers
    ADD CONSTRAINT pos_registers_company_id_default_price_list_id_fkey FOREIGN KEY (company_id, default_price_list_id) REFERENCES erp.price_lists(company_id, id);


--
-- TOC entry 6829 (class 2606 OID 44616)
-- Name: pos_registers pos_registers_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_registers
    ADD CONSTRAINT pos_registers_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6830 (class 2606 OID 44626)
-- Name: pos_registers pos_registers_company_id_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_registers
    ADD CONSTRAINT pos_registers_company_id_warehouse_id_fkey FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6835 (class 2606 OID 44697)
-- Name: pos_session_cash_counts pos_session_cash_counts_company_id_session_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_session_cash_counts
    ADD CONSTRAINT pos_session_cash_counts_company_id_session_id_fkey FOREIGN KEY (company_id, session_id) REFERENCES erp.pos_sessions(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6833 (class 2606 OID 44672)
-- Name: pos_sessions pos_sessions_company_id_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_sessions
    ADD CONSTRAINT pos_sessions_company_id_journal_entry_id_fkey FOREIGN KEY (company_id, journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6834 (class 2606 OID 44667)
-- Name: pos_sessions pos_sessions_company_id_register_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.pos_sessions
    ADD CONSTRAINT pos_sessions_company_id_register_id_fkey FOREIGN KEY (company_id, register_id) REFERENCES erp.pos_registers(company_id, id);


--
-- TOC entry 6797 (class 2606 OID 44331)
-- Name: price_list_items price_list_items_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_list_items
    ADD CONSTRAINT price_list_items_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id);


--
-- TOC entry 6798 (class 2606 OID 44326)
-- Name: price_list_items price_list_items_company_id_price_list_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_list_items
    ADD CONSTRAINT price_list_items_company_id_price_list_id_fkey FOREIGN KEY (company_id, price_list_id) REFERENCES erp.price_lists(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6799 (class 2606 OID 44336)
-- Name: price_list_items price_list_items_item_id_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_list_items
    ADD CONSTRAINT price_list_items_item_id_item_unit_id_fkey FOREIGN KEY (item_id, item_unit_id) REFERENCES erp.item_units(item_id, id) ON DELETE CASCADE;


--
-- TOC entry 6795 (class 2606 OID 44302)
-- Name: price_lists price_lists_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_lists
    ADD CONSTRAINT price_lists_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6796 (class 2606 OID 44297)
-- Name: price_lists price_lists_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.price_lists
    ADD CONSTRAINT price_lists_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6779 (class 2606 OID 44067)
-- Name: purchase_document_lines purchase_document_lines_company_id_document_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_company_id_document_id_fkey FOREIGN KEY (company_id, document_id) REFERENCES erp.purchase_documents(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6780 (class 2606 OID 44072)
-- Name: purchase_document_lines purchase_document_lines_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id);


--
-- TOC entry 6781 (class 2606 OID 44082)
-- Name: purchase_document_lines purchase_document_lines_item_id_batch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_item_id_batch_id_fkey FOREIGN KEY (item_id, batch_id) REFERENCES erp.item_batches(item_id, id);


--
-- TOC entry 6782 (class 2606 OID 44077)
-- Name: purchase_document_lines purchase_document_lines_item_id_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_item_id_item_unit_id_fkey FOREIGN KEY (item_id, item_unit_id) REFERENCES erp.item_units(item_id, id);


--
-- TOC entry 6783 (class 2606 OID 44057)
-- Name: purchase_document_lines purchase_document_lines_order_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_order_line_id_fkey FOREIGN KEY (order_line_id) REFERENCES erp.purchase_document_lines(id);


--
-- TOC entry 6784 (class 2606 OID 44052)
-- Name: purchase_document_lines purchase_document_lines_request_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_request_line_id_fkey FOREIGN KEY (request_line_id) REFERENCES erp.purchase_request_lines(id);


--
-- TOC entry 6785 (class 2606 OID 44062)
-- Name: purchase_document_lines purchase_document_lines_source_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_document_lines
    ADD CONSTRAINT purchase_document_lines_source_line_id_fkey FOREIGN KEY (source_line_id) REFERENCES erp.purchase_document_lines(id);


--
-- TOC entry 6768 (class 2606 OID 43952)
-- Name: purchase_documents purchase_documents_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6769 (class 2606 OID 43982)
-- Name: purchase_documents purchase_documents_company_id_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_cost_center_id_fkey FOREIGN KEY (company_id, cost_center_id) REFERENCES erp.cost_centers(company_id, id);


--
-- TOC entry 6770 (class 2606 OID 43972)
-- Name: purchase_documents purchase_documents_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6771 (class 2606 OID 43957)
-- Name: purchase_documents purchase_documents_company_id_fiscal_year_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_fiscal_year_id_fkey FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id);


--
-- TOC entry 6772 (class 2606 OID 43992)
-- Name: purchase_documents purchase_documents_company_id_invoice_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_invoice_id_fkey FOREIGN KEY (company_id, invoice_id) REFERENCES erp.purchase_documents(company_id, id);


--
-- TOC entry 6773 (class 2606 OID 43997)
-- Name: purchase_documents purchase_documents_company_id_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_journal_entry_id_fkey FOREIGN KEY (company_id, journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6774 (class 2606 OID 43987)
-- Name: purchase_documents purchase_documents_company_id_order_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_order_id_fkey FOREIGN KEY (company_id, order_id) REFERENCES erp.purchase_documents(company_id, id);


--
-- TOC entry 6775 (class 2606 OID 43977)
-- Name: purchase_documents purchase_documents_company_id_payment_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_payment_account_id_fkey FOREIGN KEY (company_id, payment_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6776 (class 2606 OID 44002)
-- Name: purchase_documents purchase_documents_company_id_stock_document_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_stock_document_id_fkey FOREIGN KEY (company_id, stock_document_id) REFERENCES erp.stock_documents(company_id, id);


--
-- TOC entry 6777 (class 2606 OID 43962)
-- Name: purchase_documents purchase_documents_company_id_supplier_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_supplier_id_fkey FOREIGN KEY (company_id, supplier_id) REFERENCES erp.suppliers(company_id, id);


--
-- TOC entry 6778 (class 2606 OID 43967)
-- Name: purchase_documents purchase_documents_company_id_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_documents
    ADD CONSTRAINT purchase_documents_company_id_warehouse_id_fkey FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6793 (class 2606 OID 44173)
-- Name: purchase_landed_allocations purchase_landed_allocations_landed_cost_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_allocations
    ADD CONSTRAINT purchase_landed_allocations_landed_cost_id_fkey FOREIGN KEY (landed_cost_id) REFERENCES erp.purchase_landed_costs(id) ON DELETE CASCADE;


--
-- TOC entry 6794 (class 2606 OID 44178)
-- Name: purchase_landed_allocations purchase_landed_allocations_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_allocations
    ADD CONSTRAINT purchase_landed_allocations_line_id_fkey FOREIGN KEY (line_id) REFERENCES erp.purchase_document_lines(id) ON DELETE CASCADE;


--
-- TOC entry 6788 (class 2606 OID 44144)
-- Name: purchase_landed_costs purchase_landed_costs_company_id_cost_type_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_costs
    ADD CONSTRAINT purchase_landed_costs_company_id_cost_type_id_fkey FOREIGN KEY (company_id, cost_type_id) REFERENCES erp.landed_cost_types(company_id, id);


--
-- TOC entry 6789 (class 2606 OID 44159)
-- Name: purchase_landed_costs purchase_landed_costs_company_id_credit_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_costs
    ADD CONSTRAINT purchase_landed_costs_company_id_credit_account_id_fkey FOREIGN KEY (company_id, credit_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6790 (class 2606 OID 44149)
-- Name: purchase_landed_costs purchase_landed_costs_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_costs
    ADD CONSTRAINT purchase_landed_costs_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6791 (class 2606 OID 44139)
-- Name: purchase_landed_costs purchase_landed_costs_company_id_document_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_costs
    ADD CONSTRAINT purchase_landed_costs_company_id_document_id_fkey FOREIGN KEY (company_id, document_id) REFERENCES erp.purchase_documents(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6792 (class 2606 OID 44154)
-- Name: purchase_landed_costs purchase_landed_costs_company_id_payee_supplier_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_landed_costs
    ADD CONSTRAINT purchase_landed_costs_company_id_payee_supplier_id_fkey FOREIGN KEY (company_id, payee_supplier_id) REFERENCES erp.suppliers(company_id, id);


--
-- TOC entry 6761 (class 2606 OID 43883)
-- Name: purchase_request_lines purchase_request_lines_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_request_lines
    ADD CONSTRAINT purchase_request_lines_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id);


--
-- TOC entry 6762 (class 2606 OID 43878)
-- Name: purchase_request_lines purchase_request_lines_company_id_request_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_request_lines
    ADD CONSTRAINT purchase_request_lines_company_id_request_id_fkey FOREIGN KEY (company_id, request_id) REFERENCES erp.purchase_requests(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6763 (class 2606 OID 43893)
-- Name: purchase_request_lines purchase_request_lines_company_id_suggested_supplier_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_request_lines
    ADD CONSTRAINT purchase_request_lines_company_id_suggested_supplier_id_fkey FOREIGN KEY (company_id, suggested_supplier_id) REFERENCES erp.suppliers(company_id, id);


--
-- TOC entry 6764 (class 2606 OID 43888)
-- Name: purchase_request_lines purchase_request_lines_item_id_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_request_lines
    ADD CONSTRAINT purchase_request_lines_item_id_item_unit_id_fkey FOREIGN KEY (item_id, item_unit_id) REFERENCES erp.item_units(item_id, id);


--
-- TOC entry 6758 (class 2606 OID 43840)
-- Name: purchase_requests purchase_requests_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_requests
    ADD CONSTRAINT purchase_requests_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6759 (class 2606 OID 43845)
-- Name: purchase_requests purchase_requests_company_id_fiscal_year_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_requests
    ADD CONSTRAINT purchase_requests_company_id_fiscal_year_id_fkey FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id);


--
-- TOC entry 6760 (class 2606 OID 43850)
-- Name: purchase_requests purchase_requests_company_id_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchase_requests
    ADD CONSTRAINT purchase_requests_company_id_warehouse_id_fkey FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6740 (class 2606 OID 43657)
-- Name: purchasing_settings purchasing_settings_company_id_default_supplier_control_ac_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchasing_settings
    ADD CONSTRAINT purchasing_settings_company_id_default_supplier_control_ac_fkey FOREIGN KEY (company_id, default_supplier_control_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6741 (class 2606 OID 43652)
-- Name: purchasing_settings purchasing_settings_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchasing_settings
    ADD CONSTRAINT purchasing_settings_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6742 (class 2606 OID 43667)
-- Name: purchasing_settings purchasing_settings_company_id_purchase_variance_account_i_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchasing_settings
    ADD CONSTRAINT purchasing_settings_company_id_purchase_variance_account_i_fkey FOREIGN KEY (company_id, purchase_variance_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6743 (class 2606 OID 43662)
-- Name: purchasing_settings purchasing_settings_company_id_vat_input_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.purchasing_settings
    ADD CONSTRAINT purchasing_settings_company_id_vat_input_account_id_fkey FOREIGN KEY (company_id, vat_input_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6892 (class 2606 OID 45447)
-- Name: role_limits role_limits_role_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.role_limits
    ADD CONSTRAINT role_limits_role_id_fkey FOREIGN KEY (role_id) REFERENCES erp.roles(id) ON DELETE CASCADE;


--
-- TOC entry 6890 (class 2606 OID 45433)
-- Name: role_permissions role_permissions_permission_code_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.role_permissions
    ADD CONSTRAINT role_permissions_permission_code_fkey FOREIGN KEY (permission_code) REFERENCES erp.permissions(code);


--
-- TOC entry 6891 (class 2606 OID 45428)
-- Name: role_permissions role_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES erp.roles(id) ON DELETE CASCADE;


--
-- TOC entry 6889 (class 2606 OID 45416)
-- Name: roles roles_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.roles
    ADD CONSTRAINT roles_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6854 (class 2606 OID 44904)
-- Name: sales_document_lines sales_document_lines_company_id_document_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_company_id_document_id_fkey FOREIGN KEY (company_id, document_id) REFERENCES erp.sales_documents(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6855 (class 2606 OID 44909)
-- Name: sales_document_lines sales_document_lines_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id);


--
-- TOC entry 6856 (class 2606 OID 44919)
-- Name: sales_document_lines sales_document_lines_item_id_batch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_item_id_batch_id_fkey FOREIGN KEY (item_id, batch_id) REFERENCES erp.item_batches(item_id, id);


--
-- TOC entry 6857 (class 2606 OID 44914)
-- Name: sales_document_lines sales_document_lines_item_id_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_item_id_item_unit_id_fkey FOREIGN KEY (item_id, item_unit_id) REFERENCES erp.item_units(item_id, id);


--
-- TOC entry 6858 (class 2606 OID 44894)
-- Name: sales_document_lines sales_document_lines_order_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_order_line_id_fkey FOREIGN KEY (order_line_id) REFERENCES erp.sales_document_lines(id);


--
-- TOC entry 6859 (class 2606 OID 44889)
-- Name: sales_document_lines sales_document_lines_quotation_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_quotation_line_id_fkey FOREIGN KEY (quotation_line_id) REFERENCES erp.sales_document_lines(id);


--
-- TOC entry 6860 (class 2606 OID 44899)
-- Name: sales_document_lines sales_document_lines_source_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_lines
    ADD CONSTRAINT sales_document_lines_source_line_id_fkey FOREIGN KEY (source_line_id) REFERENCES erp.sales_document_lines(id);


--
-- TOC entry 6861 (class 2606 OID 44942)
-- Name: sales_document_payments sales_document_payments_company_id_document_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_payments
    ADD CONSTRAINT sales_document_payments_company_id_document_id_fkey FOREIGN KEY (company_id, document_id) REFERENCES erp.sales_documents(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6862 (class 2606 OID 44947)
-- Name: sales_document_payments sales_document_payments_company_id_payment_method_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_document_payments
    ADD CONSTRAINT sales_document_payments_company_id_payment_method_id_fkey FOREIGN KEY (company_id, payment_method_id) REFERENCES erp.payment_methods(company_id, id);


--
-- TOC entry 6841 (class 2606 OID 44781)
-- Name: sales_documents sales_documents_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6842 (class 2606 OID 44811)
-- Name: sales_documents sales_documents_company_id_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_cost_center_id_fkey FOREIGN KEY (company_id, cost_center_id) REFERENCES erp.cost_centers(company_id, id);


--
-- TOC entry 6843 (class 2606 OID 44801)
-- Name: sales_documents sales_documents_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6844 (class 2606 OID 44791)
-- Name: sales_documents sales_documents_company_id_customer_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_customer_id_fkey FOREIGN KEY (company_id, customer_id) REFERENCES erp.customers(company_id, id);


--
-- TOC entry 6845 (class 2606 OID 44786)
-- Name: sales_documents sales_documents_company_id_fiscal_year_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_fiscal_year_id_fkey FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id);


--
-- TOC entry 6846 (class 2606 OID 44831)
-- Name: sales_documents sales_documents_company_id_invoice_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_invoice_id_fkey FOREIGN KEY (company_id, invoice_id) REFERENCES erp.sales_documents(company_id, id);


--
-- TOC entry 6847 (class 2606 OID 44836)
-- Name: sales_documents sales_documents_company_id_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_journal_entry_id_fkey FOREIGN KEY (company_id, journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6848 (class 2606 OID 44826)
-- Name: sales_documents sales_documents_company_id_order_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_order_id_fkey FOREIGN KEY (company_id, order_id) REFERENCES erp.sales_documents(company_id, id);


--
-- TOC entry 6849 (class 2606 OID 44816)
-- Name: sales_documents sales_documents_company_id_pos_session_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_pos_session_id_fkey FOREIGN KEY (company_id, pos_session_id) REFERENCES erp.pos_sessions(company_id, id);


--
-- TOC entry 6850 (class 2606 OID 44806)
-- Name: sales_documents sales_documents_company_id_price_list_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_price_list_id_fkey FOREIGN KEY (company_id, price_list_id) REFERENCES erp.price_lists(company_id, id);


--
-- TOC entry 6851 (class 2606 OID 44821)
-- Name: sales_documents sales_documents_company_id_quotation_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_quotation_id_fkey FOREIGN KEY (company_id, quotation_id) REFERENCES erp.sales_documents(company_id, id);


--
-- TOC entry 6852 (class 2606 OID 44841)
-- Name: sales_documents sales_documents_company_id_stock_document_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_stock_document_id_fkey FOREIGN KEY (company_id, stock_document_id) REFERENCES erp.stock_documents(company_id, id);


--
-- TOC entry 6853 (class 2606 OID 44796)
-- Name: sales_documents sales_documents_company_id_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_documents
    ADD CONSTRAINT sales_documents_company_id_warehouse_id_fkey FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6805 (class 2606 OID 44434)
-- Name: sales_settings sales_settings_company_id_cash_over_short_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_company_id_cash_over_short_account_id_fkey FOREIGN KEY (company_id, cash_over_short_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6806 (class 2606 OID 44419)
-- Name: sales_settings sales_settings_company_id_default_cogs_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_company_id_default_cogs_account_id_fkey FOREIGN KEY (company_id, default_cogs_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6807 (class 2606 OID 44409)
-- Name: sales_settings sales_settings_company_id_default_customer_control_account_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_company_id_default_customer_control_account_fkey FOREIGN KEY (company_id, default_customer_control_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6808 (class 2606 OID 44439)
-- Name: sales_settings sales_settings_company_id_default_price_list_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_company_id_default_price_list_id_fkey FOREIGN KEY (company_id, default_price_list_id) REFERENCES erp.price_lists(company_id, id);


--
-- TOC entry 6809 (class 2606 OID 44414)
-- Name: sales_settings sales_settings_company_id_default_revenue_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_company_id_default_revenue_account_id_fkey FOREIGN KEY (company_id, default_revenue_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6810 (class 2606 OID 44404)
-- Name: sales_settings sales_settings_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6811 (class 2606 OID 44429)
-- Name: sales_settings sales_settings_company_id_sales_returns_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_company_id_sales_returns_account_id_fkey FOREIGN KEY (company_id, sales_returns_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6812 (class 2606 OID 44424)
-- Name: sales_settings sales_settings_company_id_vat_output_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.sales_settings
    ADD CONSTRAINT sales_settings_company_id_vat_output_account_id_fkey FOREIGN KEY (company_id, vat_output_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6888 (class 2606 OID 45385)
-- Name: security_settings security_settings_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.security_settings
    ADD CONSTRAINT security_settings_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6718 (class 2606 OID 43389)
-- Name: stock_balances stock_balances_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_balances
    ADD CONSTRAINT stock_balances_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id);


--
-- TOC entry 6719 (class 2606 OID 43384)
-- Name: stock_balances stock_balances_company_id_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_balances
    ADD CONSTRAINT stock_balances_company_id_warehouse_id_fkey FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6720 (class 2606 OID 43405)
-- Name: stock_batch_balances stock_batch_balances_company_id_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_batch_balances
    ADD CONSTRAINT stock_batch_balances_company_id_warehouse_id_fkey FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6721 (class 2606 OID 43410)
-- Name: stock_batch_balances stock_batch_balances_item_id_batch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_batch_balances
    ADD CONSTRAINT stock_batch_balances_item_id_batch_id_fkey FOREIGN KEY (item_id, batch_id) REFERENCES erp.item_batches(item_id, id);


--
-- TOC entry 6927 (class 2606 OID 62089)
-- Name: stock_count_lines stock_count_lines_counted_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_count_lines
    ADD CONSTRAINT stock_count_lines_counted_by_fkey FOREIGN KEY (counted_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6928 (class 2606 OID 62094)
-- Name: stock_count_lines stock_count_lines_stock_document_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_count_lines
    ADD CONSTRAINT stock_count_lines_stock_document_line_id_fkey FOREIGN KEY (stock_document_line_id) REFERENCES erp.stock_document_lines(id);


--
-- TOC entry 6921 (class 2606 OID 62027)
-- Name: stock_counts stock_counts_approved_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT stock_counts_approved_by_fkey FOREIGN KEY (approved_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6922 (class 2606 OID 62022)
-- Name: stock_counts stock_counts_created_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT stock_counts_created_by_fkey FOREIGN KEY (created_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6923 (class 2606 OID 62032)
-- Name: stock_counts stock_counts_posted_by_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_counts
    ADD CONSTRAINT stock_counts_posted_by_fkey FOREIGN KEY (posted_by) REFERENCES erp.app_users(id);


--
-- TOC entry 6731 (class 2606 OID 43501)
-- Name: stock_document_lines stock_document_lines_company_id_document_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_document_lines
    ADD CONSTRAINT stock_document_lines_company_id_document_id_fkey FOREIGN KEY (company_id, document_id) REFERENCES erp.stock_documents(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6732 (class 2606 OID 43506)
-- Name: stock_document_lines stock_document_lines_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_document_lines
    ADD CONSTRAINT stock_document_lines_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id);


--
-- TOC entry 6733 (class 2606 OID 43516)
-- Name: stock_document_lines stock_document_lines_item_id_batch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_document_lines
    ADD CONSTRAINT stock_document_lines_item_id_batch_id_fkey FOREIGN KEY (item_id, batch_id) REFERENCES erp.item_batches(item_id, id);


--
-- TOC entry 6734 (class 2606 OID 43511)
-- Name: stock_document_lines stock_document_lines_item_id_item_unit_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_document_lines
    ADD CONSTRAINT stock_document_lines_item_id_item_unit_id_fkey FOREIGN KEY (item_id, item_unit_id) REFERENCES erp.item_units(item_id, id);


--
-- TOC entry 6724 (class 2606 OID 43445)
-- Name: stock_documents stock_documents_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6725 (class 2606 OID 43470)
-- Name: stock_documents stock_documents_company_id_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_cost_center_id_fkey FOREIGN KEY (company_id, cost_center_id) REFERENCES erp.cost_centers(company_id, id);


--
-- TOC entry 6726 (class 2606 OID 43465)
-- Name: stock_documents stock_documents_company_id_counter_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_counter_account_id_fkey FOREIGN KEY (company_id, counter_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6727 (class 2606 OID 43450)
-- Name: stock_documents stock_documents_company_id_fiscal_year_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_fiscal_year_id_fkey FOREIGN KEY (company_id, fiscal_year_id) REFERENCES erp.fiscal_years(company_id, id);


--
-- TOC entry 6728 (class 2606 OID 43475)
-- Name: stock_documents stock_documents_company_id_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_journal_entry_id_fkey FOREIGN KEY (company_id, journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6729 (class 2606 OID 43460)
-- Name: stock_documents stock_documents_company_id_to_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_to_warehouse_id_fkey FOREIGN KEY (company_id, to_warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6730 (class 2606 OID 43455)
-- Name: stock_documents stock_documents_company_id_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_documents
    ADD CONSTRAINT stock_documents_company_id_warehouse_id_fkey FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6735 (class 2606 OID 43549)
-- Name: stock_movements stock_movements_company_id_document_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_movements
    ADD CONSTRAINT stock_movements_company_id_document_id_fkey FOREIGN KEY (company_id, document_id) REFERENCES erp.stock_documents(company_id, id);


--
-- TOC entry 6736 (class 2606 OID 43559)
-- Name: stock_movements stock_movements_company_id_item_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_movements
    ADD CONSTRAINT stock_movements_company_id_item_id_fkey FOREIGN KEY (company_id, item_id) REFERENCES erp.items(company_id, id);


--
-- TOC entry 6737 (class 2606 OID 43554)
-- Name: stock_movements stock_movements_company_id_warehouse_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_movements
    ADD CONSTRAINT stock_movements_company_id_warehouse_id_fkey FOREIGN KEY (company_id, warehouse_id) REFERENCES erp.warehouses(company_id, id);


--
-- TOC entry 6738 (class 2606 OID 43564)
-- Name: stock_movements stock_movements_item_id_batch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_movements
    ADD CONSTRAINT stock_movements_item_id_batch_id_fkey FOREIGN KEY (item_id, batch_id) REFERENCES erp.item_batches(item_id, id);


--
-- TOC entry 6739 (class 2606 OID 43544)
-- Name: stock_movements stock_movements_line_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.stock_movements
    ADD CONSTRAINT stock_movements_line_id_fkey FOREIGN KEY (line_id) REFERENCES erp.stock_document_lines(id);


--
-- TOC entry 6750 (class 2606 OID 43759)
-- Name: supplier_currencies supplier_currencies_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_currencies
    ADD CONSTRAINT supplier_currencies_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6751 (class 2606 OID 43754)
-- Name: supplier_currencies supplier_currencies_company_id_supplier_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_currencies
    ADD CONSTRAINT supplier_currencies_company_id_supplier_id_fkey FOREIGN KEY (company_id, supplier_id) REFERENCES erp.suppliers(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6744 (class 2606 OID 43686)
-- Name: supplier_groups supplier_groups_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_groups
    ADD CONSTRAINT supplier_groups_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6753 (class 2606 OID 43805)
-- Name: supplier_ledger supplier_ledger_company_id_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_ledger
    ADD CONSTRAINT supplier_ledger_company_id_currency_id_fkey FOREIGN KEY (company_id, currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6754 (class 2606 OID 43800)
-- Name: supplier_ledger supplier_ledger_company_id_journal_entry_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_ledger
    ADD CONSTRAINT supplier_ledger_company_id_journal_entry_id_fkey FOREIGN KEY (company_id, journal_entry_id) REFERENCES erp.journal_entries(company_id, id);


--
-- TOC entry 6755 (class 2606 OID 43795)
-- Name: supplier_ledger supplier_ledger_company_id_supplier_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.supplier_ledger
    ADD CONSTRAINT supplier_ledger_company_id_supplier_id_fkey FOREIGN KEY (company_id, supplier_id) REFERENCES erp.suppliers(company_id, id);


--
-- TOC entry 6745 (class 2606 OID 43740)
-- Name: suppliers suppliers_company_id_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.suppliers
    ADD CONSTRAINT suppliers_company_id_account_id_fkey FOREIGN KEY (company_id, account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6746 (class 2606 OID 43730)
-- Name: suppliers suppliers_company_id_default_currency_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.suppliers
    ADD CONSTRAINT suppliers_company_id_default_currency_id_fkey FOREIGN KEY (company_id, default_currency_id) REFERENCES erp.company_currencies(company_id, currency_id);


--
-- TOC entry 6747 (class 2606 OID 43720)
-- Name: suppliers suppliers_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.suppliers
    ADD CONSTRAINT suppliers_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6748 (class 2606 OID 43725)
-- Name: suppliers suppliers_company_id_group_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.suppliers
    ADD CONSTRAINT suppliers_company_id_group_id_fkey FOREIGN KEY (company_id, group_id) REFERENCES erp.supplier_groups(company_id, id);


--
-- TOC entry 6749 (class 2606 OID 43735)
-- Name: suppliers suppliers_company_id_parent_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.suppliers
    ADD CONSTRAINT suppliers_company_id_parent_account_id_fkey FOREIGN KEY (company_id, parent_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6699 (class 2606 OID 43138)
-- Name: units units_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.units
    ADD CONSTRAINT units_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6895 (class 2606 OID 45484)
-- Name: user_branches user_branches_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.user_branches
    ADD CONSTRAINT user_branches_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6896 (class 2606 OID 45479)
-- Name: user_branches user_branches_user_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.user_branches
    ADD CONSTRAINT user_branches_user_id_fkey FOREIGN KEY (user_id) REFERENCES erp.app_users(id);


--
-- TOC entry 6887 (class 2606 OID 45370)
-- Name: user_login_log user_login_log_user_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.user_login_log
    ADD CONSTRAINT user_login_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES erp.app_users(id);


--
-- TOC entry 6893 (class 2606 OID 45465)
-- Name: user_roles user_roles_company_id_role_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.user_roles
    ADD CONSTRAINT user_roles_company_id_role_id_fkey FOREIGN KEY (company_id, role_id) REFERENCES erp.roles(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6894 (class 2606 OID 45460)
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES erp.app_users(id);


--
-- TOC entry 6882 (class 2606 OID 45229)
-- Name: voucher_allocations voucher_allocations_company_id_voucher_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_allocations
    ADD CONSTRAINT voucher_allocations_company_id_voucher_id_fkey FOREIGN KEY (company_id, voucher_id) REFERENCES erp.financial_vouchers(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6883 (class 2606 OID 45219)
-- Name: voucher_allocations voucher_allocations_customer_ledger_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_allocations
    ADD CONSTRAINT voucher_allocations_customer_ledger_id_fkey FOREIGN KEY (customer_ledger_id) REFERENCES erp.customer_ledger(id);


--
-- TOC entry 6884 (class 2606 OID 45224)
-- Name: voucher_allocations voucher_allocations_supplier_ledger_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_allocations
    ADD CONSTRAINT voucher_allocations_supplier_ledger_id_fkey FOREIGN KEY (supplier_ledger_id) REFERENCES erp.supplier_ledger(id);


--
-- TOC entry 6885 (class 2606 OID 45234)
-- Name: voucher_allocations voucher_allocations_voucher_id_voucher_detail_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_allocations
    ADD CONSTRAINT voucher_allocations_voucher_id_voucher_detail_id_fkey FOREIGN KEY (voucher_id, voucher_detail_id) REFERENCES erp.voucher_details(voucher_id, id) ON DELETE CASCADE;


--
-- TOC entry 6877 (class 2606 OID 45168)
-- Name: voucher_details voucher_details_company_id_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_details
    ADD CONSTRAINT voucher_details_company_id_account_id_fkey FOREIGN KEY (company_id, account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6878 (class 2606 OID 45173)
-- Name: voucher_details voucher_details_company_id_cost_center_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_details
    ADD CONSTRAINT voucher_details_company_id_cost_center_id_fkey FOREIGN KEY (company_id, cost_center_id) REFERENCES erp.cost_centers(company_id, id);


--
-- TOC entry 6879 (class 2606 OID 45178)
-- Name: voucher_details voucher_details_company_id_customer_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_details
    ADD CONSTRAINT voucher_details_company_id_customer_id_fkey FOREIGN KEY (company_id, customer_id) REFERENCES erp.customers(company_id, id);


--
-- TOC entry 6880 (class 2606 OID 45183)
-- Name: voucher_details voucher_details_company_id_supplier_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_details
    ADD CONSTRAINT voucher_details_company_id_supplier_id_fkey FOREIGN KEY (company_id, supplier_id) REFERENCES erp.suppliers(company_id, id);


--
-- TOC entry 6881 (class 2606 OID 45163)
-- Name: voucher_details voucher_details_company_id_voucher_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_details
    ADD CONSTRAINT voucher_details_company_id_voucher_id_fkey FOREIGN KEY (company_id, voucher_id) REFERENCES erp.financial_vouchers(company_id, id) ON DELETE CASCADE;


--
-- TOC entry 6863 (class 2606 OID 45043)
-- Name: voucher_types voucher_types_company_id_default_treasury_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_types
    ADD CONSTRAINT voucher_types_company_id_default_treasury_account_id_fkey FOREIGN KEY (company_id, default_treasury_account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6864 (class 2606 OID 45038)
-- Name: voucher_types voucher_types_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.voucher_types
    ADD CONSTRAINT voucher_types_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


--
-- TOC entry 6710 (class 2606 OID 43339)
-- Name: warehouses warehouses_company_id_account_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.warehouses
    ADD CONSTRAINT warehouses_company_id_account_id_fkey FOREIGN KEY (company_id, account_id) REFERENCES erp.accounts(company_id, id);


--
-- TOC entry 6711 (class 2606 OID 43334)
-- Name: warehouses warehouses_company_id_branch_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.warehouses
    ADD CONSTRAINT warehouses_company_id_branch_id_fkey FOREIGN KEY (company_id, branch_id) REFERENCES erp.branches(company_id, id);


--
-- TOC entry 6712 (class 2606 OID 43329)
-- Name: warehouses warehouses_company_id_fkey; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.warehouses
    ADD CONSTRAINT warehouses_company_id_fkey FOREIGN KEY (company_id) REFERENCES erp.companies(id) ON DELETE CASCADE;


-- Completed on 2026-11-20 19:44:46

--
-- PostgreSQL database dump complete
--

\unrestrict ZlefVb444ZO611VRzz7rfWcO4D5pULlvAUdkgWUQ6ihhGOSlqaKvyHbvyuF8qdP

