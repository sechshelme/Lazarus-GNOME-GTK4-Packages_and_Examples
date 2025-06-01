unit elm_inwin_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Inwin = ^TElm_Inwin;
  TElm_Inwin = TEo;

procedure elm_win_inwin_activate(obj: PElm_Inwin); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:20 ===


implementation



end.
