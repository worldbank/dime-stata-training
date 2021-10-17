
/*******************************************************************************
	List entities with highest procured value
*******************************************************************************/

* Load data
use "../Data/Final/final_process.dta", clear

* Collapse to entity level
collapse (sum) process_value, by(entity)

* Sort by process value
gsort -process_value 	// So the first few observations have the highest value

* List observations
list entity process_value in 1/5

/*******************************************************************************
	Create graph with awarded value by process type
*******************************************************************************/

* Load data again (since we changed the level of observation earlier)
use "../Data/Final/final_process.dta", clear

* Rescale process vlaue for ease of reading
replace process_value = round(process_value/1000000000, .1)

* Install pretty graph schemes
net install tsg_schemes, from("https://raw.githubusercontent.com/asjadnaqvi/Stata-schemes/main/schemes/") replace

* Select scheme to use
set scheme white_w3d

* Create graph
gr bar (sum) process_value, ///
	over(procurement_type) ///
	ytitle("Awarded value (Lev Billion)") ///
	blabel(total) ///
	title("Total awarded value by process type")

* Save graph
gr export "../Output/Awarded value by process type.png", replace

************************************************************************ The end.