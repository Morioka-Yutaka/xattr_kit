/*** HELP START ***//*

Macro Name:     xattr2macrovar
Purpose:        Convert extended attribute values into global macro variables.
Parameters:
  lib              - Library name (default = WORK)
  ds               - Dataset name
  xattr_name       - Specific attribute name to extract (optional)
  macro_name_type  - Naming convention for macro variables. Options:
                    "libname_ds_var_xattr", "ds_var_xattr", "var_xattr", "xattr"
                    Default = "ds_var_xattr"
Output:         Creates macro variables in the global symbol table with corresponding values.
 Usage Example:
%xattr2macrovar(lib=WORK)

*//*** HELP END ***/

%macro xattr2macrovar(lib=WORK,ds=,xattr_name=,macro_name_type=ds_var_xattr);
proc sql ;
create table xattr2macrovar as
 select
  libname
  ,memname as ds
  ,case 
   when name is not null then 'VARIABLE' 
   when name is null then 'DATASET' 
   else  ''
  end as xattr_category
  ,name as var
  ,xattr
  ,xtype
  ,xvalue
 from dictionary.xattrs
 where 1=1 
 %if %length(&lib) ne 0 %then %do;
  and libname="%upcase(&lib)"
 %end;
 %if %length(&ds) ne 0 %then %do;
  and memname="%upcase(&ds)"
 %end;
 %if %length(&xattr_name) ne 0 %then %do;
  and xattr="%upcase(&xattr_name)"
 %end;
;
quit;

data _null_;
set xattr2macrovar;
macro_name_type=lowcase("&macro_name_type");
if macro_name_type ="libname_ds_var_xattr" then mvar_name=catx("_",libname,ds,var,xattr);
else if macro_name_type ="ds_var_xattr" then mvar_name=catx("_",ds,var,xattr);
else if macro_name_type ="var_xattr" then mvar_name=catx("_",var,xattr);
else if macro_name_type ="xattr" then mvar_name=xattr;
else do;
  put "WARNING:macro_name_type need [libname_ds_var_xattr] or  [ds_var_xattr] or  [var_xattr] or [xattr]";
  put "NOTE: [ds_var_xattr] is set. ";
  mvar_name=catx("_",ds,var,xattr);
end;
 call symputx(mvar_name,xvalue,"G");
 put "NOTE: Global Macro variable[" mvar_name "] set with  [" xvalue"]";
run;
%mend;
