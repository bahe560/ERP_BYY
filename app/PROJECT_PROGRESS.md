# Project Progress — ERP BYY Web App

## 2026-11-20
- Inspected repository metadata and existing `BYY_Claude.sql` database dump.
- Created isolated branch `app-foundation`.
- Added initial FastAPI backend foundation with PostgreSQL connection, `erp.authenticate` login integration, signed bearer tokens, user context per transaction, health endpoint, and initial dashboard/account endpoints.
- Added Arabic RTL responsive web shell and login screen.
- Added environment template and Windows launcher.

## Limitations / not yet validated
- The code has not been run against a local database in this environment.
- Account endpoint schema and company/account column names must be confirmed against the live dump before integration testing.
- JWT secret and database credentials must be set locally.
- This is a development scaffold; security hardening, permission checks per endpoint, session revocation, password reset, company/branch selection, tests, and accounting modules remain pending.
- Never connect this scaffold to the official BYY1 database during initial testing.

## Next
1. Inspect table definitions for companies, accounts, and user/role security.
2. Fix API SQL to match the exact schema.
3. Add tests and safe dev database setup instructions.
4. Implement company selection, dashboard data, chart of accounts CRUD, then journal entry workflow.
