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
~~~sas  
 Usage Example:
  %xattr_set_var(ds=a, var=x, xname=xa1, xvalue="xxxx");
  %xattr_set_var(ds=a, var=x, xname=xa2, xvalue=1111);
  %xattr_set_var(ds=a, var=y, xname=ya1, xvalue="yyyy");
~~~

# %xattr_set_ds
Purpose:        Assign an extended attribute to a dataset.
Parameters:
~~~text
  lib       - Library name where the dataset resides (default = WORK)
  ds        - Dataset name
  xname     - Name of the extended attribute
  xvalue    - Value of the extended attribute
~~~
 Usage Example:
 %xattr_set_ds(ds=a,  xname=xds_a1, xvalue="ds attr 1");
