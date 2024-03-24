proc import out=vaxdata datafile="C:/Users/bushr/OneDrive/Desktop/covid19postvaxstatewidestats.csv"
dbms=csv replace;

*Number of unvaccinated vs. vaccinated cases; 
title 'Number of Unvaccinated vs. Vaccinated Cases';
proc sgplot data=vaxdata;
series x=date y=unvaccinated_cases/ legendlabel='unvaccinated' markers 
 markerattrs=(color=blue symbol=circlefilled) lineattrs=(color=blue pattern=solid);
  series x=date y=vaccinated_cases/ legendlabel='vaccinated' markers 
    markerattrs=(color=black symbol=circle) lineattrs=(color=black pattern=solid);
 xaxis label='Date' values=('1feb21'd to '2jan22'd by qtr) grid;
   yaxis label='Number of Cases' grid;
run;

*Number of Hospitalized Unvaccinated vs. Vaccinated cases;
title 'Number of Unvaccinated vs. Vaccinated Hospitalized Cases';
proc sgplot data=vaxdata;
series x=date y=unvaccinated_hosp/ legendlabel='unvaccinated' markers 
 markerattrs=(color=blue symbol=circlefilled) lineattrs=(color=blue pattern=solid);
  series x=date y=vaccinated_hosp/ legendlabel='vaccinated' markers 
    markerattrs=(color=black symbol=circle) lineattrs=(color=black pattern=solid);
 xaxis label='Date' values=('1feb21'd to '2jan22'd by qtr) grid;
   yaxis label='Number of Cases' grid;
run;

*Number of Unvaccinated vs. Vaccinated deaths; 
title 'Number of Unvaccinated vs. Vaccinated Deaths';
proc sgplot data=vaxdata;
series x=date y=unvaccinated_deaths/ legendlabel='unvaccinated' markers 
 markerattrs=(color=blue symbol=circlefilled) lineattrs=(color=blue pattern=solid);
  series x=date y=vaccinated_deaths/ legendlabel='vaccinated' markers 
    markerattrs=(color=black symbol=circle) lineattrs=(color=black pattern=solid);
 xaxis label='Date' values=('1feb21'd to '2jan22'd by qtr) grid;
   yaxis label='Number of Cases' grid;
run;

*Unvaccinated vs. Vaccinated population sizes;
title 'Unvaccinated vs. Vaccinated Population Size';
proc sgplot data=vaxdata;
series x=date y=population_unvaccinated/ legendlabel='unvaccinated' markers 
 markerattrs=(color=blue symbol=circlefilled) lineattrs=(color=blue pattern=solid);
  series x=date y=population_vaccinated/ legendlabel='vaccinated' markers 
    markerattrs=(color=black symbol=circle) lineattrs=(color=black pattern=solid);
 xaxis label='Date' values=('1feb21'd to '2jan22'd by qtr) grid;
   yaxis label='Number of Cases' grid;
run;


