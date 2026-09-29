---
name: subcontractor-contract-skill
description: Develop specific, locked (non-quantified) scopes of work for subcontracts from the drawings, and review a subcontractor's redlines to the GC's subcontract while protecting flow-down obligations owed to the Owner. Use whenever the user is preparing a subcontract scope of work, reviewing a sub's proposed changes/redlines to a subcontract, or asks what flow-down language needs to be in a sub's contract. Push to use this any time subcontract drafting or redline review comes up.
---

# Subcontractor Contract Skill

Two related jobs: (1) build a specific scope of work for a trade from the actual drawings,
locked in scope but not quantified (no unit counts/quantities — those belong in the sub's
pricing, not the scope description), and (2) review what a subcontractor pushes back on in
your subcontract, checking every proposed change against what the Owner Contract requires you
to flow down.

## Confirm the project first

Read the **Project Info** tab before doing anything. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding.

## Step 1 — building a scope of work from drawings

Read the actual drawing set (or the relevant sheets) for the trade in question. Build the scope
as a **specific, locked description of work** — what the sub is responsible for, sheet by sheet
and system by system — without quantities. "Locked" means precise enough that there's no
ambiguity about what's included versus excluded (so it can't be argued later that something
wasn't in scope), but expressed as scope, not as a bill of quantities:

- Right: "Furnish and install all cast-in-place concrete foundations, footings, and slabs-on-
  grade shown on S-100 through S-108, including formwork, reinforcing per the structural
  general notes, and finishing per Spec Section 03 3000."
- Wrong (unlocked/ambiguous): "Concrete work as needed."
- Wrong (quantified — not this skill's job): "450 CY of concrete foundations."

Cross-reference the **Specification Log** for the governing spec sections and pull closeout/
submittal obligations into the scope explicitly (e.g., "submittals per Spec 03 3000 required
prior to placement"). Note drawing revision numbers the scope is based on (from the **Drawing
Log**) so it's clear which issuance the scope locks to — if drawings are revised later, the
scope may need a corresponding subcontract change order, not a silent scope drift.

List explicit **inclusions and exclusions** — exclusions matter as much as inclusions for
avoiding later disputes. If the **Other Contract Documents Skill** has flagged geotech or
environmental risk items relevant to this trade, fold the resulting exclusions (e.g., "excludes
remediation of unsuitable soil beyond that anticipated in the geotechnical report") into this
scope.

## Step 2 — reviewing a sub's redlines

When a subcontractor proposes changes to your subcontract, check every redline against two
things:

1. **The Owner Contract Key Terms / flow-down requirements.** Many GC-to-Owner obligations must
   flow down to subs by contract (insurance minimums, indemnification standards, notice
   procedures, retainage terms, dispute resolution, warranty periods, safety requirements). If a
   sub's redline weakens a flow-down term below what the Owner Contract requires the GC to
   impose, that redline creates a gap the GC would have to absorb — flag it as unacceptable as
   redlined, and propose the specific fallback language that satisfies both the sub's concern
   and the flow-down obligation, if one exists.
2. **Reasonableness on its own terms.** Even redlines that don't touch flow-down obligations may
   still shift risk unfairly (payment terms, change order procedures, termination rights). Flag
   these too, with the practical risk explained plainly, same as the Owner Contract Skill does
   for prime contract review.

For each redline: quote the original clause (briefly, under 15 words per the standard copyright
limits), describe what the sub changed, state whether it conflicts with a flow-down requirement
(citing the Owner Contract section it flows from), and give a specific recommended response —
accept, reject, or counter-language.

State plainly that this is contract analysis support, not legal advice, and a licensed attorney
should review before execution, especially for anything flagged as conflicting with a flow-down
obligation.

## Output

For a scope of work: a clean, sheet-referenced scope document ready to attach as a subcontract
exhibit, with inclusions/exclusions clearly separated.

For a redline review: a clause-by-clause table (Clause, Sub's Change, Flow-Down Conflict?,
Recommendation) followed by a short summary of the highest-priority items to resolve before
signing.

## House style — PSI brand

When producing a formatted document, match Place Services Inc.'s actual report branding, the
same look as the Project Control Tracker workbook:

- **Logo top-right, red rule below the header.** The PSI logo is NOT a fixed file path — in
  a Claude Project, look for it among the Project's uploaded files (an image named something
  like `psi_logo.png`/`.jpg`, or referenced in another skill/doc in the Project). Use it if
  found. If no logo file is available anywhere in context, don't fabricate one or leave a
  broken image reference — build the document without it, keep the red header rule (`#DA251C`)
  as the visual anchor instead, and tell the person once that a logo file would complete the
  branding if they add one to the Project's files.
- **Near-black ink (`#1A1A1A`) for all headings and body text**, white background throughout.
  Reserve PSI red for the header rule, the logo, and genuine flags (a flow-down conflict) —
  never for decoration or section headers.
- **Sans-serif throughout**, left-aligned, plain field/value pairs rather than boxed callouts.
- **Cite specifically** — every scope item cites its drawing sheet/revision; every flow-down
  flag cites the Owner Contract section it comes from.
