{$IFDEF read_interface}


const
  EFL_UI_DATEPICKER_TYPE_COUNT = 3;

type
  PEfl_Ui_Datepicker_Field_Type = ^TEfl_Ui_Datepicker_Field_Type;
  TEfl_Ui_Datepicker_Field_Type = longint;

const
  DATEPICKER_YEAR = 0;
  DATEPICKER_MONTH = 1;
  DATEPICKER_DAY = 2;

type
  TEfl_Ui_Datepicker_Data = record
    dt_manager: PEo;
    year: PEo;
    month: PEo;
    day: PEo;
    cur_date: array[0..(EFL_UI_DATEPICKER_TYPE_COUNT) - 1] of longint;
    min_date: array[0..(EFL_UI_DATEPICKER_TYPE_COUNT) - 1] of longint;
    max_date: array[0..(EFL_UI_DATEPICKER_TYPE_COUNT) - 1] of longint;
  end;
  PEfl_Ui_Datepicker_Data = ^TEfl_Ui_Datepicker_Data;


  // === Konventiert am: 31-5-25 15:16:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
