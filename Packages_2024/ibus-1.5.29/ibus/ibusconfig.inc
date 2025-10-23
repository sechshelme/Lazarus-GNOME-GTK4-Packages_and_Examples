{$IFDEF read_interface}


type
  PIBusConfigPrivate = type Pointer;

  TIBusConfig = record
    parent: TIBusProxy;
    priv: PIBusConfigPrivate;
  end;
  PIBusConfig = ^TIBusConfig;

  TIBusConfigClass = record
    parent: TIBusProxyClass;
  end;
  PIBusConfigClass = ^TIBusConfigClass;


function ibus_config_get_type: TGType; cdecl; external libibus;
function ibus_config_new(connection: PGDBusConnection; cancellable: PGCancellable; error: PPGError): PIBusConfig; cdecl; external libibus;
procedure ibus_config_new_async(connection: PGDBusConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_config_new_async_finish(res: PGAsyncResult; error: PPGError): PIBusConfig; cdecl; external libibus;
function ibus_config_get_value(config: PIBusConfig; section: Pgchar; name: Pgchar): PGVariant; cdecl; external libibus;
procedure ibus_config_get_value_async(config: PIBusConfig; section: Pgchar; name: Pgchar; timeout_ms: Tgint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_config_get_value_async_finish(config: PIBusConfig; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libibus;
function ibus_config_get_values(config: PIBusConfig; section: Pgchar): PGVariant; cdecl; external libibus;
procedure ibus_config_get_values_async(config: PIBusConfig; section: Pgchar; timeout_ms: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libibus;
function ibus_config_get_values_async_finish(config: PIBusConfig; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libibus;
function ibus_config_set_value(config: PIBusConfig; section: Pgchar; name: Pgchar; value: PGVariant): Tgboolean; cdecl; external libibus;
procedure ibus_config_set_value_async(config: PIBusConfig; section: Pgchar; name: Pgchar; value: PGVariant; timeout_ms: Tgint;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_config_set_value_async_finish(config: PIBusConfig; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_config_unset(config: PIBusConfig; section: Pgchar; name: Pgchar): Tgboolean; cdecl; external libibus;
function ibus_config_watch(config: PIBusConfig; section: Pgchar; name: Pgchar): Tgboolean; cdecl; external libibus;
function ibus_config_unwatch(config: PIBusConfig; section: Pgchar; name: Pgchar): Tgboolean; cdecl; external libibus;

// === Konventiert am: 25-7-25 17:22:05 ===

function IBUS_TYPE_CONFIG: TGType;
function IBUS_CONFIG(obj: Pointer): PIBusConfig;
function IBUS_CONFIG_CLASS(klass: Pointer): PIBusConfigClass;
function IBUS_IS_CONFIG(obj: Pointer): Tgboolean;
function IBUS_IS_CONFIG_CLASS(klass: Pointer): Tgboolean;
function IBUS_CONFIG_GET_CLASS(obj: Pointer): PIBusConfigClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function IBUS_TYPE_CONFIG: TGType;
begin
  IBUS_TYPE_CONFIG := ibus_config_get_type;
end;

function IBUS_CONFIG(obj: Pointer): PIBusConfig;
begin
  Result := PIBusConfig(g_type_check_instance_cast(obj, IBUS_TYPE_CONFIG));
end;

function IBUS_CONFIG_CLASS(klass: Pointer): PIBusConfigClass;
begin
  Result := PIBusConfigClass(g_type_check_class_cast(klass, IBUS_TYPE_CONFIG));
end;

function IBUS_IS_CONFIG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_CONFIG);
end;

function IBUS_IS_CONFIG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_CONFIG);
end;

function IBUS_CONFIG_GET_CLASS(obj: Pointer): PIBusConfigClass;
begin
  Result := PIBusConfigClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
