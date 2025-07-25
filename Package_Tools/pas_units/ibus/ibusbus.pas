unit ibusbus;

interface

uses
  fp_glib2, ibus, ibusobject, ibusinputcontext, ibuscomponent, ibusenginedesc, ibusconfig, ibusxevent;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PIBusBusGlobalBindingType = ^TIBusBusGlobalBindingType;
  TIBusBusGlobalBindingType = longint;

const
  IBUS_BUS_GLOBAL_BINDING_TYPE_ANY = 0;
  IBUS_BUS_GLOBAL_BINDING_TYPE_IME_SWITCHER = 1;
  IBUS_BUS_GLOBAL_BINDING_TYPE_EMOJI_TYPING = 2;

type
  PIBusBusPrivate = type Pointer;

  TIBusBus = record
    parent: TIBusObject;
    priv: PIBusBusPrivate;
  end;
  PIBusBus = ^TIBusBus;

  TIBusBusClass = record
    parent: TIBusObjectClass;
  end;
  PIBusBusClass = ^TIBusBusClass;


function ibus_bus_get_type: TGType; cdecl; external libibus;
function ibus_bus_new: PIBusBus; cdecl; external libibus;
function ibus_bus_new_async: PIBusBus; cdecl; external libibus;
function ibus_bus_new_async_client: PIBusBus; cdecl; external libibus;
function ibus_bus_is_connected(bus: PIBusBus): Tgboolean; cdecl; external libibus;
function ibus_bus_get_connection(bus: PIBusBus): PGDBusConnection; cdecl; external libibus;
function ibus_bus_get_service_name(bus: PIBusBus): Pgchar; cdecl; external libibus;
function ibus_bus_hello(bus: PIBusBus): Pgchar; cdecl; external libibus;
function ibus_bus_request_name(bus: PIBusBus; name: Pgchar; flags: Tguint32): Tguint32; cdecl; external libibus;
procedure ibus_bus_request_name_async(bus: PIBusBus; name: Pgchar; flags: Tguint; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_request_name_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tguint; cdecl; external libibus;
function ibus_bus_release_name(bus: PIBusBus; name: Pgchar): Tguint; cdecl; external libibus;
procedure ibus_bus_release_name_async(bus: PIBusBus; name: Pgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_release_name_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tguint; cdecl; external libibus;
function ibus_bus_list_queued_owners(bus: PIBusBus; name: Pgchar): PGList; cdecl; external libibus;
function ibus_bus_name_has_owner(bus: PIBusBus; name: Pgchar): Tgboolean; cdecl; external libibus;
procedure ibus_bus_name_has_owner_async(bus: PIBusBus; name: Pgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_name_has_owner_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_bus_list_names(bus: PIBusBus): PGList; cdecl; external libibus;
function ibus_bus_add_match(bus: PIBusBus; rule: Pgchar): Tgboolean; cdecl; external libibus;
procedure ibus_bus_add_match_async(bus: PIBusBus; rule: Pgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_add_match_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_bus_remove_match(bus: PIBusBus; rule: Pgchar): Tgboolean; cdecl; external libibus;
procedure ibus_bus_remove_match_async(bus: PIBusBus; rule: Pgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_remove_match_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_bus_get_name_owner(bus: PIBusBus; name: Pgchar): Pgchar; cdecl; external libibus;
procedure ibus_bus_get_name_owner_async(bus: PIBusBus; name: Pgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_get_name_owner_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Pgchar; cdecl; external libibus;
function ibus_bus_exit(bus: PIBusBus; restart: Tgboolean): Tgboolean; cdecl; external libibus;
procedure ibus_bus_exit_async(bus: PIBusBus; restart: Tgboolean; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_exit_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_bus_create_input_context(bus: PIBusBus; client_name: Pgchar): PIBusInputContext; cdecl; external libibus;
procedure ibus_bus_create_input_context_async(bus: PIBusBus; client_name: Pgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_create_input_context_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): PIBusInputContext; cdecl; external libibus;
function ibus_bus_current_input_context(bus: PIBusBus): Pgchar; cdecl; external libibus;
procedure ibus_bus_current_input_context_async(bus: PIBusBus; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_current_input_context_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Pgchar; cdecl; external libibus;
function ibus_bus_register_component(bus: PIBusBus; component: PIBusComponent): Tgboolean; cdecl; external libibus;
procedure ibus_bus_register_component_async(bus: PIBusBus; component: PIBusComponent; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_register_component_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_bus_list_engines(bus: PIBusBus): PGList; cdecl; external libibus;
procedure ibus_bus_list_engines_async(bus: PIBusBus; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_list_engines_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): PGList; cdecl; external libibus;
function ibus_bus_list_active_engines(bus: PIBusBus): PGList; cdecl; external libibus; deprecated;
procedure ibus_bus_list_active_engines_async(bus: PIBusBus; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus; deprecated;
function ibus_bus_list_active_engines_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): PGList; cdecl; external libibus; deprecated;
function ibus_bus_get_engines_by_names(bus: PIBusBus; names: PPgchar): PPIBusEngineDesc; cdecl; external libibus;
function ibus_bus_get_use_sys_layout(bus: PIBusBus): Tgboolean; cdecl; external libibus; deprecated;
procedure ibus_bus_get_use_sys_layout_async(bus: PIBusBus; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus; deprecated;
function ibus_bus_get_use_sys_layout_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus; deprecated;
function ibus_bus_get_use_global_engine(bus: PIBusBus): Tgboolean; cdecl; external libibus; deprecated;
procedure ibus_bus_get_use_global_engine_async(bus: PIBusBus; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus; deprecated;
function ibus_bus_get_use_global_engine_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus; deprecated;
function ibus_bus_is_global_engine_enabled(bus: PIBusBus): Tgboolean; cdecl; external libibus; deprecated;
procedure ibus_bus_is_global_engine_enabled_async(bus: PIBusBus; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus; deprecated;
function ibus_bus_is_global_engine_enabled_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus; deprecated;
function ibus_bus_get_global_engine(bus: PIBusBus): PIBusEngineDesc; cdecl; external libibus;
procedure ibus_bus_get_global_engine_async(bus: PIBusBus; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_get_global_engine_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): PIBusEngineDesc; cdecl; external libibus;
function ibus_bus_set_global_engine(bus: PIBusBus; global_engine: Pgchar): Tgboolean; cdecl; external libibus;
procedure ibus_bus_set_global_engine_async(bus: PIBusBus; global_engine: Pgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_set_global_engine_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
procedure ibus_bus_set_watch_dbus_signal(bus: PIBusBus; watch: Tgboolean); cdecl; external libibus;
procedure ibus_bus_set_watch_ibus_signal(bus: PIBusBus; watch: Tgboolean); cdecl; external libibus;
function ibus_bus_get_config(bus: PIBusBus): PIBusConfig; cdecl; external libibus;
function ibus_bus_preload_engines(bus: PIBusBus; names: PPgchar): Tgboolean; cdecl; external libibus;
procedure ibus_bus_preload_engines_async(bus: PIBusBus; names: PPgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_preload_engines_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_bus_set_global_shortcut_keys(bus: PIBusBus; gtype: TIBusBusGlobalBindingType; keys: PIBusProcessKeyEventData): Tgboolean; cdecl; external libibus;
procedure ibus_bus_set_global_shortcut_keys_async(bus: PIBusBus; gtype: TIBusBusGlobalBindingType; keys: PIBusProcessKeyEventData; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_set_global_shortcut_keys_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;
function ibus_bus_get_ibus_property(bus: PIBusBus; property_name: Pgchar): PGVariant; cdecl; external libibus;
procedure ibus_bus_get_ibus_property_async(bus: PIBusBus; property_name: Pgchar; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_get_ibus_property_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libibus;
procedure ibus_bus_set_ibus_property(bus: PIBusBus; property_name: Pgchar; value: PGVariant); cdecl; external libibus;
procedure ibus_bus_set_ibus_property_async(bus: PIBusBus; property_name: Pgchar; value: PGVariant; timeout_msec: Tgint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libibus;
function ibus_bus_set_ibus_property_async_finish(bus: PIBusBus; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libibus;

// === Konventiert am: 25-7-25 14:44:51 ===

function IBUS_TYPE_BUS: TGType;
function IBUS_BUS(obj: Pointer): PIBusBus;
function IBUS_BUS_CLASS(klass: Pointer): PIBusBusClass;
function IBUS_IS_BUS(obj: Pointer): Tgboolean;
function IBUS_IS_BUS_CLASS(klass: Pointer): Tgboolean;
function IBUS_BUS_GET_CLASS(obj: Pointer): PIBusBusClass;


implementation

function IBUS_TYPE_BUS: TGType;
begin
  IBUS_TYPE_BUS := ibus_bus_get_type;
end;

function IBUS_BUS(obj: Pointer): PIBusBus;
begin
  Result := PIBusBus(g_type_check_instance_cast(obj, IBUS_TYPE_BUS));
end;

function IBUS_BUS_CLASS(klass: Pointer): PIBusBusClass;
begin
  Result := PIBusBusClass(g_type_check_class_cast(klass, IBUS_TYPE_BUS));
end;

function IBUS_IS_BUS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, IBUS_TYPE_BUS);
end;

function IBUS_IS_BUS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, IBUS_TYPE_BUS);
end;

function IBUS_BUS_GET_CLASS(obj: Pointer): PIBusBusClass;
begin
  Result := PIBusBusClass(PGTypeInstance(obj)^.g_class);
end;



end.
