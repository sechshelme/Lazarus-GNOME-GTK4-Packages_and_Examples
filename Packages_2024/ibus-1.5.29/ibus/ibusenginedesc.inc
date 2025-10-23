{$IFDEF read_interface}


type
  PIBusEngineDescPrivate = type Pointer;

  TIBusEngineDesc = record
    parent: TIBusSerializable;
    priv: PIBusEngineDescPrivate;
  end;
  PIBusEngineDesc = ^TIBusEngineDesc;
  PPIBusEngineDesc = ^PIBusEngineDesc;

  TIBusEngineDescClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusEngineDescClass = ^TIBusEngineDescClass;

function ibus_engine_desc_get_type: TGType; cdecl; external libibus;
function ibus_engine_desc_new(name: Pgchar; longname: Pgchar; description: Pgchar; language: Pgchar; license: Pgchar;
  author: Pgchar; icon: Pgchar; layout: Pgchar): PIBusEngineDesc; cdecl; external libibus;
function ibus_engine_desc_new_varargs(first_property_name: Pgchar): PIBusEngineDesc; cdecl; varargs; external libibus;
function ibus_engine_desc_new_from_xml_node(node: PXMLNode): PIBusEngineDesc; cdecl; external libibus;
function ibus_engine_desc_get_name(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_longname(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_description(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_language(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_license(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_author(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_icon(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_layout(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_layout_variant(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_layout_option(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_rank(info: PIBusEngineDesc): Tguint; cdecl; external libibus;
function ibus_engine_desc_get_hotkeys(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_symbol(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_setup(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_version(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_textdomain(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
function ibus_engine_desc_get_icon_prop_key(info: PIBusEngineDesc): Pgchar; cdecl; external libibus;
procedure ibus_engine_desc_output(info: PIBusEngineDesc; output: PGString; indent: Tgint); cdecl; external libibus;

// === Konventiert am: 25-7-25 16:54:48 ===

function IBUS_TYPE_ENGINE_DESC: TGType;
function IBUS_ENGINE_DESC(obj: Pointer): PIBusEngineDesc;
function IBUS_ENGINE_DESC_CLASS(klass: Pointer): PIBusEngineDescClass;
function IBUS_IS_ENGINE_DESC(obj: Pointer): Tgboolean;
function IBUS_IS_ENGINE_DESC_CLASS(klass: Pointer): Tgboolean;
function IBUS_ENGINE_DESC_GET_CLASS(obj: Pointer): PIBusEngineDescClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_ENGINE_DESC: TGType;
begin
  IBUS_TYPE_ENGINE_DESC := ibus_engine_desc_get_type;
end;

function IBUS_ENGINE_DESC(obj: Pointer): PIBusEngineDesc;
begin
  Result := PIBusEngineDesc(g_type_check_instance_cast(obj, IBUS_TYPE_ENGINE_DESC));
end;

function IBUS_ENGINE_DESC_CLASS(klass: Pointer): PIBusEngineDescClass;
begin
  Result := PIBusEngineDescClass(g_type_check_class_cast(klass, IBUS_TYPE_ENGINE_DESC));
end;

function IBUS_IS_ENGINE_DESC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_ENGINE_DESC);
end;

function IBUS_IS_ENGINE_DESC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_ENGINE_DESC);
end;

function IBUS_ENGINE_DESC_GET_CLASS(obj: Pointer): PIBusEngineDescClass;
begin
  Result := PIBusEngineDescClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
