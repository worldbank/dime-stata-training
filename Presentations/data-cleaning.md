---
author:
- DIME RA Onbarding Course
date: 'September 20, 2021'
title: Data Cleaning
---


# Input: the raw data

-  Contains only information originally received during data acquisition
-  Raw data files should be stored in the raw data folder [exactly]{style="color: orange"} as they were acquired
-  The raw data files should [never]{style="color: orange"} be edited directly
-  Be mindful of how and where they are stored: they cannot be re-created and nearly always contain confidential data
-  In DIME, we recommend following the [[3-2-1 rule](https://www.acronis.com/en-us/articles/backup-rule/)]{style="color: violet"} for storage of raw data, [[using OneDrive as a
back-up](https://github.com/worldbank/dime-standards/blob/master/dime-research-standards/pillar-4-data-security/data-security-resources/onedrive-backup-guidelines.md)]{style="color: violet"}
-  If the raw data contains confidential information, it [must be safely stored]{style="color: orange"}

# Output: the de-identified dataset

-  Working version of the dataset that can be shared [within]{style="color: orange"} the research team without risk
-  Contains only information originally received during data acquisition
-  Contains no direct identifiers
-  [Is not necessarily anonymized]{style="color: orange"}
-  Typically, de-identification should not affect the usability of the data

# Identifying direct identifiers

-  The first thing you need to de-identify the data is a list of all direct identifiers in the data set
-  Ideally, for originally collected datasets, all potentially identifying variables are flagged during questionnaire design
-  Useful tools:
  -  JPAL's `PII scan` Stata command
  -  The [[`sdcMicro` R package](https://sdcpractice.readthedocs.io/en/latest/sdcMicro.html)]{style="color: violet"}
  -  DIME Analytics' `iecodebook` Stata command

# Removing direct identifiers 

Once you have a list of all direct identifiers, for each one of them, ask yourself (and the pre-analysis plan):

1.  Will this variable be needed for the analysis?
  -  If the answer is no, it can be dropped during the cleaning process
  -  Don't be afraid to drop too many variables: you can always add them back (but you can't undo a data leak)

2.  Can I encode or otherwise construct a variable that masks the PII?

Direct identifiers are almost never needed for analysis, but when that is the case, all data work needs to be completed in a secure environment

# Introduction 

During data cleaning, you will look carefully at each variable in your data set. The objectives of this process are

1.  Making the data set easily usable and understandable
2.  Documenting individual data points and patterns that may bias the analysis

# Introduction

-  Cleaning is [the most time-consuming data work task]{style="color: orange"}, and you will be tempted to skip steps
-  However, this is the time when really get to know your data
-  Take the time to explore your data set using tabulations, summaries, and descriptive plots
-  Knowing your data set well will make it possible to do analysis
-  Cleaning your data well will save you time down the line

# Output: the cleaned data set

-  At the end of this process, you should have a data set that is essentially the same as the one you originally acquired
  -  During data cleaning, we will change the [format]{style="color: orange"} of the data
-  We will [not]{style="color: orange"} add new variables, or make significant changes to individual data points
-  The main difference between the raw and the clean data sets lies in how easy it is to understand them and handle them in statistical software
-  Typically, one clean dataset will be created for each data source or survey instrument
-  The clean, de-identified dataset, plus the documentation to support it, are first data output of your project: [a publishable data set]{style="color: orange"}

# Output: documentation 

A few pieces of documentation should accompany the clean dataset:
-  A variable dictionary/codebook listing details about each variable
-  What does this variable mean?
-  Summary of its content
-  The instruments used to collect the data
-  A complete record of any corrections made to the raw data, including careful explanation about the decision-making process involved
-  A report documenting any irregularities and distributional patterns encountered in the data

# Data cleaning: a summary

![image](img/summary){width=".5\\linewidth"}

### Unique ID

The first thing you want to look for every single time you open a new
data set for the first time is

1.  Unit of observation
2.  Uniquely and fully identifying ID variable

### Unique ID

The first thing you want to look for every single time you open a new
data set for the first time is

1.  Unit of observation
2.  Uniquely and fully identifying ID variable

[Before you separate the identifiable from the de-identified data, make sure you know how to cross both using the unique ID]{style="color: orange"}

# Desirable properties of an ID variables

1.  Uniquely identifying
2.  Fully identifying
3.  Anonymous
4.  Constant within a project

# Desirable properties of an ID variables

1.  Uniquely identifying
2.  Fully identifying
3.  Anonymous
4.  Constant within a project

[How would you test if a variable is uniquely and fully identifying?]{style="color: orange"}

# Unique ID

Commands for testing that a variable is uniquely and fully identifying

In Stata:
-  `isid`
-  `codebook`

In R:
-  `n_distinct()`
-  `is.na()`
-  `unique()`
-  `length()`
-  `dim()`

# Using `iefieldkit` to solve duplicated entries

-  The [[`ieduplicates`](https://osf.io/yhjmn/)]{style="color: violet"}
command helps identify and resolve duplicates in raw survey data
-  The command outputs a report of all the duplicated entries of a
variable (in Excel), and removes the duplicates from the data set
until they are resolved
-  The Excel report is used to document the cases of duplicated
interviews and how they were solved

![image](img/iedupreport)

# Data entry corrections

-  During data acquisition, particularly during primary data
collection, it's likely that issues will be reported
-  During data quality monitoring, you are likely to identify more
problems that need to be addressed
-  Examples of issues are typos, incorrect IDs, and re-surveys
-  It's important to record all these issues and the communications
about them
-  This is the only case, apart from duplicated IDs, when you will
change data points during data cleaning
-  [Make all corrections in a script]{style="color: orange"}, not
manually, and remember to document where the information is coming
from

# Label variables 

When cleaning a data set, you should make sure that all
variables are properly labeled, so that it is easy to understand what
each variable represents:
-  Check that all variables have variable labels (in English)
-  Variable labels should explain what the variable is and, if that's
the case, what unit it is in
-  Labels should be longer than 80 characters
-  You can use `label variable` in Stata and the package `sjlabelled`
in R to do this

# Encode variables

-  Each statistical software has optimized the formats it uses to store
and handle different types if information
-  The clean data set should contain no string variables, except for

  1.  Proper nouns that are not categories
  2.  Digits with leading zeros or long IDs (over 15 digits)

-  That means categorical string variables must be transformed into
labeled variables or factors
-  Be mindful of open-ended questions: they present a much higher risk
of statistical disclosure
-  Check that all categorical variables have value labels (in English)

# Encoding variables in Stata

-  In Stata, the best practice is to use `encode` with both the `label`
and the `noextend` options

[Example:]{style="color: orange"}
`encode dist_name, generate(dist_id) label(district) noextend`

-  Other useful commands: `label define`, `label value`, `label dir`,
`label list`, `labelbook`
-  If you used Survey CTO, added labels to the column `label:stata`,
and the data was properly imported, this step may not be necessary

# Encoding variables in R

-  The `tidyverse` package `forcats` includes tools to deal with
categorical variables
-  Note that, unlike in Stata, in R you cannot choose the underlying
numeric value of a factor variable
-  This is not a problem, as you can refer to factors by their labels,
and don't need to know what is the underlying numeric value
-  R transforms strings into factors in alphabetical order, so remember
to use `ordered` factors if you care about the order in which
categories are displayed

# Extended missing values

-  During primary data collection, use codes like -88, -9,-777 to
represent different reasons for missing data such as "don't know",
"declined to answer" etc
-  These values need to be removed since they will otherwise bias the
means
-  We can use Stata's `recode` and R's `naniar` package to replace
these values

# Extended missing values in Stata

-  If we recode all non-response codes to standard missing values, we
will lose information
-  Use extended missing values to keep the information but still tell
Stata to treat them like missing
-  Regular missing value in Stata: .
-  Use extended missing to represent the same reason for missing data
across the project
 -  `.d` = "Don't know"
 -  `.r` = "Refused to answer"
 -  `.s` = "Skipped"

-  Missing values can also be labeled

# Extended missing values in Stata

-  To Stata, $numbers< . <.a<.b<.c<...<.z$
-  So replace this
`sum HH_income if employment != .`
-  With this
`sum HH_income if !missing(employment)`

# Extended missing values in R 

Extended missing values are not native to R, but the package `haven` allows you to tag missing values:

```
library(tidyverse)
library(haven)

mock_data <-
 data.frame("id" = 1:5,
"var" = c(1:3, -9, -8))

mock_data_clean <-
 mock_data %>%
 mutate(var_clean = case_when(var == -8 ~ tagged_na("d"),
var == -9 ~ tagged_na("o"),
TRUE ~ var))

mock_data_clean

is_tagged_na(mock_data_clean$var_clean)
na_tag(mock_data_clean$var_clean)
```

# (Not) Renaming variables

-  Do not change the names of variables coming from a survey, even if
you do not like the naming conventions used in the questionnaire
-  Renaming variables will make it harder to find the correspondence
between variables and survey questions

# Using `iefieldkit` to annotate the data set

-  The [[`iecodebook`](https://osf.io/yhjmn/)]{style="color: violet"}
command helps you perform most of the tasks described above (with
the exception of encoding)
-  The command outputs (in Excel) a list of all variables in the data
set and their labels, and applies changes to them so the process is
simplified
-  The Excel report is used to document the modifications made to the
data set while cleaning

![image](img/iecodebook){width="\\linewidth"}

# Exploring the data

-  A great Research Assistant knows the data better than anyone else in
the project
-  This will allow you to make unique contributions
-  Use the data cleaning process to get to know the data and come up
with suggestions of things to explore in it

# Creating documentation

-  Creating a record of what you found as you explored your data during
cleaning will help you make data construction and analysis decisions
-  As a Research Assistant, you should be more concerned with
[finding]{style="color: orange"} potential issues in the data than
with [fixing]{style="color: orange"} them
-  Having these issues listed in a document will make it easier to
discuss with the rest of your team how to address them
-  R and Stata markdown packages are particularly useful to create this
documentation

# Check variables consistency

-  Check that values are consistent across variables
-  For example, if an individual is male, then he cannot be pregnant
-  This kind of inconsistency should usually be corrected during the
high-frequency checks, but often times there's no time when the
enumerators are in the field to identify and correct all of them
-  So if you find any issues, create flag variables that identify
observations with inconsistent values

# Identify and document outliers

-  We do not want our results to be driven by a few individuals. For
example, if the village leaders get all benefits
-  There is no exact rule for what is an outlier. Ask if your PI has a
preference of specific rule
-  Identifying outliers often comes down to common sense: can the
outlier be explained by typos?This is especially common when
selecting units from multiple choice lists
-  RAs should try to identify as many discrepant values as possible,
even at the cost of not correcting them

# Useful Stata commands to identify outliers

-  `sum detail`
-  `tabulate`
-  `inspect`
-  `assert`
-  `histogram`

# Useful R commands to identify outliers

-  `summary`
-  `table`
-  `tidyverse`'s `count`
-  `assert_that`
-  `hist`
-  `skimr`'s `skim`

# Documenting metadata

-  Variable labels must be short and self-explanatory, as they will be
used in tables and graphs
-  However, there is much more information that is useful for someone
opening the data for the first time
-  This information should be stored in a data dictionary/codebook,
including
-  The definition of each variable or corresponding survey question
-  The number of missing observations in each variable
-  Summary statistics
-  Any field notes or corrections made to each variable

# Recategorize values listed as "others"

-  Categorical variables usually have an open-ended "other, specify"
option that is saved as a string
-  Answers that appear frequently in the open-ended question can be
included as a new category in the categorical variable
-  That is usually done during the pilot or the high-frequency checks,
but it is possible that there are still relevant categories left out

# Drop variables from survey

-  Some variables are created to be used within the survey and for
survey checks
-  That is the case of most calculate fields, as well as notes and
duration variables
-  Variables that are not part of the questionnaire itself may be
dropped from the clean data set
-  If you are in a hurry while cleaning your data, one strategy you can
adopt is to only clean the variables that you will use
*immediately*, and remove any other variable from the clean data set

# Ordering variables

-  It is recommended the variables in the final data tables follow the
same order as in the questionnaire
-  If the data was not collected exclusively for you study, you may
want to group related variables so they are close to each other
-  The variables that identify observations should be ordered first in
each data table

# Saving files

-  During the data cleaning process, you might have saved multiple
intermediate files, for example if you cleaned long modules
separately to make your code more readable
-  After cleaning your data and merging it back together, you'll want
to save a final cleaned data set, containing all variables from your
survey
-  This new data set will probably be quite heavy. Use `compress` to
save your variables in the most economic format
-  It's often desirable to save your data set in a previous Stata
version, so other members of your team will not have version
conflicts. To do this, use `saveold`

# Naming files

-  Make sure all output files, datasets and others are clearly and
uniquely labeled, i.e.: "desc_stats_tmt_only.xls"
"input_plan_adm_data.dta"
-  It's often desirable to have the names of your data sets and
do-files linked, so it is easy to understand which do-files is
creating which data set, such as "merge.do" and "merged.dta" or
"cleaning.do" and "clean.dta"
-  Do not use _v1, _v2 etc. for any final files. This leads to bugs
in do-files that depend on these files when a new versions is added.
-  It's ok to use _v1, _v2 etc. for old versions of files if you
[really]{style="color: orange"} need to keep an archive

# Recap

-  The main output of data cleaning is a data set that contains the
same data points as the acquired data, with the exception of
corrections made to data entry error
-  The main difference between the clean data set and the raw data set
is that the first is in a format that is easier for a human to
understand and for a statistical software to handle
-  Ideally, the raw data set should be de-identified before cleaning
-  The data documentation and quality checks should be archived with
the clean data set
-  During data cleaning, the data set will be thoroughly explored and
documented to inform data analysis and construction

# Version control

-  Track changes to the data and the code at the same time so you
notice when significant changes are made

# Publising data

-  Per Bank policy, teams must submit their clean datasets to the
Microdata Catalog within 6 months of acquiring original data
-  DIME Analytics can perform a review of the data cleaning code at
this stage

# Exercise

-  Apply the tasks you've learned in the last few sessions to [[this
data set](https://www.dropbox.com/s/x8vj2arq9hf0218/LWH_FUP2.dta?dl=0)]{style="color: violet"}
(Link will expire on Oct 14, 2021). You can use the [[data cleaning
checklist](https://dimewiki.worldbank.org/Checklist:_Data_Cleaning)]{style="color: violet"}
as a guide.

-  Tidying
-  De-identiying
-  Looking for duplicated entries
-  Documenting issues on the data
-  Annotating the data
-  Creating data dictionaries/codebooks
-  If you are using Stata, you can install `iefieldkit` by typing `ssc install iefieldkit, replace` to use `ieduplicates` and `iecodebook`

# DIME Research Assistant Onboarding Course - Fall 2021

![Research data work[]{label="fig:intro"}](../common-resources/img/Intro.png)

-  Sessions held from 9:30AM-11.00AM

1.  Statistical programming 101: Sep 13
2.  Data management: Sep 14
3.  Tidying data: Sep 15
4.  Data cleaning: Sep 20
5.  Data construction: Sep 21
6.  Data analysis: Sep 22

-  Sign up to each session at
<https://olc.worldbank.org/content/research-assistant-onboarding-course-1>
-  Material will be made available at <https://osf.io/qtmdp/>
