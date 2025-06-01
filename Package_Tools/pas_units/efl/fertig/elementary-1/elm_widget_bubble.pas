unit elm_widget_bubble;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, elm_bubble_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Bubble_Data = record
    pos: TElm_Bubble_Pos;
  end;
  PElm_Bubble_Data = ^TElm_Bubble_Data;


  // === Konventiert am: 1-6-25 15:41:13 ===


implementation



end.
