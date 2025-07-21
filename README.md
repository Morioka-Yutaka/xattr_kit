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

# %xattr_in
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

# %xattr2macrovar
Purpose:        Convert extended attribute values into global macro variables.
 ~~~text
Parameters:
  lib              - Library name (default = WORK)
  ds               - Dataset name
  xattr_name       - Specific attribute name to extract (optional)
  macro_name_type  - Naming convention for macro variables. Options:
                    "libname_ds_var_xattr", "ds_var_xattr", "var_xattr", "xattr"
                    Default = "ds_var_xattr"
~~~
Output:         Creates macro variables in the global symbol table with corresponding values. <br>
 Usage Example:
~~~sas
%xattr2macrovar(lib=WORK)
~~~
<img width="289" height="39" alt="Image" src="https://github.com/user-attachments/assets/44041d05-5e81-433a-836e-e3fca03204de" />

# version history
0.1.0(22July2025): Initial version

## What is SAS Packages?  
The package is built on top of **SAS Packages framework(SPF)** developed by Bartosz Jablonski.
For more information about SAS Packages framework, see [SAS_PACKAGES](https://github.com/yabwon/SAS_PACKAGES).  
You can also find more SAS Packages(SASPACs) in [SASPAC](https://github.com/SASPAC).

## How to use SAS Packages? (quick start)
### 1. Set-up SPF(SAS Packages Framework)
Firstly, create directory for your packages and assign a fileref to it.
~~~sas      
filename packages "\path\to\your\packages";
~~~
Secondly, enable the SAS Packages Framework.  
(If you don't have SAS Packages Framework installed, follow the instruction in [SPF documentation](https://github.com/yabwon/SAS_PACKAGES/tree/main/SPF/Documentation) to install SAS Packages Framework.)  
~~~sas      
%include packages(SPFinit.sas)
~~~  
### 2. Install SAS package  
Install SAS package you want to use using %installPackage() in SPFinit.sas.
~~~sas      
%installPackage(packagename, sourcePath=\github\path\for\packagename)
~~~
(e.g. %installPackage(ABC, sourcePath=https://github.com/XXXXX/ABC/raw/main/))  
### 3. Load SAS package  
Load SAS package you want to use using %loadPackage() in SPFinit.sas.
~~~sas      
%loadPackage(packagename)
~~~
### Enjoy😁
