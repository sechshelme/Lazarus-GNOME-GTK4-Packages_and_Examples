

  {$IFDEF read_struct}
type
  TAsCategory = record
    parent_instance: TGObject;
  end;
  PAsCategory = ^TAsCategory;

  PAsCategoryClass = ^TAsCategoryClass;
  TAsCategoryClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_category_get_type: TGType; cdecl; external libappstream;
function as_category_new: PAsCategory; cdecl; external libappstream;
function as_category_get_id(category: PAsCategory): Pgchar; cdecl; external libappstream;
procedure as_category_set_id(category: PAsCategory; id: Pgchar); cdecl; external libappstream;
function as_category_get_name(category: PAsCategory): Pgchar; cdecl; external libappstream;
procedure as_category_set_name(category: PAsCategory; value: Pgchar); cdecl; external libappstream;
function as_category_get_summary(category: PAsCategory): Pgchar; cdecl; external libappstream;
procedure as_category_set_summary(category: PAsCategory; value: Pgchar); cdecl; external libappstream;
function as_category_get_icon(category: PAsCategory): Pgchar; cdecl; external libappstream;
procedure as_category_set_icon(category: PAsCategory; value: Pgchar); cdecl; external libappstream;
function as_category_get_children(category: PAsCategory): PGPtrArray; cdecl; external libappstream;
function as_category_has_children(category: PAsCategory): Tgboolean; cdecl; external libappstream;
procedure as_category_add_child(category: PAsCategory; subcat: PAsCategory); cdecl; external libappstream;
procedure as_category_remove_child(category: PAsCategory; subcat: PAsCategory); cdecl; external libappstream;
function as_category_get_desktop_groups(category: PAsCategory): PGPtrArray; cdecl; external libappstream;
procedure as_category_add_desktop_group(category: PAsCategory; group_name: Pgchar); cdecl; external libappstream;
function as_category_get_components(category: PAsCategory): PGPtrArray; cdecl; external libappstream;
procedure as_category_add_component(category: PAsCategory; cpt: PAsComponent); cdecl; external libappstream;
function as_category_has_component(category: PAsCategory; cpt: PAsComponent): Tgboolean; cdecl; external libappstream;
function as_get_default_categories(with_special: Tgboolean): PGPtrArray; cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:36:41 ===

function AS_TYPE_CATEGORY: TGType;
function AS_CATEGORY(obj: Pointer): PAsCategory;
function AS_IS_CATEGORY(obj: Pointer): Tgboolean;
function AS_CATEGORY_CLASS(klass: Pointer): PAsCategoryClass;
function AS_IS_CATEGORY_CLASS(klass: Pointer): Tgboolean;
function AS_CATEGORY_GET_CLASS(obj: Pointer): PAsCategoryClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_CATEGORY: TGType;
begin
  Result := as_category_get_type;
end;

function AS_CATEGORY(obj: Pointer): PAsCategory;
begin
  Result := PAsCategory(g_type_check_instance_cast(obj, AS_TYPE_CATEGORY));
end;

function AS_IS_CATEGORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_CATEGORY);
end;

function AS_CATEGORY_CLASS(klass: Pointer): PAsCategoryClass;
begin
  Result := PAsCategoryClass(g_type_check_class_cast(klass, AS_TYPE_CATEGORY));
end;

function AS_IS_CATEGORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_CATEGORY);
end;

function AS_CATEGORY_GET_CLASS(obj: Pointer): PAsCategoryClass;
begin
  Result := PAsCategoryClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
