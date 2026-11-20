# Database Review Progress

## 2026-11-20 — Static review follow-up
- Added `database/review_fixes_2026-11-20.sql` on branch `db-review-fixes`.
- Included targeted indexes for ledger journal/voucher/currency references, journal period/reversal, sales/purchase document lookups, line-link lookups, stock movement item/line, vouchers, cheques, POS sessions, and reconciliation matches.
- Replaced `erp.fn_apply_stock_movement` with a guarded version that rejects null/zero quantity before division and rejects null/negative inbound value.
- Added `database/review_fixes_validation.sql` with post-migration index checks and zero/null quantity guard tests.
- No PostgreSQL instance is connected in this session, so migration and SQL tests have **not** been executed. This is not a runtime test report.

## Deferred findings
- Session GUC write guards and `erp.current_user_id` can be spoofed by database users with direct SQL access; needs role/grant architecture and secure definer functions, not a superficial patch.
- Deferred journal balance trigger optimization requires regression/concurrency tests. Kept unchanged.
- Stock lock ordering across all posting functions needs a broader audit before changing multiple posting functions.

## Test steps
1. Restore the current SQL dump to a disposable database.
2. Apply `database/review_fixes_2026-11-20.sql`.
3. Run `database/review_fixes_validation.sql`; it checks the expected indexes and tests zero/null quantity guards.
4. Use valid fixture records in the disposable DB to test positive/negative movements, insufficient stock, negative-stock permission, batch balances, and rollback behavior. Test script comments enumerate the cases.
5. Run accounting, inventory, voucher, cheque, bank-reconciliation, and reversal regression tests.
6. Review query plans and index usefulness with `EXPLAIN (ANALYZE, BUFFERS)` on representative queries before production.

## Safety
- Do not run either file directly on official `BYY1`.
- Migration is proposed and statically reviewed only; production application is blocked until disposable-database testing passes.
