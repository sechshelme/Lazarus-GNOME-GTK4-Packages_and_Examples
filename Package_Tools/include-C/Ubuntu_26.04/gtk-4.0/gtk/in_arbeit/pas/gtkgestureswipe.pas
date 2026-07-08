unit gtkgestureswipe;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkGestureSwipe = type Pointer;
  PGtkGestureSwipeClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_gesture_swipe_get_type: TGType; cdecl; external libgtk4;
function gtk_gesture_swipe_new: PGtkGesture; cdecl; external libgtk4;
function gtk_gesture_swipe_get_velocity(gesture: PGtkGestureSwipe; velocity_x: Pdouble; velocity_y: Pdouble): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:03:26 ===

function GTK_TYPE_GESTURE_SWIPE: TGType;
function GTK_GESTURE_SWIPE(obj: Pointer): PGtkGestureSwipe;
function GTK_GESTURE_SWIPE_CLASS(klass: Pointer): PGtkGestureSwipeClass;
function GTK_IS_GESTURE_SWIPE(obj: Pointer): Tgboolean;
function GTK_IS_GESTURE_SWIPE_CLASS(klass: Pointer): Tgboolean;
function GTK_GESTURE_SWIPE_GET_CLASS(obj: Pointer): PGtkGestureSwipeClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_GESTURE_SWIPE: TGType;
begin
  GTK_TYPE_GESTURE_SWIPE := gtk_gesture_swipe_get_type;
end;

function GTK_GESTURE_SWIPE(obj: Pointer): PGtkGestureSwipe;
begin
  Result := PGtkGestureSwipe(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_SWIPE));
end;

function GTK_GESTURE_SWIPE_CLASS(klass: Pointer): PGtkGestureSwipeClass;
begin
  Result := PGtkGestureSwipeClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_SWIPE));
end;

function GTK_IS_GESTURE_SWIPE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GESTURE_SWIPE);
end;

function GTK_IS_GESTURE_SWIPE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_GESTURE_SWIPE);
end;

function GTK_GESTURE_SWIPE_GET_CLASS(obj: Pointer): PGtkGestureSwipeClass;
begin
  Result := PGtkGestureSwipeClass(PGTypeInstance(obj)^.g_class);
end;



end.
