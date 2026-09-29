---
name: owner-contract-skill
description: Review, redline, and give constructive feedback on an Owner Contract of ANY delivery method (AIA Lump Sum, GMP, Design-Build, IPD, ConsensusDocs, EJCDC, or custom) — extract and summarize key terms (milestones, retainage/GMP/target cost, payment, closeout, change order requirements, submission timelines, delay/notice requirements); generate weekly contract-deadline reminders; and keep the Owner Contract Key Terms tab of the Project Control Tracker workbook in sync. Use whenever the user mentions the owner contract, prime contract, contract review, redline, retainage, GMP, design-build, IPD, payment terms, closeout requirements, or asks what the contract requires for something. Push to use this any time owner-contract analysis or summarization comes up.
---

# Owner Contract Skill

Reads the actual executed (or draft) Owner Contract and turns it into usable project-control
information: a plain-language summary, specific answers about what it requires, redline
feedback if reviewing a draft, and a populated **Owner Contract Key Terms** tab.

**This skill is only as good as the contract you give it, and it is NOT AIA-only.** The tracker's
defaults reference AIA A201 because it's the most common single reference point, but plenty of
real projects run on something else entirely — GMP agreements, Design-Build, IPD, ConsensusDocs,
EJCDC, or a fully custom Lump Sum contract with its own defined terms and section numbers. Never
assume AIA structure, section numbers, or terminology apply just because that's this skill's
fallback reference. Always extract from the actual document in front of you, identify its real
form first (Step 0), and flag plainly whenever it differs from the generic placeholder.

## Confirm the project first

Read the **Project Info** tab before doing anything. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding. If no Owner Contract has been provided yet, ask for it — don't extract terms from
assumption.

## Step 0 — identify the actual contract form

Before extracting anything, determine what you're actually looking at and record it in the
Owner Contract Key Terms tab's **Contract Form** field. Common forms and what changes about how
you read them:

- **AIA Lump Sum (A101/A201)** — the tracker's fallback reference; General Conditions
  (A201) modified by Supplementary Conditions and exhibits.
- **AIA GMP/CMc (A102/A133)** — adds a Guaranteed Maximum Price, Cost of the Work definition,
  Contractor's Fee, and usually a Savings/Shared Savings clause — extract the GMP amount and
  savings split explicitly, not just a lump sum.
- **Design-Build (DBIA or custom)** — single point of responsibility for design AND
  construction; look for Basis of Design documents, design standard-of-care language, and how
  design liability/E&O is handled — there is no separate Architect party to route RFIs to in
  the traditional sense.
- **IPD (multi-party agreement)** — Owner, Designer, and Contractor (and often key trades) on
  one agreement; look for a shared risk/reward pool, Target Cost (not GMP), waivers of liability
  between the signing parties, and joint decision-making structures — traditional notice/claim
  mechanics between GC and Owner often don't apply the same way.
- **ConsensusDocs (200/500 series) / EJCDC** — different base forms with their own numbering;
  read them on their own terms the same way you would AIA, don't map their sections onto AIA
  section numbers.
- **Custom/manuscript Lump Sum** — a GC- or Owner-drafted contract with no standard base form.
  Extract entirely from what's written; there's no fallback structure to lean on at all here.

If the form is ambiguous or the user hasn't said, ask, or state your best read of it from the
document's own language and ask for confirmation — getting this wrong at the start skews every
extraction that follows.

## Step 1 — read the whole document, not just the parts you're asked about

Owner contracts cross-reference themselves constantly (General Conditions modified by
Supplementary Conditions, further modified by exhibits). Before answering any specific question
or populating the Key Terms tab, check for a Supplementary Conditions section and any exhibits
that amend the base terms — a term stated in the General Conditions can be completely rewritten
three pages later. Cite the actual section/exhibit you pulled each answer from.

## Step 2 — extract Key Terms

Populate (or update) the **Owner Contract Key Terms** tab from the actual contract: Contract
Form (from Step 0), Retainage (labor and stored materials, and the reduction trigger — for a
GMP contract also note the GMP amount and any Savings/Shared Savings split; for IPD, the Target
Cost and risk pool structure instead of retainage as such if that's how the agreement is
structured), Payment Application due date and payment terms, Change Order notice/pricing
deadline, Claim notice deadline, Delay notice deadline, Submittal review turnaround, Closeout
submission deadline and requirements, Liquidated damages rate, Insurance requirements summary,
Dispute resolution method, Termination for convenience notice period. For each field, replace
the generic placeholder with the actual contract's term, using that contract's own section/
article numbering and terminology (don't force AIA section numbers onto a ConsensusDocs or
custom contract). If a field genuinely isn't addressed, or doesn't apply to this contract's
structure (e.g. "retainage" may not be the right concept for an IPD risk pool), say so
explicitly rather than leaving the placeholder silently in place — a silent default looks like
it was verified when it wasn't.

Also update the **Contract Milestones** tab and **Project Info** contract fields (Contract Type
/ Delivery Method, Contract Date, NTP, Substantial Completion) if this is the first time the
contract has been read into the tracker, or if they're wrong.

## Step 3 — summaries and specific answers

When asked for a summary, a milestone list, a retainage summary, closeout requirements, payment
requirements, change order requirements, submission timelines, or delay requirements — answer
from the Key Terms extraction (Step 2) plus direct citation to the contract section, not a
generic AIA description. Structure a full summary as: Parties & Contract Sum → Schedule &
Milestones → Payment Terms → Retainage → Change Order Procedure → Notice Requirements (claims,
delay) → Submittal/Submission Timelines → Closeout Requirements → Insurance & Bonds → Dispute
Resolution → Termination.

## Step 4 — review, redline, and feedback

When asked to review a contract (before signing, or a draft with proposed changes): go
clause-by-clause looking for terms that create outsized risk — one-sided indemnification, unfair
retainage, ambiguous notice mechanics (how notice must be delivered, to whom), unlimited
liability, pay-if-paid conditions to subs that don't match how the GC gets paid, no-damage-for-
delay clauses, unilateral change/termination rights. For each concern: cite the exact clause,
explain the practical risk in plain language, and propose specific counter-language — not just
"this seems risky."

Watch for delivery-method-specific risk too: on a **GMP** contract, how "Cost of the Work" is
defined and what's excluded from it matters as much as the GMP number itself; on **Design-Build**,
check where design liability actually sits and whether the standard of care is clearly stated;
on **IPD**, check the liability waiver's scope — a waiver that's supposed to be mutual among all
signing parties but is drafted one-sided defeats the point of the delivery method.

State plainly that this is contract analysis support, not legal advice, and that a licensed
attorney should review before execution, especially for anything flagged high risk.

## Weekly contract reminders

When asked for contract-deadline reminders (or on a recurring "weekly" cadence if the user has
set one up), read the Key Terms and Contract Milestones tabs and surface anything with a
deadline inside the next 14 days — a payment application due date, an upcoming milestone, a
closeout submission window opening. This is a plain-language list, not a formal report, unless
the user asks for it as one.

## House style — PSI brand

When a task calls for a formatted document (a contract summary memo, redline feedback — not
just a plain-text answer), match Place Services Inc.'s actual report branding, the same look as
the Project Control Tracker workbook:

- **Logo top-right, red rule below the header.** The PSI logo is NOT a fixed file path — in
  a Claude Project, look for it among the Project's uploaded files (an image named something
  like `psi_logo.png`/`.jpg`, or referenced in another skill/doc in the Project). Use it if
  found. If no logo file is available anywhere in context, don't fabricate one or leave a
  broken image reference — build the document without it, keep the red header rule (`#DA251C`)
  as the visual anchor instead, and tell the person once that a logo file would complete the
  branding if they add one to the Project's files.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (a high-risk clause, a missed
  deadline) — never for decoration or section headers.
- **Sans-serif throughout**, left-aligned, plain field/value pairs (Label: Value) rather than
  boxed callouts — a clean corporate report style, not a decorative one.
- **Cite specifically.** Every extracted term or flagged risk names the section/exhibit it came
  from — a summary with no citations isn't verifiable and isn't useful.
