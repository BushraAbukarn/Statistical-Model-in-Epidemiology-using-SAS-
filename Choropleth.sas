*Choropleth world maps of the number of COVID cases;
proc import out=coviddata 
datafile="C:\Users\bushr\OneDrive\Desktop\CovidCasesWorldWide.csv" dbms=csv replace;
data quarter1; 
set coviddata; 
if (quarter=1); 
run; 
title "Number of COVID Cases by Country, Y2020 Q1"; 
proc gmap data=quarter1 map=maps.world; 
id id; 
choro ncases/name="graph1"; 
run; 
quit; 
data quarter2; 
set coviddata; 
if (quarter=2); 
run; 
title "Number of COVID Cases by Country, Y2020 Q2"; 
proc gmap data=quarter2 map=maps.world; 
id id; 
choro ncases/name="graph2"; 
run; 
quit; 
data quarter3; 
set coviddata; 
if (quarter=3); 
run;
title "Number of COVID Cases by Country, Y2020 Q3"; 
proc gmap data=quarter3 map=maps.world; 
id id; 
choro ncases/name="graph3"; 
run; 
quit;
proc greplay igout=work.gseg tc=sashelp.templt template=l2r2 nofs; 
treplay 1:graph1 2:graph3 3:graph2; 
run; 

*Choropleth world maps of death rates; 
title "Death Rate by Country, Y2020 Q1"; 
proc gmap data=quarter1 map=maps.world; 
id id; 
choro deathrate/name="graph4"; 
run; 
quit; 
title "Death Rate by Country, Y2020 Q2"; 
proc gmap data=quarter2 map=maps.world; 
id id; 
choro deathrate/name="graph5"; 
run; 
quit; 
title "Death Rate by Country, Y2020 Q3"; 
proc gmap data=quarter3 map=maps.world; 
id id; 
choro deathrate/name="graph6"; 
run; 
quit; 
proc greplay igout=work.gseg tc=sashelp.templt template=l2r2 nofs; 
treplay 1:graph4 2:graph6 3:graph5; 
run; 

*Choropleth US map of the median AQI; 
proc import out=AQIdata datafile="C:\Users\bushr\OneDrive\Desktop\AQI_by_County.csv" dbms=csv replace; 
run; 
title "Median AQI in 2020 in US by County"; 
proc gproject data=maps.counties out=contUScounties; 
where state not in(2,15,72); 
id state county; 
run; 
proc gmap data=AQIdata map=contUScounties all; 
id state county; 
choro medianAQI; 
run; 
quit; 
