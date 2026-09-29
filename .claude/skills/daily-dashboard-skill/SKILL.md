---
name: daily-dashboard-skill
description: Export the Dashboard tab of the Project Control Tracker as a clean, single-page PDF for daily distribution, and read out the Stale Items (no activity in 14+ days) list directly in chat. Use whenever the user asks for "today's dashboard," "the daily PDF," "send out the dashboard," or asks what's gone stale/quiet. This replaces separate daily RFI/Submittal report exports — the Dashboard is the one daily artifact.
---

# Daily Dashboard Skill

Produces the single daily artifact for this project: the Dashboard tab, exported as a clean
one-page PDF, ready to send to a distribution list. There is no separate daily RFI report,
daily submittal report, or other per-log daily export — everything that matters daily rolls up
into this one page, including a **Stale Items** section that flags anything with no recorded
activity in 14+ days.

## Confirm the project first

Read the **Project Info** tab before doing anything. If more than one tracker workbook is
available, or the request could apply to more than one project, ask which project before
proceeding.

## Producing the PDF

1. Make sure the workbook reflects today's data — if the person has given you updates this
   session that haven't been saved into the tracker yet, get those saved first.
2. Recalculate the workbook so every formula (including Last Activity Date / Days Since
   Activity, and every Dashboard rollup) reflects current values — don't export stale cached
   numbers. If a recalculation tool is available in this environment, use it before exporting.
3. Export the **Dashboard** tab specifically as a PDF — not the whole workbook. The tab is
   already built to fit one printed page (portrait, fit-to-height). If your tooling exports the
   full workbook, extract just the Dashboard's page(s) rather than handing over a 20-tab PDF.
4. Name the file `Daily_Dashboard_<Project Number>_<YYYY-MM-DD>.pdf` and present it.

If you're not sure the export actually looks right — logo present, nothing clipped, Stale Items
section fully visible and not cut off by a print-area boundary — render it and check before
handing it over. A dashboard that's supposed to go out daily needs to actually look right every
time, not just usually.

## Reading out Stale Items

Always say, in chat, what the Stale Items section shows — don't make the person open the PDF to
find out. For anything non-zero, name it: "2 RFIs and 1 Change Order have had no activity in 14+
days" — and if asked, or if the count is more than a couple, identify which specific items (by
#) rather than just the count, the same way the other Skills surface specifics rather than just
tallies. A stale item isn't necessarily a problem — it might just mean nothing's needed right
now — but it's exactly the kind of thing that's easy to lose track of without a system flagging
it, which is the point of this section.

## What this replaces

If asked for "today's RFI report" or "the daily submittal report," redirect to this — those
standalone exports no longer exist. The Dashboard already contains the relevant counts, and a
person who wants the full detail behind a specific log's numbers can just ask for it directly
("what RFIs are open") rather than needing a separate file. Weekly reports (Change Order,
Claims, Risk, Permit review, Procurement) are unaffected by this — those still exist as their
own Skills' outputs; only the daily, per-log exports were replaced by this single dashboard.

## House style — PSI brand

- **Logo top-right, red rule below the header.** The PSI logo is NOT a fixed file path — in
  a Claude Project, look for it among the Project's uploaded files (an image named something
  like `psi_logo.png`/`.jpg`, or referenced in another skill/doc in the Project). Use it if
  found. If no logo file is available anywhere in context, don't fabricate one or leave a
  broken image reference — export without it, keep the red header rule (`#DA251C`) as the
  visual anchor instead, and tell the person once that a logo file would complete the branding
  if they add one to the Project's files.
- **Near-black ink (`#1A1A1A`)** for all labels and values, white background. PSI red is used
  only where the Dashboard itself already uses it — non-zero alert counts and Stale Items — not
  added anywhere else.
- **One page.** If a future addition to the Dashboard makes it overflow a single printed page,
  say so rather than silently shipping a clipped PDF — the print area needs to grow with it.
