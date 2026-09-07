unit pk_category;

interface

uses
  fp_glib2, fp_packagekit, pk_source;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPkCategoryPrivate = type Pointer;

  PPkCategory = ^TPkCategory;
  TPkCategory = record
    parent: TPkSource;
    priv: PPkCategoryPrivate;
  end;

  PPkCategoryClass = ^TPkCategoryClass;
  TPkCategoryClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_category_get_type: TGType; cdecl; external libpackagekit;
function pk_category_new: PPkCategory; cdecl; external libpackagekit;
function pk_category_get_parent_id(category: PPkCategory): Pgchar; cdecl; external libpackagekit;
procedure pk_category_set_parent_id(category: PPkCategory; parent_id: Pgchar); cdecl; external libpackagekit;
function pk_category_get_id(category: PPkCategory): Pgchar; cdecl; external libpackagekit;
procedure pk_category_set_id(category: PPkCategory; cat_id: Pgchar); cdecl; external libpackagekit;
function pk_category_get_name(category: PPkCategory): Pgchar; cdecl; external libpackagekit;
procedure pk_category_set_name(category: PPkCategory; name: Pgchar); cdecl; external libpackagekit;
function pk_category_get_summary(category: PPkCategory): Pgchar; cdecl; external libpackagekit;
procedure pk_category_set_summary(category: PPkCategory; summary: Pgchar); cdecl; external libpackagekit;
function pk_category_get_icon(category: PPkCategory): Pgchar; cdecl; external libpackagekit;
procedure pk_category_set_icon(category: PPkCategory; icon: Pgchar); cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:04:24 ===

function PK_TYPE_CATEGORY: TGType;
function PK_CATEGORY(obj: Pointer): PPkCategory;
function PK_CATEGORY_CLASS(klass: Pointer): PPkCategoryClass;
function PK_IS_CATEGORY(obj: Pointer): Tgboolean;
function PK_IS_CATEGORY_CLASS(klass: Pointer): Tgboolean;
function PK_CATEGORY_GET_CLASS(obj: Pointer): PPkCategoryClass;

implementation

function PK_TYPE_CATEGORY: TGType;
begin
  PK_TYPE_CATEGORY := pk_category_get_type;
end;

function PK_CATEGORY(obj: Pointer): PPkCategory;
begin
  Result := PPkCategory(g_type_check_instance_cast(obj, PK_TYPE_CATEGORY));
end;

function PK_CATEGORY_CLASS(klass: Pointer): PPkCategoryClass;
begin
  Result := PPkCategoryClass(g_type_check_class_cast(klass, PK_TYPE_CATEGORY));
end;

function PK_IS_CATEGORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_CATEGORY);
end;

function PK_IS_CATEGORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_CATEGORY);
end;

function PK_CATEGORY_GET_CLASS(obj: Pointer): PPkCategoryClass;
begin
  Result := PPkCategoryClass(PGTypeInstance(obj)^.g_class);
end;



end.
