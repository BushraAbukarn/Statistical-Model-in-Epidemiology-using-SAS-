* A 90% CI for incidence rate ratio; 
data deaths; 
input n1 T1 n2 T2; 
cards;
72 1862 511 36653
; 
%let conf_level=90; 

data IRR_CI;
set deaths; 
IRR=(n1/T1) / (n2/T2); 
z=-probit((1-.01*&conf_level)/2); 
SE=sqrt(1/n1+1/n2); 
LCL=IRR/exp(z*SE); 
UCL=IRR*exp(z*SE); 
keep IRR LCL UCL; 
run; 

proc print data=IRR_CI; 
run; 

*Estimating the prevalence proprtions, odds, and incidence rates of concussions in football and in baseball; 
proc import out=ConcData datafile="C:/Users/bushr/OneDrive/Desktop/ConcussionData.csv" 
dbms=csv replace;

data ConcStats (drop=SubjectID Sport Concussion End_Date); 
set ConcData; 
if sport='football' and concussion='yes' then Fcases+1; 
if sport='baseball' and concussion='yes' then Bcases+1;
if sport='football' then Ftotal+1; 
if sport='baseball' then Btotal+1; 
if sport='football' then Fduration+end_date-'20Aug2015'd; 
if sport='baseball' then Bduration+end_date-'20Aug2015'd; 
if _N_=889; 
run; 

data ConcStat; 
set ConcStats; 
F_PP=Fcases/Ftotal; 
B_PP=Bcases/Btotal; 
F_ODDS=Fcases/(Ftotal-Fcases); 
B_ODDS=Bcases/(Btotal-Bcases); 
F_IR=Fcases/Fduration;
B_IR=Bcases/Bduration; 
run; 

proc print data=ConcStat noobs; 
var F_PP B_PP F_ODDS B_ODDS F_IR B_IR; 
run; 
