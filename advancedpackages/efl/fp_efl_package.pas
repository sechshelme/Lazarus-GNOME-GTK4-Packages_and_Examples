{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_efl_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_eina, efl, fp_eo, fp_efl, fp_emile, fp_evas, fp_ecore, fp_ecore_evas, 
  fp_edje, fp_ecore_file, fp_eet, fp_elementary, fp_ethumb, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_efl_package', @Register);
end.
