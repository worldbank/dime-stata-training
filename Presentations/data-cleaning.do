---
title: Cleaning data
author: Luiza Andrade and Sushmita Samaddar
---

# What is data cleaning?

The best way to summarize what data cleaning means is through this image

![](img/cleaning.png)


# What is data cleaning?

- Cleaning is about changing the *format* of the data to the format that is the most efficient to store and handle in statistical software and also the easiest for humans to understand
- We are not making changes to the *information* contained in the data set -- this will come later, in *data construction*

# Input: the raw data

- Contains only information originally received during data acquisition
- Raw data files should be stored in the raw data folder [exactly]{style="color: orange"} as they were acquired
  - The raw data files should [never]{style="color: orange"} be edited directly
  - Be mindful of how and where they are stored: they cannot be re-created and nearly always contain confidential data
- If the raw data contains confidential information, it [must be safely stored]{style="color: orange"}

# Output: the cleaned data set

- At the end of this process, you should have a data set that is essentially the same as the one you originally acquired
 - During data cleaning, we will change the [format]{style="color: orange"} of the data
 - We will [not]{style="color: orange"} make significant changes to individual data points
- The main difference between the *raw* and the *clean* data sets lies in how easy it is to understand them and handle them in statistical software
- One clean dataset will be created for each data source


# Cleaning string variables

- Trim
- Replace
- Missing values
- Upper and lower cases

# Dates

- Convert to date
- Change format

# Encode variables

-  Each statistical software has optimized the formats it uses to store and handle different types if information
-  The clean data set should contain no string variables, except for

  1.  Proper nouns that are not categories
  2.  Digits with leading zeros or long IDs (over 15 digits)

-  That means categorical string variables must be transformed into labeled variables or factors
-  Be mindful of open-ended questions: they present a much higher risk of statistical disclosure
-  Check that all categorical variables have value labels (in English)

# Encoding variables in Stata

-  In Stata, the best practice is to use `encode` with both the `label` and the `noextend` options

[Example:]{style="color: orange"}
`encode dist_name, generate(dist_id) label(district) noextend`

-  Other useful commands: `label define`, `label value`, `label dir`, `label list`, `labelbook`
-  If you used Survey CTO, added labels to the column `label:stata`, and the data was properly imported, this step may not be necessary

# Value labels

- Exercise: `label define yesno 1 "Yes" 0 "No"`
- Apply labels to a variable
- browse dataset and see the underlying number and the label

# Destring


# Identify and document outliers

-  We do not want our results to be driven by a few individuals. For example, if the village leaders get all benefits
-  There is no exact rule for what is an outlier. Ask if your PI has a preference of specific rule
-  Identifying outliers often comes down to common sense: can the outlier be explained by typos?This is especially common when selecting units from multiple choice lists
-  RAs should try to identify as many discrepant values as possible, even at the cost of not correcting them

# Useful Stata commands to identify outliers

-  `sum detail`
-  `tabulate`
-  `inspect`
-  `assert`
-  `histogram`

# Identifying outliers

- Inspect the contract value variable and identify outliers

# Label variables 

When cleaning a data set, you should make sure that all variables are properly labeled, so that it is easy to understand what each variable represents:

-  Check that all variables have variable labels
-  Variable labels should explain what the variable is and, if that's the case, what unit it is in
-  Labels should be longer than 80 characters

# Label variables: exercise

- Label a variable and see how the label is shown in the graph
	
# Ordering variables

-  It is recommended the variables in the final data tables follow the same order as in the questionnaire
-  If the data was not collected exclusively for you study, you may want to group related variables so they are close to each other
-  The variables that identify observations should be ordered first in each data table

# Ordering variables: exercise

- `order varlist`
- `order varlist, before()`
- `order varlist, after()`

# Saving files

-  During the data cleaning process, you might have saved multiple intermediate files, for example if you cleaned long modules separately to make your code more readable
-  After cleaning your data and merging it back together, you'll want to save a final cleaned data set, containing all variables from your survey
-  This new data set will probably be quite heavy. Use `compress` to save your variables in the most economic format
-  It's often desirable to save your data set in a previous Stata version, so other members of your team will not have version conflicts. To do this, use `saveold`

# Exercise: Exporting data to Excel

- Use user interface, then copy the code

# Naming files

-  Make sure all output files, datasets and others are clearly and uniquely named
-  It's often desirable to have the names of your data sets and do-files linked, so it is easy to understand which do-files is creating which data set, such as "merge.do" and "merged.dta" or "cleaning.do" and "clean.dta"
-  Do not use _v1, _v2 etc. for any final files. This leads to bugs in do-files that depend on these files when a new versions is added.
-  It's ok to use _v1, _v2 etc. for old versions of files if you [really]{style="color: orange"} need to keep an archive

# Exercise

- Save do-file, call it "cleaning-process"
- Save data, call it "clean-process-data"

# Recap

-  The main output of data cleaning is a data set that contains the same data points as the acquired data, with the exception of corrections made to data entry error
-  The main difference between the clean data set and the raw data set is that the first is in a format that is easier for a human to understand and for a statistical software to handle
-  Ideally, the raw data set should be de-identified before cleaning
-  The data documentation and quality checks should be archived with the clean data set
-  During data cleaning, the data set will be thoroughly explored and documented to inform data analysis and construction

# Output: documentation 

A few pieces of documentation should accompany the clean dataset:

-  A variable dictionary/codebook listing details about each variable
  -  What does this variable mean?
  -  Summary of its content
-  A description of how the data was collected
-  A complete record of any corrections made to the raw data, including careful explanation about the decision-making process involved
-  A report documenting any irregularities and distributional patterns encountered in the data


# What is data cleaning?

-  Cleaning is [the most time-consuming data work task]{style="color: orange"}, and you will be tempted to skip steps
-  However, this is the time when really get to know your data
-  Take the time to explore your data set using tabulations, summaries, and descriptive plots
-  Knowing your data set well will make it possible to do analysis
-  Cleaning your data well will save you time down the line