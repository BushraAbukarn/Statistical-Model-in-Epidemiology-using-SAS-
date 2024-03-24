* A 99% CI of relative risk; 
data cases; 
input x1 n1 x2 n2; 
cards; 
18 1000 43 1000
; 
%let conf_level=99; 

data RR_CI; 
set cases; 
RR=(x1/n1) / (x2/n2); 
z=-probit((1-0.01*&conf_level)/2); 
SE=sqrt(1/x1-1/n1+1/x2-1/n2); 
LCL=RR/exp(z*SE); 
UCL=RR*exp(z*SE); 
keep RR LCL UCL; 
run; 

proc print data=RR_CI noobs; 
run; 

* A 99% CI of the odss ratio; 
%let conf_level=99; 
data OR_CI; 
set cases; 
OR=(x1/(n1-x1))/(x2/(n2-x2)); 
z=-probit((1-.01*&conf_level)/2); 
SE=sqrt(1/x1+1/(n1-x1)+1/x2+1/(n2-x2)); 
LCL=OR/exp(z*SE); 
UCL=OR*exp(z*SE); 
keep OR LCL UCL; 
run; 
proc print data=OR_CI noobs; 
run; 
