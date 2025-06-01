unit efl_ui_radio_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGroup = record
    value: longint;
    valuep: Plongint;
    radios: PEina_List;
  end;
  PGroup = ^TGroup;

  TEfl_Ui_Radio_Data = record
    value: longint;
    group: PGroup;
  end;
  PEfl_Ui_Radio_Data = ^TEfl_Ui_Radio_Data;


  // === Konventiert am: 30-5-25 15:52:23 ===


implementation



end.
