{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_colord_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_colord, fp_colord_gtk4, fp_colord_session, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_colord_package', @Register);
end.
