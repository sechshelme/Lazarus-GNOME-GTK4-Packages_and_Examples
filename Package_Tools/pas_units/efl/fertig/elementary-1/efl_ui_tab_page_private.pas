unit efl_ui_tab_page_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEfl_Ui_Tab_Page_Data = record
    content: PEo;
    tab_label: pchar;
    tab_icon: pchar;
    tab_bar_icon: PEo;
  end;
  PEfl_Ui_Tab_Page_Data = ^TEfl_Ui_Tab_Page_Data;


  // === Konventiert am: 31-5-25 17:38:08 ===


implementation



end.
