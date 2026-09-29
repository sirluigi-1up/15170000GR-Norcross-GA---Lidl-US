---
name: contract-review-skill
description: Run a clause-by-clause gap analysis of a subcontract or prime contract against the user's standard playbook positions (AIA-based), flag deviations by risk level, and keep the Contract Review Log tab of the Project Control Tracker workbook in sync. Use whenever the user asks to review a contract or subcontract before signing, wants a redline, asks "what's different from our standard terms," or uploads a contract for review. Push to use this any time contract or subcontract review comes up. This is drafting/analysis support only, not legal advice — always say so.
---

# Contract Review Skill

Runs a gap analysis between an actual contract/subcontract and the user's standard positions,
and produces the row for the **Contract Review Log** tab of `Project_Control_Tracker.xlsx`.

**Always state plainly that this is not legal advice** and that a licensed attorney should
review before execution, especially for anything flagged High risk. Never omit this.

## Confirm the project first

Read the **Project Info** tab before drafting anything — it has the project name, number,
owner, architect, GC, and contract dates that belong in this document's header, so you don't
have to ask the user for them each time. If more than one tracker workbook is available in
this conversation or Project, or the request could plausibly apply to more than one project,
ask which project before proceeding — never guess, and never pull or blend rows from two
different projects' trackers into one document.

## Step 1 — establish the playbook

Ask the user for their standard/preferred positions if not already known, on at minimum these
common AIA-adjacent clause categories:
- Indemnification (mutual vs. one-sided, cap level)
- Insurance requirements and additional-insured status
- Payment terms (pay-if-paid vs. pay-when-paid, retainage %, payment timing)
- Notice requirements for claims/delays and their deadlines
- Termination for convenience/cause
- Dispute resolution (mediation/arbitration vs. litigation, venue)
- Limitation of liability / consequential damages waiver
- Warranty period and scope
- Liquidated damages

If the user has a written playbook document, use it verbatim; if not, use what they tell you in
conversation and note in the output that these are the positions as stated, not a formal
company policy document.

## Step 2 — read the contract and compare

Go clause by clause. For each clause category above (and any others the contract actually
addresses), record: the actual language (summarized, not reproduced verbatim at length — this
protects both accuracy and copyright), whether it deviates from the playbook position, and a
risk level.

**Risk level guide**: High = shifts material financial/legal exposure to the user or removes a
protection they rely on (e.g., one-sided uncapped indemnity, pay-if-paid with no carve-out,
short notice periods that are easy to miss). Medium = deviates but with limited exposure or an
available workaround. Low = wording difference with no practical effect.

## Step 3 — draft the redline recommendation

For each deviation, state the specific fallback language or position to propose — not just
"push back on this," but the actual counter-position the user would ask for.

## Output format — always give both pieces

**1. A summary memo**: overall risk assessment, count of High/Medium/Low deviations, and the
3–5 items to prioritize in negotiation.

**2. One tracker row per clause reviewed**, exact column order for **Contract Review Log**:

```
Item #: <sequential number>
Contract / Subcontract: <party/contract name>
Clause Ref: <section number and short name>
Standard Position (Playbook): <the user's position>
Actual Clause (Summary): <paraphrased, not quoted at length>
Deviation?: <Yes / No>
Risk Level: <High / Medium / Low>
Recommended Redline: <specific counter-language or ask>
Status: <Open — default for a fresh review>
Backup Documents: <file name of the actual contract/subcontract being reviewed, plus any
  markup/redline file once one exists>
```

The contract itself is the backup document for every row in this log — record its file name
once, on the first row, so anyone reviewing the log later knows exactly which document these
findings apply to.

## Copyright note

Never reproduce large verbatim blocks of the contract text in the memo or the log — paraphrase
the substance of each clause. Short exact phrases (under ~15 words) in quotes are fine where
precise wording matters (e.g., a specific indemnity trigger phrase).

## Follow-up

If asked for status across a negotiation, read the Contract Review Log, filter to Status = Open
and Risk Level = High, and report those first — that's what actually needs a decision before
signing.


## House style — PSI brand

When a task calls for a formatted document (letter, memo, transmittal, report — not just the
tracker row), match Place Services Inc.'s actual report branding, the same look as the Project
Control Tracker workbook:

- **Logo top-right, red rule below the header.** The PSI logo is NOT a fixed file path — in
  a Claude Project, look for it among the Project's uploaded files (an image named something
  like `psi_logo.png`/`.jpg`, or referenced in another skill/doc in the Project). Use it if
  found. If no logo file is available anywhere in context, don't fabricate one or leave a
  broken image reference — build the document without it, keep the red header rule (`#DA251C`)
  as the visual anchor instead, and tell the person once that a logo file would complete the
  branding if they add one to the Project's files.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (overdue, high risk, a
  required backup document that's missing) — never for decoration or section headers.
- **Light gray (`#EBEBEB`) shading for subtotal/summary rows** in any cost table, matching
  PSI's own cost-breakdown format (a shaded "SUBTOTAL" row, a shaded final total row, a
  markup line before the grand total).
- **Sans-serif throughout**, left-aligned, plain field/value pairs (Label: Value) rather than
  boxed callouts — a clean corporate report style, not a decorative one.
- **Say the status in words, not just color.** Color is a scanning aid, not a substitute for
  stating "Overdue" or "Missing required backup" plainly in the text.
