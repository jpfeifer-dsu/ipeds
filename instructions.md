Process:
 -- 1st Submission File
 
	  Run against PROD:
		01_ipeds-npsas-initial_submision.sql
		
	  After submitting NPSAS will send a sample of student data back to DSU to be analyzed
 
 -- Sample Data
	  Run against DSCIR:
		02_ipeds-npsas-create-insert-sample-data.sql
		import sampled student data into table
		
	  Run against PROD & update parameters and sampled student table
	    03_ipeds-npsas-create-insert-gi-enrl-data.sql
		
	  Run the Return File Queries:
	    export the data as csv with no headers
		04_ipeds-npsas-return-sample-general.sql
		05_ipeds-npsas-return-sample-enrollment.sql
		06_ipeds-npsas-return-sample-budget.sql
	    07_ipeds-npsas-return-sample-fa.sql
		
-- 2nd Submission File to NPSAS
		
 