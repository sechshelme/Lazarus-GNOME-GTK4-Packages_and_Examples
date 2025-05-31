unit efl_ui_tab_pager_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEfl_Ui_Tab_Pager_Data = record
    tab_bar: PEo;
    spotlight: PEo;
  end;
  PEfl_Ui_Tab_Pager_Data = ^TEfl_Ui_Tab_Pager_Data;


  // === Konventiert am: 31-5-25 17:38:14 ===


implementation



end.
