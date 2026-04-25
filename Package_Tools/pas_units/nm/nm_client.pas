unit nm_client;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PNMClientInstanceFlags = ^TNMClientInstanceFlags;
  TNMClientInstanceFlags = longint;

const
  NM_CLIENT_INSTANCE_FLAGS_NONE = 0;
  NM_CLIENT_INSTANCE_FLAGS_NO_AUTO_FETCH_PERMISSIONS = $1;
  NM_CLIENT_INSTANCE_FLAGS_INITIALIZED_GOOD = $2;
  NM_CLIENT_INSTANCE_FLAGS_INITIALIZED_BAD = $4;

const
  NM_CLIENT_VERSION = 'version';
  NM_CLIENT_VERSION_INFO = 'version-info';
  NM_CLIENT_STATE = 'state';
  NM_CLIENT_STARTUP = 'startup';
  NM_CLIENT_NM_RUNNING = 'nm-running';
  NM_CLIENT_DBUS_CONNECTION = 'dbus-connection';
  NM_CLIENT_DBUS_NAME_OWNER = 'dbus-name-owner';
  NM_CLIENT_INSTANCE_FLAGS = 'instance-flags';
  NM_CLIENT_NETWORKING_ENABLED = 'networking-enabled';
  NM_CLIENT_WIRELESS_ENABLED = 'wireless-enabled';
  NM_CLIENT_WWAN_ENABLED = 'wwan-enabled';
  NM_CLIENT_WIMAX_ENABLED = 'wimax-enabled';
  NM_CLIENT_WIRELESS_HARDWARE_ENABLED = 'wireless-hardware-enabled';
  NM_CLIENT_WWAN_HARDWARE_ENABLED = 'wwan-hardware-enabled';
  NM_CLIENT_WIMAX_HARDWARE_ENABLED = 'wimax-hardware-enabled';
  NM_CLIENT_RADIO_FLAGS = 'radio-flags';
  NM_CLIENT_ACTIVE_CONNECTIONS = 'active-connections';
  NM_CLIENT_CONNECTIVITY = 'connectivity';
  NM_CLIENT_CONNECTIVITY_CHECK_URI = 'connectivity-check-uri';
  NM_CLIENT_CONNECTIVITY_CHECK_AVAILABLE = 'connectivity-check-available';
  NM_CLIENT_CONNECTIVITY_CHECK_ENABLED = 'connectivity-check-enabled';
  NM_CLIENT_PRIMARY_CONNECTION = 'primary-connection';
  NM_CLIENT_ACTIVATING_CONNECTION = 'activating-connection';
  NM_CLIENT_DEVICES = 'devices';
  NM_CLIENT_ALL_DEVICES = 'all-devices';
  NM_CLIENT_CONNECTIONS = 'connections';
  NM_CLIENT_HOSTNAME = 'hostname';
  NM_CLIENT_CAN_MODIFY = 'can-modify';
  NM_CLIENT_METERED = 'metered';
  NM_CLIENT_DNS_MODE = 'dns-mode';
  NM_CLIENT_DNS_RC_MANAGER = 'dns-rc-manager';
  NM_CLIENT_DNS_CONFIGURATION = 'dns-configuration';
  NM_CLIENT_CHECKPOINTS = 'checkpoints';
  NM_CLIENT_CAPABILITIES = 'capabilities';
  NM_CLIENT_PERMISSIONS_STATE = 'permissions-state';
  NM_CLIENT_DEVICE_ADDED = 'device-added';
  NM_CLIENT_DEVICE_REMOVED = 'device-removed';
  NM_CLIENT_ANY_DEVICE_ADDED = 'any-device-added';
  NM_CLIENT_ANY_DEVICE_REMOVED = 'any-device-removed';
  NM_CLIENT_PERMISSION_CHANGED = 'permission-changed';
  NM_CLIENT_CONNECTION_ADDED = 'connection-added';
  NM_CLIENT_CONNECTION_REMOVED = 'connection-removed';
  NM_CLIENT_ACTIVE_CONNECTION_ADDED = 'active-connection-added';
  NM_CLIENT_ACTIVE_CONNECTION_REMOVED = 'active-connection-removed';

type
  PNMClientError = ^TNMClientError;
  TNMClientError = longint;

const
  NM_CLIENT_ERROR_FAILED = 0;
  NM_CLIENT_ERROR_MANAGER_NOT_RUNNING = 1;
  NM_CLIENT_ERROR_OBJECT_CREATION_FAILED = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function NM_CLIENT_ERROR: TGQuark;

function nm_client_error_quark: TGQuark; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PNMDnsEntry = type PointerArray;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_dns_entry_get_type: TGType; cdecl; external libnm;
procedure nm_dns_entry_unref(entry: PNMDnsEntry); cdecl; external libnm;
function nm_dns_entry_get_interface(entry: PNMDnsEntry): pchar; cdecl; external libnm;
function nm_dns_entry_get_nameservers(entry: PNMDnsEntry): PPchar; cdecl; external libnm;
function nm_dns_entry_get_domains(entry: PNMDnsEntry): PPchar; cdecl; external libnm;
function nm_dns_entry_get_priority(entry: PNMDnsEntry): longint; cdecl; external libnm;
function nm_dns_entry_get_vpn(entry: PNMDnsEntry): Tgboolean; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PNMClient = type Pointer;
  PNMClientClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_client_get_type: TGType; cdecl; external libnm;
function nm_client_new(cancellable: PGCancellable; error: PPGError): PNMClient; cdecl; external libnm;
procedure nm_client_new_async(cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_new_finish(result: PGAsyncResult; error: PPGError): PNMClient; cdecl; external libnm;
function nm_client_get_instance_flags(self: PNMClient): TNMClientInstanceFlags; cdecl; external libnm;
function nm_client_get_dbus_connection(client: PNMClient): PGDBusConnection; cdecl; external libnm;
function nm_client_get_main_context(self: PNMClient): PGMainContext; cdecl; external libnm;
function nm_client_get_context_busy_watcher(self: PNMClient): PGObject; cdecl; external libnm;
function nm_client_get_dbus_name_owner(client: PNMClient): pchar; cdecl; external libnm;
function nm_client_get_version(client: PNMClient): pchar; cdecl; external libnm;
function nm_client_get_version_info(client: PNMClient; length: Pgsize): Pguint32; cdecl; external libnm;
function nm_client_get_state(client: PNMClient): TNMState; cdecl; external libnm;
function nm_client_get_startup(client: PNMClient): Tgboolean; cdecl; external libnm;
function nm_client_get_nm_running(client: PNMClient): Tgboolean; cdecl; external libnm;
function nm_client_get_object_by_path(client: PNMClient; dbus_path: pchar): PNMObject; cdecl; external libnm;
function nm_client_get_metered(client: PNMClient): TNMMetered; cdecl; external libnm;
function nm_client_networking_get_enabled(client: PNMClient): Tgboolean; cdecl; external libnm;
function nm_client_get_capabilities(client: PNMClient; length: Pgsize): Pguint32; cdecl; external libnm;
function nm_client_networking_set_enabled(client: PNMClient; enabled: Tgboolean; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
function nm_client_wireless_get_enabled(client: PNMClient): Tgboolean; cdecl; external libnm;
procedure nm_client_wireless_set_enabled(client: PNMClient; enabled: Tgboolean); cdecl; external libnm; deprecated;
function nm_client_wireless_hardware_get_enabled(client: PNMClient): Tgboolean; cdecl; external libnm;
function nm_client_wwan_get_enabled(client: PNMClient): Tgboolean; cdecl; external libnm;
procedure nm_client_wwan_set_enabled(client: PNMClient; enabled: Tgboolean); cdecl; external libnm; deprecated;
function nm_client_wwan_hardware_get_enabled(client: PNMClient): Tgboolean; cdecl; external libnm;
function nm_client_wimax_get_enabled(client: PNMClient): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_client_wimax_set_enabled(client: PNMClient; enabled: Tgboolean); cdecl; external libnm; deprecated;
function nm_client_wimax_hardware_get_enabled(client: PNMClient): Tgboolean; cdecl; external libnm; deprecated;
function nm_client_get_radio_flags(client: PNMClient): TNMRadioFlags; cdecl; external libnm;
function nm_client_connectivity_check_get_available(client: PNMClient): Tgboolean; cdecl; external libnm;
function nm_client_connectivity_check_get_enabled(client: PNMClient): Tgboolean; cdecl; external libnm;
procedure nm_client_connectivity_check_set_enabled(client: PNMClient; enabled: Tgboolean); cdecl; external libnm; deprecated;
function nm_client_connectivity_check_get_uri(client: PNMClient): pchar; cdecl; external libnm;
function nm_client_get_logging(client: PNMClient; level: PPchar; domains: PPchar; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
function nm_client_set_logging(client: PNMClient; level: pchar; domains: pchar; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
function nm_client_get_permission_result(client: PNMClient; permission: TNMClientPermission): TNMClientPermissionResult; cdecl; external libnm;
function nm_client_get_permissions_state(self: PNMClient): TNMTernary; cdecl; external libnm;
function nm_client_get_connectivity(client: PNMClient): TNMConnectivityState; cdecl; external libnm;
function nm_client_check_connectivity(client: PNMClient; cancellable: PGCancellable; error: PPGError): TNMConnectivityState; cdecl; external libnm; deprecated;
procedure nm_client_check_connectivity_async(client: PNMClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_check_connectivity_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): TNMConnectivityState; cdecl; external libnm;
function nm_client_save_hostname(client: PNMClient; hostname: pchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_client_save_hostname_async(client: PNMClient; hostname: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_save_hostname_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;

function nm_client_get_devices(client: PNMClient): PGPtrArray; cdecl; external libnm;
function nm_client_get_all_devices(client: PNMClient): PGPtrArray; cdecl; external libnm;
function nm_client_get_device_by_path(client: PNMClient; object_path: pchar): PNMDevice; cdecl; external libnm;
function nm_client_get_device_by_iface(client: PNMClient; iface: pchar): PNMDevice; cdecl; external libnm;

function nm_client_get_active_connections(client: PNMClient): PGPtrArray; cdecl; external libnm;
function nm_client_get_primary_connection(client: PNMClient): PNMActiveConnection; cdecl; external libnm;
function nm_client_get_activating_connection(client: PNMClient): PNMActiveConnection; cdecl; external libnm;
procedure nm_client_activate_connection_async(client: PNMClient; connection: PNMConnection; device: PNMDevice; specific_object: pchar; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_activate_connection_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): PNMActiveConnection; cdecl; external libnm;
procedure nm_client_add_and_activate_connection_async(client: PNMClient; partial: PNMConnection; device: PNMDevice; specific_object: pchar; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_add_and_activate_connection_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): PNMActiveConnection; cdecl; external libnm;
procedure nm_client_add_and_activate_connection2(client: PNMClient; partial: PNMConnection; device: PNMDevice; specific_object: pchar; options: PGVariant;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_add_and_activate_connection2_finish(client: PNMClient; result: PGAsyncResult; out_result: PPGVariant; error: PPGError): PNMActiveConnection; cdecl; external libnm;
function nm_client_deactivate_connection(client: PNMClient; active: PNMActiveConnection; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_client_deactivate_connection_async(client: PNMClient; active: PNMActiveConnection; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_deactivate_connection_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;

function nm_client_get_connections(client: PNMClient): PGPtrArray; cdecl; external libnm;
function nm_client_get_connection_by_id(client: PNMClient; id: pchar): PNMRemoteConnection; cdecl; external libnm;
function nm_client_get_connection_by_path(client: PNMClient; path: pchar): PNMRemoteConnection; cdecl; external libnm;
function nm_client_get_connection_by_uuid(client: PNMClient; uuid: pchar): PNMRemoteConnection; cdecl; external libnm;
procedure nm_client_add_connection_async(client: PNMClient; connection: PNMConnection; save_to_disk: Tgboolean; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libnm;
function nm_client_add_connection_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): PNMRemoteConnection; cdecl; external libnm;
procedure nm_client_add_connection2(client: PNMClient; settings: PGVariant; flags: TNMSettingsAddConnection2Flags; args: PGVariant; ignore_out_result: Tgboolean;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_add_connection2_finish(client: PNMClient; result: PGAsyncResult; out_result: PPGVariant; error: PPGError): PNMRemoteConnection; cdecl; external libnm;
function nm_client_load_connections(client: PNMClient; filenames: PPchar; failures: PPPchar; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_client_load_connections_async(client: PNMClient; filenames: PPchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_load_connections_finish(client: PNMClient; failures: PPPchar; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_client_reload_connections(client: PNMClient; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_client_reload_connections_async(client: PNMClient; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_reload_connections_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_client_get_dns_mode(client: PNMClient): pchar; cdecl; external libnm;
function nm_client_get_dns_rc_manager(client: PNMClient): pchar; cdecl; external libnm;
function nm_client_get_dns_configuration(client: PNMClient): PGPtrArray; cdecl; external libnm;
function nm_client_get_checkpoints(client: PNMClient): PGPtrArray; cdecl; external libnm;
procedure nm_client_checkpoint_create(client: PNMClient; devices: PGPtrArray; rollback_timeout: Tguint32; flags: TNMCheckpointCreateFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_checkpoint_create_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): PNMCheckpoint; cdecl; external libnm;
procedure nm_client_checkpoint_destroy(client: PNMClient; checkpoint_path: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_checkpoint_destroy_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
procedure nm_client_checkpoint_rollback(client: PNMClient; checkpoint_path: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_checkpoint_rollback_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): PGHashTable; cdecl; external libnm;
procedure nm_client_checkpoint_adjust_rollback_timeout(client: PNMClient; checkpoint_path: pchar; add_timeout: Tguint32; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libnm;
function nm_client_checkpoint_adjust_rollback_timeout_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
procedure nm_client_reload(client: PNMClient; flags: TNMManagerReloadFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_reload_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;

procedure nm_client_dbus_call(client: PNMClient; object_path: pchar; interface_name: pchar; method_name: pchar; parameters: PGVariant;
  reply_type: PGVariantType; timeout_msec: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_dbus_call_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libnm;
procedure nm_client_dbus_set_property(client: PNMClient; object_path: pchar; interface_name: pchar; property_name: pchar; value: PGVariant;
  timeout_msec: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_dbus_set_property_finish(client: PNMClient; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;

procedure nm_utils_print(output_mode: longint; msg: pchar); cdecl; external libnm;
function nm_utils_file_is_certificate(filename: pchar): Tgboolean; cdecl; external libnm;
function nm_utils_file_is_private_key(filename: pchar; out_encrypted: Pgboolean): Tgboolean; cdecl; external libnm;
function nm_utils_file_is_pkcs12(filename: pchar): Tgboolean; cdecl; external libnm;

procedure nm_client_wait_shutdown(client: PNMClient; integrate_maincontext: Tgboolean; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_client_wait_shutdown_finish(result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:33:29 ===

function NM_TYPE_CLIENT: TGType;
function NM_CLIENT(obj: Pointer): PNMClient;
function NM_CLIENT_CLASS(klass: Pointer): PNMClientClass;
function NM_IS_CLIENT(obj: Pointer): Tgboolean;
function NM_IS_CLIENT_CLASS(klass: Pointer): Tgboolean;
function NM_CLIENT_GET_CLASS(obj: Pointer): PNMClientClass;
{$ENDIF read_function}

implementation

function NM_TYPE_CLIENT: TGType;
begin
  NM_TYPE_CLIENT := nm_client_get_type;
end;

function NM_CLIENT(obj: Pointer): PNMClient;
begin
  Result := PNMClient(g_type_check_instance_cast(obj, NM_TYPE_CLIENT));
end;

function NM_CLIENT_CLASS(klass: Pointer): PNMClientClass;
begin
  Result := PNMClientClass(g_type_check_class_cast(klass, NM_TYPE_CLIENT));
end;

function NM_IS_CLIENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_CLIENT);
end;

function NM_IS_CLIENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_CLIENT);
end;

function NM_CLIENT_GET_CLASS(obj: Pointer): PNMClientClass;
begin
  Result := PNMClientClass(PGTypeInstance(obj)^.g_class);
end;


function NM_CLIENT_ERROR: TGQuark;
begin
  NM_CLIENT_ERROR := nm_client_error_quark;
end;


end.
