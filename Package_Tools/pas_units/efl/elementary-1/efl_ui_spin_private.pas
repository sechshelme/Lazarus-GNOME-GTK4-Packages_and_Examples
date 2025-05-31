unit efl_ui_spin_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEfl_Ui_Spin_Data = record
    val: double;
    val_min: double;
    val_max: double;
  end;
  PEfl_Ui_Spin_Data = ^TEfl_Ui_Spin_Data;

  // === Konventiert am: 31-5-25 17:37:49 ===


implementation



end.
