# Database Review Progress

## 2026-11-20 — Static review follow-up
- Added `database/review_fixes_2026-11-20.sql` on branch `db-review-fixes`.
- Included idempotent targeted indexes for ledger journal/voucher/currency references, journal period/reversal, sales/purchase document lookups, line-link lookups, stock movement item/line, vouchers, cheques, POS sessions, and reconciliation matches.
- Replaced `erp.fn_apply_stock_movement` with a guarded version that rejects null/zero quantity before division and rejects null/negative inbound value.
- No database execution or integration tests were run: this branch contains a proposed migration only.

## Deferred findings
- Session GUC write guards and `erp.current_user_id` can be spoofed by database users with direct SQL access; needs role/grant architecture and secure definer functions, not a superficial patch.
- Deferred journal balance trigger optimization requires regression/concurrency tests. Kept unchanged.
- Stock lock ordering across all posting functions needs a broader audit before changing multiple posting functions.

## Validation needed before applying
1. Restore the current SQL dump to a disposable database.
2. Run the patch in that database.
3. Verify all indexes exist and no duplicate/invalid indexes were created.
4. Test stock movement with positive, negative, zero, null, and insufficient stock.
5. Run accounting, inventory, voucher, and reversal regression tests.
6. Only then consider production migration.
