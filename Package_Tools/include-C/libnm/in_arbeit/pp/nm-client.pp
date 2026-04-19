
unit nm-client;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-client.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
Pgboolean  = ^gboolean;
PGCancellable  = ^GCancellable;
PGDBusConnection  = ^GDBusConnection;
PGError  = ^GError;
PGHashTable  = ^GHashTable;
PGMainContext  = ^GMainContext;
PGObject  = ^GObject;
PGPtrArray  = ^GPtrArray;
Pgsize  = ^gsize;
Pguint32  = ^guint32;
PGVariant  = ^GVariant;
PGVariantType  = ^GVariantType;
PNMActiveConnection  = ^NMActiveConnection;
PNMCheckpoint  = ^NMCheckpoint;
PNMClient  = ^NMClient;
PNMClientError  = ^NMClientError;
PNMClientInstanceFlags  = ^NMClientInstanceFlags;
PNMConnection  = ^NMConnection;
PNMDevice  = ^NMDevice;
PNMDnsEntry  = ^NMDnsEntry;
PNMObject  = ^NMObject;
PNMRemoteConnection  = ^NMRemoteConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2014 Red Hat, Inc.
  }
{$ifndef __NM_CLIENT_H__}
{$define __NM_CLIENT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{*
 * NMClientInstanceFlags:
 * @NM_CLIENT_INSTANCE_FLAGS_NONE: special value to indicate no flags.
 * @NM_CLIENT_INSTANCE_FLAGS_NO_AUTO_FETCH_PERMISSIONS: by default, NMClient
 *   will fetch the permissions via "GetPermissions" and refetch them when
 *   "CheckPermissions" signal gets received. By setting this flag, this behavior
 *   can be disabled. You can toggle this flag to enable and disable automatic
 *   fetching of the permissions. Watch also nm_client_get_permissions_state()
 *   to know whether the permissions are up to date.
 * @NM_CLIENT_INSTANCE_FLAGS_INITIALIZED_GOOD: as #NMClient is an GInitable
 *   and GAsyncInitable, nm_client_get_instance_flags() returns this flag
 *   once initialization completed with success. This flag cannot be set
 *   as NM_CLIENT_INSTANCE_FLAGS property. Since: 1.42.
 * @NM_CLIENT_INSTANCE_FLAGS_INITIALIZED_BAD: like @NM_CLIENT_INSTANCE_FLAGS_INITIALIZED_GOOD
 *   indicates that the instance completed initialization with failure. In that
 *   case the instance is unusable. Since: 1.42.
 *
 * Since: 1.24
  }
{< flags > }type
  PNMClientInstanceFlags = ^TNMClientInstanceFlags;
  TNMClientInstanceFlags =  Longint;
  Const
    NM_CLIENT_INSTANCE_FLAGS_NONE = 0;
    NM_CLIENT_INSTANCE_FLAGS_NO_AUTO_FETCH_PERMISSIONS = $1;
    NM_CLIENT_INSTANCE_FLAGS_INITIALIZED_GOOD = $2;
    NM_CLIENT_INSTANCE_FLAGS_INITIALIZED_BAD = $4;
;

{ was #define dname def_expr }
function NM_TYPE_CLIENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CLIENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CLIENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_CLIENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_CLIENT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CLIENT_GET_CLASS(obj : longint) : longint;

const
  NM_CLIENT_VERSION = 'version';  
  NM_CLIENT_VERSION_INFO = 'version-info';  
  NM_CLIENT_STATE = 'state';  
  NM_CLIENT_STARTUP = 'startup';  
  NM_CLIENT_NM_RUNNING = 'nm-running';  
  NM_CLIENT_DBUS_CONNECTION = 'dbus-connection';  
  NM_CLIENT_DBUS_NAME_OWNER = 'dbus-name-owner';  
  NM_CLIENT_INSTANCE_FLAGS = 'instance-flags';  
{//xxxx _NM_DEPRECATED_SYNC_WRITABLE_PROPERTY }
  NM_CLIENT_NETWORKING_ENABLED = 'networking-enabled';  
{//xxxx _NM_DEPRECATED_SYNC_WRITABLE_PROPERTY }
  NM_CLIENT_WIRELESS_ENABLED = 'wireless-enabled';  
{//xxxx _NM_DEPRECATED_SYNC_WRITABLE_PROPERTY }
  NM_CLIENT_WWAN_ENABLED = 'wwan-enabled';  
{//xxxx _NM_DEPRECATED_SYNC_WRITABLE_PROPERTY }
  NM_CLIENT_WIMAX_ENABLED = 'wimax-enabled';  
  NM_CLIENT_WIRELESS_HARDWARE_ENABLED = 'wireless-hardware-enabled';  
  NM_CLIENT_WWAN_HARDWARE_ENABLED = 'wwan-hardware-enabled';  
  NM_CLIENT_WIMAX_HARDWARE_ENABLED = 'wimax-hardware-enabled';  
  NM_CLIENT_RADIO_FLAGS = 'radio-flags';  
  NM_CLIENT_ACTIVE_CONNECTIONS = 'active-connections';  
  NM_CLIENT_CONNECTIVITY = 'connectivity';  
  NM_CLIENT_CONNECTIVITY_CHECK_URI = 'connectivity-check-uri';  
  NM_CLIENT_CONNECTIVITY_CHECK_AVAILABLE = 'connectivity-check-available';  
{//xxxx _NM_DEPRECATED_SYNC_WRITABLE_PROPERTY }
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
{*
 * NMClientError:
 * @NM_CLIENT_ERROR_FAILED: unknown or unclassified error
 * @NM_CLIENT_ERROR_MANAGER_NOT_RUNNING: an operation that requires NetworkManager
 *   failed because NetworkManager is not running
 * @NM_CLIENT_ERROR_OBJECT_CREATION_FAILED: NetworkManager claimed that an
 *   operation succeeded, but the object that was allegedly created (eg,
 *   #NMRemoteConnection, #NMActiveConnection) was apparently destroyed before
 *   #NMClient could create a representation of it.
 *
 * Describes errors that may result from operations involving a #NMClient.
 *
 * D-Bus operations may also return errors from other domains, including
 * #NMManagerError, #NMSettingsError, #NMAgentManagerError, and #NMConnectionError.
 * }
type
  PNMClientError = ^TNMClientError;
  TNMClientError =  Longint;
  Const
    NM_CLIENT_ERROR_FAILED = 0;
    NM_CLIENT_ERROR_MANAGER_NOT_RUNNING = 1;
    NM_CLIENT_ERROR_OBJECT_CREATION_FAILED = 2;
;

{ was #define dname def_expr }
function NM_CLIENT_ERROR : longint; { return type might be wrong }

function nm_client_error_quark:TGQuark;cdecl;external;
{ DNS stuff  }
{*
 * NMDnsEntry:
 *
 * Since: 1.6
  }
type

function nm_dns_entry_get_type:TGType;cdecl;external;
procedure nm_dns_entry_unref(entry:PNMDnsEntry);cdecl;external;
(* Const before type ignored *)
function nm_dns_entry_get_interface(entry:PNMDnsEntry):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_dns_entry_get_nameservers(entry:PNMDnsEntry):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_dns_entry_get_domains(entry:PNMDnsEntry):^Pchar;cdecl;external;
function nm_dns_entry_get_priority(entry:PNMDnsEntry):longint;cdecl;external;
function nm_dns_entry_get_vpn(entry:PNMDnsEntry):Tgboolean;cdecl;external;
{*
 * NMClient:
 *
 * NMClient contains a cache of the objects of NetworkManager's D-Bus API.
 * It uses #GMainContext and #GDBusConnection for that and registers to
 * D-Bus signals. That means, when iterating the associated #GMainContext,
 * D-Bus signals gets processed and the #NMClient instance updates and
 * emits #GObject signals.
  }
type

function nm_client_get_type:TGType;cdecl;external;
function nm_client_new(cancellable:PGCancellable; error:PPGError):PNMClient;cdecl;external;
procedure nm_client_new_async(cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_new_finish(result:PGAsyncResult; error:PPGError):PNMClient;cdecl;external;
function nm_client_get_instance_flags(self:PNMClient):TNMClientInstanceFlags;cdecl;external;
function nm_client_get_dbus_connection(client:PNMClient):PGDBusConnection;cdecl;external;
function nm_client_get_main_context(self:PNMClient):PGMainContext;cdecl;external;
function nm_client_get_context_busy_watcher(self:PNMClient):PGObject;cdecl;external;
(* Const before type ignored *)
function nm_client_get_dbus_name_owner(client:PNMClient):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_client_get_version(client:PNMClient):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_client_get_version_info(client:PNMClient; length:Pgsize):Pguint32;cdecl;external;
function nm_client_get_state(client:PNMClient):TNMState;cdecl;external;
function nm_client_get_startup(client:PNMClient):Tgboolean;cdecl;external;
function nm_client_get_nm_running(client:PNMClient):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_client_get_object_by_path(client:PNMClient; dbus_path:Pchar):PNMObject;cdecl;external;
function nm_client_get_metered(client:PNMClient):TNMMetered;cdecl;external;
function nm_client_networking_get_enabled(client:PNMClient):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_client_get_capabilities(client:PNMClient; length:Pgsize):Pguint32;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_client_networking_set_enabled(client:PNMClient; enabled:Tgboolean; error:PPGError):Tgboolean;cdecl;external;
function nm_client_wireless_get_enabled(client:PNMClient):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
procedure nm_client_wireless_set_enabled(client:PNMClient; enabled:Tgboolean);cdecl;external;
function nm_client_wireless_hardware_get_enabled(client:PNMClient):Tgboolean;cdecl;external;
function nm_client_wwan_get_enabled(client:PNMClient):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
procedure nm_client_wwan_set_enabled(client:PNMClient; enabled:Tgboolean);cdecl;external;
function nm_client_wwan_hardware_get_enabled(client:PNMClient):Tgboolean;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx NM_DEPRECATED_IN_1_22 }
function nm_client_wimax_get_enabled(client:PNMClient):Tgboolean;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx NM_DEPRECATED_IN_1_22 }
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
procedure nm_client_wimax_set_enabled(client:PNMClient; enabled:Tgboolean);cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx NM_DEPRECATED_IN_1_22 }
function nm_client_wimax_hardware_get_enabled(client:PNMClient):Tgboolean;cdecl;external;
function nm_client_get_radio_flags(client:PNMClient):TNMRadioFlags;cdecl;external;
function nm_client_connectivity_check_get_available(client:PNMClient):Tgboolean;cdecl;external;
function nm_client_connectivity_check_get_enabled(client:PNMClient):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
procedure nm_client_connectivity_check_set_enabled(client:PNMClient; enabled:Tgboolean);cdecl;external;
(* Const before type ignored *)
function nm_client_connectivity_check_get_uri(client:PNMClient):Pchar;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_client_get_logging(client:PNMClient; level:PPchar; domains:PPchar; error:PPGError):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
(* Const before type ignored *)
(* Const before type ignored *)
function nm_client_set_logging(client:PNMClient; level:Pchar; domains:Pchar; error:PPGError):Tgboolean;cdecl;external;
function nm_client_get_permission_result(client:PNMClient; permission:TNMClientPermission):TNMClientPermissionResult;cdecl;external;
function nm_client_get_permissions_state(self:PNMClient):TNMTernary;cdecl;external;
function nm_client_get_connectivity(client:PNMClient):TNMConnectivityState;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx NM_DEPRECATED_IN_1_22 }
function nm_client_check_connectivity(client:PNMClient; cancellable:PGCancellable; error:PPGError):TNMConnectivityState;cdecl;external;
procedure nm_client_check_connectivity_async(client:PNMClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_check_connectivity_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):TNMConnectivityState;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
(* Const before type ignored *)
function nm_client_save_hostname(client:PNMClient; hostname:Pchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure nm_client_save_hostname_async(client:PNMClient; hostname:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_save_hostname_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{ Devices  }
(* Const before type ignored *)
function nm_client_get_devices(client:PNMClient):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function nm_client_get_all_devices(client:PNMClient):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function nm_client_get_device_by_path(client:PNMClient; object_path:Pchar):PNMDevice;cdecl;external;
(* Const before type ignored *)
function nm_client_get_device_by_iface(client:PNMClient; iface:Pchar):PNMDevice;cdecl;external;
{ Active Connections  }
(* Const before type ignored *)
function nm_client_get_active_connections(client:PNMClient):PGPtrArray;cdecl;external;
function nm_client_get_primary_connection(client:PNMClient):PNMActiveConnection;cdecl;external;
function nm_client_get_activating_connection(client:PNMClient):PNMActiveConnection;cdecl;external;
(* Const before type ignored *)
procedure nm_client_activate_connection_async(client:PNMClient; connection:PNMConnection; device:PNMDevice; specific_object:Pchar; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_activate_connection_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):PNMActiveConnection;cdecl;external;
(* Const before type ignored *)
procedure nm_client_add_and_activate_connection_async(client:PNMClient; partial:PNMConnection; device:PNMDevice; specific_object:Pchar; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_add_and_activate_connection_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):PNMActiveConnection;cdecl;external;
(* Const before type ignored *)
procedure nm_client_add_and_activate_connection2(client:PNMClient; partial:PNMConnection; device:PNMDevice; specific_object:Pchar; options:PGVariant; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_add_and_activate_connection2_finish(client:PNMClient; result:PGAsyncResult; out_result:PPGVariant; error:PPGError):PNMActiveConnection;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_client_deactivate_connection(client:PNMClient; active:PNMActiveConnection; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_client_deactivate_connection_async(client:PNMClient; active:PNMActiveConnection; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_deactivate_connection_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{ Connections  }
(* Const before type ignored *)
function nm_client_get_connections(client:PNMClient):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function nm_client_get_connection_by_id(client:PNMClient; id:Pchar):PNMRemoteConnection;cdecl;external;
(* Const before type ignored *)
function nm_client_get_connection_by_path(client:PNMClient; path:Pchar):PNMRemoteConnection;cdecl;external;
(* Const before type ignored *)
function nm_client_get_connection_by_uuid(client:PNMClient; uuid:Pchar):PNMRemoteConnection;cdecl;external;
procedure nm_client_add_connection_async(client:PNMClient; connection:PNMConnection; save_to_disk:Tgboolean; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function nm_client_add_connection_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):PNMRemoteConnection;cdecl;external;
procedure nm_client_add_connection2(client:PNMClient; settings:PGVariant; flags:TNMSettingsAddConnection2Flags; args:PGVariant; ignore_out_result:Tgboolean; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_add_connection2_finish(client:PNMClient; result:PGAsyncResult; out_result:PPGVariant; error:PPGError):PNMRemoteConnection;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_client_load_connections(client:PNMClient; filenames:PPchar; failures:PPPchar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_client_load_connections_async(client:PNMClient; filenames:PPchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_load_connections_finish(client:PNMClient; failures:PPPchar; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{xxxx //xxxx //xxxx //xxxx _NM_DEPRECATED_SYNC_METHOD }
function nm_client_reload_connections(client:PNMClient; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
procedure nm_client_reload_connections_async(client:PNMClient; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_reload_connections_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_client_get_dns_mode(client:PNMClient):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_client_get_dns_rc_manager(client:PNMClient):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_client_get_dns_configuration(client:PNMClient):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function nm_client_get_checkpoints(client:PNMClient):PGPtrArray;cdecl;external;
(* Const before type ignored *)
procedure nm_client_checkpoint_create(client:PNMClient; devices:PGPtrArray; rollback_timeout:Tguint32; flags:TNMCheckpointCreateFlags; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_checkpoint_create_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):PNMCheckpoint;cdecl;external;
(* Const before type ignored *)
procedure nm_client_checkpoint_destroy(client:PNMClient; checkpoint_path:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_checkpoint_destroy_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure nm_client_checkpoint_rollback(client:PNMClient; checkpoint_path:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_checkpoint_rollback_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):PGHashTable;cdecl;external;
(* Const before type ignored *)
procedure nm_client_checkpoint_adjust_rollback_timeout(client:PNMClient; checkpoint_path:Pchar; add_timeout:Tguint32; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function nm_client_checkpoint_adjust_rollback_timeout_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure nm_client_reload(client:PNMClient; flags:TNMManagerReloadFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_reload_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{*************************************************************************** }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure nm_client_dbus_call(client:PNMClient; object_path:Pchar; interface_name:Pchar; method_name:Pchar; parameters:PGVariant; 
            reply_type:PGVariantType; timeout_msec:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_dbus_call_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):PGVariant;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure nm_client_dbus_set_property(client:PNMClient; object_path:Pchar; interface_name:Pchar; property_name:Pchar; value:PGVariant; 
            timeout_msec:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_dbus_set_property_finish(client:PNMClient; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{*************************************************************************** }
(* Const before type ignored *)
procedure nm_utils_print(output_mode:longint; msg:Pchar);cdecl;external;
(* Const before type ignored *)
function nm_utils_file_is_certificate(filename:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_file_is_private_key(filename:Pchar; out_encrypted:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_utils_file_is_pkcs12(filename:Pchar):Tgboolean;cdecl;external;
{*************************************************************************** }
procedure nm_client_wait_shutdown(client:PNMClient; integrate_maincontext:Tgboolean; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function nm_client_wait_shutdown_finish(result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __NM_CLIENT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_CLIENT : longint; { return type might be wrong }
  begin
    NM_TYPE_CLIENT:=nm_client_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CLIENT(obj : longint) : longint;
begin
  NM_CLIENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_CLIENT,NMClient);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CLIENT_CLASS(klass : longint) : longint;
begin
  NM_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_CLIENT,NMClientClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_CLIENT(obj : longint) : longint;
begin
  NM_IS_CLIENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_CLIENT_CLASS(klass : longint) : longint;
begin
  NM_IS_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_CLIENT_GET_CLASS(obj : longint) : longint;
begin
  NM_CLIENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_CLIENT,NMClientClass);
end;

{ was #define dname def_expr }
function NM_CLIENT_ERROR : longint; { return type might be wrong }
  begin
    NM_CLIENT_ERROR:=nm_client_error_quark;
  end;


end.
