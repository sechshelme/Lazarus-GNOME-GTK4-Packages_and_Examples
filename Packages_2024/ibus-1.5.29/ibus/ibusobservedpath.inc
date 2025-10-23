{$IFDEF read_interface}



type
  TIBusObservedPath = record
    parent: TIBusSerializable;
    path: Pgchar;
    mtime: Tglong;
    is_dir: Tgboolean;
    is_exist: Tgboolean;
  end;
  PIBusObservedPath = ^TIBusObservedPath;

  TIBusObservedPathClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusObservedPathClass = ^TIBusObservedPathClass;

function ibus_observed_path_get_type: TGType; cdecl; external libibus;
function ibus_observed_path_new_from_xml_node(node: PXMLNode; fill_stat: Tgboolean): PIBusObservedPath; cdecl; external libibus;
function ibus_observed_path_new(path: Pgchar; fill_stat: Tgboolean): PIBusObservedPath; cdecl; external libibus;
function ibus_observed_path_traverse(path: PIBusObservedPath; dir_only: Tgboolean): PGList; cdecl; external libibus;
function ibus_observed_path_check_modification(path: PIBusObservedPath): Tgboolean; cdecl; external libibus;
procedure ibus_observed_path_output(path: PIBusObservedPath; output: PGString; indent: Tgint); cdecl; external libibus;

// === Konventiert am: 26-7-25 15:54:19 ===

function IBUS_TYPE_OBSERVED_PATH: TGType;
function IBUS_OBSERVED_PATH(obj: Pointer): PIBusObservedPath;
function IBUS_OBSERVED_PATH_CLASS(klass: Pointer): PIBusObservedPathClass;
function IBUS_IS_OBSERVED_PATH(obj: Pointer): Tgboolean;
function IBUS_IS_OBSERVED_PATH_CLASS(klass: Pointer): Tgboolean;
function IBUS_OBSERVED_PATH_GET_CLASS(obj: Pointer): PIBusObservedPathClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_OBSERVED_PATH: TGType;
begin
  IBUS_TYPE_OBSERVED_PATH := ibus_observed_path_get_type;
end;

function IBUS_OBSERVED_PATH(obj: Pointer): PIBusObservedPath;
begin
  Result := PIBusObservedPath(g_type_check_instance_cast(obj, IBUS_TYPE_OBSERVED_PATH));
end;

function IBUS_OBSERVED_PATH_CLASS(klass: Pointer): PIBusObservedPathClass;
begin
  Result := PIBusObservedPathClass(g_type_check_class_cast(klass, IBUS_TYPE_OBSERVED_PATH));
end;

function IBUS_IS_OBSERVED_PATH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_OBSERVED_PATH);
end;

function IBUS_IS_OBSERVED_PATH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_OBSERVED_PATH);
end;

function IBUS_OBSERVED_PATH_GET_CLASS(obj: Pointer): PIBusObservedPathClass;
begin
  Result := PIBusObservedPathClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
