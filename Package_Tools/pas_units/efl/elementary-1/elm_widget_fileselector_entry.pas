unit elm_widget_fileselector_entry;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Fileselector_Entry_Data = record
    button: PEvas_Object;
    entry: PEvas_Object;
    path: pchar;
  end;
  PElm_Fileselector_Entry_Data = ^TElm_Fileselector_Entry_Data;


  // === Konventiert am: 1-6-25 15:41:25 ===


implementation



end.
