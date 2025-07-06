{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_clib_packages;

{$warn 5023 off : no warning about unused units}
interface

uses
  clib, fp_signal, fp_stdio, fp_termios, fp_netdb, fp_unistd, fp_socket, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_clib_packages', @Register);
end.
