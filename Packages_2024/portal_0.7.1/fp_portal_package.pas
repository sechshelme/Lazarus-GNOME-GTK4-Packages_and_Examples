{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_portal_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_portal, fp_portal_gtk4, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_portal_package', @Register);
end.
