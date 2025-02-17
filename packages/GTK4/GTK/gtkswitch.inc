
{$IFDEF read_interface}


type
  TGtkSwitch = record // _GtkSwitch
  end;
  PGtkSwitch = ^TGtkSwitch;

function gtk_switch_get_type: TGType; cdecl; external libgtk4;
function gtk_switch_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_switch_set_active(self: PGtkSwitch; is_active: Tgboolean); cdecl; external libgtk4;
function gtk_switch_get_active(self: PGtkSwitch): Tgboolean; cdecl; external libgtk4;
procedure gtk_switch_set_state(self: PGtkSwitch; state: Tgboolean); cdecl; external libgtk4;
function gtk_switch_get_state(self: PGtkSwitch): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 28-7-24 16:40:51 ===

function GTK_TYPE_SWITCH: TGType;
function GTK_SWITCH(obj: Pointer): PGtkSwitch;
function GTK_IS_SWITCH(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_SWITCH: TGType;
begin
  GTK_TYPE_SWITCH := gtk_switch_get_type;
end;

function GTK_SWITCH(obj: Pointer): PGtkSwitch;
begin
  Result := PGtkSwitch(g_type_check_instance_cast(obj, GTK_TYPE_SWITCH));
end;

function GTK_IS_SWITCH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SWITCH);
end;



{$ENDIF read_implementation}
