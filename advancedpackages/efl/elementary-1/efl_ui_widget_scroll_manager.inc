{$IFDEF read_interface}


type
  TInterpolator = function(data: pointer; progress: double): double; cdecl;

type
  PInterpType = ^TInterpType;
  TInterpType = longint;

const
  INTERP_LINEAR = 0;
  INTERP_ACCEL = 1;
  INTERP_DECEL = 2;

type
  PEfl_Ui_Scroll_Manager_Data = ^TEfl_Ui_Scroll_Manager_Data;
  TEfl_Ui_Scroll_Manager_Data = record
  end;

  // === Konventiert am: 30-5-25 19:28:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
