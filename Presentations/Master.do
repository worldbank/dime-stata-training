/*==============================================================================

						MAKING ANALYTICS REUSABLE
							Washington, DC
							 March 1, 2019
							 
					STATA MARKDOWN MASTER DO FILE
							 
==============================================================================*/

/*******************************************************************************
	PART 0: Select sections to run
*******************************************************************************/

	local packages		0
	local paths			1
	local document		1

/*******************************************************************************
	PART 1: Install necessary packages
*******************************************************************************/

	if `packages' {
		
		* Install markstat to use Stata markdown
		ssc install markstat, replace

		* Install whereis to make markstat work
		ssc install whereis, replace
		
		* Install other commands we will use for this session
		ssc install estout, replace
		ssc install unique, replace
		
	}
	
/*******************************************************************************
	PART 2: Set folder paths
*******************************************************************************/

	if `paths' {

		* Tell Stata where to find the relevant programs	
		cap noi whereis pdflatex 			"C:\Program Files\MiKTeX 2.9\miktex\bin\x64\pdflatex.exe"

		* Luiza's computer
		if lower("`c(username)'") == "wb501238" {
			
			* Folder where markdown files are
			global mdfolder 	"C:\Users\wb501238\Documents\GitHub\dime-stata-training\Presentations"
			
			* Tell Stata where to find pandoc
			whereis pandoc 		"C:\Program Files (x86)\Pandoc\pandoc.exe"
		}
		
		if "`c(username)'" == "wb522556" {
			
			* Folder where markdown files are
			global mdfolder 	"C:\Users\wb522556\OneDrive - WBG\Documents\GitHub\dime-stata-training\Presentations"
			
			* Tell Stata where to find pandoc
			whereis pandoc 		"C:\Program Files\Pandoc\pandoc.exe"
		}
	}
	
/*******************************************************************************
	PART 3: Create document
*******************************************************************************/

	if `document' {
	
		* Copy the Stata style to the same folder as the markdown file to compile in PDF
		cd "${mdfolder}"
		//copy https://www.stata-journal.com/production/sjlatex/stata.sty 	stata.sty
		
		foreach pres in "importing-data" "cleaning-str-cat" {
			
			if "`pres'" == "intro" 				local name Introduction
			if "`pres'" == "stata-interface" 	local name Lab 1 - Stata Interface
			if "`pres'" == "programming-101"	local name Lecture 1 - Introduction to Statistical Programming
			if "`pres'" == "data-map"	        local name Lecture 2 - Data Map
			if "`pres'" == "data-management"    local name Lecture 3 - Data Management
			if "`pres'" == "explore-data"	    local name Lab 2 - Exploring Data in Stata
			if "`pres'" == "importing-data"		local name Lab 3 - Importing and Exploring New Data
			if "`pres'" == "cleaning-str-cat"	local name Lab 4 - Cleaning Text and Categorical Variables
			
			markstat using "`pres'", slides(santiago)
			
			filefilter 	"`pres'.html" "`name'.html", ///
						from("c:/ado/plus/m/s5/santiago") to("www") replace
						
			cap erase "`pres'.smcl"
			cap erase "`pres'.do"
			cap erase "`pres'.html"

		}
	}
	
*============================== THE END =======================================*
