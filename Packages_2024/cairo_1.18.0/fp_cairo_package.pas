{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_cairo_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_cairo_ft, fp_cairo_pdf, fp_cairo_ps, fp_cairo_script, 
  fp_cairo_script_interpreter, fp_cairo_svg, fp_cairo_tee, fp_cairo_xcb, 
  fp_cairo_xlib, fp_cairo_xlib_xrender, fp_cairo, fp_cairo_gobject, 
  LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_cairo_package', @Register);
end.
