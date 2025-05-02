{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_tickit_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_tickit, fp_tickit_evloop, fp_tickit_mockterm, fp_tickit_termdrv, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_tickit_package', @Register);
end.
