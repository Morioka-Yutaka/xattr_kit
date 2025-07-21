/*** HELP START ***//*

Macro Name:     xattr_set_ds
Purpose:        Assign an extended attribute to a dataset.
Parameters:
  lib       - Library name where the dataset resides (default = WORK)
  ds        - Dataset name
  xname     - Name of the extended attribute
  xvalue    - Value of the extended attribute
 Usage Example:
 %xattr_set_ds(ds=a,  xname=xds_a1, xvalue="ds attr 1");

*//*** HELP END ***/

%macro xattr_set_ds(lib=WORK,ds=,xname=,xvalue=);
proc datasets nolist lib=&lib;
modify &ds;
xattr set ds &xname =&xvalue;
quit;
%mend;
