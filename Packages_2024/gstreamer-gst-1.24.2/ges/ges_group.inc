{$IFDEF read_interface}

  {GES_DECLARE_TYPE (Group, group, GROUP); }
type
  TGESGroupPrivate = record
  end;
  PGESGroupPrivate = ^TGESGroupPrivate;

  TGESGroup = record
    parent: TGESContainer;
    priv: PGESGroupPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESGroup = ^TGESGroup;

  TGESGroupClass = record
    parent_class: TGESContainerClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESGroupClass = ^TGESGroupClass;

function ges_group_get_type: TGType; cdecl; external libges;
function ges_group_new: PGESGroup; cdecl; external libges;

// === Konventiert am: 12-12-24 19:37:02 ===

function GES_TYPE_GROUP: TGType;
function GES_GROUP(obj: Pointer): PGESGroup;
function GES_IS_GROUP(obj: Pointer): Tgboolean;
function GES_GROUP_CLASS(klass: Pointer): PGESGroupClass;
function GES_IS_GROUP_CLASS(klass: Pointer): Tgboolean;
function GES_GROUP_GET_CLASS(obj: Pointer): PGESGroupClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_GROUP: TGType;
begin
  Result := ges_group_get_type;
end;

function GES_GROUP(obj: Pointer): PGESGroup;
begin
  Result := PGESGroup(g_type_check_instance_cast(obj, GES_TYPE_GROUP));
end;

function GES_IS_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_GROUP);
end;

function GES_GROUP_CLASS(klass: Pointer): PGESGroupClass;
begin
  Result := PGESGroupClass(g_type_check_class_cast(klass, GES_TYPE_GROUP));
end;

function GES_IS_GROUP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_GROUP);
end;

function GES_GROUP_GET_CLASS(obj: Pointer): PGESGroupClass;
begin
  Result := PGESGroupClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
