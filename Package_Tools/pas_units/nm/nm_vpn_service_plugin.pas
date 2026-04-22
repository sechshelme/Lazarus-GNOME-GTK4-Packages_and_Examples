unit nm_vpn_service_plugin;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_VPN_SERVICE_PLUGIN_DBUS_SERVICE_NAME = 'service-name';
  NM_VPN_SERVICE_PLUGIN_DBUS_WATCH_PEER = 'watch-peer';
  NM_VPN_SERVICE_PLUGIN_STATE = 'state';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TNMVpnServicePlugin = record
    parent: TGObject;
  end;
  PNMVpnServicePlugin = ^TNMVpnServicePlugin;

  TNMVpnServicePluginClass = record
    parent: TGObjectClass;
    state_changed: procedure(plugin: PNMVpnServicePlugin; state: TNMVpnServiceState); cdecl;
    ip4_config: procedure(plugin: PNMVpnServicePlugin; ip4_config: PGVariant); cdecl;
    login_banner: procedure(plugin: PNMVpnServicePlugin; banner: pchar); cdecl;
    failure: procedure(plugin: PNMVpnServicePlugin; reason: TNMVpnPluginFailure); cdecl;
    quit: procedure(plugin: PNMVpnServicePlugin); cdecl;
    config: procedure(plugin: PNMVpnServicePlugin; config: PGVariant); cdecl;
    ip6_config: procedure(plugin: PNMVpnServicePlugin; config: PGVariant); cdecl;
    connect: function(plugin: PNMVpnServicePlugin; connection: PNMConnection; err: PPGError): Tgboolean; cdecl;
    need_secrets: function(plugin: PNMVpnServicePlugin; connection: PNMConnection; setting_name: PPchar; error: PPGError): Tgboolean; cdecl;
    disconnect: function(plugin: PNMVpnServicePlugin; err: PPGError): Tgboolean; cdecl;
    new_secrets: function(plugin: PNMVpnServicePlugin; connection: PNMConnection; error: PPGError): Tgboolean; cdecl;
    connect_interactive: function(plugin: PNMVpnServicePlugin; connection: PNMConnection; details: PGVariant; error: PPGError): Tgboolean; cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  PNMVpnServicePluginClass = ^TNMVpnServicePluginClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_vpn_service_plugin_get_type: TGType; cdecl; external libnm;
function nm_vpn_service_plugin_get_connection(plugin: PNMVpnServicePlugin): PGDBusConnection; cdecl; external libnm;
procedure nm_vpn_service_plugin_secrets_required(plugin: PNMVpnServicePlugin; message: pchar; hints: PPchar); cdecl; external libnm;
procedure nm_vpn_service_plugin_set_login_banner(plugin: PNMVpnServicePlugin; banner: pchar); cdecl; external libnm;
procedure nm_vpn_service_plugin_failure(plugin: PNMVpnServicePlugin; reason: TNMVpnPluginFailure); cdecl; external libnm;
procedure nm_vpn_service_plugin_set_config(plugin: PNMVpnServicePlugin; config: PGVariant); cdecl; external libnm;
procedure nm_vpn_service_plugin_set_ip4_config(plugin: PNMVpnServicePlugin; ip4_config: PGVariant); cdecl; external libnm;
procedure nm_vpn_service_plugin_set_ip6_config(plugin: PNMVpnServicePlugin; ip6_config: PGVariant); cdecl; external libnm;
function nm_vpn_service_plugin_disconnect(plugin: PNMVpnServicePlugin; err: PPGError): Tgboolean; cdecl; external libnm;
procedure nm_vpn_service_plugin_shutdown(plugin: PNMVpnServicePlugin); cdecl; external libnm;
function nm_vpn_service_plugin_read_vpn_details(fd: longint; out_data: PPGHashTable; out_secrets: PPGHashTable): Tgboolean; cdecl; external libnm;
function nm_vpn_service_plugin_get_secret_flags(data: PGHashTable; secret_name: pchar; out_flags: PNMSettingSecretFlags): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:18:51 ===

function NM_TYPE_VPN_SERVICE_PLUGIN: TGType;
function NM_VPN_SERVICE_PLUGIN(obj: Pointer): PNMVpnServicePlugin;
function NM_VPN_SERVICE_PLUGIN_CLASS(klass: Pointer): PNMVpnServicePluginClass;
function NM_IS_VPN_SERVICE_PLUGIN(obj: Pointer): Tgboolean;
function NM_IS_VPN_SERVICE_PLUGIN_CLASS(klass: Pointer): Tgboolean;
function NM_VPN_SERVICE_PLUGIN_GET_CLASS(obj: Pointer): PNMVpnServicePluginClass;
{$ENDIF read_function}

implementation

function NM_TYPE_VPN_SERVICE_PLUGIN: TGType;
begin
  NM_TYPE_VPN_SERVICE_PLUGIN := nm_vpn_service_plugin_get_type;
end;

function NM_VPN_SERVICE_PLUGIN(obj: Pointer): PNMVpnServicePlugin;
begin
  Result := PNMVpnServicePlugin(g_type_check_instance_cast(obj, NM_TYPE_VPN_SERVICE_PLUGIN));
end;

function NM_VPN_SERVICE_PLUGIN_CLASS(klass: Pointer): PNMVpnServicePluginClass;
begin
  Result := PNMVpnServicePluginClass(g_type_check_class_cast(klass, NM_TYPE_VPN_SERVICE_PLUGIN));
end;

function NM_IS_VPN_SERVICE_PLUGIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_VPN_SERVICE_PLUGIN);
end;

function NM_IS_VPN_SERVICE_PLUGIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_VPN_SERVICE_PLUGIN);
end;

function NM_VPN_SERVICE_PLUGIN_GET_CLASS(obj: Pointer): PNMVpnServicePluginClass;
begin
  Result := PNMVpnServicePluginClass(PGTypeInstance(obj)^.g_class);
end;



end.
