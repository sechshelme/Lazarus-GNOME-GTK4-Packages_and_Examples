{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_serd_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_serd, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_serd_package', @Register);
end.
