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
		cap noi whereis pandoc 				"C:\Program Files (x86)\Pandoc\pandoc.exe"
		
		if "`c(username)'" == "wb522556" {
					whereis pandoc 				"C:\Program Files\Pandoc\pandoc.exe"
				}		
		* Workshop folder
		global	mdfolder	"C:\Users\wb501238\Documents\GitHub\dime-stata-training\Presentations"
		if "`c(username)'" == "wb522556" {
					global mdfolder 	"C:\Users\wb522556\OneDrive - WBG\Documents\GitHub\dime-stata-training\Presentations"
				}
	}
	
/*******************************************************************************
	PART 3: Create document
*******************************************************************************/

	if `document' {
	
		* Copy the Stata style to the same folder as the markdown file to compile in PDF
		cd "${mdfolder}"
		//copy https://www.stata-journal.com/production/sjlatex/stata.sty 	stata.sty
		
		*markstat using "${mdfolder}/1-stata-interface", slides(santiago)		
		*markstat using "${mdfolder}/5-data-analysis", beamer
		markstat using "${mdfolder}/explore-data", slides(santiago)
		
	
	}
	
*============================== THE END =======================================*
