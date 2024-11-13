{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_GTK4_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_GDK4, fp_GDK4_broadway, fp_GSK4, fp_GSK4_broadway, fp_GTK4, 
  fp_GTK4_unix_print, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_GTK4_package', @Register);
end.
