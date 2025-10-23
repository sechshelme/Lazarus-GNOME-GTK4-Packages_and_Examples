{$IFDEF read_interface}


type
  PIBusComponentPrivate = type Pointer;

  TIBusComponent = record
    parent: TIBusSerializable;
    priv: PIBusComponentPrivate;
    pdummy: array[0..6] of Tgpointer;
  end;
  PIBusComponent = ^TIBusComponent;

  TIBusComponentClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusComponentClass = ^TIBusComponentClass;


function ibus_component_get_type: TGType; cdecl; external libibus;
function ibus_component_new(name: Pgchar; description: Pgchar; version: Pgchar; license: Pgchar; author: Pgchar;
  homepage: Pgchar; command_line: Pgchar; textdomain: Pgchar): PIBusComponent; cdecl; external libibus;
function ibus_component_new_varargs(first_property_name: Pgchar): PIBusComponent; cdecl; varargs; external libibus;
function ibus_component_new_from_xml_node(node: PXMLNode): PIBusComponent; cdecl; external libibus;
function ibus_component_new_from_file(filename: Pgchar): PIBusComponent; cdecl; external libibus;
function ibus_component_get_name(component: PIBusComponent): Pgchar; cdecl; external libibus;
function ibus_component_get_description(component: PIBusComponent): Pgchar; cdecl; external libibus;
function ibus_component_get_version(component: PIBusComponent): Pgchar; cdecl; external libibus;
function ibus_component_get_license(component: PIBusComponent): Pgchar; cdecl; external libibus;
function ibus_component_get_author(component: PIBusComponent): Pgchar; cdecl; external libibus;
function ibus_component_get_homepage(component: PIBusComponent): Pgchar; cdecl; external libibus;
function ibus_component_get_exec(component: PIBusComponent): Pgchar; cdecl; external libibus;
function ibus_component_get_textdomain(component: PIBusComponent): Pgchar; cdecl; external libibus;
procedure ibus_component_add_observed_path(component: PIBusComponent; path: Pgchar; access_fs: Tgboolean); cdecl; external libibus;
procedure ibus_component_add_engine(component: PIBusComponent; engine: PIBusEngineDesc); cdecl; external libibus;
function ibus_component_get_engines(component: PIBusComponent): PGList; cdecl; external libibus;
procedure ibus_component_output(component: PIBusComponent; output: PGString; indent: Tgint); cdecl; external libibus;
procedure ibus_component_output_engines(component: PIBusComponent; output: PGString; indent: Tgint); cdecl; external libibus;
function ibus_component_check_modification(component: PIBusComponent): Tgboolean; cdecl; external libibus;
function ibus_component_get_observed_paths(component: PIBusComponent): PGList; cdecl; external libibus;

// === Konventiert am: 25-7-25 17:17:55 ===

function IBUS_TYPE_COMPONENT: TGType;
function IBUS_COMPONENT(obj: Pointer): PIBusComponent;
function IBUS_COMPONENT_CLASS(klass: Pointer): PIBusComponentClass;
function IBUS_IS_COMPONENT(obj: Pointer): Tgboolean;
function IBUS_IS_COMPONENT_CLASS(klass: Pointer): Tgboolean;
function IBUS_COMPONENT_GET_CLASS(obj: Pointer): PIBusComponentClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_COMPONENT: TGType;
begin
  IBUS_TYPE_COMPONENT := ibus_component_get_type;
end;

function IBUS_COMPONENT(obj: Pointer): PIBusComponent;
begin
  Result := PIBusComponent(g_type_check_instance_cast(obj, IBUS_TYPE_COMPONENT));
end;

function IBUS_COMPONENT_CLASS(klass: Pointer): PIBusComponentClass;
begin
  Result := PIBusComponentClass(g_type_check_class_cast(klass, IBUS_TYPE_COMPONENT));
end;

function IBUS_IS_COMPONENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_COMPONENT);
end;

function IBUS_IS_COMPONENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_COMPONENT);
end;

function IBUS_COMPONENT_GET_CLASS(obj: Pointer): PIBusComponentClass;
begin
  Result := PIBusComponentClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
