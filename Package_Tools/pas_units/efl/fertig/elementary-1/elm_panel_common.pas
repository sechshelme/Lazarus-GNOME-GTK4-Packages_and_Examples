unit elm_panel_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Panel_Scroll_Info = record
    rel_x: double;
    rel_y: double;
  end;
  PElm_Panel_Scroll_Info = ^TElm_Panel_Scroll_Info;

  // === Konventiert am: 1-6-25 13:54:50 ===


implementation



end.
