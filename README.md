# PUPIL Lab — R & AI Workshop

A static, publishable edition of **Part I: Introduction to R and Data Exploration** by Yuxiao Zhang, maintained by PUPIL Lab (source handout updated July 2026).

## Open the workshop

- Open `index.html` to read the course. The course, editor, prompts, and embedded input files are in this one HTML file.
- For reliable R execution, serve the complete folder over HTTP/HTTPS. If Node.js is installed, run `node serve.cjs` in this folder, then open http://127.0.0.1:4173.
- Or use any static web server. Some browsers block WebR when an HTML file is opened directly through `file://`.

The first Run downloads WebR 0.6.0 from https://webr.r-wasm.org/v0.6.0/. Internet access and a modern browser with WebAssembly, Workers, and OffscreenCanvas are required. Core exercises use base R. Import packages (`readxl` and `haven`) are installed on demand from the WebR repository, using the Packages control. A slow first run is normal. A failed download is reported with retry instructions.

## Publish with GitHub Pages

1. Create a GitHub repository and upload the **contents of this folder**, keeping `index.html` at its root and keeping the data, materials, and licenses folders.
2. In repository Settings → Pages, choose Deploy from a branch, then select the branch and `/ (root)` folder.
3. Open the Pages URL GitHub provides. No build step, backend, secret, or API key is required.
4. Before the workshop, run a calculation, histogram, and original SPSS/Excel import on the actual teaching network.

The page uses WebR's `PostMessage` channel so it does not need cross-origin isolation headers. Since that channel cannot interrupt an individual R command, Restart R closes the worker and clears the R session. It restores the supplied files on the next Run. Do not use `readline()`, `browser()`, interactive desktop dialogs, or desktop-only package installation workflows here.

## What is included

- 15 core learning units preserving every original Part I section, including original explanations, code, printed outputs, screenshots, plots, and learning links.
- Integrated AI prompts, prediction tasks, verification notes, and runnable examples in each unit.
- A 16th, optional classroom design lab extending the earlier prototype and crediting the Stanford ARVO 2026 pattern.
- An editable R textarea, Run, console, plot rendering and PNG downloads, example chooser, reset, restart, script download, import package installation, and R file export.
- ChatGPT, Claude, Gemini, and Copilot launch links. Prompts are copied manually and are not automatically submitted. Students use their own accounts; no key is stored or requested.
- Original PISA teaching files in Excel and SPSS plus a numeric CSV export, and a separate simulated classroom CSV.
- Original HTML handout, all example R code, an instructor guide, content mapping, and attribution.

## Session behavior

`data_demo` starts as the PISA CSV export. `dat` is the simulated classroom dataset. The original SPSS example replaces `data_demo` with a labelled tibble, which the base R exercises also accept. Switching lessons preserves editor and prompt edits in this browser tab, but the R session is shared: code can change its objects. Restart R restores the data. The missing-data lesson deliberately creates `data_complete_school` instead of overwriting the original data.

Edits and R objects are **not saved after closing or refreshing**. Download scripts and R-generated files before leaving. The console stores the latest text for each lesson during the tab session; plots are cleared when switching lessons. There is no autosave, login, analytics, grading, or server upload.

Files written with `write.csv()` or `write_sav()` remain in the browser R filesystem until you use **Export R file**. This is separate from downloading the editor's script.

## Data provenance and editing

See `ATTRIBUTION.md` and `materials/CONTENT-MAP.md`. The original PISA demo files were located in the user's existing `2025 Fall_Workshop 2` materials; their dimensions, first rows, score summary, category counts, missingness, and below-400 answer match the requested Purdue Part I handout. They are instructional demonstration data. Do not treat the practice exercises as a full PISA population analysis or as a validated student-support decision rule.

To edit the app, change its embedded `course-data` JSON, stylesheet, or final script in `index.html`. If changing bundled data, update both the downloadable file and its base64 entry in `course-data.files` so the browser runtime uses the same version. There are no application package dependencies to install.

The workshop is published at https://xiyu-w.github.io/pupil-ai-r-workshop/. This folder is the matching static distribution.


## Teaching Mode (September 2026 update)

The three areas are Lesson, R Workspace, and AI Learning Assistant. The built-in assistant is explicitly labelled **curated guided practice**, not a generative model. No AI API key, backend, or paid AI call is included. Free-text goals are included in an optional context handoff; the local guide does not interpret arbitrary questions.

Four help actions progress through hint, reasoning, starter code, and an explicitly requested full example. Suggestions never run automatically. Run records actual code, text output, and a limited session-structure snapshot; edited code, other lesson runs, and R restarts make previous results stale. Automatic notices cover the numeric Gender mean/table and the missing-score challenge. They do not interpret arbitrary code or plots.

The missing-data challenge uses a separate challenge_data object with three injected NA values. The original Math_Overall has no missing scores. External AI links are secondary; Prepare current teaching context includes the lesson, codebook, current code, last run, stage and learner question for review and copying. Nothing is sent automatically.

A conversational in-page generative AI assistant remains a separate backend integration. Keep API keys on a server; do not add a secret to this public HTML.
