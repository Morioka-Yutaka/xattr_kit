/*** HELP START ***//*

Macro Name:     xattr_set_var
Purpose:        Assign an extended attribute to a variable .
Parameters:
  lib       - Library name where the dataset resides (default = WORK)
  ds        - Dataset name
  var       - Variable name to which the extended attribute will be assigned
  xname     - Name of the extended attribute
  xvalue    - Value of the extended attribute
 Usage Example:
  %xattr_set_var(ds=a, var=x, xname=xa1, xvalue="xxxx");
  %xattr_set_var(ds=a, var=x, xname=xa2, xvalue=1111);
  %xattr_set_var(ds=a, var=y, xname=ya1, xvalue="yyyy");

*//*** HELP END ***/

%macro xattr_set_var(lib=WORK,ds=,var=,xname=,xvalue=);
proc datasets nolist lib=&lib;
modify &ds;
xattr set var &var( &xname =&xvalue);
quit;
%mend;
