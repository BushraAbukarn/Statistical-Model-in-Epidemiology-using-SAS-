*Problem 1;
data cold_data;
input cold$ freq; 
cards; 
yes 390
no 1210
; 
proc freq data=cold_data; 
table cold/binomial (p=.27 level="yes") alpha=0.01; 
weight freq; 
run; 

*Problem 2; 
data cases; 
input T n; 
cards; 
15348 193
; 

%let conf_level=99; 
data CI (drop=alpha); 
set cases; 
alpha=(1-0.01*&conf_level); 
lambda_hat=n/T; 
lambdaL=gaminv(alpha/2,n)/T; 
lambdaU=gaminv(1-alpha/2,n+1)/T; 
run; 

proc print data=CI noobs; 
run;

%let lambda0=0.01; 
%let H1="two.sided"; 

data test; 
set cases; 
if(&H1="two.sided" and n<&lambda0*T) then 
pvalue=min(2*(1-cdf("gamma", &lambda0*T, n+1)),1); 
if(&H1="two.sided" and n>=&lambda0*T) then 
pvalue=min(2*cdf("gamma", &lambda0*T, n),1);
run; 

proc print data=test noobs; 
run; 


