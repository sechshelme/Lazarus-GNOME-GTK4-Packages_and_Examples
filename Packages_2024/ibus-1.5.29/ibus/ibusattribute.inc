{$IFDEF read_interface}


type
  PIBusAttrType = ^TIBusAttrType;
  TIBusAttrType = longint;

const
  IBUS_ATTR_TYPE_UNDERLINE = 1;
  IBUS_ATTR_TYPE_FOREGROUND = 2;
  IBUS_ATTR_TYPE_BACKGROUND = 3;

type
  PIBusAttrUnderline = ^TIBusAttrUnderline;
  TIBusAttrUnderline = longint;

const
  IBUS_ATTR_UNDERLINE_NONE = 0;
  IBUS_ATTR_UNDERLINE_SINGLE = 1;
  IBUS_ATTR_UNDERLINE_DOUBLE = 2;
  IBUS_ATTR_UNDERLINE_LOW = 3;
  IBUS_ATTR_UNDERLINE_ERROR = 4;

type
  TIBusAttribute = record
    parent: TIBusSerializable;
    _type: Tguint;
    value: Tguint;
    start_index: Tguint;
    end_index: Tguint;
  end;
  PIBusAttribute = ^TIBusAttribute;

  TIBusAttributeClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusAttributeClass = ^TIBusAttributeClass;

function ibus_attribute_get_type: TGType; cdecl; external libibus;
function ibus_attribute_new(_type: Tguint; value: Tguint; start_index: Tguint; end_index: Tguint): PIBusAttribute; cdecl; external libibus;
function ibus_attribute_get_attr_type(attr: PIBusAttribute): Tguint; cdecl; external libibus;
function ibus_attribute_get_value(attr: PIBusAttribute): Tguint; cdecl; external libibus;
function ibus_attribute_get_start_index(attr: PIBusAttribute): Tguint; cdecl; external libibus;
function ibus_attribute_get_end_index(attr: PIBusAttribute): Tguint; cdecl; external libibus;
function ibus_attr_underline_new(underline_type: Tguint; start_index: Tguint; end_index: Tguint): PIBusAttribute; cdecl; external libibus;
function ibus_attr_foreground_new(color: Tguint; start_index: Tguint; end_index: Tguint): PIBusAttribute; cdecl; external libibus;
function ibus_attr_background_new(color: Tguint; start_index: Tguint; end_index: Tguint): PIBusAttribute; cdecl; external libibus;

// === Konventiert am: 25-7-25 17:16:04 ===

function IBUS_TYPE_ATTRIBUTE: TGType;
function IBUS_ATTRIBUTE(obj: Pointer): PIBusAttribute;
function IBUS_ATTRIBUTE_CLASS(klass: Pointer): PIBusAttributeClass;
function IBUS_IS_ATTRIBUTE(obj: Pointer): Tgboolean;
function IBUS_IS_ATTRIBUTE_CLASS(klass: Pointer): Tgboolean;
function IBUS_ATTRIBUTE_GET_CLASS(obj: Pointer): PIBusAttributeClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_ATTRIBUTE: TGType;
begin
  IBUS_TYPE_ATTRIBUTE := ibus_attribute_get_type;
end;

function IBUS_ATTRIBUTE(obj: Pointer): PIBusAttribute;
begin
  Result := PIBusAttribute(g_type_check_instance_cast(obj, IBUS_TYPE_ATTRIBUTE));
end;

function IBUS_ATTRIBUTE_CLASS(klass: Pointer): PIBusAttributeClass;
begin
  Result := PIBusAttributeClass(g_type_check_class_cast(klass, IBUS_TYPE_ATTRIBUTE));
end;

function IBUS_IS_ATTRIBUTE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_ATTRIBUTE);
end;

function IBUS_IS_ATTRIBUTE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_ATTRIBUTE);
end;

function IBUS_ATTRIBUTE_GET_CLASS(obj: Pointer): PIBusAttributeClass;
begin
  Result := PIBusAttributeClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
