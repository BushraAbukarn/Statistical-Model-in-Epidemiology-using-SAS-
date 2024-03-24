*/ Binomial Exact Test CI for Prevalence Proprtion; 
data flu_freq;
do i=1 to 725;
flu="yes";
output;
end;
do i=726 to 10000;
flu="no";
output;
end;
run;

proc freq data=flu_freq;
table flu/binomial (p=.07 level="yes") alpha=0.1;
run;

*/Pisson Exact Test and CI for Incidence Rate;
data cases; 
input T n; 
cards; 
1978 12
; 

%let lambda0=.01; 
%let H1="less"; 

data test; 
set cases; 
if (&H1="greater") then 
pvalue=cdf("gamma", &lambda0*T, n); 
if (&H1="less") then
pvalue=1-cdf("gamma", &lambda0*T, n+1); 
if (&H1="two.sided" and n<&lambda0*T) then 
pvalue=min(2*(1-cdf("gamma", &lambda0*T, n+1)),1); 
if (&H1="two.sided" and n>&lambda0*T) thenn
pvalue=min(2*1-cdf("gamma", &lambda0*T, n),1); 
run; 

proc print data=test noobs; 
run; 

/*Exact Poisson CI*/ 
%let conf_level=95; 
data CI (drop=alpha); 
set cases; 
alpha=(1-0.01*&conf_level); 
lambda_hat=n/T; 
lambdaL=gaminv(alpha/2,n)/T; 
lambdaU=gaminv(1-alpha/2,n+1)/T; 
run; 

proc print data=CI noobs; 
run; 
