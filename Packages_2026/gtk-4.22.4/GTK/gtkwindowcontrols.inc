

  {$IFDEF read_struct}
type
  PGtkWindowControls = type Pointer;

  TGtkWindowControlsClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkWindowControlsClass = ^TGtkWindowControlsClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_window_controls_get_type: TGType; cdecl; external libgtk4;
function gtk_window_controls_new(side: TGtkPackType): PGtkWidget; cdecl; external libgtk4;
function gtk_window_controls_get_side(self: PGtkWindowControls): TGtkPackType; cdecl; external libgtk4;
procedure gtk_window_controls_set_side(self: PGtkWindowControls; side: TGtkPackType); cdecl; external libgtk4;
function gtk_window_controls_get_decoration_layout(self: PGtkWindowControls): pchar; cdecl; external libgtk4;
procedure gtk_window_controls_set_decoration_layout(self: PGtkWindowControls; layout: pchar); cdecl; external libgtk4;
function gtk_window_controls_get_use_native_controls(self: PGtkWindowControls): Tgboolean; cdecl; external libgtk4;
procedure gtk_window_controls_set_use_native_controls(self: PGtkWindowControls; setting: Tgboolean); cdecl; external libgtk4;
function gtk_window_controls_get_empty(self: PGtkWindowControls): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:02:57 ===

function GTK_TYPE_WINDOW_CONTROLS: TGType;
function GTK_WINDOW_CONTROLS(obj: Pointer): PGtkWindowControls;
function GTK_IS_WINDOW_CONTROLS(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_WINDOW_CONTROLS: TGType;
begin
  Result := gtk_window_controls_get_type;
end;

function GTK_WINDOW_CONTROLS(obj: Pointer): PGtkWindowControls;
begin
  Result := PGtkWindowControls(g_type_check_instance_cast(obj, GTK_TYPE_WINDOW_CONTROLS));
end;

function GTK_IS_WINDOW_CONTROLS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_WINDOW_CONTROLS);
end;

{$ENDIF read_implementation}
