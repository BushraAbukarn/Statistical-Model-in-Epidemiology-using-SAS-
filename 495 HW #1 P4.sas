data vaccination;
input state $1-13 race $ percent; 
cards;
Virginia      White    66
Virginia      Black    64
Virginia      Hispanic 75
Virginia      Asian    97
South Dakota  White    60
South Dakota  Black    35
South Dakota  Hispanic 5
South Dakota  Asian    12
Massachusetts White    85
Massachusetts Black    76
Massachusetts Hispanic 72
Massachusetts Asian    94
Idaho	      White    43
Idaho         Black    42
Idaho         Hispanic 40
Idaho         Asian    58
Maryland      White    76
Maryland      Black    70
Maryland      Hispanic 77
Maryland      Asian    93
;

*a; 
*Group bu race clustered by state; 
title 'Percent Vaccinated by Race Clustered by State';
proc sgplot data=vaccination; 
 styleattrs datacolors=(blue green red purple);
  vbar state /response=percent group=race groupdisplay=cluster;
     xaxis label=' ';
      yaxis label='Percent Vaccinated';
run;
*Group by state clustered by race;
title 'Percent Vaccinated by State Clustered by Race';
proc sgplot data=vaccination; 
 styleattrs datacolors=(blue green red purple orange);
  vbar race /response=percent group=state groupdisplay=cluster;
     xaxis label=' ';
      yaxis label='Percent Vaccinated';
run;

*b; 
*histogram of percent vaccinated Asians;
proc import out=perc_vaccinated datafile=" C:/Users/bushr/OneDrive/Desktop/CovidVaccination.csv" dbms=csv replace;
title 'Histogram of Percent Vaccinated Asians';
proc sgplot data=perc_vaccinated;
 histogram Asian/scale=count binstart=0 
binwidth=10 showbins fillattrs=(color=green);
   xaxis display=(nolabel);
run;

*histogram of percent vaccinated Black; 
title 'Histogram of Percent Vaccinated Blacks';
proc sgplot data=perc_vaccinated;
 histogram Black/scale=count binstart=0 
binwidth=10 showbins fillattrs=(color=blue);
   xaxis display=(nolabel);
run;

*histogram of percent vaccinated Hispanic; 
title 'Histogram of Percent Vaccinated Hispanics';
proc sgplot data=perc_vaccinated;
 histogram Hispanic/scale=count binstart=0 
binwidth=10 showbins fillattrs=(color=red);
   xaxis display=(nolabel);
run;

*histogram of percent vaccinated White; 
title 'Histogram of Percent Vaccinated Whites';
proc sgplot data=perc_vaccinated;
 histogram White/scale=count binstart=0 
binwidth=10 showbins fillattrs=(color='yellow');
   xaxis display=(nolabel);
run;



