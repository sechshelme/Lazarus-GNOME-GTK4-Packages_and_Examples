unit gtkeventcontrollermotion;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkeventcontroller;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkEventControllerMotion = type Pointer;
  PGtkEventControllerMotionClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_event_controller_motion_get_type: TGType; cdecl; external libgtk4;
function gtk_event_controller_motion_new: PGtkEventController; cdecl; external libgtk4;
function gtk_event_controller_motion_contains_pointer(self: PGtkEventControllerMotion): Tgboolean; cdecl; external libgtk4;
function gtk_event_controller_motion_is_pointer(self: PGtkEventControllerMotion): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:03:37 ===

function GTK_TYPE_EVENT_CONTROLLER_MOTION: TGType;
function GTK_EVENT_CONTROLLER_MOTION(obj: Pointer): PGtkEventControllerMotion;
function GTK_EVENT_CONTROLLER_MOTION_CLASS(klass: Pointer): PGtkEventControllerMotionClass;
function GTK_IS_EVENT_CONTROLLER_MOTION(obj: Pointer): Tgboolean;
function GTK_IS_EVENT_CONTROLLER_MOTION_CLASS(klass: Pointer): Tgboolean;
function GTK_EVENT_CONTROLLER_MOTION_GET_CLASS(obj: Pointer): PGtkEventControllerMotionClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_EVENT_CONTROLLER_MOTION: TGType;
begin
  GTK_TYPE_EVENT_CONTROLLER_MOTION := gtk_event_controller_motion_get_type;
end;

function GTK_EVENT_CONTROLLER_MOTION(obj: Pointer): PGtkEventControllerMotion;
begin
  Result := PGtkEventControllerMotion(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER_MOTION));
end;

function GTK_EVENT_CONTROLLER_MOTION_CLASS(klass: Pointer): PGtkEventControllerMotionClass;
begin
  Result := PGtkEventControllerMotionClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER_MOTION));
end;

function GTK_IS_EVENT_CONTROLLER_MOTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EVENT_CONTROLLER_MOTION);
end;

function GTK_IS_EVENT_CONTROLLER_MOTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_EVENT_CONTROLLER_MOTION);
end;

function GTK_EVENT_CONTROLLER_MOTION_GET_CLASS(obj: Pointer): PGtkEventControllerMotionClass;
begin
  Result := PGtkEventControllerMotionClass(PGTypeInstance(obj)^.g_class);
end;



end.
