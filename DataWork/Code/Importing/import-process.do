
* Importing the dataset and saving it in Stata format

import excel "DataWork/Data/Raw/process_raw.xlsx", firstrow sheet("Sheet1") clear

isid Nadmetanje_ID 	// uniquely and fully identifying

drop if Process_Naziv == "" //one way to find this missing observation

save 		 "DataWork/Data/Raw/process_raw.dta", replace









