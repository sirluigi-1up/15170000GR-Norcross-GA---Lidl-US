---
name: material-tracker-skill
description: Log and track material/equipment procurement — order status from Not Ordered through Received, PO numbers, expected delivery, lead times, vendor contacts, and overdue-delivery flagging — keeping the Material Tracker tab of the Project Control Tracker workbook in sync. Build a procurement responsibility matrix from drawings and specs, and generate a procurement report as Excel on any cadence. Use whenever the user mentions materials, procurement, purchase orders, POs, ordering equipment/fixtures, long-lead items, lead times, vendors, asks "what's on order" / "what's overdue" / "what haven't we ordered yet," or wants a procurement report. Push to use this any time procurement tracking comes up.
---

# Material Tracker Skill

Logs material and equipment orders and produces the row for the **Material Tracker** tab of
`Project_Control_Tracker.xlsx`. This is a tracking skill first, not a drafting skill — most
requests are "add this to the tracker" or "what's the status of X," not a formal document.

## Confirm the project first

Read the **Project Info** tab before logging anything — it has Project Name and Job Number,
which belong at the top of the Material Tracker. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding.

## Logging a new material to track

Required inputs: supplier/vendor, description of the item, priority (High/Medium/Low — ask if
unclear rather than defaulting silently, since priority drives what gets chased first), and
order status. If the item depends on an approved submittal before it can be ordered (common for
finish materials, fixtures, and anything with a shop-drawing step), say so and link the
Submittal # — don't log it as simply "Not Ordered" with no explanation when the real blocker is
an open submittal.

**Tracker row**, exact column order for **Material Tracker**:

```
Material #: MAT-0XX
Supplier / Vendor: <name>
Description: <item>
Responsible Person: <name/role — who owns this in the responsibility matrix>
Priority: <High / Medium / Low>
Order Status: <Not Ordered / Ordered / Partially Received / Received / On Hold / Cancelled>
PO / Order #: <once ordered>
Date Ordered: <date>
Expected Delivery: <date — Date Ordered + Lead Time is a reasonable default if not given
  directly>
Date Received: (leave blank until received)
Linked Submittal #: <if the order depends on an approved submittal>
Notes / Next Action: <e.g. "long-lead — confirm weekly", or what's blocking it>
Backup Documents: <file names — vendor quote, PO, packing slip once received>
Backup Required?: <Yes for anything with real cost attached; No for trivial/incidental items>
Lead Time (days): <from vendor quote/PO, or ask if pricing a long-lead item>
Vendor Contact: <name, email, phone — whoever actually answers when you need a status update>
```

Flag is a formula — never type over that column. It auto-marks OVERDUE when Expected Delivery
has passed with no Date Received and status isn't Cancelled.

## Building from drawings and specs — the responsibility matrix

When asked to build out procurement tracking for a scope (not just log one item), read the
drawings and specifications to identify long-lead equipment and materials, and check each
against the **Submittal Log** — most equipment/material with a real lead time also has a
submittal that needs approval before ordering. For each item, work out: what it is, which
spec section governs it, who's responsible for ordering it (GC direct, or which sub), and
whether a submittal needs to clear first. This is the responsibility matrix — present it as a
table (Item, Spec Section, Responsible Party, Submittal Dependency, Estimated Lead Time) before
converting entries into tracker rows, so the user can correct any misassigned responsibility
before it's logged.

## Updating status

When the user reports a status change (ordered, received, delayed), give the update
instruction rather than redrafting: "In Material Tracker, row for MAT-0XX: set **Order
Status**, **PO / Order #** / **Date Ordered** / **Date Received** as applicable." If a High
priority item is moving to Partially Received or is running late, flag whether this affects the
schedule — cross-check the **3-Week Look-Ahead** tab if available, since a delayed long-lead
item is exactly the kind of thing that belongs in that look-ahead.

## Status checks

If asked "what's on order," "what's overdue," or "what haven't we ordered yet," read the
Material Tracker and group by Order Status. Lead with:
1. Flag = OVERDUE (a delivery promise already missed)
2. Priority = High and Status = Not Ordered (the highest-risk backlog — not yet moving)
3. Everything else, briefly

Don't just report counts — name the specific items so the user can act, the same way the RFI
and Submittal skills surface specific overdue numbers rather than just a tally.

## Procurement report (Excel, any cadence)

When asked for a procurement report — daily, weekly, or "give me the current status," whatever
cadence the user names — generate a standalone `.xlsx` file, not just a copy of the tracker
tab, covering **every material/equipment item regardless of status**, sorted OVERDUE first,
then High priority + Not Ordered, then everything else.

Structure:
- Header block: Project Name/Job Number (from Project Info), report title "Procurement
  Report", the date (and range if the cadence implies one), and the PSI logo/red rule per
  house style.
- One table: Material #, Description, Priority, Order Status, Expected Delivery, Lead Time,
  Vendor Contact — OVERDUE rows shaded in PSI red per house style.
- A summary line above the table: count by Order Status, count of OVERDUE.

Save it as `Procurement_Report_<YYYY-MM-DD>.xlsx` and tell the person it's ready — Claude
doesn't have the ability to actually email or deliver it to a distribution list, so hand it off
as a file for them to send, and offer to draft the accompanying email if useful.

## House style — PSI brand

When a task calls for a formatted document (a procurement status memo — not just the plain-text
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
  Reserve PSI red for the header rule, the logo, and genuine flags (OVERDUE deliveries, High
  priority + Not Ordered) — never for decoration or section headers.
- **Sans-serif throughout**, left-aligned, plain field/value pairs (Label: Value) rather than
  boxed callouts — a clean corporate report style, not a decorative one.
- **Say the status in words, not just color.** Color is a scanning aid, not a substitute for
  stating "Overdue since 9/30" plainly in the text.
