# xattr_kit
xattr_kit is a package to simplify the management of SAS extended attributes

![xattr_kit](./xattr_kit_small.png)  

# %xattr_set_var
Purpose:        Assign an extended attribute to a variable.
~~~text  
Parameters:
  lib       - Library name where the dataset resides (default = WORK)
  ds        - Dataset name
  var       - Variable name to which the extended attribute will be assigned
  xname     - Name of the extended attribute
  xvalue    - Value of the extended attribute
~~~
 Usage Example:
~~~sas  
  %xattr_set_var(ds=a, var=x, xname=xa1, xvalue="xxxx");
  %xattr_set_var(ds=a, var=x, xname=xa2, xvalue=1111);
  %xattr_set_var(ds=a, var=y, xname=ya1, xvalue="yyyy");
~~~

# %xattr_set_ds
Purpose:        Assign an extended attribute to a dataset.
~~~text
Parameters:
  lib       - Library name where the dataset resides (default = WORK)
  ds        - Dataset name
  xname     - Name of the extended attribute
  xvalue    - Value of the extended attribute
~~~
 Usage Example:
~~~sas
 %xattr_set_ds(ds=a,  xname=xds_a1, xvalue="ds attr 1");
~~~

# %list_xattr
 Purpose:       List of attributes printed and/or logged; results stored in xattrs dataset.
 ~~~text
 Parameters:
   lib           - (Optional) Library name to filter the results
   ds            - (Optional) Dataset name to filter the results
   cat           - (Optional) Category (VARIABLE or DATASET) to filter
   xattr_name    - (Optional) Specific extended attribute name to filter
   display_ods   - (Y/N) Whether to print the result table using PROC PRINT (default = Y)
   put_log       - (Y/N) Whether to output results to log via PUT statement (default = Y)
~~~
 Usage Example:
 ~~~sas
 %list_xattr()
~~~
<img width="292" height="101" alt="Image" src="https://github.com/user-attachments/assets/db2fed44-8692-4bd9-aaa2-d6b18d19aa7e" />
<br>
<img width="335" height="38" alt="Image" src="https://github.com/user-attachments/assets/5d96267a-1fb7-48e4-85e7-07d1c049c9ed" />
<br>
<img width="514" height="83" alt="Image" src="https://github.com/user-attachments/assets/ef838b81-22eb-4beb-ba30-dc841260419a" />
<br>

# %attr_in
Purpose:        Reapply extended attributes listed in the xattrs dataset to datasets/variables.
 ~~~text
Parameters:
  ds        - Name of the dataset containing the extended attributes (typically 'xattrs')
Variables required for the read data set are [libname],[ds],[var],[xattr],[xtype],[xvalue]
~~~
Usage Example:
 ~~~sas
%xattr_in(ds=xattrs);
~~~
<img width="514" height="83" alt="Image" src="https://github.com/user-attachments/assets/ef838b81-22eb-4beb-ba30-dc841260419a" />
<br>
<img width="438" height="103" alt="Image" src="https://github.com/user-attachments/assets/96244bea-d64a-4d13-98c9-d087da143cbf" />
