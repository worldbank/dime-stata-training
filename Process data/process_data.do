 
	if regex(c(username), "501238") {
		global onedrive		"C:\Users\wb501238\OneDrive - WBG\"
		global github 		"C:\Users\wb501238\Documents\GitHub\"
	} 
	
	global raw 		"${onedrive}/Croatia/DataWork/Data/For Training"
	global repo		"${github}/dime-stata-training"
	global datawork "${repo}/DataWork"
	
	use "${raw}\process_clean.dta", clear
	
	iecodebook apply using "${datawork}/Documentation/clean_process.xlsx"
	
	foreach var of varlist 	evaluation_method bid_procedure bid_status ///
							procurement_type bid_type bid_classification ///
							entity_county process_type {
		tempvar newvar
		rename `var' `newvar'
		encode `newvar', gen(`var')
		drop `newvar'
	}
	
	order 	bid_id ///
			process_id process_name unit_id ///
			entity entity_county ///
			year_init month_init ///
			evaluation_method procurement_type ///
			bid_procedure bid_type bid_classification bid_status ///
			bid_submission_deadline ///
			nr_participants nr_nonlocal_bidders nr_sme_bidders nr_lots ///
			process_value process_type ///
			bid_submission_date bid_delivery_date bid_subm_del_date bid_submission_period ///
			in_sample
			
	save "${datawork}/Data/Final/final_process", replace
