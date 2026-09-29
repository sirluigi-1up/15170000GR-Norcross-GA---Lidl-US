---
name: subcontractor-co-skill
description: Review change orders SUBMITTED BY a subcontractor for GC approval — check validity against the subcontract, drawings, and specs, and track status (Submitted/Under Review/Approved/Pending/Rejected/Void) against the subcontractor's contract value. Keeps the Subcontractor CO Log tab of the Project Control Tracker workbook in sync. Use whenever the user mentions a sub's change order, cost proposal, or extra they submitted, asks whether a sub's pricing is valid, or wants to know a subcontractor's change order exposure against their contract. This is the reverse direction of the Change Order Skill (which handles GC -> Owner); use this one specifically when a SUB is asking the GC for money.
---

# Subcontractor CO Skill

Reviews a change order a subcontractor submitted, assesses whether it's valid, and keeps the
**Subcontractor CO Log** tab of `Project_Control_Tracker.xlsx` in sync. This is the mirror
image of the Change Order Skill: that one handles the GC pricing something up to the Owner;
this one handles a sub pricing something up to the GC, for the GC to approve, reject, or
push back on.

## Confirm the project first

Read the **Project Info** tab before doing anything. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding.

## Step 1 — gather what the sub submitted

You need: the subcontractor's name and subcontract #, what they're asking for (scope and
dollar amount), and their stated basis (an RFI response, a field condition, a design change).
If the user hasn't given you the sub's actual submission (a quote, an SCO document, an email),
ask for it rather than inventing numbers — validity review requires the real submission.

**Subs should submit on `Subcontractor_Change_Order_Template.xlsx`** (the horizontal, one-page
Excel form). When you're handed a filled copy, read it directly instead of re-asking for
details it already contains, and map it to the Subcontractor CO Log: Subcontractor Name,
Subcontract #, Date Submitted, Related PCO/CO # and RFI #, and Schedule Impact come straight
from the header strips; Amount Requested = the form's TOTAL THIS SUBCONTRACTOR CHANGE ORDER;
Backup Documents = the backup line. Before reviewing validity, sanity-check the form itself: any
red CHECK line (lines with a Total but no Type selected), a markup % that doesn't match the
subcontract, or an Original Subcontract Amount / Prior Approved SCOs that disagrees with your
log — these are worth raising with the sub before anything else. Record your review in the
form's **For GC Use Only** block (Status, Approved Amount, Date Reviewed, Reviewed By, Validity
Assessment) as well as in the log, so the form and the log tell the same story. If a sub sends
a different format (their own quote or a PDF), that's fine — review it the same way and offer
the template for their next submission.

## Step 2 — assess validity

This is the core of the skill. Check the submission against three things, and say explicitly
what you checked each against — don't just render a verdict:

1. **The subcontract** — is this scope actually outside their contracted scope of work? Check
   exclusions/inclusions and the changes-in-work clause. A sub asking to be paid extra for
   something already in their scope is not a valid change order, however good the quote looks.
2. **The drawings** — does the current (or revised) drawing set actually show/require what
   they're claiming as a change? If a Drawing Log is available, check whether the sub is
   pricing against an old revision.
3. **The specifications** — does the spec section covering this trade support their claim of
   added scope, added quality/quantity, or changed method?

If any of the three don't clearly support the claim, say so plainly and specifically (cite the
subcontract clause, drawing number/revision, or spec section) rather than a vague "seems
reasonable." If pricing looks disproportionate to the scope (compare against their own bid unit
costs or the trade's typical range if you have context), flag that too — validity includes
reasonableness of cost, not just entitlement to a change.

## Step 3 — keep the tracker in sync

**Tracker row**, exact column order for **Subcontractor CO Log**:

```
SCO Log #: SCO-LOG-0XX
Date Submitted: <date>
Subcontractor Name: <name>
Subcontract #: <#>
Description: <one line>
Amount Requested ($): <what they asked for>
Schedule Impact Requested (days): <number>
Related Owner PCO/CO #: <if this flows up into a GC-level PCO — link it>
Related RFI #: <if applicable>
Validity Assessment: <your review findings from Step 2 — subcontract clause, drawing/spec
  reference, and a reasonableness note, in a sentence or two>
Status: <Submitted / Under Review / Approved / Pending / Rejected / Void — use the dropdown>
Date Reviewed: <date, once a status decision is made>
Reviewed By: <name/role>
Approved Amount ($): <may differ from what was requested — leave blank until decided>
Backup Documents: <file names — the sub's quote/SCO, any markup/redline>
Backup Required?: <Yes>
```

Running Approved Total (per subcontractor) is a formula — never type over that column. It
tracks cumulative approved SCOs against that specific Subcontract #, which is what tells you
whether a sub's change order exposure is creeping up against their original contract value.

## Step 4 — the decision

Don't set Status to Approved or Rejected yourself unless the user has actually told you the
decision — your job in Step 2 is to give them the information to decide, not to make the call
silently. If the user says "approve it" or "reject it," that's when you set Status and Date
Reviewed. If the validity check turned up real problems, recommend Rejected or Pending (with
what's needed to move it to Approved) rather than defaulting to Approved just because a number
was submitted.

If this SCO becomes the basis for a PCO the GC submits to the Owner, note the resulting PCO/CO #
back on this row (Related Owner PCO/CO #) and tell the user to reference this SCO in that PCO's
Backup Documents — the two logs should trace to each other in both directions.

## Checking the log

If asked about a subcontractor's change order exposure ("how much have we approved for Ace
Tile," "what's pending review"), read the Subcontractor CO Log, filter by Subcontractor Name
or Status as asked, and report the running total against their original Subcontract # value
from Project Info or the sub's contract data if available — a sub creeping toward a large
percentage of their original contract value in change orders is worth flagging even if each
individual SCO looked fine in isolation.

## House style — PSI brand

When a task calls for a formatted document (a validity review memo — not just the plain-text
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
  Reserve PSI red for the header rule, the logo, and genuine flags (Rejected, a validity concern)
  — never for decoration or section headers.
- **Sans-serif throughout**, left-aligned, plain field/value pairs (Label: Value) rather than
  boxed callouts — a clean corporate report style, not a decorative one.
- **Say the status in words, not just color.** Color is a scanning aid, not a substitute for
  stating "Not supported by current drawing revision" plainly in the text.
