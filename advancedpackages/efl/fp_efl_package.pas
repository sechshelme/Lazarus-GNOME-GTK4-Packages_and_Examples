{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit fp_efl_package;

{$warn 5023 off : no warning about unused units}
interface

uses
  fp_eina, efl, fp_eo, fp_efl, fp_emile, fp_evas, fp_ecore, fp_ecore_evas, 
  fp_edje, fp_ecore_file, fp_eet, fp_elementary, fp_ethumb, fp_ecore_con, 
  fp_eldbus, fp_efreet, fp_ecore_ipc, fp_emotion, fp_eio, fp_eeze, fp_eolian, 
  fp_ecore_audio, fp_ecore_x, fp_efl_canvas_wl, fp_ecore_drm2, fp_ecore_fb, 
  fp_ecore_imf, fp_ecore_imf_evas, fp_ecore_input, fp_ecore_input_evas, 
  fp_ecore_wl2, fp_elput, fp_embryo, fp_ethumb_client, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('fp_efl_package', @Register);
end.
