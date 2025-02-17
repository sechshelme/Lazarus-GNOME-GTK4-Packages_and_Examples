
{$IFDEF read_interface}

type
  TGtkGestureStylus = record // _GtkGestureStylus
  end;
  PGtkGestureStylus = ^TGtkGestureStylus;

  TGtkGestureStylusClass = record // _GtkGestureStylusClass
  end;
  PGtkGestureStylusClass = ^TGtkGestureStylusClass;

function gtk_gesture_stylus_get_type: TGType; cdecl; external libgtk4;
function gtk_gesture_stylus_new: PGtkGesture; cdecl; external libgtk4;
function gtk_gesture_stylus_get_stylus_only(gesture: PGtkGestureStylus): Tgboolean; cdecl; external libgtk4;
procedure gtk_gesture_stylus_set_stylus_only(gesture: PGtkGestureStylus; stylus_only: Tgboolean); cdecl; external libgtk4;
function gtk_gesture_stylus_get_axis(gesture: PGtkGestureStylus; axis: TGdkAxisUse; Value: Pdouble): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_stylus_get_axes(gesture: PGtkGestureStylus; axes: PGdkAxisUse; values: PPdouble): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_stylus_get_backlog(gesture: PGtkGestureStylus; backlog: PPGdkTimeCoord; n_elems: Pguint): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_stylus_get_device_tool(gesture: PGtkGestureStylus): PGdkDeviceTool; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 15:43:19 ===

function GTK_TYPE_GESTURE_STYLUS: TGType;
function GTK_GESTURE_STYLUS(obj: Pointer): PGtkGestureStylus;
function GTK_GESTURE_STYLUS_CLASS(klass: Pointer): PGtkGestureStylusClass;
function GTK_IS_GESTURE_STYLUS(obj: Pointer): Tgboolean;
function GTK_IS_GESTURE_STYLUS_CLASS(klass: Pointer): Tgboolean;
function GTK_GESTURE_STYLUS_GET_CLASS(obj: Pointer): PGtkGestureStylusClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_GESTURE_STYLUS: TGType;
begin
  GTK_TYPE_GESTURE_STYLUS := gtk_gesture_stylus_get_type;
end;

function GTK_GESTURE_STYLUS(obj: Pointer): PGtkGestureStylus;
begin
  Result := PGtkGestureStylus(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_STYLUS));
end;

function GTK_GESTURE_STYLUS_CLASS(klass: Pointer): PGtkGestureStylusClass;
begin
  Result := PGtkGestureStylusClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_STYLUS));
end;

function GTK_IS_GESTURE_STYLUS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GESTURE_STYLUS);
end;

function GTK_IS_GESTURE_STYLUS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_GESTURE_STYLUS);
end;

function GTK_GESTURE_STYLUS_GET_CLASS(obj: Pointer): PGtkGestureStylusClass;
begin
  Result := PGtkGestureStylusClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
