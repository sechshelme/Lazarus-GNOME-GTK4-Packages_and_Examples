{$IFDEF read_interface}



type
  TAdapEnumListItem = record
  end;
  PAdapEnumListItem = ^TAdapEnumListItem;

  TAdapEnumListItemClass = record
    parent_class: TGObjectClass;
  end;
  PAdapEnumListItemClass = ^TAdapEnumListItemClass;

function adap_enum_list_item_get_type: TGType; cdecl; external libadapta;
function adap_enum_list_item_get_value(self: PAdapEnumListItem): longint; cdecl; external libadapta;
function adap_enum_list_item_get_name(self: PAdapEnumListItem): pchar; cdecl; external libadapta;
function adap_enum_list_item_get_nick(self: PAdapEnumListItem): pchar; cdecl; external libadapta;

type
  TAdapEnumListModel = record
  end;
  PAdapEnumListModel = ^TAdapEnumListModel;

  TAdapEnumListModelClass = record
    parent_class: TGObjectClass;
  end;
  PAdapEnumListModelClass = ^TAdapEnumListModelClass;

function adap_enum_list_model_get_type: TGType; cdecl; external libadapta;
function adap_enum_list_model_new(enum_type: TGType): PAdapEnumListModel; cdecl; external libadapta;
function adap_enum_list_model_get_enum_type(self: PAdapEnumListModel): TGType; cdecl; external libadapta;
function adap_enum_list_model_find_position(self: PAdapEnumListModel; value: longint): Tguint; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:09:04 ===

function ADAP_TYPE_ENUM_LIST_ITEM: TGType;
function ADAP_ENUM_LIST_ITEM(obj: Pointer): PAdapEnumListItem;
function ADAP_IS_ENUM_LIST_ITEM(obj: Pointer): Tgboolean;

function ADAP_TYPE_ENUM_LIST_MODEL: TGType;
function ADAP_ENUM_LIST_MODEL(obj: Pointer): PAdapEnumListModel;
function ADAP_IS_ENUM_LIST_MODEL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_ENUM_LIST_ITEM: TGType;
begin
  Result := adap_enum_list_item_get_type;
end;

function ADAP_ENUM_LIST_ITEM(obj: Pointer): PAdapEnumListItem;
begin
  Result := PAdapEnumListItem(g_type_check_instance_cast(obj, ADAP_TYPE_ENUM_LIST_ITEM));
end;

function ADAP_IS_ENUM_LIST_ITEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ENUM_LIST_ITEM);
end;

// ====

function ADAP_TYPE_ENUM_LIST_MODEL: TGType;
begin
  Result := adap_enum_list_model_get_type;
end;

function ADAP_ENUM_LIST_MODEL(obj: Pointer): PAdapEnumListModel;
begin
  Result := PAdapEnumListModel(g_type_check_instance_cast(obj, ADAP_TYPE_ENUM_LIST_MODEL));
end;

function ADAP_IS_ENUM_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ENUM_LIST_MODEL);
end;

{$ENDIF read_implementation}
