{$IFDEF read_interface}


type
  TIBusAttrList = record
    parent: TIBusSerializable;
    attributes: PGArray;
  end;
  PIBusAttrList = ^TIBusAttrList;

  TIBusAttrListClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusAttrListClass = ^TIBusAttrListClass;

function ibus_attr_list_get_type: TGType; cdecl; external libibus;
function ibus_attr_list_new: PIBusAttrList; cdecl; external libibus;
procedure ibus_attr_list_append(attr_list: PIBusAttrList; attr: PIBusAttribute); cdecl; external libibus;
function ibus_attr_list_get(attr_list: PIBusAttrList; index: Tguint): PIBusAttribute; cdecl; external libibus;

// === Konventiert am: 25-7-25 17:14:28 ===

function IBUS_TYPE_ATTR_LIST: TGType;
function IBUS_ATTR_LIST(obj: Pointer): PIBusAttrList;
function IBUS_ATTR_LIST_CLASS(klass: Pointer): PIBusAttrListClass;
function IBUS_IS_ATTR_LIST(obj: Pointer): Tgboolean;
function IBUS_IS_ATTR_LIST_CLASS(klass: Pointer): Tgboolean;
function IBUS_ATTR_LIST_GET_CLASS(obj: Pointer): PIBusAttrListClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_ATTR_LIST: TGType;
begin
  IBUS_TYPE_ATTR_LIST := ibus_attr_list_get_type;
end;

function IBUS_ATTR_LIST(obj: Pointer): PIBusAttrList;
begin
  Result := PIBusAttrList(g_type_check_instance_cast(obj, IBUS_TYPE_ATTR_LIST));
end;

function IBUS_ATTR_LIST_CLASS(klass: Pointer): PIBusAttrListClass;
begin
  Result := PIBusAttrListClass(g_type_check_class_cast(klass, IBUS_TYPE_ATTR_LIST));
end;

function IBUS_IS_ATTR_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_ATTR_LIST);
end;

function IBUS_IS_ATTR_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_ATTR_LIST);
end;

function IBUS_ATTR_LIST_GET_CLASS(obj: Pointer): PIBusAttrListClass;
begin
  Result := PIBusAttrListClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
