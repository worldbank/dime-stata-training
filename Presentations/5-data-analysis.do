# Exploratory analysis: `codebook`

~~~
codebook [varlist] [if] [in] [, options]
~~~

Explore the entire dataset:

~~~
codebook
~~~

# Exploratory analysis: `summarize`

~~~
summarize [varlist] [if] [in] [weight] [, options]
~~~ 

Exercise: Use summarize to explore the variables process_value and process_type

Exploratory analysis: summarize
summarize [varlist] [if] [in] [weight] [, options]

```{s}
summarize process_value process_type

Exploratory analysis: summarize
summarize [varlist] [if] [in] [weight] [, options]

```{s}
. summarize process_value process_type


Exploratory analysis: summarize
summarize [varlist] [if] [in] [weight] [, options]

```{s}
summarize process_value, detail
```

# Exploratory analysis: tabulate one way

~~~
tabulate varname [if] [in] [weight] [, options]
~~~

Exercise: use tabulate to explore the variable procurement_type

# Exploratory analysis: tabulate one way

~~~
tabulate varname [if] [in] [weight] [, options]
~~~

```{s}
tabulate procurement_type
```

# Exploratory analysis: tabulate two way

~~~
tabulate varname1 varname2 [if] [in] [weight] [, options]
~~~
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