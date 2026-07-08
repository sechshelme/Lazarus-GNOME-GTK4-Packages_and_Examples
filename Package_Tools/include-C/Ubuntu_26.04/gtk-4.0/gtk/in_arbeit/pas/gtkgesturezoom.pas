unit gtkgesturezoom;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkGestureZoom = type Pointer;
  PGtkGestureZoomClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_gesture_zoom_get_type: TGType; cdecl; external libgtk4;
function gtk_gesture_zoom_new: PGtkGesture; cdecl; external libgtk4;
function gtk_gesture_zoom_get_scale_delta(gesture: PGtkGestureZoom): Tdouble; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:07:37 ===

function GTK_TYPE_GESTURE_ZOOM: TGType;
function GTK_GESTURE_ZOOM(obj: Pointer): PGtkGestureZoom;
function GTK_GESTURE_ZOOM_CLASS(klass: Pointer): PGtkGestureZoomClass;
function GTK_IS_GESTURE_ZOOM(obj: Pointer): Tgboolean;
function GTK_IS_GESTURE_ZOOM_CLASS(klass: Pointer): Tgboolean;
function GTK_GESTURE_ZOOM_GET_CLASS(obj: Pointer): PGtkGestureZoomClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_GESTURE_ZOOM: TGType;
begin
  GTK_TYPE_GESTURE_ZOOM := gtk_gesture_zoom_get_type;
end;

function GTK_GESTURE_ZOOM(obj: Pointer): PGtkGestureZoom;
begin
  Result := PGtkGestureZoom(g_type_check_instance_cast(obj, GTK_TYPE_GESTURE_ZOOM));
end;

function GTK_GESTURE_ZOOM_CLASS(klass: Pointer): PGtkGestureZoomClass;
begin
  Result := PGtkGestureZoomClass(g_type_check_class_cast(klass, GTK_TYPE_GESTURE_ZOOM));
end;

function GTK_IS_GESTURE_ZOOM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_GESTURE_ZOOM);
end;

function GTK_IS_GESTURE_ZOOM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_GESTURE_ZOOM);
end;

function GTK_GESTURE_ZOOM_GET_CLASS(obj: Pointer): PGtkGestureZoomClass;
begin
  Result := PGtkGestureZoomClass(PGTypeInstance(obj)^.g_class);
end;



end.
