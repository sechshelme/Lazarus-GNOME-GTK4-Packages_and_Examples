unit efl_ui_timepicker_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EFL_UI_TIMEPICKER_TYPE_COUNT = 3;

type
  PEfl_Ui_Timepicker_Field_Type = ^TEfl_Ui_Timepicker_Field_Type;
  TEfl_Ui_Timepicker_Field_Type = longint;

const
  TIMEPICKER_HOUR = 0;
  TIMEPICKER_MIN = 1;
  TIMEPICKER_AMPM = 2;

type
  TEfl_Ui_Timepicker_Data = record
    dt_manager: PEo;
    hour: PEo;
    min: PEo;
    ampm: PEo;
    cur_time: array[0..(EFL_UI_TIMEPICKER_TYPE_COUNT) - 1] of longint;
    is_24hour: TEina_Bool;
  end;
  PEfl_Ui_Timepicker_Data = ^TEfl_Ui_Timepicker_Data;


  // === Konventiert am: 31-5-25 19:14:24 ===


implementation



end.
