# PUPIL Part I: AI-assisted edition
# Run from the complete workshop folder in desktop RStudio.
# data_demo starts from the CSV export (numeric category codes).
data_demo <- read.csv("data/PISA_200.csv")
dat <- read.csv("data/education_workshop_data.csv")

# Why R still matters
# Run real R in your browser. No RStudio installation needed.
2 + 3
R.version.string
# A script records your steps; the output alone does not.
scores <- c(65, 72, 81)
mean(scores)



# Find your way around
score <- 85
score
ls()
hist(c(65,72,81,85,90), main="Our first plot", xlab="Score", col="#CFB991")



# Calculate, then predict
2 + 3
3 * 5
8 / 2
2 + 3 * 5
(2 + 3) * 5



# Objects and assignment
x <- 5
x
y <- x + 3
y
x <- 10
y

# Optional: Debug a name mismatch
# Intentional error exercise:
score <- 85
Score

# Vectors and indexing
numbers <- c(1, 3, 5, 7, 9)
sum(numbers)
mean(numbers)
new_nums <- numbers - mean(numbers)
new_nums
numbers[2]
numbers[1:3]
numbers[-4]
numbers[-c(3,5)]
numbers > 5
numbers[numbers > 5]



# Files and folders
getwd()
list.files("data")
file.exists("data/PISA_200.csv")
data_demo <- read.csv("data/PISA_200.csv")
dim(data_demo)



# Packages and libraries
# Base R is ready without extra packages.
search()
# Check availability without causing an error.
requireNamespace("readxl", quietly=TRUE)
requireNamespace("haven", quietly=TRUE)

# Optional: Load import packages (install first)
library(readxl)
library(haven)
packageVersion("readxl")
packageVersion("haven")

# Import Excel and SPSS
# Always-available CSV path for the same SPSS observations.
data_demo <- read.csv("data/PISA_200.csv")
head(data_demo)
dim(data_demo)
str(data_demo)

# Optional: Original Excel / SPSS import (install first)
library(readxl)
library(haven)
pisa_200_excel <- read_excel("data/PISA_200.xlsx")
data_demo <- read_sav("data/PISA_200.sav")
dim(pisa_200_excel)
dim(data_demo)
names(data_demo)
attr(data_demo$Gender, "labels")

# Inspect before analyzing
head(data_demo)
dim(data_demo)
names(data_demo)
str(data_demo)
anyDuplicated(data_demo$Stu_ID)
colSums(is.na(data_demo))



# Summaries and histograms
summary(data_demo$Math_Overall)
mean(data_demo$Math_Overall, na.rm=TRUE)
sd(data_demo$Math_Overall, na.rm=TRUE)
hist(data_demo$Math_Overall,
     main="Histogram of Math Overall Scores",
     xlab="Math Overall Scores", ylab="Frequency",
     col="#CFB991", border="white")

# Optional: Change the bin count
hist(data_demo$Math_Overall, breaks=20, main="Math scores: 20 requested breaks", xlab="Math Overall Scores", col="#2B7570", border="white")

# Counts, labels, missingness
# A deliberately questionable summary. Predict what R will do.
mean(data_demo$Gender)
# Does successful execution make this a meaningful summary?

# Optional: Worked example: labels and a bar plot
gender <- factor(data_demo$Gender, levels=c(1,2), labels=c("Female","Male"))
school <- factor(data_demo$Sch_Type, levels=1:3,
 labels=c("Private independent","Private Government-dependent","Public"))
table(gender, useNA="ifany")
table(school, useNA="ifany")
barplot(table(gender), main="Distribution of Gender",
 xlab="Gender", ylab="Frequency", col=c("#CFB991","#2B7570"))

# Optional: Count numeric codes
table(data_demo$Gender, useNA="ifany")

# Optional: Original value labels (install first)
library(haven)
data_demo <- read_sav("data/PISA_200.sav")
table(as_factor(data_demo$Gender))
table(as_factor(data_demo$Sch_Type), useNA="ifany")

# Pipes and subsets
data_demo[1:10, 1:4]
data_demo$Gender |> factor(levels=c(1,2), labels=c("Female","Male")) |> table()
female_score <- data_demo[!is.na(data_demo$Gender) & data_demo$Gender == 1,
 c("Stu_ID","Math_Overall")]
head(female_score)
nrow(female_score)
write.csv(female_score, "female_score.csv", row.names=FALSE)



# Your turn: scores below 400
# Your task: create low_math, then summarize it.
# Columns: Stu_ID, Gender, Math_Overall
# Condition: nonmissing Math_Overall < 400
names(data_demo)
# Write your code below:


# Optional: Worked answer / backup
low_math <- data_demo[!is.na(data_demo$Math_Overall) & data_demo$Math_Overall < 400,
 c("Stu_ID","Gender","Math_Overall")]
nrow(low_math)
mean(low_math$Math_Overall)
factor(low_math$Gender, levels=c(1,2), labels=c("Female","Male")) |> table()

# When valid code misleads
flag <- data_demo$Sch_Type == 1
table(flag, useNA="ifany")
private_unchecked <- data_demo[flag, ]
nrow(private_unchecked)
private_unchecked
# Keep the original data intact.
private_checked <- data_demo[!is.na(flag) & flag, ]
nrow(private_checked)
data_complete_school <- data_demo[!is.na(data_demo$Sch_Type), ]
dim(data_complete_school)



# Take the workflow with you
# Record your environment for reproducibility.
sessionInfo()
# Use Download script to keep the code you edited here.



# AI design lab: reveal & revise
head(dat)
aggregate(posttest_score ~ condition, dat, mean)
boxplot(posttest_score ~ condition, dat, col=c("#CFB991","#2B7570"))

# Optional: Step 1: tempting student-level test
# Deliberately naive: critique independence before using results.
t.test(posttest_score ~ condition, dat)

# Optional: Step 3: classroom-level comparison
class_means <- aggregate(posttest_score ~ classroom_id + condition, dat, mean)
class_means
table(class_means$condition)
t.test(posttest_score ~ condition, class_means)