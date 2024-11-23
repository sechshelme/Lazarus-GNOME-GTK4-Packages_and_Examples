{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_GLIB2_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_glib2, fp_GLIBTools, fp_glib_unix, fp_gmodule, fp_gio_unix_2, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_GLIB2_package', @Register);
end.
