unit adw_enum_list_model;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {G_DECLARE_FINAL_TYPE (AdwEnumListItem, adw_enum_list_item, ADW, ENUM_LIST_ITEM, GObject) }
type
  TAdwEnumListItem = record
  end;
  PAdwEnumListItem = ^TAdwEnumListItem;

  TAdwEnumListItemClass = record
    parent_class: TGObjectClass;
  end;
  PAdwEnumListItemClass = ^TAdwEnumListItemClass;

function adw_enum_list_item_get_type: TGType; cdecl; external libadwaita;
function adw_enum_list_item_get_value(self: PAdwEnumListItem): longint; cdecl; external libadwaita;
function adw_enum_list_item_get_name(self: PAdwEnumListItem): pchar; cdecl; external libadwaita;
function adw_enum_list_item_get_nick(self: PAdwEnumListItem): pchar; cdecl; external libadwaita;

{G_DECLARE_FINAL_TYPE (AdwEnumListModel, adw_enum_list_model, ADW, ENUM_LIST_MODEL, GObject) }
type
  TAdwEnumListModel = record
  end;
  PAdwEnumListModel = ^TAdwEnumListModel;

  TAdwEnumListModelClass = record
    parent_class: TGObjectClass;
  end;
  PAdwEnumListModelClass = ^TAdwEnumListModelClass;

function adw_enum_list_model_get_type: TGType; cdecl; external libadwaita;
function adw_enum_list_model_new(enum_type: TGType): PAdwEnumListModel; cdecl; external libadwaita;
function adw_enum_list_model_get_enum_type(self: PAdwEnumListModel): TGType; cdecl; external libadwaita;
function adw_enum_list_model_find_position(self: PAdwEnumListModel; Value: longint): Tguint; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:49:48 ===

function ADW_TYPE_ENUM_LIST_ITEM: TGType;
function ADW_ENUM_LIST_ITEM(obj: Pointer): PAdwEnumListItem;
function ADW_IS_ENUM_LIST_ITEM(obj: Pointer): Tgboolean;

function ADW_TYPE_ENUM_LIST_MODEL: TGType;
function ADW_ENUM_LIST_MODEL(obj: Pointer): PAdwEnumListModel;
function ADW_IS_ENUM_LIST_MODEL(obj: Pointer): Tgboolean;


implementation

function ADW_TYPE_ENUM_LIST_ITEM: TGType;
begin
  Result := adw_enum_list_item_get_type;
end;

function ADW_ENUM_LIST_ITEM(obj: Pointer): PAdwEnumListItem;
begin
  Result := PAdwEnumListItem(g_type_check_instance_cast(obj, ADW_TYPE_ENUM_LIST_ITEM));
end;

function ADW_IS_ENUM_LIST_ITEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ENUM_LIST_ITEM);
end;

// ====

function ADW_TYPE_ENUM_LIST_MODEL: TGType;
begin
  Result := adw_enum_list_model_get_type;
end;

function ADW_ENUM_LIST_MODEL(obj: Pointer): PAdwEnumListModel;
begin
  Result := PAdwEnumListModel(g_type_check_instance_cast(obj, ADW_TYPE_ENUM_LIST_MODEL));
end;

function ADW_IS_ENUM_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_ENUM_LIST_MODEL);
end;


end.
