capture log close
log using "C:\Users\wb522556\OneDrive - WBG\Documents\GitHub\dime-stata-training\Presentations\5-data-analysis", smcl replace
//_1q
set scheme s2color
//_2
use "../DataWork/Data/Final/final_process.dta", clear
//_^
log close
