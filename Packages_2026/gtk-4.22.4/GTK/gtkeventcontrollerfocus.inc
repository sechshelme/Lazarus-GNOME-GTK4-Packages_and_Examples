
  {$IFDEF read_struct}
type
  PGtkEventControllerFocus = type Pointer;
  PGtkEventControllerFocusClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_event_controller_focus_get_type: TGType; cdecl; external libgtk4;
function gtk_event_controller_focus_new: PGtkEventController; cdecl; external libgtk4;
function gtk_event_controller_focus_contains_focus(self: PGtkEventControllerFocus): Tgboolean; cdecl; external libgtk4;
function gtk_event_controller_focus_is_focus(self: PGtkEventControllerFocus): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:03:49 ===

function GTK_TYPE_EVENT_CONTROLLER_FOCUS: TGType;
function GTK_EVENT_CONTROLLER_FOCUS(obj: Pointer): PGtkEventControllerFocus;
function GTK_EVENT_CONTROLLER_FOCUS_CLASS(klass: Pointer): PGtkEventControllerFocusClass;
function GTK_IS_EVENT_CONTROLLER_FOCUS(obj: Pointer): Tgboolean;
function GTK_IS_EVENT_CONTROLLER_FOCUS_CLASS(klass: Pointer): Tgboolean;
function GTK_EVENT_CONTROLLER_FOCUS_GET_CLASS(obj: Pointer): PGtkEventControllerFocusClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_EVENT_CONTROLLER_FOCUS: TGType;
begin
  GTK_TYPE_EVENT_CONTROLLER_FOCUS := gtk_event_controller_focus_get_type;
end;

function GTK_EVENT_CONTROLLER_FOCUS(obj: Pointer): PGtkEventControllerFocus;
begin
  Result := PGtkEventControllerFocus(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER_FOCUS));
end;

function GTK_EVENT_CONTROLLER_FOCUS_CLASS(klass: Pointer): PGtkEventControllerFocusClass;
begin
  Result := PGtkEventControllerFocusClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER_FOCUS));
end;

function GTK_IS_EVENT_CONTROLLER_FOCUS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EVENT_CONTROLLER_FOCUS);
end;

function GTK_IS_EVENT_CONTROLLER_FOCUS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_EVENT_CONTROLLER_FOCUS);
end;

function GTK_EVENT_CONTROLLER_FOCUS_GET_CLASS(obj: Pointer): PGtkEventControllerFocusClass;
begin
  Result := PGtkEventControllerFocusClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
