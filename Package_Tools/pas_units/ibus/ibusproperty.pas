unit ibusproperty;

interface

uses
  fp_glib2, ibus, ibusserializable, ibustext;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TIBusPropList = record
    parent: TIBusSerializable;
    properties: PGArray;
  end;
  PIBusPropList = ^TIBusPropList;

  TIBusPropListClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusPropListClass = ^TIBusPropListClass;

type
  PIBusPropType = ^TIBusPropType;
  TIBusPropType = longint;

const
  PROP_TYPE_NORMAL = 0;
  PROP_TYPE_TOGGLE = 1;
  PROP_TYPE_RADIO = 2;
  PROP_TYPE_MENU = 3;
  PROP_TYPE_SEPARATOR = 4;

type
  PIBusPropState = ^TIBusPropState;
  TIBusPropState = longint;

const
  PROP_STATE_UNCHECKED = 0;
  PROP_STATE_CHECKED = 1;
  PROP_STATE_INCONSISTENT = 2;

type
  PIBusPropertyPrivate = type Pointer;

  TIBusProperty = record
    parent: TIBusSerializable;
    priv: PIBusPropertyPrivate;
    pdummy: array[0..6] of Tgpointer;
  end;
  PIBusProperty = ^TIBusProperty;

  TIBusPropertyClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusPropertyClass = ^TIBusPropertyClass;

function ibus_property_get_type: TGType; cdecl; external libibus;
function ibus_property_new(key: Pgchar; _type: TIBusPropType; _label: PIBusText; icon: Pgchar; tooltip: PIBusText;
  sensitive: Tgboolean; visible: Tgboolean; state: TIBusPropState; prop_list: PIBusPropList): PIBusProperty; cdecl; external libibus;
function ibus_property_new_varargs(first_property_name: Pgchar): PIBusProperty; cdecl; varargs; external libibus;
function ibus_property_get_key(prop: PIBusProperty): Pgchar; cdecl; external libibus;
function ibus_property_get_label(prop: PIBusProperty): PIBusText; cdecl; external libibus;
procedure ibus_property_set_label(prop: PIBusProperty; _label: PIBusText); cdecl; external libibus;
function ibus_property_get_symbol(prop: PIBusProperty): PIBusText; cdecl; external libibus;
procedure ibus_property_set_symbol(prop: PIBusProperty; symbol: PIBusText); cdecl; external libibus;
function ibus_property_get_icon(prop: PIBusProperty): Pgchar; cdecl; external libibus;
procedure ibus_property_set_icon(prop: PIBusProperty; icon: Pgchar); cdecl; external libibus;
function ibus_property_get_tooltip(prop: PIBusProperty): PIBusText; cdecl; external libibus;
procedure ibus_property_set_tooltip(prop: PIBusProperty; tooltip: PIBusText); cdecl; external libibus;
function ibus_property_get_sensitive(prop: PIBusProperty): Tgboolean; cdecl; external libibus;
procedure ibus_property_set_sensitive(prop: PIBusProperty; sensitive: Tgboolean); cdecl; external libibus;
function ibus_property_get_visible(prop: PIBusProperty): Tgboolean; cdecl; external libibus;
procedure ibus_property_set_visible(prop: PIBusProperty; visible: Tgboolean); cdecl; external libibus;
function ibus_property_get_prop_type(prop: PIBusProperty): TIBusPropType; cdecl; external libibus;
function ibus_property_get_state(prop: PIBusProperty): TIBusPropState; cdecl; external libibus;
procedure ibus_property_set_state(prop: PIBusProperty; state: TIBusPropState); cdecl; external libibus;
function ibus_property_get_sub_props(prop: PIBusProperty): PIBusPropList; cdecl; external libibus;
procedure ibus_property_set_sub_props(prop: PIBusProperty; prop_list: PIBusPropList); cdecl; external libibus;
function ibus_property_update(prop: PIBusProperty; prop_update: PIBusProperty): Tgboolean; cdecl; external libibus;

// === Konventiert am: 25-7-25 19:51:42 ===

function IBUS_TYPE_PROPERTY: TGType;
function IBUS_PROPERTY(obj: Pointer): PIBusProperty;
function IBUS_PROPERTY_CLASS(klass: Pointer): PIBusPropertyClass;
function IBUS_IS_PROPERTY(obj: Pointer): Tgboolean;
function IBUS_IS_PROPERTY_CLASS(klass: Pointer): Tgboolean;
function IBUS_PROPERTY_GET_CLASS(obj: Pointer): PIBusPropertyClass;

implementation

function IBUS_TYPE_PROPERTY: TGType;
begin
  IBUS_TYPE_PROPERTY := ibus_property_get_type;
end;

function IBUS_PROPERTY(obj: Pointer): PIBusProperty;
begin
  Result := PIBusProperty(g_type_check_instance_cast(obj, IBUS_TYPE_PROPERTY));
end;

function IBUS_PROPERTY_CLASS(klass: Pointer): PIBusPropertyClass;
begin
  Result := PIBusPropertyClass(g_type_check_class_cast(klass, IBUS_TYPE_PROPERTY));
end;

function IBUS_IS_PROPERTY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_PROPERTY);
end;

function IBUS_IS_PROPERTY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_PROPERTY);
end;

function IBUS_PROPERTY_GET_CLASS(obj: Pointer): PIBusPropertyClass;
begin
  Result := PIBusPropertyClass(PGTypeInstance(obj)^.g_class);
end;



end.
