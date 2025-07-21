/*** HELP START ***//*

Macro Name:     list_xattr
 Purpose:       List of attributes printed and/or logged; results stored in xattrs dataset.
 Parameters:
   lib           - (Optional) Library name to filter the results
   ds            - (Optional) Dataset name to filter the results
   cat           - (Optional) Category (VARIABLE or DATASET) to filter
   xattr_name    - (Optional) Specific extended attribute name to filter
   display_ods   - (Y/N) Whether to print the result table using PROC PRINT (default = Y)
   put_log       - (Y/N) Whether to output results to log via PUT statement (default = Y)

 Usage Example:
 %list_xattr()

*//*** HELP END ***/

%macro list_xattr(lib=,ds=,cat=,xattr_name=,display_ods=Y,put_log=Y);
proc sql ;
create table xattrs as
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
 %if %length(&cat) ne 0 %then %do;
  and calculated xattr_category="%upcase(&cat)"
 %end;
 %if %length(&xattr_name) ne 0 %then %do;
  and xattr="%upcase(&xattr_name)"
 %end;
;
quit;
%if %upcase(&display_ods) = Y %then %do;
 proc print data=xattrs noobs;
 run;
%end;
%if %upcase(&put_log) = Y %then %do;
 data _null_;
 set xattrs;
 put ds= xattr_category= var= xattr= xtype= xvalue=; 
run;
%end;
%mend;
