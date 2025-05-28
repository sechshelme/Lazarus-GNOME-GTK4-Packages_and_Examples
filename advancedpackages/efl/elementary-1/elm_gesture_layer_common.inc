{$IFDEF read_interface}


type
  TElm_Gesture_Taps_Info = record
    x: TEvas_Coord;
    y: TEvas_Coord;
    n: dword;
    timestamp: dword;
  end;
  PElm_Gesture_Taps_Info = ^TElm_Gesture_Taps_Info;

  TElm_Gesture_Momentum_Info = record
    x1: TEvas_Coord;
    y1: TEvas_Coord;
    x2: TEvas_Coord;
    y2: TEvas_Coord;
    tx: dword;
    ty: dword;
    mx: TEvas_Coord;
    my: TEvas_Coord;
    n: dword;
  end;
  PElm_Gesture_Momentum_Info = ^TElm_Gesture_Momentum_Info;

  TElm_Gesture_Line_Info = record
    momentum: TElm_Gesture_Momentum_Info;
    angle: double;
  end;
  PElm_Gesture_Line_Info = ^TElm_Gesture_Line_Info;

  TElm_Gesture_Zoom_Info = record
    x: TEvas_Coord;
    y: TEvas_Coord;
    radius: TEvas_Coord;
    zoom: double;
    momentum: double;
  end;
  PElm_Gesture_Zoom_Info = ^TElm_Gesture_Zoom_Info;

  TElm_Gesture_Rotate_Info = record
    x: TEvas_Coord;
    y: TEvas_Coord;
    radius: TEvas_Coord;
    base_angle: double;
    angle: double;
    momentum: double;
  end;
  PElm_Gesture_Rotate_Info = ^TElm_Gesture_Rotate_Info;

  TElm_Gesture_Event_Cb = function(data: pointer; event_info: pointer): TEvas_Event_Flags; cdecl;

procedure elm_gesture_layer_line_min_length_set(obj: PEvas_Object; line_min_length: longint); cdecl; external libelementary;
function elm_gesture_layer_line_min_length_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_gesture_layer_zoom_distance_tolerance_set(obj: PEvas_Object; zoom_distance_tolerance: TEvas_Coord); cdecl; external libelementary;
function elm_gesture_layer_zoom_distance_tolerance_get(obj: PEvas_Object): TEvas_Coord; cdecl; external libelementary;
procedure elm_gesture_layer_line_distance_tolerance_set(obj: PEvas_Object; line_distance_tolerance: TEvas_Coord); cdecl; external libelementary;
function elm_gesture_layer_line_distance_tolerance_get(obj: PEvas_Object): TEvas_Coord; cdecl; external libelementary;
procedure elm_gesture_layer_line_angular_tolerance_set(obj: PEvas_Object; line_angular_tolerance: double); cdecl; external libelementary;
function elm_gesture_layer_line_angular_tolerance_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_gesture_layer_zoom_wheel_factor_set(obj: PEvas_Object; zoom_wheel_factor: double); cdecl; external libelementary;
function elm_gesture_layer_zoom_wheel_factor_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_gesture_layer_zoom_finger_factor_set(obj: PEvas_Object; zoom_finger_factor: double); cdecl; external libelementary;
function elm_gesture_layer_zoom_finger_factor_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_gesture_layer_rotate_angular_tolerance_set(obj: PEvas_Object; rotate_angular_tolerance: double); cdecl; external libelementary;
function elm_gesture_layer_rotate_angular_tolerance_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_gesture_layer_flick_time_limit_ms_set(obj: PEvas_Object; flick_time_limit_ms: dword); cdecl; external libelementary;
function elm_gesture_layer_flick_time_limit_ms_get(obj: PEvas_Object): dword; cdecl; external libelementary;
procedure elm_gesture_layer_long_tap_start_timeout_set(obj: PEvas_Object; long_tap_start_timeout: double); cdecl; external libelementary;
function elm_gesture_layer_long_tap_start_timeout_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_gesture_layer_continues_enable_set(obj: PEvas_Object; continues_enable: TEina_Bool); cdecl; external libelementary;
function elm_gesture_layer_continues_enable_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_gesture_layer_double_tap_timeout_set(obj: PEvas_Object; double_tap_timeout: double); cdecl; external libelementary;
function elm_gesture_layer_double_tap_timeout_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_gesture_layer_tap_finger_size_set(obj: PEvas_Object; sz: TEvas_Coord); cdecl; external libelementary;
function elm_gesture_layer_tap_finger_size_get(obj: PEvas_Object): TEvas_Coord; cdecl; external libelementary;

// === Konventiert am: 27-5-25 19:21:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
