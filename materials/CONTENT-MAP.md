# Purdue Part I content map

All original sections are retained in the app's original-content panels. The full, unchanged HTML is included alongside this file. Labels below distinguish original material from the newly authored AI activities.

Source: https://education.purdue.edu/wp-content/uploads/2026/07/Part-1-Intro-to-R-1.html

Prepared by Yuxiao Zhang; maintained by PUPIL Lab; source update July 2026.

| Original section | App unit | AI-era activity |
| --- | --- | --- |
| 1. Getting Started with R | 1. Why R still matters | Before asking AI, name one thing you must know about a dataset that its column names cannot tell you. |
| 2.1 RStudio interface | 2. Find your way around | Predict where code, numbers, objects, and a histogram will appear. Run the example and compare. |
| 2.2 Basic calculations | 3. Calculate, then predict | Predict all three answers before Run. Then change parentheses in 2 + 3 * 5. |
| 2.3 Assigning variables | 4. Objects and assignment | Change x after creating y. Predict whether y changes automatically. |
| 2.4 Vectors and indexing | 5. Vectors and indexing | Predict numbers[-4] and numbers[numbers > 5]. Ask AI to explain only after making a prediction. |
| 3.1 Working directory | 6. Files and folders | Run list.files("data") and locate the three formats. Explain why a Windows path copied from AI cannot work here. |
| 3.2 Packages and libraries | 7. Packages and libraries | Ask AI for import code and identify which lines install, load, and call functions. |
| 3.3 Reading Excel and SPSS files | 8. Import Excel and SPSS | Compare names, dimensions, and category metadata. Ask AI why Excel numeric codes and SPSS value labels need different handling. |
| 3.4 First look at the data | 9. Inspect before analyzing | Ask AI to propose three data checks. Run them and verify that it used the actual variable names. |
| 3.5 Exploring continuous variables | 10. Summaries and histograms | Predict how changing histogram breaks affects the picture. Ask AI to change one plot feature, then check the axis labels. |
| 3.6 Exploring categorical variables | 11. Counts, labels, missingness | Ask AI to summarize school type. Check whether its counts add to 200, and whether missing cases disappear. |
| 3.7 Using the pipe and selecting rows and columns | 12. Pipes and subsets | Describe the desired subset in words before asking AI for code. Check row count and column names afterward. |
| 3.8 Exercise: create and summarize a subset dataset | 13. Your turn: scores below 400 | Try the task yourself or ask AI for a hint. Do not open the worked answer until you have checked your own result. |
| 3.9 Missing data warning | 14. When valid code misleads | Run the flawed subset. Ask AI why it returns 11 rows when only 8 students have school type 1. Then repair it. |
| 4. Further Learning | 15. Take the workflow with you | Ask AI to review your script for hidden assumptions. Re-run from a fresh session before accepting the review. |
| New optional extension | 16. AI design lab: reveal & revise | Step 1: ask AI to compare posttest scores. Step 2: reveal classroom assignment. Step 3: evaluate and revise. Use the example menu to compare the two analyses. |

## Deliberate adaptations

- RStudio explanations and screenshots remain; added notes distinguish the temporary WebR filesystem from a desktop project.
- The complete original calculations, variables, vectors, index examples, import code, descriptive summaries, plots, pipe/subsetting examples, export examples, subset exercise, and missingness warning remain visible.
- Core browser examples use a CSV export and explicit factor labels, avoiding package downloads. The original readxl/haven calls remain runnable via the example menu after package installation.
- The source's description of vectors as list-like is retained in the original panel; a new check clarifies the distinction between atomic vectors and R lists.
- The below-400 answer is behind the reasoning disclosure / worked example, while the original reading panel also includes the original worked answer. Instructors should ask students to attempt before reading it.
- Missing school types create a separate 197-row object; the original data are not overwritten by the recommended runnable code.
- The optional classroom example is newly simulated, clearly separated from PISA. Its simple corrected comparison respects classroom assignment but does not adjust for pretest. An optional mixed-model discussion is in the instructor guide.

## Data checks

The supplied local PISA_200.sav matches the original page on dimensions, first six rows, Math_Overall summary, gender counts, school type counts/missingness, and the 47-case exercise (mean 350.8397, gender counts 26/21). CSV export retains numeric precision and codes, not SPSS metadata.
