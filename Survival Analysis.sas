*Q1; 
proc import out=necrolysis_data 
datafile="C:\Users\bushr\OneDrive\Desktop\necrolysis_data.csv"
dbms=csv replace; 
run; 

*Fitting overall KM survival curve; 
proc lifetest plots=(survival); 
time weeks*censored(1); 
run; 
*KM curves and log-rank test by gender; 
proc lifetest plots=(survivial); 
time weeks*censored(1); 
strata gender; 
run; 
*KM curves and log-rank test by causes; 
proc lifetest plots=(survivial); 
time weeks*censored(1); 
strata causes; 
run; 
*KM curves and log-rank test by comorbidities; 
proc lifetest plots=(survivial); 
time weeks*censored(1); 
strata comorbidities; 
run; 
*Cox Proportional Hazards Model;  
proc phreg data=necrolysis_data outest=betas;
   class gender(ref='M') causes(ref='known') comorbidities(ref='no');
   model weeks*censored(1) = age gender causes comorbidities;
   baseline out=outdata survival=Sbar;
run;
proc print data=betas;
run;
proc print data=outdata;
run;
