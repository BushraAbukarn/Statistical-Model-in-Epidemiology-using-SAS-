data sicklez_cell; 
input clinic $ SBP @@; 
cards; 
A 124 A 123 A 106 A 120 A 113 A 103
B 142 B 140 B 129 B 131 B 129 B 113
C 128 C 135 C 146 C 133 C 137 C 129
; 
*One-way ANOVA (Analysis of Variance); 
proc anova; 
class clinic; 
model SBP=clinic; 
run; 

*Tukey-test; 
proc glm; 
class clinic; 
model SBP=clinic; 
means clinic/tukey; 
run; 

*Wilcoxon test; 
proc npar1way Wilcoxon;
  class clinic;
  var SBP;
  exact;
run;

*Wilcoxon rank-sum test for pairwise comparison between the clinics; 
* A & B; 
proc npar1way Wilcoxon;
  class clinic;
  var SBP;
  exact;
  where clinic in ("A", "B"); 
run;

*A & C;
proc npar1way Wilcoxon;
  class clinic;
  var SBP;
  exact;
  where clinic in ("A", "C"); 
run;

*B & C; 
proc npar1way Wilcoxon;
  class clinic;
  var SBP;
  exact;
  where clinic in ("B", "C"); 
run;
