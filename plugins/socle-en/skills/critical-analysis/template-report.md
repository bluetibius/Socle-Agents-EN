# Shared critical report template

Used by `critical-analysis` and `post-work-verification`. Adapt the length to
the verified material; no page or finding quota.

## Evidence and assessment

Each finding carries a stable identifier (for example SEC-01, LOG-01,
QUAL-01, UX-01, OPS-01), a title, axis, affected scope/version,
evidence status (measured, inferred or to confirm), impact and its conditions,
locatable evidence (file and lines at the commit read, dated request, log
or redacted screenshot), a recommendation and an observable closure criterion.
A hypothesis does not become a confirmed vulnerability. A search without
results does not prove absence throughout the product.

Separate severity from treatment order: critical, major, moderate or minor
according to impact and exposure; P0 to P3 according to urgency and dependencies.
Explain the classification, particularly any P0. Present a visual preference
as such; a financial or security risk specifies its scenario.

Every metric gives its source, method and scope. Test volume is not coverage;
code found is not a feature exercised. Scores per axis are optional: if used,
explain the scale and evidence supporting the judgement, without false
precision or a score for an unverified axis. A numerical comparison requires
comparable methods and scopes. Never invent a measurement, check or screenshot.

## Report composition

1. **Cover and dashboard**: product, author, date and time zone, report type,
   scope, commit/tag read, freshness, observed or unknown served states;
   assessment of the five axes and a reasoned overall verdict.
2. **Decision summary**: dominant risks, strengths, major limitations and
   proposed decisions. Distinguish blockers within scope from a judgement on
   the whole product.
3. **Findings by axis**: identified entries following the evidence contract
   above. Reference the same identifiers in the summary and tables.
4. **Proposed plan**: P0 to P3, identifier, action, dependencies, estimated effort
   with uncertainty, closure criterion. Do not assign a date or owner without
   a decision.
5. **Method, sources and limitations**: surfaces read and samples, commands
   actually executed, results and failures, checks not performed and why.
   For a gate, use the evidence from `verification-and-done`.

For post-work verification, insert the before/after matrix defined by
`post-work-verification` after the summary; replace the initial roadmap with
remaining work and new risks. Preserve references to the original report
without rewriting it.

## PDF

Reuse the visual conventions of provided examples where useful: concise cover,
hierarchical sections, readable tables, consistent colours by severity,
pagination and evidence appendices. Keep a readable font and sufficient
contrast; colour alone does not carry meaning. A long table repeats its
headers and does not cut off its content.

Use available PDF production tools; no dependency on a proprietary service,
extension or font. Render the PDF then inspect its pages, particularly tables
and section endings; fix overflow, overlaps, missing glyphs, blank pages and
awkward breaks. Also verify text extraction, identifiers and references.
If the rendering cannot be inspected, state that limitation; do not claim a
successful visual check. If generation is unavailable, deliver an exportable
source outside the project and explicitly state that the requested PDF remains
to be produced.

The final PDF stands on its own: no essential evidence only in chat or a
temporary file. Redact secrets and personal data, including screenshots and
metadata. Provide a link to the deliverable.
