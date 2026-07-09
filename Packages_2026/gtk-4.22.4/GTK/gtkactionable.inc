
  {$IFDEF read_struct}
type
  PGtkActionable = type Pointer;

  PGtkActionableInterface = ^TGtkActionableInterface;
  TGtkActionableInterface = record
    g_iface: TGTypeInterface;
    get_action_name: function(actionable: PGtkActionable): pchar; cdecl;
    set_action_name: procedure(actionable: PGtkActionable; action_name: pchar); cdecl;
    get_action_target_value: function(actionable: PGtkActionable): PGVariant; cdecl;
    set_action_target_value: procedure(actionable: PGtkActionable; target_value: PGVariant); cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_actionable_get_type: TGType; cdecl; external libgtk4;
function gtk_actionable_get_action_name(actionable: PGtkActionable): pchar; cdecl; external libgtk4;
procedure gtk_actionable_set_action_name(actionable: PGtkActionable; action_name: pchar); cdecl; external libgtk4;
function gtk_actionable_get_action_target_value(actionable: PGtkActionable): PGVariant; cdecl; external libgtk4;
procedure gtk_actionable_set_action_target_value(actionable: PGtkActionable; target_value: PGVariant); cdecl; external libgtk4;
procedure gtk_actionable_set_action_target(actionable: PGtkActionable; format_string: pchar; args: array of const); cdecl; external libgtk4;
procedure gtk_actionable_set_action_target(actionable: PGtkActionable; format_string: pchar); cdecl; external libgtk4;
procedure gtk_actionable_set_detailed_action_name(actionable: PGtkActionable; detailed_action_name: pchar); cdecl; external libgtk4;

// === Konventiert am: 5-7-26 16:28:19 ===

function GTK_TYPE_ACTIONABLE: TGType;
function GTK_ACTIONABLE(obj: Pointer): PGtkActionable;
function GTK_IS_ACTIONABLE(obj: Pointer): Tgboolean;
function GTK_ACTIONABLE_GET_IFACE(obj: Pointer): PGtkActionableInterface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_ACTIONABLE: TGType;
begin
  GTK_TYPE_ACTIONABLE := gtk_actionable_get_type;
end;

function GTK_ACTIONABLE(obj: Pointer): PGtkActionable;
begin
  Result := PGtkActionable(g_type_check_instance_cast(obj, GTK_TYPE_ACTIONABLE));
end;

function GTK_IS_ACTIONABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_ACTIONABLE);
end;

function GTK_ACTIONABLE_GET_IFACE(obj: Pointer): PGtkActionableInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_ACTIONABLE);
end;



{$ENDIF read_implementation}
