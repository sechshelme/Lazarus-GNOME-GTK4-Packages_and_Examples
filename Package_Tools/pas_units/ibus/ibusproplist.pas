unit ibusproplist;

interface

uses
  fp_glib2, ibus, ibusserializable, ibusproperty;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function ibus_prop_list_get_type: TGType; cdecl; external libibus;
function ibus_prop_list_new: PIBusPropList; cdecl; external libibus;
procedure ibus_prop_list_append(prop_list: PIBusPropList; prop: PIBusProperty); cdecl; external libibus;
function ibus_prop_list_get(prop_list: PIBusPropList; index: Tguint): PIBusProperty; cdecl; external libibus;
function ibus_prop_list_update_property(prop_list: PIBusPropList; prop: PIBusProperty): Tgboolean; cdecl; external libibus;

// === Konventiert am: 25-7-25 19:50:05 ===

function IBUS_TYPE_PROP_LIST: TGType;
function IBUS_PROP_LIST(obj: Pointer): PIBusPropList;
function IBUS_PROP_LIST_CLASS(klass: Pointer): PIBusPropListClass;
function IBUS_IS_PROP_LIST(obj: Pointer): Tgboolean;
function IBUS_IS_PROP_LIST_CLASS(klass: Pointer): Tgboolean;
function IBUS_PROP_LIST_GET_CLASS(obj: Pointer): PIBusPropListClass;

implementation

function IBUS_TYPE_PROP_LIST: TGType;
begin
  IBUS_TYPE_PROP_LIST := ibus_prop_list_get_type;
end;

function IBUS_PROP_LIST(obj: Pointer): PIBusPropList;
begin
  Result := PIBusPropList(g_type_check_instance_cast(obj, IBUS_TYPE_PROP_LIST));
end;

function IBUS_PROP_LIST_CLASS(klass: Pointer): PIBusPropListClass;
begin
  Result := PIBusPropListClass(g_type_check_class_cast(klass, IBUS_TYPE_PROP_LIST));
end;

function IBUS_IS_PROP_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_PROP_LIST);
end;

function IBUS_IS_PROP_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_PROP_LIST);
end;

function IBUS_PROP_LIST_GET_CLASS(obj: Pointer): PIBusPropListClass;
begin
  Result := PIBusPropListClass(PGTypeInstance(obj)^.g_class);
end;



end.
