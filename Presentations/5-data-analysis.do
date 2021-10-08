Data Analysis
. set scheme s2color
Data analysis
What is data analysis?
Data analysis
Input
One or multiple constructed datasets
Steps
Exploratory analysis: explore, describe and look for patterns in the data
Final data analysis: create and export polished tables and graphs
Output
Excel tables
PNG or JPG images
Documentation
Exploratory analysis
During exploratory analysis, we will explore the data and look for patterns
At this stage, we are looking to understand the data rather than to present findings
We will create code, but not necessarily export outputs or spend time making sure graphs and tables are well-presented
Exploratory analysis: setting the stage
Open a new do-file in the do-file editor
Load the dataset that you want to explore
. use "../DataWork/Data/Final/final_process.dta", clear
Note that:

We have created multiple constructed datasets, with different levels of observation
We will explore each of them separately
If you want to explore variables that are not in the dataset yet, go back to construction and create them
Exploratory analysis: useful commands
codebook: to describe the dataset and individual variables
summarize: to see descriptive statistics for continuous variables
tabulate: to create frequency tables
histogram: to create a histograms
kdensity: to create a density graph for continuous variables
scatter: to quickly visualize the relationship between two variables
Exploratory analysis: codebook
codebook [varlist] [if] [in] [, options]

Explore the entire dataset:

. codebook

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_id                                                                                                                                   Bidding ID
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)

                 range:  [168120,312400]              units:  1
         unique values:  25,000                   missing .:  0/25,000

                  mean:    230198
              std. dev:   41450.6

           percentiles:        10%       25%       50%       75%       90%
                            179877    194137    222910    264215    294115

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
process_name                                                                                                                           Process Name
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  string (str1013)

         unique values:  21,656                   missing "":  0/25,000

              examples:  "Izvođenje građevinsko-zanatskih radova na dječjem
                         igralištu u GK Split 3 - Dobrilina ulica"
                         "Nabava potrošnog medicinskog materijala -Obloge za
                         rane i ostomijska pomagala za potrebe  Kliničke
                         bolnice Merkur"
                         "Poštanske usluge"
                         "UNIFORME ZA ZAŠTITARE - ČUVARE"

               warning:  variable has embedded and trailing blanks

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
unit_id                                                                                                                      Organizational Unit ID
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)

                 range:  [88575,229569]               units:  1
         unique values:  1,902                    missing .:  0/25,000

                  mean:    110141
              std. dev:   9890.67

           percentiles:        10%       25%       50%       75%       90%
                            106575    106977    108447    109716    110411

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
entity                                                                                                                                  Entity Name
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  string (str131)

         unique values:  1,892                    missing "":  0/25,000

              examples:  "GRAD ZAGREB"
                         "HRVATSKE CESTE D.O.O. ZAGREB"
                         "KLINIčKI BOLNIčKI CENTAR OSIJEK"
                         "OPćINA KRAPINSKE TOPLICE"

               warning:  variable has embedded and trailing blanks

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
entity_county                                                                                                                       Entity's County
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  entity_county

                 range:  [1,21]                       units:  1
         unique values:  21                       missing .:  1/25,000

              examples:  2     CITY OF ZAGREB
                         2     CITY OF ZAGREB
                         6     KOPRIVNICA-KRIZEVCI
                         14    SISAK-MOSLAVINA

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
year_init                                                                                                              Year Procedure Was Initiated
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (int)

                 range:  [2014,2021]                  units:  1
         unique values:  8                        missing .:  2,466/25,000

            tabulation:  Freq.  Value
                            26  2014
                         3,111  2015
                         3,448  2016
                         2,970  2017
                         3,799  2018
                         4,293  2019
                         3,776  2020
                         1,111  2021
                         2,466  .

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
month_init                                                                                                            Month Procedure Was Initiated
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (byte)

                 range:  [1,12]                       units:  1
         unique values:  12                       missing .:  2,466/25,000

                  mean:   6.67463
              std. dev:   3.47338

           percentiles:        10%       25%       50%       75%       90%
                                 2         4         6        10        12

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
evaluation_method                                                                                                                 Evaluation Method
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  evaluation_method

                 range:  [1,2]                        units:  1
         unique values:  2                        missing .:  0/25,000

            tabulation:  Freq.   Numeric  Label
                         8,626         1  Lowest price
                        16,374         2  MEAT

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
procurement_type                                                                                                                   Procurement Type
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  procurement_type

                 range:  [1,3]                        units:  1
         unique values:  3                        missing .:  15/25,000

            tabulation:  Freq.   Numeric  Label
                        11,150         1  Goods
                         8,119         2  Services
                         5,716         3  Works
                            15         .  

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_procedure                                                                                                                Bidding Procedure Name
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  bid_procedure

                 range:  [1,11]                       units:  1
         unique values:  11                       missing .:  8/25,000

              examples:  7     Open procedure
                         7     Open procedure
                         7     Open procedure
                         7     Open procedure

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_type                                                                                                                               Bidding Type
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  bid_type

                 range:  [1,4]                        units:  1
         unique values:  4                        missing .:  0/25,000

            tabulation:  Freq.   Numeric  Label
                            34         1  Exemption procurement
                         4,101         2  Procurement of great value
                        19,437         3  Procurement of small value
                         1,428         4  Trivial procurement

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_classification                                                                                                           Bidding Classification
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  bid_classification

                 range:  [1,26]                       units:  1
         unique values:  26                       missing .:  0/25,000

              examples:  22    Open public procurement procedure
                         22    Open public procurement procedure
                         22    Open public procurement procedure
                         22    Open public procurement procedure

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_status                                                                                                                           Bidding Status
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  bid_status

                 range:  [1,8]                        units:  1
         unique values:  8                        missing .:  0/25,000

            tabulation:  Freq.   Numeric  Label
                        19,416         1  Agreed
                         1,718         2  Canceled
                           743         3  In contracting
                            14         4  On appeal
                           999         5  Published / queries for
                                          quotation
                         1,687         6  Registration of offers
                           422         7  Selection decision
                             1         8  Suggested

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_submission_deadline                                                                                             Deadline for Submission of Bids
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric daily date (int)

                 range:  [20108,22459]                units:  1
       or equivalently:  [20jan2015,28jun2021]        units:  days
         unique values:  1,615                    missing .:  2,350/25,000

                  mean:   21368.5 = 03jul2018 (+ 12 hours)
              std. dev:   656.843

           percentiles:        10%       25%       50%       75%       90%
                             20402     20815     21437     21907     22243
                         10nov2015 27dec2016 10sep2018 24dec2019 24nov2020

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
nr_participants                                                                                                              Number of Participants
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (int)

                 range:  [0,247]                      units:  1
         unique values:  36                       missing .:  2,452/25,000

                  mean:   2.46186
              std. dev:   2.83397

           percentiles:        10%       25%       50%       75%       90%
                                 1         1         2         3         5

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
nr_nonlocal_bidders                                                                                                       Number of Non-Local Firms
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (byte)

                 range:  [0,46]                       units:  1
         unique values:  33                       missing .:  2,452/25,000

                  mean:   1.18764
              std. dev:   1.83998

           percentiles:        10%       25%       50%       75%       90%
                                 0         0         1         2         3

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
nr_sme_bidders                                                                                                                Number of SME Bidders
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (byte)

                 range:  [0,14]                       units:  1
         unique values:  11                       missing .:  2,452/25,000

                  mean:   .251552
              std. dev:   .614472

           percentiles:        10%       25%       50%       75%       90%
                                 0         0         0         0         1

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
nr_lots                                                                                                                              Number of Lots
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (int)

                 range:  [1,380]                      units:  1
         unique values:  96                       missing .:  0/25,000

                  mean:   2.18908
              std. dev:   6.80638

           percentiles:        10%       25%       50%       75%       90%
                                 1         1         1         1         3

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
process_value                                                                                                                         Process Value
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (float)

                 range:  [294.8,2.043e+09]            units:  .01
         unique values:  7,272                    missing .:  0/25,000

                  mean:   4.5e+06
              std. dev:   3.6e+07

           percentiles:        10%       25%       50%       75%       90%
                            250000    400000    848000   2.1e+06   6.0e+06

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
process_type                                                                                                                        Processing Type
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  process_type

                 range:  [1,3]                        units:  1
         unique values:  3                        missing .:  8/25,000

            tabulation:  Freq.   Numeric  Label
                         1,691         1  Closed
                        21,043         2  Open
                         2,258         3  Restricted
                             8         .  

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_submission_date                                                                                         Deadline for Delivery of Initial Offers
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric daily date (int)

                 range:  [20572,22413]                units:  1
       or equivalently:  [28apr2016,13may2021]        units:  days
         unique values:  670                      missing .:  23,889/25,000

                  mean:   21679.8 = 10may2019 (+ 19 hours)
              std. dev:   453.766

           percentiles:        10%       25%       50%       75%       90%
                             21035     21284     21738     22075     22258
                         04aug2017 10apr2018 08jul2019 09jun2020 09dec2020

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_delivery_date                                                                                                     Deadline for Delivery Request
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric daily date (int)

                 range:  [20136,22421]                units:  1
       or equivalently:  [17feb2015,21may2021]        units:  days
         unique values:  352                      missing .:  24,588/25,000

                  mean:   21273.2 = 30mar2018 (+ 4 hours)
              std. dev:   674.891

           percentiles:        10%       25%       50%       75%       90%
                             20310   20649.5   21295.5   21843.5     22190
                         10aug2015 14jul2016 21apr2018 21oct2019 02oct2020

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_subm_del_date                                                                                                      Bid Submission/Delivery Date
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric daily date (int)

                 range:  [20108,22459]                units:  1
       or equivalently:  [20jan2015,28jun2021]        units:  days
         unique values:  1,615                    missing .:  1,124/25,000

                  mean:   21380.7 = 15jul2018 (+ 17 hours)
              std. dev:   654.238

           percentiles:        10%       25%       50%       75%       90%
                             20409     20839     21452     21923     22245
                         17nov2015 20jan2017 25sep2018 09jan2020 26nov2020

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
bid_submission_period                                                                                                         Bid Submission Period
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (float)

                 range:  [0,627]                      units:  .1
         unique values:  228                      missing .:  2,344/25,000

                  mean:   29.5587
              std. dev:   27.3013

           percentiles:        10%       25%       50%       75%       90%
                                18        20        22        31        43

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
in_sample                                                                                                                               Sampled Bid
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (byte)

                 range:  [1,1]                        units:  1
         unique values:  1                        missing .:  0/25,000

            tabulation:  Freq.  Value
                        25,000  1

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
process_id                                                                                                                              Process Tag
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  oi

                 range:  [1,22723]                    units:  1
         unique values:  22,723                   missing .:  0/25,000

              examples:  4720  2019-2370
                         9508  452-2016-EMV
                         14023 Feb-18
                         18268 MV-28/16
Exploratory analysis: codebook
codebook [varlist] [if] [in] [, options]

Explore selected variables:

. codebook process_value process_type

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
process_value                                                                                                                         Process Value
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (float)

                 range:  [294.8,2.043e+09]            units:  .01
         unique values:  7,272                    missing .:  0/25,000

                  mean:   4.5e+06
              std. dev:   3.6e+07

           percentiles:        10%       25%       50%       75%       90%
                            250000    400000    848000   2.1e+06   6.0e+06

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
process_type                                                                                                                        Processing Type
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (long)
                 label:  process_type

                 range:  [1,3]                        units:  1
         unique values:  3                        missing .:  8/25,000

            tabulation:  Freq.   Numeric  Label
                         1,691         1  Closed
                        21,043         2  Open
                         2,258         3  Restricted
                             8         .  
Exploratory analysis: codebook
codebook [varlist] [if] [in] [, options]

Explore selected variables and observations:

. codebook process_value if process_type == 1

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
process_value                                                                                                                         Process Value
───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

                  type:  numeric (float)

                 range:  [294.8,1.146e+08]            units:  .01
         unique values:  557                      missing .:  0/1,691

                  mean:    577893
              std. dev:   4.2e+06

           percentiles:        10%       25%       50%       75%       90%
                             50000     90000    150000    211000    480000
Exploratory analysis: summarize
summarize [varlist] [if] [in] [weight] [, options]

Exercise: Use summarize to explore the variables process_value and process_type

Exploratory analysis: summarize
summarize [varlist] [if] [in] [weight] [, options]

. summarize process_value process_type

    Variable │        Obs        Mean    Std. Dev.       Min        Max
─────────────┼─────────────────────────────────────────────────────────
process_va~e │     25,000     4478843    3.60e+07      294.8   2.04e+09
process_type │     24,992    2.022687    .3968654          1          3
Exploratory analysis: summarize
summarize [varlist] [if] [in] [weight] [, options]

. summarize process_value process_type

    Variable │        Obs        Mean    Std. Dev.       Min        Max
─────────────┼─────────────────────────────────────────────────────────
process_va~e │     25,000     4478843    3.60e+07      294.8   2.04e+09
process_type │     24,992    2.022687    .3968654          1          3
Only meaningful for continuous variables

Exploratory analysis: summarize
summarize [varlist] [if] [in] [weight] [, options]

. summarize process_value, detail

                        Process Value
─────────────────────────────────────────────────────────────
      Percentiles      Smallest
 1%     63285.75          294.8
 5%       200000         464.79
10%       250000         990.23       Obs              25,000
25%       400000        1414.61       Sum of Wgt.      25,000

50%       848000                      Mean            4478843
                        Largest       Std. Dev.      3.60e+07
75%      2060000       1.78e+09
90%      6000000       1.90e+09       Variance       1.29e+15
95%     1.26e+07       2.04e+09       Skewness       40.09512
99%     6.00e+07       2.04e+09       Kurtosis       1987.837
Exploratory analysis: tabulate one way
tabulate varname [if] [in] [weight] [, options]

Exercise: use tabulate to explore the variable procurement_type

Exploratory analysis: tabulate one way
tabulate varname [if] [in] [weight] [, options]

. tabulate procurement_type

Procurement │
       Type │      Freq.     Percent        Cum.
────────────┼───────────────────────────────────
      Goods │     11,150       44.63       44.63
   Services │      8,119       32.50       77.12
      Works │      5,716       22.88      100.00
────────────┼───────────────────────────────────
      Total │     24,985      100.00
Exploratory analysis: tabulate two way
tabulate varname1 varname2 [if] [in] [weight] [, options]

Exercise: use tabulate to explore the relationship between variables procurement_type and process_type

Exploratory analysis: tabulate two way
tabulate varname1 varname2 [if] [in] [weight] [, options]

. tabulate procurement_type process_type

Procuremen │         Processing Type
    t Type │    Closed       Open  Restricte │     Total
───────────┼─────────────────────────────────┼──────────
     Goods │       615      9,593        940 │    11,148 
  Services │       781      6,315      1,020 │     8,116 
     Works │       295      5,120        298 │     5,713 
───────────┼─────────────────────────────────┼──────────
     Total │     1,691     21,028      2,258 │    24,977 
Exploratory analysis: histogram
histogram varname [if] [in] [weight] [, [continuous_opts | discrete_opts] options]

Exercise: use histogram to explore the distibrution of variable month_init

Exploratory analysis: histogram
histogram varname [if] [in] [weight] [, [continuous_opts | discrete_opts] options]

. histogram month_init
(bin=43, start=1, width=.25581395)
Exploratory analysis: histogram
histogram varname [if] [in] [weight] [, [continuous_opts | discrete_opts] options]

. histogram month_init, discrete
(start=1, width=1)
Particularly useful with discrete variables

Exploratory analysis: histogram
histogram varname [if] [in] [weight] [, [continuous_opts | discrete_opts] options]

. histogram bid_submission_period
(bin=43, start=0, width=14.581395)
Particularly useful with discrete variables

Exploratory analysis: kdensity
kdensity varname [if] [in] [weight] [, options]

. kdensity bid_submission_period
Exploratory analysis: kdensity
kdensity varname [if] [in] [weight] [, options]

Exercise: use kdensity to explore the distribution of variable bid_submission_period only for processes where the period is shorter than 100 days

Exploratory analysis: kdensity
kdensity varname [if] [in] [weight] [, options]

. kdensity bid_submission_period if bid_submission_period < 100
Exploratory analysis: scatter
scatter varlist [if] [in] [weight] [, options]

Exercise: use scatter to explore the relationship between variables nr_nonlocal_bidders and nr_participants

Exploratory analysis: scatter
scatter varlist [if] [in] [weight] [, options]

.  scatter nr_nonlocal_bidders nr_participants
Exploratory analysis: graph bar
graph bar  yvars [if] [in] [weight] [, options]
graph hbar yvars [if] [in] [weight] [, options]
Exercise: use graph bar to explore the variable process_value

Exploratory analysis: graph bar
. graph bar process_value
Note that by default a bar graph displays the average value of a continuous variable
Exploratory analysis: graph bar
Use the option over() to break down a bar graph into groups

. graph bar process_value, over(procurement_type)
Exploratory analysis: graph bar
Write (**stat**) before a variable’s name to show a statistic other than the mean

. graph bar (sum) process_value, over(procurement_type)
Other possible values of stat are: - sum - count - mean - median - percent

Exploratory analysis: graph bar
graph bar  yvars [if] [in] [weight] [, options]
graph hbar yvars [if] [in] [weight] [, options]
Exercise: Create a horizontal bar graph that shows the number of processes with each procurement type

Exploratory analysis: graph bar
. graph hbar (count) process_id, over(procurement_type)
Exercise: Create a horizontal bar graph that shows the number of processes with each procurement type

Final analysis
Once we have explored the data and understood what it is showing us, we will decide how to present our results
Formatting outputs to make sure they include all relevant information can be very time-consuming
We will only spend time formatting the outputs that we want to share with others
Final analysis: setting the stage
Save the code that you wrote for exploratory analysis on the Code/Analysis folder. Call it explore-process-data.do.
Open a new script
Load the data that you want to use
Copy the code that created the graph you want to polish
Final analysis: graph bar
. use "../DataWork/Data/Final/final_process.dta"

. 
. graph bar (count) process_id, over(procurement_type) 
Final analysis: graph bar
. use "../DataWork/Data/Final/final_process.dta"

. 
. graph bar (count) process_id, ///
> over(procurement_type) ///
> ytitle("Number of processes")
Final analysis: graph bar
. use "../DataWork/Data/Final/final_process.dta"

. 
. graph bar (count) process_id, ///
> over(procurement_type) ///
> ytitle("Number of processes") ///
> blabel(total)
Final analysis: graph bar
. use "../DataWork/Data/Final/final_process.dta"

. 
. graph bar (count) process_id, ///
> over(procurement_type) ///
> ytitle("Number of processes") ///
> blabel(total)  ///
> graphregion(color(white))
Final analysis: set scheme
. set scheme uncluttered

. 
. use "../DataWork/Data/Final/final_process.dta"

. 
. graph bar (count) process_id, ///
> over(procurement_type) ///
> ytitle("Number of processes") ///
> blabel(total) 
Final analysis: set scheme
. set scheme plottig

. 
. use "../DataWork/Data/Final/final_process.dta"

. 
. graph bar (count) process_id, ///
> over(procurement_type) ///
> ytitle("Number of processes") ///
> blabel(total) 
Final analysis: set scheme
. set scheme plotplain

. 
. use "../DataWork/Data/Final/final_process.dta"

. 
. graph bar (count) process_id, ///
> over(procurement_type) ///
> ytitle("Number of processes") ///
> blabel(total) 
Final analysis: bar graph
Exercise: recreate the graph shown below

. set scheme uncluttered

. 
. use "../DataWork/Data/Final/final_process.dta"

. 
. gr bar (sum) process_value, ///
> over(procurement_type) ///
> ytitle("Awarded value (Lev)") ///
> blabel(total)  
Final analysis: bar graph
Exercise: recreate the graph shown below

. set scheme uncluttered

. 
. use "../DataWork/Data/Final/final_process.dta"

. 
. gr bar (sum) process_value, ///
> over(procurement_type) ///
> ytitle("Awarded value (Lev)") ///
> blabel(total)  
Final analysis: exporting outputs
Always save outputs in easily accessible format (such as PNG ang JPEG)
Use self-explanatory names on your graphs
Graph names and the names of the do-files that create them should be easy to match
Final analysis: exporting graphs
graph export newfilename.suffix [, options]
Exercise: Export the graph you just created to the Output folder. Call it process-value-by-procurement-type.png

Final analysis: exporting graphs
graph export "../DataWork/Output/process-value-by-procurement-type.png", replace
Final analysis: saving do-files
Final analysis scripts should be short and simple:

Load the data to be used
Create the graph or table to be exported
Export the graph or table
Exercise: Clean and save the do-file that created your graph to the folder Code/Analysis. Call it process-value-by-procurement-type.do

Final analysis: saving do-files
process-value-by-procurement-type.do

. set scheme uncluttered

. 
. use "../DataWork/Data/Final/final_process.dta"

. 
. gr bar (sum) process_value, ///
> over(procurement_type) ///
> ytitle("Awarded value (Lev)") ///
> blabel(total)  

. 
. graph export "../DataWork/Output/process-value-by-procurement-type.png", replace
(file ../DataWork/Output/process-value-by-procurement-type.png written in PNG format)
Final analysis: saving do-files
processes-by-procurement-type.do

. set scheme uncluttered

. 
. use "../DataWork/Data/Final/final_process.dta"

. 
. gr bar (sum) process_id, ///
> over(procurement_type) ///
> ytitle("Number of processes") ///
> blabel(total)  

. 
. graph export "../DataWork/Output/processes-by-procurement-type.png", replace
(file ../DataWork/Output/processes-by-procurement-type.png written in PNG format)
Final analysis: saving do-files
Analysis scripts should be this short for a few reasons:

In the future, we may only want to recreate one graph and not all of the graph we ever exported. In these cases, running a short script is much faster.
We want to be able to quickly find the piece of code that created an image. It is harder to read a long script and find the exact part of the code that created it than it is to connect a graph name to a do-file name.
In the next session, we will see how to recreate many figures without opening and running each do-file individually.

Final analysis: graph pie
Slices as totals or percentages within over() categories
    graph pie varname [if] [in] [weight], over(varname) [options]

Slices as frequencies within over() categories
    graph pie [if] [in] [weight], over(varname) [options]
Final analysis: graph pie
. graph pie, over(procurement_type)
Final analysis: graph pie
. graph pie process_value, over(procurement_type)
Final analysis: graph pie
. gr pie process_value, over(procurement_type) plabel(_all percent)
Final analysis: graph pie
. gr pie process_value, over(procurement_type) plabel(_all percent) legend(position(12) cols(3))
Final analysis: graph pie
. gr pie process_value, over(procurement_type) plabel(_all percent) legend(position(4) cols(1))
Final analysis: graph pie
. gr pie process_value, over(procurement_type) plabel(_all percent, gap(10)) legend(on position(4) cols(1)) pie(2, explode)
Two way graphs
All the graphs we’ve seen so far illustrate a single continuous variable, either by itself or over a categorical variable
To show the relationship between two continuous variables, however, another type of Stata graph is used: the two-way graph
If we wanted to see how the total process value changes over time, for example, we could simple treat time as a categorical variable and create the following graph:
. gr bar (sum) process_value, over(year_init) 
Two way graphs
However, time trends are usually displayed as line plots, which are in Stata created as a two-way graph
In this two-way graph, we have two continuous variables: time and process value
When we create two-way graphs, the most important thing to have in mind is that the data used for the graph needs to be tidy
That is, each row in the dataset should represent one data point to be displayed in the graph – we cannot group observations by calculating the mean or percent only in the graph, as we did for one way graphs
In our example, in order to create a line plot of total process value by year, we need to start from a dataset where each row represents one year
Two-way graphs
The way to create this year-level dataset was discussed when we talked about construction:

. collapse (sum) process_value, by(year_init)
Two-way graphs
Once the data is at the appropriate level of observation, we can create a two-way plot:

[graph] twoway plottype yvar xvar [if] [in] [, twoway_options]
. graph twoway line process_value year_init
Two-way graphs
One nice freature of two-way graphs is that we can add layers to a plot:

. graph twoway ///
> (line process_value year_init) /// First layer
> (scatter process_value year_init) // Second layer
Two-way graphs
When a graph has multiple layers, there are two different types of options we can add: layer-specific options and general graph options
General graph options are separated by a comma and added outside of the parentheses that define a layer:
. graph twoway ///
> (line process_value year_init) /// First layer
> (scatter process_value year_init) /// Second layer
> , ///
> legend(off) // general graph option
Two-way graphs
When a graph has multiple layers, there are two different types of options we can add: layer-specific options and general graph options
Layer-specific options are also separeted by a comma, but must be entered inside the parentheses that define the layer
. graph twoway ///
> (line process_value year_init) /// First layer
> (scatter process_value year_init /// Second layer
>     , mlabel(process_value)) /// Option to be applied to the second layer
> , ///
> legend(off) // General graph option
Two-way graphs
Exercise: add a title to the graph that was created previously

. graph twoway ///
> (line process_value year_init) /// First layer
> (scatter process_value year_init /// Second layer
>     , mlabel(process_value)) /// Option to be applied to the second layer
> , ///
> legend(off) // General graph option
Two-way graphs
Exercise: add a title to the graph that was created previously

. graph twoway ///
> (line process_value year_init) /// First layer
> (scatter process_value year_init /// Second layer
>     , mlabel(process_value)) /// Option to be applied to the second layer
> , ///
> legend(off) /// General graph option
> title(Total process value by over (Lev))
set scheme plotplain gr twoway (line process_value year_init) (scatter process_value year_init, mlabel(process_value)), legend(off)


# Two-way graphs

- There is a large number of graph types that can be added as twoway graphs, including
  - Bar plots
  - Area plots 
  - Line plots
  - Dropline plots
- To see a complete list of two-way types and their layer-specific options, type `help twoway`

# Final analysis: exporting tables

- The `collapse` command that we just used to make sure our dataset was represeting year-level observations is also useful to create descriptive tables 
- The easiest way to export a descriptive table to Excel is to collapse the dataset, create the columns we want to present in our table, and export the entire dataset to Excel, as we did in session X

**Exercise:**

1. Open a new do-file
2. Load the constructed process dataset
3. Coll

# Exporting tables

```{s}
    use "../DataWork/Data/Final/final_process.dta", clear
    
    collapse (sum) value = process_value (percent) percent = process_value (count) volume = bid_id, by(bid_procedure)
    
    label variable value     "Awarded value (Lev)"
    label variable percent     "Percent of awarded value"
    label variable volume     "Volume of processes"
    
    export excel using "../DataWork/Output/Tables.xls", sheet("Bid procedure") sheetreplace firstrow(varlabels)
Final analysis: exporting tables
Exercise: recreate the image below



Open a new do-file
Load the constructed process dataset
Collapse the data to display the desired statistics for each bid procedure
Label the columns using label variable
Export the resulting dataset to Excel
Final analysis: exporting tables
    use "../DataWork/Data/Final/final_process.dta", clear
    
    collapse (sum)        value = process_value ///
             (percent) percent = process_value ///
             (count)   volume = bid_id ///
             , ///
             by(bid_procedure)
    
    label variable value     "Awarded value (Lev)"
    label variable percent     "Percent of awarded value"
    label variable volume     "Volume of processes"
    
    export excel using "../DataWork/Output/Tables.xls", sheet("Bid procedure") sheetreplace firstrow(varlabels)
Appendix
Changing layer colors
esttab
Stata visual library