
  {$IFDEF read_struct}
type
  PGtkGestureLongPress = type Pointer;
  PGtkGestureLongPressClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_gesture_long_press_get_type: TGType; cdecl; external libgtk4;
function gtk_gesture_long_press_new: PGtkGesture; cdecl; external libgtk4;
procedure gtk_gesture_long_press_set_delay_factor(gesture: PGtkGestureLongPress; delay_factor: double); cdecl; external libgtk4;
function gtk_gesture_long_press_get_delay_factor(gesture: PGtkGestureLongPress): double; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:03:34 ===

function GTK_TYPE_GESTURE_LONG_PRESS: TGType;
function GTK_GESTURE_LONG_PRESS(obj: Pointer): PGtkGestureLongPress;
function GTK_GESTURE_LONG_PRESS_CLASS(klass: Pointer): PGtkGestureLongPressClass;
function GTK_IS_GESTURE_LONG_PRESS(obj: Pointer): Tgboolean;
function GTK_IS_GESTURE_LONG_PRESS_CLASS(klass: Pointer): Tgboolean;
function GTK_GESTURE_LONG_PRESS_GET_CLASS(obj: Pointer): PGtkGestureLongPressClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_GESTURE_LONG_PRESS: TGType;
begin
  GTK_TYPE_GESTURE_LONG_PRESS := gtk_gesture_long_press_get_type;
end;

function GTK_GESTURE_LONG_PRESS(obj: Pointer): PGtkGestureLongPress;
begin
  Result := PGtkGestureLongPress(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_LONG_PRESS));
end;

function GTK_GESTURE_LONG_PRESS_CLASS(klass: Pointer): PGtkGestureLongPressClass;
begin
  Result := PGtkGestureLongPressClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_LONG_PRESS));
end;

function GTK_IS_GESTURE_LONG_PRESS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GESTURE_LONG_PRESS);
end;

function GTK_IS_GESTURE_LONG_PRESS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_GESTURE_LONG_PRESS);
end;

function GTK_GESTURE_LONG_PRESS_GET_CLASS(obj: Pointer): PGtkGestureLongPressClass;
begin
  Result := PGtkGestureLongPressClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
