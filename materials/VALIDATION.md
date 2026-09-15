# Validation — 10 September 2026

## Completed

- JavaScript syntax and embedded course JSON validated.
- All 16 units have reading, runnable code, an AI activity, a prompt, and a reasoning check.
- All original Purdue subsections are represented; the unchanged full handout is also included.
- Embedded runtime data checked byte-for-byte against downloadable files.
- Local download and documentation links checked for existing targets.
- Local HTTP preview returned 200.
- WebR 0.6.0, using the same PostMessage communication mode as the page, executed 21 starter/optional core examples, including the deliberate name-error exercise.
- Verified the 200-by-7 input; 47-case below-400 subset and mean; 11-row flawed versus 8-row corrected private-school subset; 197-row school-type-complete object; and 12 classroom means in the optional extension.
- Exported CSV bytes were nonempty.
- WebR installed readxl and haven, then successfully ran all three package-dependent example groups, including both original file imports and SPSS labelled categories.
- R plotting commands executed using a PDF graphics device during the Node runtime tests.

## Limits of these checks

These are runtime and static checks, not a full browser interaction or visual test. Browser canvas rendering, clipboard permissions, mobile layout, assistant account flows, and GitHub Pages deployment have not been end-to-end tested. Before a live workshop, open the hosted page on the teaching network and run the histogram plus Excel/SPSS examples. The external WebR CDN and package repository must be reachable. A desktop Node loader workaround was used only in the Windows test harness; it is not part of the browser application or distributable.


## September 2026 Teaching Mode update

Validated with actual WebR 0.6.0: Gender mean 1.51; counts 98/102; factor example execution; stale/warning notice suppression; three injected challenge NA values; a finite corrected mean; unchanged 200-row original with zero missing Math_Overall scores; R error capture. Checked all 16 lessons across four actions and four reveal stages, plus generated-page JavaScript and local file references. Browser visual/interaction QA was not performed for this update. No generative AI backend is connected.
