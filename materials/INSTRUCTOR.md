# Instructor notes

## Suggested session

Allow about 108 minutes for the Purdue core, plus discussion/breaks. Use the 20-minute classroom design lab only if there is time or as a later session. These are suggested timings, not a claim about the original workshop's duration.

- Orientation, calculations, objects, vectors: 31 minutes.
- Working directory, packages, import, inspection: 25 minutes.
- Continuous and categorical summaries, pipes/subsets: 24 minutes.
- Below-400 exercise, missing-data critique, further learning: 28 minutes.

For a 90-minute session, assign the RStudio screenshot and package overview as preparation and shorten the AI comparisons. Keep the subset exercise and missing-data critique: they make verification concrete for beginners.

## Preparation

Start R and install import packages on the same network and browser students will use. The CSV path works without extra packages, so a package-download problem need not stop the core session. Keep the original HTML and all-example R script available for desktop RStudio. Check any organization policies before participants use external AI services. Use only the instructional data in prompts.

## Teaching loop in every chapter

Have learners predict or describe a result; ask AI for explanation or a draft; run the code; inspect actual R output; check names, counts, labels, and assumptions; then revise. AI access is optional: built-in examples serve as backup code. Ask students to explain a correction in their own words instead of only presenting a successful output.

The original handout lives inside each lesson's reading panel. Printed outputs there are source references, not live runtime output. The console and plot area show new execution. The lesson menu preserves edits only for the current tab session. Students should download their scripts before refreshing or closing.

## Answer anchors from the source

- Vector c(1,3,5,7,9): sum 25; mean 5; values above 5 are 7 and 9.
- Imported SPSS sample: 200 rows, 7 columns.
- Gender: Female 98, Male 102 under the source coding.
- School type: Private independent 8; Private Government-dependent 1; Public 188; missing 3.
- Math_Overall below 400: 47 observations, mean 350.8397, Female 26 and Male 21.
- `data_demo[flag, ]` with `flag <- data_demo$Sch_Type == 1` returns 11 rows, including 3 unknown rows from NA logical indices.
- `data_demo[!is.na(flag) & flag, ]` returns 8 rows.
- Excluding missing school type creates 197 rows. This edition uses a separate object and does not silently replace the 200-row input.

Ask why the below-400 threshold is useful for practicing selection but not sufficient for an educational intervention decision. Do not interpret this small teaching file as a weighted PISA population estimate. Do not infer missingness mechanisms from a count alone.

## Stanford ARVO comparison

| Dimension | Purdue Part I | ARVO 2026 | This edition |
| --- | --- | --- | --- |
| Starting point | Beginner R and data exploration | AI-generated biomedical analysis | Purdue core with AI activities throughout |
| Main data | 200-case PISA teaching sample | Paired-eye rat EAU data | Original PISA sample; separate simulated classroom extension |
| Learning sequence | R basics → import → summaries → subsets → missingness | Initial code → add context → evaluate → correct | Predict → ask → run → check throughout; optional reveal/revise lab |
| R environment | RStudio instructions | WebR or RStudio, per README | Embedded WebR with desktop fallback |
| Backup | Worked examples and printed results | Backup R code in activity documents | Starter/example menu plus downloaded scripts |

Repository and MIT notice: https://github.com/arvo2026-workshop/arvo2026-workshop

The optional extension uses 12 randomized classrooms and 20 students in each. Let learners critique an independent-student t-test, reveal assignment, and compare classroom means. The base R classroom-level t-test uses six means per condition and makes the assignment unit visible. It does not adjust for pretest and is not a complete prescription for a real study.

For a more advanced desktop extension, discuss a pretest-adjusted random-intercept model:

```r
# Desktop R / optional advanced discussion; not required for Part I.
# install.packages("lme4")
library(lme4)
dat$classroom_id <- factor(dat$classroom_id)
dat$condition <- relevel(factor(dat$condition), ref = "Control")
model <- lmer(posttest_score ~ condition + pretest_score + (1 | classroom_id),
              data = dat, REML = TRUE)
summary(model)
```

With only 12 clusters, examine design, baseline balance, model assumptions, and small-sample inference. A random intercept alone does not guarantee a justified p-value. Students need not learn mixed-model estimation in a beginner Part I session.
