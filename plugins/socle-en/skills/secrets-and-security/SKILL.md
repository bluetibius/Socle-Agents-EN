---
name: secrets-and-security
description: Everyday secrets and security — what never leaves, entry points and their guards, SSRF, local interfaces, redacted logs, privacy (mobile included), loosening a control, backups. Load before writing a report, a commit or a log that could contain a secret or personal data, and before touching authentication, permissions, outgoing requests or data collection.
---

# Secrets and security

## What never leaves

No secret, full token, cookie, session or personal data in: a repository, a
URL, a log, a report, an output, a commit message.

- We **count**, **mask** or **hash** instead of quoting.
- `.env.example` (or equivalent) keeps its secrets empty.
- Negative tests use artificial values.
- No copy of production data on a development workstation.

## Surfaces

- Inventory critical API surfaces; authenticate and authorise what must be;
  restrict by network or IP where relevant.
- Preserve legitimate machine-to-machine flows with a dedicated identity or
  token.
- A public endpoint is not a vulnerability because it is public.
- Security invariants do not become freely editable through an administration
  interface.

## Entry points

Each kind of entry has **its** guard, and a structural test checks that every
route carries one:

| Entry | Guard |
|---|---|
| HTML page | session |
| read JSON | session, JSON response (no redirect) |
| write JSON | session + CSRF protection |
| scheduled task | service token or secret, **in a header**, never in the URL |
| command line | refused outside the CLI |

- Write actions in an administration console require a second-factor session;
  reading and machine paths do not depend on it.
- Access decided at two levels when the product provides for it: a right
  granted by the identity service **and** a local authorisation.
- A public client (installed application, third-party integration) has no
  secret: a `client_secret` in its repository is a blocking defect.
- An OAuth redirect is exact and declared per environment; never a test address
  declared in production.
- A service does not read another's tables: it goes through its contract (OIDC,
  API, events).

## Outgoing requests and local interfaces

- SSRF policy: any URL supplied by a caller is refused towards private and local
  ranges; do not weaken it. Never a host, command or URL coming from a caller:
  only a path under a declared target.
- A local interface (agent, workstation tool) listens on `127.0.0.1`, never
  `0.0.0.0`, and checks `Host`, `Origin`, `Sec-Fetch-Site` and `Content-Type`
  before any routing, without CORS.
- A client never executes what the server sends back.
- An automated agent never bypasses 2FA, CAPTCHA or a security check: it hands
  back to the human.
- Attachments and uploads: outside the web root, bounded types and sizes. The
  web root is strictly the public folder.

## Logs and storage

- The log goes through redaction: no cookie, token, password, raw HTML or
  personal identifier. A command written to the log never carries a secret.
- Tokens verified server-side are stored **hashed**; a workstation secret lives
  in the system keychain, not in a file.
- One secret per product and per environment; rotation with the previous secret
  accepted during the transition.
- Private logs (restricted permissions), rotated.

## Privacy

- Collect the minimum; no identifying data survives aggregation when it is not
  needed.
- Mobile: no device or subscriber identifier (IMEI, IMSI, phone number,
  advertising identifier…) read or sent; permissions requested at the moment of
  use, never in bulk; refusing breaks nothing; no background collection without
  an explicit session; private zones applied before writing to disk.
- Diagnostic exports and field logs: never in the repository, nor in a ticket
  without review.
- A development build that talks to production says so and uploads nothing
  from testing by accident.

## Loosening a control

Any loosening of a security control is a **regression**: it requires a test
that justifies it and an entry in the version history. A behaviour change in a
security library is reported to every product that took it on.

## Audits

Current findings live in the security audit the profile designates. Work that
is not about security does not restart an audit: it passes on what it sees.

## Backups

The reference is the hosting provider's backup for what it hosts. Do not claim
a database is covered without having measured it. An HTTP 200 code is not proof
that a backup succeeded.
