{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_soundio_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_soundio, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_soundio_package', @Register);
end.
