/*** HELP START ***//*

Macro Name:     xattr_in
Purpose:        Reapply extended attributes listed in the xattrs dataset to datasets/variables.
Parameters:
  ds        - Name of the dataset containing the extended attributes (typically 'xattrs')
Variables required for the read data set are [libname],[ds],[var],[xattr],[xtype],[xvalue]

Usage Example:
%xattr_in(ds=xattrs);

*//*** HELP END ***/

%macro xattr_in(ds=);
options nosource;
%put NOTE: Variables required for the read data set are [libname],[ds],[var],[xattr],[xtype],[xvalue];
data _null_;
set xattrs;
call execute("proc datasets nolist lib=");
call execute(libname);
call execute(";");
call execute("modify");
call execute(ds);
call execute(";");
if missing(var) then do;
  call execute("xattr set ds");
  call execute(xattr);
  call execute("=");
  if upcase(xtype)="NUM" then do;
    call execute(xvalue);
    call execute(";");
  end;
  if upcase(xtype)="CHAR" then do;
    call execute(quote(strip(xvalue)));
    call execute(";");
  end;
  put "NOTE: Data set " ds "of library " libname "has been set to extended attribute "  xattr " with the value " xvalue;
end;
if ^missing(var) then do;
  call execute("xattr set var");
  call execute(var);
  call execute("(");
  call execute(xattr);
  call execute("=");
  if upcase(xtype)="NUM" then do;
    call execute(xvalue);
    call execute(");");
  end;
  if upcase(xtype)="CHAR" then do;
    call execute(quote(strip(xvalue)));
    call execute(");");
  end;
  put "NOTE: Variable " var "in data set " ds "of library " libname "has been set to extended attribute "  xattr " with the value " xvalue;
end;
call execute("quit;");
run;
options source;
%mend;
