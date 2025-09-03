
FILE STRUCTURE INTERDISCIPLINARITY PROFS (SITE VERSION)

Main folder:

1. oa_articles.RMD
> File in which I scrape OpenAlex publications based on NARCIS publications
> We also gather OpenAlex author IDs with the NARCIS publications, and use these to scrape additional publications by the same author
> Output files:
	> oa_allpubs_disci ("./data/openalex_pubs/all_publications/oa_allpubs_disci.rda"): file with publications obtained from OpenAlex containing associated topics and topic scores (1-3)
	> oa_allpubs_cites ("./data/openalex_pubs/all_publications/oa_allpubs_cites.rda"): file with publications obtained from OpenAlex containing citation counts (currently unused)

2. interdisciplinarity.RMD
> File in which I determine Rao-Stirling diversity (and its components of variety-balance-disparity) using OpenAlex publications with attached topics
> Output files:
	> interdisciplinarity ("./data/processed/interdisciplinarity.rda"): time-varying Rao-Stirling and other interdisciplinarity indices for each scholar

3. datapreparation.RMD
> Overall data preparation file, where I attach all relevant variables (such as full professor promotions/interdisciplinarity score) to the PhD dataset, and create a person-period-file for the time-varying variables. Variables such as gender, which I created for and re-use from earlier papers, are also added here without further detailing their creation. I can place that code on the replication website, or refer to my earlier replication websites for the creation of the starting dataset. 
> Output files:
	> df_ppf ("./data/processed/df_ppf.rda"): person-period-file containing all variables used in the main analyses
	> df_ppf_r ("./data/processed/df_ppf_r.rda"): person-period-file containing all variables used in the robustness analyses, please note that the sample size is somewhat reduced because I set broader time-windows for measuring interdisciplinarity in some of these checks. 

4. analyses.RMD
> Code used to execute our main analyses and robustness checks
> I also created the figures here
> For the replication web site, I will probably split these up into main analyses and robustness checks
> Output files:
	> 20250723_ame ("./results/20250723_ame.rda"): average marginal effects (AMEs) for all models of our main analyses
	> various AME results files for all robustness checkes (./results/robustness/[filenames].rda)

5. tables.RMD
> Code used to create all tables in the manuscript


Professors folder

professor_lists_cleaning.RMD
> Cleaning yearly lists of professors, which are in different formats, so that we have a clean file of all professor appointments between 2004-2019
> Output file:
	> profs ("./data/professors/profs.rda"): dataframe of yearly professor appointments

professor_names.RMD
> Cleaning professor first names and adding names from different data sources and manually filled first names, so we can match professor appointments to PhDs
> Output files:
	> full ("./data/processed/fullprofessors.rda"): list of full professor appointments with year of appointment AND first name present
 	> full_nofn ("./data/prof_names/fullnofn.rda"): list of full professor appointments with year of appointment without first names after filling



