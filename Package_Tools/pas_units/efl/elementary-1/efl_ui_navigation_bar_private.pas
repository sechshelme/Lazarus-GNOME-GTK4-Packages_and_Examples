unit efl_ui_navigation_bar_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEfl_Ui_Navigation_Bar_Data = record
    back_button: PEo;
  end;
  PEfl_Ui_Navigation_Bar_Data = ^TEfl_Ui_Navigation_Bar_Data;


  // === Konventiert am: 31-5-25 15:50:26 ===


implementation



end.
