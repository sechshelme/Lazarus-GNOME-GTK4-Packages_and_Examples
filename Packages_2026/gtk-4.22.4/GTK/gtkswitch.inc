

  {$IFDEF read_struct}
type
  PGtkSwitch = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_switch_get_type: TGType; cdecl; external libgtk4;
function gtk_switch_new: PGtkWidget; cdecl; external libgtk4;
procedure gtk_switch_set_active(self: PGtkSwitch; is_active: Tgboolean); cdecl; external libgtk4;
function gtk_switch_get_active(self: PGtkSwitch): Tgboolean; cdecl; external libgtk4;
procedure gtk_switch_set_state(self: PGtkSwitch; state: Tgboolean); cdecl; external libgtk4;
function gtk_switch_get_state(self: PGtkSwitch): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:06:36 ===

function GTK_TYPE_SWITCH: TGType;
function GTK_SWITCH(obj: Pointer): PGtkSwitch;
function GTK_IS_SWITCH(obj: Pointer): Tgboolean;
{$ENDIF read_function}


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
