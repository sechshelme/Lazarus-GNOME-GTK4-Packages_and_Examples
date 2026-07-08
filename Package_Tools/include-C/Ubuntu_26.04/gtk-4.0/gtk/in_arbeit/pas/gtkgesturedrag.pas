unit gtkgesturedrag;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkGestureDrag = type Pointer;
  PGtkGestureDragClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_gesture_drag_get_type: TGType; cdecl; external libgtk4;
function gtk_gesture_drag_new: PGtkGesture; cdecl; external libgtk4;
function gtk_gesture_drag_get_start_point(gesture: PGtkGestureDrag; x: Pdouble; y: Pdouble): Tgboolean; cdecl; external libgtk4;
function gtk_gesture_drag_get_offset(gesture: PGtkGestureDrag; x: Pdouble; y: Pdouble): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:00:37 ===

function GTK_TYPE_GESTURE_DRAG: TGType;
function GTK_GESTURE_DRAG(obj: Pointer): PGtkGestureDrag;
function GTK_GESTURE_DRAG_CLASS(klass: Pointer): PGtkGestureDragClass;
function GTK_IS_GESTURE_DRAG(obj: Pointer): Tgboolean;
function GTK_IS_GESTURE_DRAG_CLASS(klass: Pointer): Tgboolean;
function GTK_GESTURE_DRAG_GET_CLASS(obj: Pointer): PGtkGestureDragClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_GESTURE_DRAG: TGType;
begin
  GTK_TYPE_GESTURE_DRAG := gtk_gesture_drag_get_type;
end;

function GTK_GESTURE_DRAG(obj: Pointer): PGtkGestureDrag;
begin
  Result := PGtkGestureDrag(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_DRAG));
end;

function GTK_GESTURE_DRAG_CLASS(klass: Pointer): PGtkGestureDragClass;
begin
  Result := PGtkGestureDragClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_DRAG));
end;

function GTK_IS_GESTURE_DRAG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GESTURE_DRAG);
end;

function GTK_IS_GESTURE_DRAG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_GESTURE_DRAG);
end;

function GTK_GESTURE_DRAG_GET_CLASS(obj: Pointer): PGtkGestureDragClass;
begin
  Result := PGtkGestureDragClass(PGTypeInstance(obj)^.g_class);
end;



end.
