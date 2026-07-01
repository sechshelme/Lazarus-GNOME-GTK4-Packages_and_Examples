

{$IFDEF read_function}
function g_dbus_connection_get_type: TGType; cdecl; external libgio2;

procedure g_bus_get(bus_type: TGBusType; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_bus_get_finish(res: PGAsyncResult; error: PPGError): PGDBusConnection; cdecl; external libgio2;
function g_bus_get_sync(bus_type: TGBusType; cancellable: PGCancellable; error: PPGError): PGDBusConnection; cdecl; external libgio2;

procedure g_dbus_connection_new(stream: PGIOStream; guid: Pgchar; flags: TGDBusConnectionFlags; observer: PGDBusAuthObserver; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_new_finish(res: PGAsyncResult; error: PPGError): PGDBusConnection; cdecl; external libgio2;
function g_dbus_connection_new_sync(stream: PGIOStream; guid: Pgchar; flags: TGDBusConnectionFlags; observer: PGDBusAuthObserver; cancellable: PGCancellable;
  error: PPGError): PGDBusConnection; cdecl; external libgio2;
procedure g_dbus_connection_new_for_address(address: Pgchar; flags: TGDBusConnectionFlags; observer: PGDBusAuthObserver; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_new_for_address_finish(res: PGAsyncResult; error: PPGError): PGDBusConnection; cdecl; external libgio2;
function g_dbus_connection_new_for_address_sync(address: Pgchar; flags: TGDBusConnectionFlags; observer: PGDBusAuthObserver; cancellable: PGCancellable; error: PPGError): PGDBusConnection; cdecl; external libgio2;

procedure g_dbus_connection_start_message_processing(connection: PGDBusConnection); cdecl; external libgio2;
function g_dbus_connection_is_closed(connection: PGDBusConnection): Tgboolean; cdecl; external libgio2;
function g_dbus_connection_get_stream(connection: PGDBusConnection): PGIOStream; cdecl; external libgio2;
function g_dbus_connection_get_guid(connection: PGDBusConnection): Pgchar; cdecl; external libgio2;
function g_dbus_connection_get_unique_name(connection: PGDBusConnection): Pgchar; cdecl; external libgio2;
function g_dbus_connection_get_peer_credentials(connection: PGDBusConnection): PGCredentials; cdecl; external libgio2;
function g_dbus_connection_get_last_serial(connection: PGDBusConnection): Tguint32; cdecl; external libgio2;
function g_dbus_connection_get_exit_on_close(connection: PGDBusConnection): Tgboolean; cdecl; external libgio2;
procedure g_dbus_connection_set_exit_on_close(connection: PGDBusConnection; exit_on_close: Tgboolean); cdecl; external libgio2;
function g_dbus_connection_get_capabilities(connection: PGDBusConnection): TGDBusCapabilityFlags; cdecl; external libgio2;
function g_dbus_connection_get_flags(connection: PGDBusConnection): TGDBusConnectionFlags; cdecl; external libgio2;

procedure g_dbus_connection_close(connection: PGDBusConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_close_finish(connection: PGDBusConnection; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_dbus_connection_close_sync(connection: PGDBusConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

procedure g_dbus_connection_flush(connection: PGDBusConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_flush_finish(connection: PGDBusConnection; res: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgio2;
function g_dbus_connection_flush_sync(connection: PGDBusConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgio2;

function g_dbus_connection_send_message(connection: PGDBusConnection; message: PGDBusMessage; flags: TGDBusSendMessageFlags; out_serial: Pguint32; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_dbus_connection_send_message_with_reply(connection: PGDBusConnection; message: PGDBusMessage; flags: TGDBusSendMessageFlags; timeout_msec: Tgint; out_serial: Pguint32;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_send_message_with_reply_finish(connection: PGDBusConnection; res: PGAsyncResult; error: PPGError): PGDBusMessage; cdecl; external libgio2;
function g_dbus_connection_send_message_with_reply_sync(connection: PGDBusConnection; message: PGDBusMessage; flags: TGDBusSendMessageFlags; timeout_msec: Tgint; out_serial: Pguint32;
  cancellable: PGCancellable; error: PPGError): PGDBusMessage; cdecl; external libgio2;

function g_dbus_connection_emit_signal(connection: PGDBusConnection; destination_bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; signal_name: Pgchar;
  parameters: PGVariant; error: PPGError): Tgboolean; cdecl; external libgio2;
procedure g_dbus_connection_call(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
  parameters: PGVariant; reply_type: PGVariantType; flags: TGDBusCallFlags; timeout_msec: Tgint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_call_finish(connection: PGDBusConnection; res: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libgio2;
function g_dbus_connection_call_sync(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
  parameters: PGVariant; reply_type: PGVariantType; flags: TGDBusCallFlags; timeout_msec: Tgint; cancellable: PGCancellable;
  error: PPGError): PGVariant; cdecl; external libgio2;

{$ifdef linux}
procedure g_dbus_connection_call_with_unix_fd_list(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
  parameters: PGVariant; reply_type: PGVariantType; flags: TGDBusCallFlags; timeout_msec: Tgint; fd_list: PGUnixFDList;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgio2;
function g_dbus_connection_call_with_unix_fd_list_finish(connection: PGDBusConnection; out_fd_list: PPGUnixFDList; res: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libgio2;
function g_dbus_connection_call_with_unix_fd_list_sync(connection: PGDBusConnection; bus_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar;
  parameters: PGVariant; reply_type: PGVariantType; flags: TGDBusCallFlags; timeout_msec: Tgint; fd_list: PGUnixFDList;
  out_fd_list: PPGUnixFDList; cancellable: PGCancellable; error: PPGError): PGVariant; cdecl; external libgio2;
{$endif}
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TGDBusInterfaceMethodCallFunc = procedure(connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; interface_name: Pgchar; method_name: Pgchar; parameters: PGVariant; invocation: PGDBusMethodInvocation; user_data: Tgpointer); cdecl;
  TGDBusInterfaceGetPropertyFunc = function(connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; interface_name: Pgchar; property_name: Pgchar; error: PPGError; user_data: Tgpointer): PGVariant; cdecl;
  TGDBusInterfaceSetPropertyFunc = function(connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; interface_name: Pgchar; property_name: Pgchar; value: PGVariant; error: PPGError; user_data: Tgpointer): Tgboolean; cdecl;

  PGDBusInterfaceVTable = ^TGDBusInterfaceVTable;
  TGDBusInterfaceVTable = record
    method_call: TGDBusInterfaceMethodCallFunc;
    get_property: TGDBusInterfaceGetPropertyFunc;
    set_property: TGDBusInterfaceSetPropertyFunc;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_dbus_connection_register_object(connection: PGDBusConnection; object_path: Pgchar; interface_info: PGDBusInterfaceInfo; vtable: PGDBusInterfaceVTable; user_data: Tgpointer;
  user_data_free_func: TGDestroyNotify; error: PPGError): Tguint; cdecl; external libgio2;
function g_dbus_connection_register_object_with_closures(connection: PGDBusConnection; object_path: Pgchar; interface_info: PGDBusInterfaceInfo; method_call_closure: PGClosure; get_property_closure: PGClosure;
  set_property_closure: PGClosure; error: PPGError): Tguint; cdecl; external libgio2; deprecated;
function g_dbus_connection_register_object_with_closures2(connection: PGDBusConnection; object_path: Pgchar; interface_info: PGDBusInterfaceInfo; method_call_closure: PGClosure; get_property_closure: PGClosure;
  set_property_closure: PGClosure; error: PPGError): Tguint; cdecl; external libgio2;
function g_dbus_connection_unregister_object(connection: PGDBusConnection; registration_id: Tguint): Tgboolean; cdecl; external libgio2;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TGDBusSubtreeEnumerateFunc = function(connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; user_data: Tgpointer): PPgchar; cdecl;
  TGDBusSubtreeIntrospectFunc = function(connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; node: Pgchar; user_data: Tgpointer): PPGDBusInterfaceInfo; cdecl;
  TGDBusSubtreeDispatchFunc = function(connection: PGDBusConnection; sender: Pgchar; object_path: Pgchar; interface_name: Pgchar; node: Pgchar; out_user_data: Pgpointer; user_data: Tgpointer): PGDBusInterfaceVTable; cdecl;

  PGDBusSubtreeVTable = ^TGDBusSubtreeVTable;
  TGDBusSubtreeVTable = record
    enumerate: TGDBusSubtreeEnumerateFunc;
    introspect: TGDBusSubtreeIntrospectFunc;
    dispatch: TGDBusSubtreeDispatchFunc;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_dbus_connection_register_subtree(connection: PGDBusConnection; object_path: Pgchar; vtable: PGDBusSubtreeVTable; flags: TGDBusSubtreeFlags; user_data: Tgpointer;
  user_data_free_func: TGDestroyNotify; error: PPGError): Tguint; cdecl; external libgio2;
function g_dbus_connection_unregister_subtree(connection: PGDBusConnection; registration_id: Tguint): Tgboolean; cdecl; external libgio2;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TGDBusSignalCallback = procedure(connection: PGDBusConnection; sender_name: Pgchar; object_path: Pgchar; interface_name: Pgchar; signal_name: Pgchar;
    parameters: PGVariant; user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_dbus_connection_signal_subscribe(connection: PGDBusConnection; sender: Pgchar; interface_name: Pgchar; member: Pgchar; object_path: Pgchar;
  arg0: Pgchar; flags: TGDBusSignalFlags; callback: TGDBusSignalCallback; user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_signal_unsubscribe(connection: PGDBusConnection; subscription_id: Tguint); cdecl; external libgio2;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TGDBusMessageFilterFunction = function(connection: PGDBusConnection; message: PGDBusMessage; incoming: Tgboolean; user_data: Tgpointer): PGDBusMessage; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_dbus_connection_add_filter(connection: PGDBusConnection; filter_function: TGDBusMessageFilterFunction; user_data: Tgpointer; user_data_free_func: TGDestroyNotify): Tguint; cdecl; external libgio2;
procedure g_dbus_connection_remove_filter(connection: PGDBusConnection; filter_id: Tguint); cdecl; external libgio2;

procedure g_clear_dbus_signal_subscription(subscription_id_pointer: Pguint; connection: PGDBusConnection); inline;

// === Konventiert am: 26-6-26 16:43:24 ===

function G_TYPE_DBUS_CONNECTION: TGType;
function G_DBUS_CONNECTION(obj: Pointer): PGDBusConnection;
function G_IS_DBUS_CONNECTION(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_DBUS_CONNECTION: TGType;
begin
  G_TYPE_DBUS_CONNECTION := g_dbus_connection_get_type;
end;

function G_DBUS_CONNECTION(obj: Pointer): PGDBusConnection;
begin
  Result := PGDBusConnection(g_type_check_instance_cast(obj, G_TYPE_DBUS_CONNECTION));
end;

function G_IS_DBUS_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DBUS_CONNECTION);
end;

procedure g_clear_dbus_signal_subscription(subscription_id_pointer: Pguint; connection: PGDBusConnection);
var
  subscription_id: cardinal;
begin
  subscription_id := g_steal_handle_id(subscription_id_pointer);
  if subscription_id > 0 then  begin
    g_dbus_connection_signal_unsubscribe(connection, subscription_id);
  end;
end;

{$ENDIF read_implementation}
