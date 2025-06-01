unit efl_ui_navigation_layout_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, efl_ui_layout_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEfl_Ui_Navigation_Layout_Data = record
    bar: PEfl_Ui_Layout;
  end;
  PEfl_Ui_Navigation_Layout_Data = ^TEfl_Ui_Navigation_Layout_Data;


  // === Konventiert am: 31-5-25 15:50:31 ===


implementation



end.
