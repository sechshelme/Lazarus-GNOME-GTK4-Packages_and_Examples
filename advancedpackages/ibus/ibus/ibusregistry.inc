{$IFDEF read_interface}


type
  PIBusRegistryPrivate = type Pointer;

  TIBusRegistry = record
    parent: TIBusSerializable;
    priv: PIBusRegistryPrivate;
  end;
  PIBusRegistry = ^TIBusRegistry;

  TIBusRegistryClass = record
    parent: TIBusSerializableClass;
  end;
  PIBusRegistryClass = ^TIBusRegistryClass;

function ibus_registry_get_type: TGType; cdecl; external libibus;
function ibus_registry_new: PIBusRegistry; cdecl; external libibus;
procedure ibus_registry_load(registry: PIBusRegistry); cdecl; external libibus;
procedure ibus_registry_load_in_dir(registry: PIBusRegistry; dirname: Pgchar); cdecl; external libibus;
function ibus_registry_load_cache(registry: PIBusRegistry; is_user: Tgboolean): Tgboolean; cdecl; external libibus;
function ibus_registry_load_cache_file(registry: PIBusRegistry; filename: Pgchar): Tgboolean; cdecl; external libibus;
function ibus_registry_save_cache(registry: PIBusRegistry; is_user: Tgboolean): Tgboolean; cdecl; external libibus;
function ibus_registry_save_cache_file(registry: PIBusRegistry; filename: Pgchar): Tgboolean; cdecl; external libibus;
procedure ibus_registry_output(registry: PIBusRegistry; output: PGString; indent: longint); cdecl; external libibus;
function ibus_registry_check_modification(registry: PIBusRegistry): Tgboolean; cdecl; external libibus;
function ibus_registry_get_components(registry: PIBusRegistry): PGList; cdecl; external libibus;
function ibus_registry_get_observed_paths(registry: PIBusRegistry): PGList; cdecl; external libibus;
procedure ibus_registry_start_monitor_changes(registry: PIBusRegistry); cdecl; external libibus;

// === Konventiert am: 26-7-25 15:32:37 ===

function IBUS_TYPE_REGISTRY: TGType;
function IBUS_REGISTRY(obj: Pointer): PIBusRegistry;
function IBUS_REGISTRY_CLASS(klass: Pointer): PIBusRegistryClass;
function IBUS_IS_REGISTRY(obj: Pointer): Tgboolean;
function IBUS_IS_REGISTRY_CLASS(klass: Pointer): Tgboolean;
function IBUS_REGISTRY_GET_CLASS(obj: Pointer): PIBusRegistryClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_REGISTRY: TGType;
begin
  IBUS_TYPE_REGISTRY := ibus_registry_get_type;
end;

function IBUS_REGISTRY(obj: Pointer): PIBusRegistry;
begin
  Result := PIBusRegistry(g_type_check_instance_cast(obj, IBUS_TYPE_REGISTRY));
end;

function IBUS_REGISTRY_CLASS(klass: Pointer): PIBusRegistryClass;
begin
  Result := PIBusRegistryClass(g_type_check_class_cast(klass, IBUS_TYPE_REGISTRY));
end;

function IBUS_IS_REGISTRY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_REGISTRY);
end;

function IBUS_IS_REGISTRY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_REGISTRY);
end;

function IBUS_REGISTRY_GET_CLASS(obj: Pointer): PIBusRegistryClass;
begin
  Result := PIBusRegistryClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
