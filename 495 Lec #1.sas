data diabetes1; 
input race gender percent @@; 
cards; 
1 1 14.5 1 0 14.8 2 1 10.0 2 0 8.5 3 1 11.4 3 0 12.0
4 1 13.7 4 0 11.6 5 1 8.6 5 0 6.6
;
*Convert factor to categorical;  
proc format; 
value racefmt 1='American Indian/AK Native'
              2='Asian, Non-Hispanic' 
			  3='Black, Non-Hispanic'
			  4='Hispanic' 
			  5='White, Non-Hispanic' 
; 
value genderfmt 1='Male' 0='Female'; 
run; 

*Visualize;
title 'Ground Bar Graph for Prevelance of Diagnosed Diabetes by Race and Gender'; 
proc sgplot data=diabetes1; 
styleattrs datacolors=(green red); 
vbar race /response=percent group=gender groupdisplay=cluster;
format race racefmt. gender genderfmt.; 
xaxis label= ' ';
yaxis label= 'Percent'; 
run;
