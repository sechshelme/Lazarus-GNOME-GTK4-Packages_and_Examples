{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_clib_packages;

{$warn 5023 off : no warning about unused units}
interface

uses
  clib, signal, stdio, termios, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_clib_packages', @Register);
end.
