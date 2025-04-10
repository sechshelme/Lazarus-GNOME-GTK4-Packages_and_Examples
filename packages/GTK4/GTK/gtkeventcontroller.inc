
{$IFDEF read_interface}

type
  // ausgelagert
  //TGtkEventController = record // _GtkEventController
  //end;
  //PGtkEventController = ^TGtkEventController;

  TGtkEventControllerClass = record // _GtkEventControllerClass
  end;
  PGtkEventControllerClass = ^TGtkEventControllerClass;

function gtk_event_controller_get_type: TGType; cdecl; external libgtk4;
function gtk_event_controller_get_widget(controller: PGtkEventController): PGtkWidget; cdecl; external libgtk4;
procedure gtk_event_controller_reset(controller: PGtkEventController); cdecl; external libgtk4;
function gtk_event_controller_get_propagation_phase(controller: PGtkEventController): TGtkPropagationPhase; cdecl; external libgtk4;
procedure gtk_event_controller_set_propagation_phase(controller: PGtkEventController; phase: TGtkPropagationPhase); cdecl; external libgtk4;
function gtk_event_controller_get_propagation_limit(controller: PGtkEventController): TGtkPropagationLimit; cdecl; external libgtk4;
procedure gtk_event_controller_set_propagation_limit(controller: PGtkEventController; limit: TGtkPropagationLimit); cdecl; external libgtk4;
function gtk_event_controller_get_name(controller: PGtkEventController): PChar; cdecl; external libgtk4;
procedure gtk_event_controller_set_name(controller: PGtkEventController; Name: PChar); cdecl; external libgtk4;
procedure gtk_event_controller_set_static_name(controller: PGtkEventController; Name: PChar); cdecl; external libgtk4;
function gtk_event_controller_get_current_event(controller: PGtkEventController): PGdkEvent; cdecl; external libgtk4;
function gtk_event_controller_get_current_event_time(controller: PGtkEventController): Tguint32; cdecl; external libgtk4;
function gtk_event_controller_get_current_event_device(controller: PGtkEventController): PGdkDevice; cdecl; external libgtk4;
function gtk_event_controller_get_current_event_state(controller: PGtkEventController): TGdkModifierType; cdecl; external libgtk4;

// === Konventiert am: 25-7-24 18:32:14 ===

function GTK_TYPE_EVENT_CONTROLLER: TGType;
function GTK_EVENT_CONTROLLER(obj: Pointer): PGtkEventController;
function GTK_EVENT_CONTROLLER_CLASS(klass: Pointer): PGtkEventControllerClass;
function GTK_IS_EVENT_CONTROLLER(obj: Pointer): Tgboolean;
function GTK_IS_EVENT_CONTROLLER_CLASS(klass: Pointer): Tgboolean;
function GTK_EVENT_CONTROLLER_GET_CLASS(obj: Pointer): PGtkEventControllerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_EVENT_CONTROLLER: TGType;
begin
  GTK_TYPE_EVENT_CONTROLLER := gtk_event_controller_get_type;
end;

function GTK_EVENT_CONTROLLER(obj: Pointer): PGtkEventController;
begin
  Result := PGtkEventController(g_type_check_instance_cast(obj, GTK_TYPE_EVENT_CONTROLLER));
end;

function GTK_EVENT_CONTROLLER_CLASS(klass: Pointer): PGtkEventControllerClass;
begin
  Result := PGtkEventControllerClass(g_type_check_class_cast(klass, GTK_TYPE_EVENT_CONTROLLER));
end;

function GTK_IS_EVENT_CONTROLLER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_EVENT_CONTROLLER);
end;

function GTK_IS_EVENT_CONTROLLER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_EVENT_CONTROLLER);
end;

function GTK_EVENT_CONTROLLER_GET_CLASS(obj: Pointer): PGtkEventControllerClass;
begin
  Result := PGtkEventControllerClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
