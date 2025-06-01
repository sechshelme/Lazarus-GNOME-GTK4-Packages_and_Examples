unit efl_ui_frame_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Frame = ^TElm_Frame;
  TElm_Frame = TEo;

function elm_frame_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:17:00 ===


implementation



end.
