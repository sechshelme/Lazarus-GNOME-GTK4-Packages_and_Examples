{$IFDEF read_interface}


type
  PElm_Hover = ^TElm_Hover;
  TElm_Hover = TEo;

type
  PElm_Hover_Axis = ^TElm_Hover_Axis;
  TElm_Hover_Axis = longint;

const
  ELM_HOVER_AXIS_NONE = 0;
  ELM_HOVER_AXIS_HORIZONTAL = 1;
  ELM_HOVER_AXIS_VERTICAL = 2;
  ELM_HOVER_AXIS_BOTH = 3;

procedure elm_hover_target_set(obj: PElm_Hover; target: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_hover_target_get(obj: PElm_Hover): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_hover_best_content_location_get(obj: PElm_Hover; pref_axis: TElm_Hover_Axis): pchar; cdecl; external libelementary;
procedure elm_hover_dismiss(obj: PElm_Hover); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
