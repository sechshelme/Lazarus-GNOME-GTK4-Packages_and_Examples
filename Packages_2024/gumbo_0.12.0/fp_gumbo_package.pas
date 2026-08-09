{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_gumbo_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_gumbo, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_gumbo_package', @Register);
end.
