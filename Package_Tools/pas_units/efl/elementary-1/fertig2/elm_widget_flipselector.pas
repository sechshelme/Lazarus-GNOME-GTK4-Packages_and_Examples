unit elm_widget_flipselector;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Flipselector_Data = ^TElm_Flipselector_Data;
  TElm_Flipselector_Data = record
  end;

type
  TElm_Flipselector_Item_Data = record
    base: PElm_Widget_Item_Data;
    _label: pchar;
    func: TEvas_Smart_Cb;
  end;
  PElm_Flipselector_Item_Data = ^TElm_Flipselector_Item_Data;


  // === Konventiert am: 30-5-25 17:16:50 ===


implementation



end.
