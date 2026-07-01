

  {$IFDEF read_struct}
type
  PGSimpleActionGroupPrivate = type Pointer;

  PGSimpleActionGroup = ^TGSimpleActionGroup;
  TGSimpleActionGroup = record
    parent_instance: TGObject;
    priv: PGSimpleActionGroupPrivate;
  end;

  PGSimpleActionGroupClass = ^TGSimpleActionGroupClass;
  TGSimpleActionGroupClass = record
    parent_class: TGObjectClass;
    padding: array[0..11] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_simple_action_group_get_type: TGType; cdecl; external libgio2;
function g_simple_action_group_new: PGSimpleActionGroup; cdecl; external libgio2;
function g_simple_action_group_lookup(simple: PGSimpleActionGroup; action_name: Pgchar): PGAction; cdecl; external libgio2; deprecated;
procedure g_simple_action_group_insert(simple: PGSimpleActionGroup; action: PGAction); cdecl; external libgio2; deprecated;
procedure g_simple_action_group_remove(simple: PGSimpleActionGroup; action_name: Pgchar); cdecl; external libgio2; deprecated;
procedure g_simple_action_group_add_entries(simple: PGSimpleActionGroup; entries: PGActionEntry; n_entries: Tgint; user_data: Tgpointer); cdecl; external libgio2; deprecated;

// === Konventiert am: 26-6-26 19:51:58 ===

function G_TYPE_SIMPLE_ACTION_GROUP: TGType;
function G_SIMPLE_ACTION_GROUP(obj: Pointer): PGSimpleActionGroup;
function G_SIMPLE_ACTION_GROUP_CLASS(klass: Pointer): PGSimpleActionGroupClass;
function G_IS_SIMPLE_ACTION_GROUP(obj: Pointer): Tgboolean;
function G_IS_SIMPLE_ACTION_GROUP_CLASS(klass: Pointer): Tgboolean;
function G_SIMPLE_ACTION_GROUP_GET_CLASS(obj: Pointer): PGSimpleActionGroupClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_SIMPLE_ACTION_GROUP: TGType;
begin
  G_TYPE_SIMPLE_ACTION_GROUP := g_simple_action_group_get_type;
end;

function G_SIMPLE_ACTION_GROUP(obj: Pointer): PGSimpleActionGroup;
begin
  Result := PGSimpleActionGroup(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_ACTION_GROUP));
end;

function G_SIMPLE_ACTION_GROUP_CLASS(klass: Pointer): PGSimpleActionGroupClass;
begin
  Result := PGSimpleActionGroupClass(g_type_check_class_cast(klass, G_TYPE_SIMPLE_ACTION_GROUP));
end;

function G_IS_SIMPLE_ACTION_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_SIMPLE_ACTION_GROUP);
end;

function G_IS_SIMPLE_ACTION_GROUP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_SIMPLE_ACTION_GROUP);
end;

function G_SIMPLE_ACTION_GROUP_GET_CLASS(obj: Pointer): PGSimpleActionGroupClass;
begin
  Result := PGSimpleActionGroupClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
