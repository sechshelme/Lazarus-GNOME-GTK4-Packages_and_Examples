

{$IFDEF read_function}
function g_simple_action_get_type: TGType; cdecl; external libgio2;
function g_simple_action_new(name: Pgchar; parameter_type: PGVariantType): PGSimpleAction; cdecl; external libgio2;
function g_simple_action_new_stateful(name: Pgchar; parameter_type: PGVariantType; state: PGVariant): PGSimpleAction; cdecl; external libgio2;
procedure g_simple_action_set_enabled(simple: PGSimpleAction; enabled: Tgboolean); cdecl; external libgio2;
procedure g_simple_action_set_state(simple: PGSimpleAction; value: PGVariant); cdecl; external libgio2;
procedure g_simple_action_set_state_hint(simple: PGSimpleAction; state_hint: PGVariant); cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:52:07 ===

function G_TYPE_SIMPLE_ACTION: TGType;
function G_SIMPLE_ACTION(obj: Pointer): PGSimpleAction;
function G_IS_SIMPLE_ACTION(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_SIMPLE_ACTION: TGType;
begin
  G_TYPE_SIMPLE_ACTION := g_simple_action_get_type;
end;

function G_SIMPLE_ACTION(obj: Pointer): PGSimpleAction;
begin
  Result := PGSimpleAction(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_ACTION));
end;

function G_IS_SIMPLE_ACTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_ACTION);
end;



{$ENDIF read_implementation}
