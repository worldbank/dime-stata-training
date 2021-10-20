use "DataWork/Data/Raw/process_raw.dta", clear

replace Process_Naziv = "" if Process_Naziv == "NULL"
replace StatusNadmetanja_Naziv_tr = lower(StatusNadmetanja_Naziv_tr)
replace StatusNadmetanja_Naziv_tr = strtrim(StatusNadmetanja_Naziv_tr)

encode StatusNadmetanja_Naziv_tr, gen(bid_status)

encode TipNadmetanja_Naziv_tr, gen(bidding_type)
recode bidding_type (4 = 3) (5 = 6)

encode MetodaEvaluacije_tr, gen(evaluation_method)

label define evaluation_method 2 "Most economically advantageous tender", modify

save "DataWork/Data/Clean/process_clean", replace
