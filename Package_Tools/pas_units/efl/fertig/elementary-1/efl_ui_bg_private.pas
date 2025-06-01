unit efl_ui_bg_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEfl_Ui_Bg_Data = record
    rect: PEvas_Object;
    img: PEvas_Object;
    file_: pchar;
    key: pchar;
  end;
  PEfl_Ui_Bg_Data = ^TEfl_Ui_Bg_Data;

  // === Konventiert am: 31-5-25 13:09:37 ===


implementation



end.
