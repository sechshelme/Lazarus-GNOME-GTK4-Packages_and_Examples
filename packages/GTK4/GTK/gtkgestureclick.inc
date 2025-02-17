
{$IFDEF read_interface}

type
  TGtkGestureClick = record // _GtkGestureClick
  end;
  PGtkGestureClick = ^TGtkGestureClick;

  TGtkGestureClickClass = record // _GtkGestureClickClass
  end;
  PGtkGestureClickClass = ^TGtkGestureClickClass;

function gtk_gesture_click_get_type: TGType; cdecl; external libgtk4;
function gtk_gesture_click_new: PGtkGesture; cdecl; external libgtk4;

// === Konventiert am: 27-7-24 15:37:05 ===

function GTK_TYPE_GESTURE_CLICK: TGType;
function GTK_GESTURE_CLICK(obj: Pointer): PGtkGestureClick;
function GTK_GESTURE_CLICK_CLASS(klass: Pointer): PGtkGestureClickClass;
function GTK_IS_GESTURE_CLICK(obj: Pointer): Tgboolean;
function GTK_IS_GESTURE_CLICK_CLASS(klass: Pointer): Tgboolean;
function GTK_GESTURE_CLICK_GET_CLASS(obj: Pointer): PGtkGestureClickClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_GESTURE_CLICK: TGType;
begin
  GTK_TYPE_GESTURE_CLICK := gtk_gesture_click_get_type;
end;

function GTK_GESTURE_CLICK(obj: Pointer): PGtkGestureClick;
begin
  Result := PGtkGestureClick(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_CLICK));
end;

function GTK_GESTURE_CLICK_CLASS(klass: Pointer): PGtkGestureClickClass;
begin
  Result := PGtkGestureClickClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_CLICK));
end;

function GTK_IS_GESTURE_CLICK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GESTURE_CLICK);
end;

function GTK_IS_GESTURE_CLICK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_GESTURE_CLICK);
end;

function GTK_GESTURE_CLICK_GET_CLASS(obj: Pointer): PGtkGestureClickClass;
begin
  Result := PGtkGestureClickClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
