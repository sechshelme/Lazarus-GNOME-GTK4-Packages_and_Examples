unit elm_widget_dayselector;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Dayselector_Data = ^TElm_Dayselector_Data;
  TElm_Dayselector_Data = record
  end;

type
  TElm_Dayselector_Item_Data = record
    base: PElm_Widget_Item_Data;
    day: TElm_Dayselector_Day;
    day_style: pchar;
  end;
  PElm_Dayselector_Item_Data = ^TElm_Dayselector_Item_Data;

  // === Konventiert am: 1-6-25 15:41:21 ===


implementation



end.
