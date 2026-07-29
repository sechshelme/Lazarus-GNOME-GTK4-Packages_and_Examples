

  {$IFDEF read_struct}
type
  PGESGroupClass = ^TGESGroupClass;
  TGESGroupClass = record
    parent_class: TGESContainerClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_group_get_type: TGType; cdecl; external libges;
function ges_group_new: PGESGroup; cdecl; external libges;

// === Konventiert am: 27-7-26 20:01:18 ===

function GES_TYPE_GROUP: TGType;
function GES_GROUP(obj: Pointer): PGESGroup;
function GES_IS_GROUP(obj: Pointer): Tgboolean;
function GES_GROUP_CLASS(klass: Pointer): PGESGroupClass;
function GES_IS_GROUP_CLASS(klass: Pointer): Tgboolean;
function GES_GROUP_GET_CLASS(obj: Pointer): PGESGroupClass;
{$ENDIF read_function}


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
