
{$IFDEF read_interface}

type
  TGtkGesture = record // _GtkGesture
  end;
  PGtkGesture = ^TGtkGesture;

  TGtkGestureClass = record // _GtkGestureClass
  end;
  PGtkGestureClass = ^TGtkGestureClass;

function gtk_gesture_get_type: TGType; cdecl; external libgtk4;
function gtk_gesture_get_device(gesture: PGtkGesture): PGdkDevice; cdecl; external libgtk4;
function gtk_gesture_set_state(gesture: PGtkGesture; state: TGtkEventSequenceState): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_get_sequence_state(gesture: PGtkGesture; sequence: PGdkEventSequence): TGtkEventSequenceState; cdecl; external libgtk4;
function gtk_gesture_set_sequence_state(gesture: PGtkGesture; sequence: PGdkEventSequence; state: TGtkEventSequenceState): Tgboolean; cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_10';
function gtk_gesture_get_sequences(gesture: PGtkGesture): PGList; cdecl; external libgtk4;
function gtk_gesture_get_last_updated_sequence(gesture: PGtkGesture): PGdkEventSequence; cdecl; external libgtk4;
function gtk_gesture_handles_sequence(gesture: PGtkGesture; sequence: PGdkEventSequence): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_get_last_event(gesture: PGtkGesture; sequence: PGdkEventSequence): PGdkEvent; cdecl; external libgtk4;
function gtk_gesture_get_point(gesture: PGtkGesture; sequence: PGdkEventSequence; x: Pdouble; y: Pdouble): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_get_bounding_box(gesture: PGtkGesture; rect: PGdkRectangle): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_get_bounding_box_center(gesture: PGtkGesture; x: Pdouble; y: Pdouble): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_is_active(gesture: PGtkGesture): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_is_recognized(gesture: PGtkGesture): Tgboolean; cdecl; external libgtk4;
procedure gtk_gesture_group(group_gesture: PGtkGesture; gesture: PGtkGesture); cdecl; external libgtk4;
procedure gtk_gesture_ungroup(gesture: PGtkGesture); cdecl; external libgtk4;
function gtk_gesture_get_group(gesture: PGtkGesture): PGList; cdecl; external libgtk4;
function gtk_gesture_is_grouped_with(gesture: PGtkGesture; other: PGtkGesture): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 15:48:38 ===

function GTK_TYPE_GESTURE: TGType;
function GTK_GESTURE(obj: Pointer): PGtkGesture;
function GTK_GESTURE_CLASS(klass: Pointer): PGtkGestureClass;
function GTK_IS_GESTURE(obj: Pointer): Tgboolean;
function GTK_IS_GESTURE_CLASS(klass: Pointer): Tgboolean;
function GTK_GESTURE_GET_CLASS(obj: Pointer): PGtkGestureClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_GESTURE: TGType;
begin
  GTK_TYPE_GESTURE := gtk_gesture_get_type;
end;

function GTK_GESTURE(obj: Pointer): PGtkGesture;
begin
  Result := PGtkGesture(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE));
end;

function GTK_GESTURE_CLASS(klass: Pointer): PGtkGestureClass;
begin
  Result := PGtkGestureClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE));
end;

function GTK_IS_GESTURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GESTURE);
end;

function GTK_IS_GESTURE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_GESTURE);
end;

function GTK_GESTURE_GET_CLASS(obj: Pointer): PGtkGestureClass;
begin
  Result := PGtkGestureClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
