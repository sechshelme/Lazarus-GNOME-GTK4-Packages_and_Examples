unit efl_ui_image_zoomable_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Image_Zoomable = ^TEfl_Ui_Image_Zoomable;
  TEfl_Ui_Image_Zoomable = TEo;

procedure elm_photocam_gesture_enabled_set(obj: PEfl_Ui_Image_Zoomable; gesture: TEina_Bool); cdecl; external libelementary;
function elm_photocam_gesture_enabled_get(obj: PEfl_Ui_Image_Zoomable): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:27:19 ===


implementation



end.
