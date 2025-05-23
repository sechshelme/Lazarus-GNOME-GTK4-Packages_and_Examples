{$IFDEF read_interface}


type
  PEfl_Ui_Textpath = ^TEfl_Ui_Textpath;
  TEfl_Ui_Textpath = TEo;

type
  PEfl_Ui_Textpath_Direction = ^TEfl_Ui_Textpath_Direction;
  TEfl_Ui_Textpath_Direction = longint;

const
  EFL_UI_TEXTPATH_DIRECTION_CW = 0;
  EFL_UI_TEXTPATH_DIRECTION_CCW = 1;
  EFL_UI_TEXTPATH_DIRECTION_CW_CENTER = 2;
  EFL_UI_TEXTPATH_DIRECTION_CCW_CENTER = 3;

procedure elm_textpath_circular_set(obj: PEfl_Ui_Textpath; radius: double; start_angle: double; direction: TEfl_Ui_Textpath_Direction); cdecl; external libelementary;
procedure elm_textpath_slice_number_set(obj: PEfl_Ui_Textpath; slice_no: longint); cdecl; external libelementary;
function elm_textpath_slice_number_get(obj: PEfl_Ui_Textpath): longint; cdecl; external libelementary;
procedure elm_textpath_ellipsis_set(obj: PEfl_Ui_Textpath; ellipsis: TEina_Bool); cdecl; external libelementary;
function elm_textpath_ellipsis_get(obj: PEfl_Ui_Textpath): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 23-5-25 17:57:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
