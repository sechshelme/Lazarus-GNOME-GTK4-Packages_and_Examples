{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit mgl2_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_mgl2, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('mgl2_package', @Register);
end.
