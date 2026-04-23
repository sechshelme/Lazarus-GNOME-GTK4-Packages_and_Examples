unit nm_vpn_plugin_old;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_VPN_PLUGIN_OLD_DBUS_SERVICE_NAME = 'service-name';
  NM_VPN_PLUGIN_OLD_STATE = 'state';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TNMVpnPluginOld = record
    parent: TGObject;
  end;
  PNMVpnPluginOld = ^TNMVpnPluginOld;

  TNMVpnPluginOldClass = record
    parent: TGObjectClass;
    state_changed: procedure(plugin: PNMVpnPluginOld; state: TNMVpnServiceState); cdecl;
    ip4_config: procedure(plugin: PNMVpnPluginOld; ip4_config: PGVariant); cdecl;
    login_banner: procedure(plugin: PNMVpnPluginOld; banner: pchar); cdecl;
    failure: procedure(plugin: PNMVpnPluginOld; reason: TNMVpnPluginFailure); cdecl;
    quit: procedure(plugin: PNMVpnPluginOld); cdecl;
    config: procedure(plugin: PNMVpnPluginOld; config: PGVariant); cdecl;
    ip6_config: procedure(plugin: PNMVpnPluginOld; config: PGVariant); cdecl;
    connect: function(plugin: PNMVpnPluginOld; connection: PNMConnection; err: PPGError): Tgboolean; cdecl;
    need_secrets: function(plugin: PNMVpnPluginOld; connection: PNMConnection; setting_name: PPchar; error: PPGError): Tgboolean; cdecl;
    disconnect: function(plugin: PNMVpnPluginOld; err: PPGError): Tgboolean; cdecl;
    new_secrets: function(plugin: PNMVpnPluginOld; connection: PNMConnection; error: PPGError): Tgboolean; cdecl;
    connect_interactive: function(plugin: PNMVpnPluginOld; connection: PNMConnection; details: PGVariant; error: PPGError): Tgboolean; cdecl;
    padding: array[0..7] of Tgpointer;
  end;
  PNMVpnPluginOldClass = ^TNMVpnPluginOldClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_vpn_plugin_old_get_type: TGType; cdecl; external libnm;
function nm_vpn_plugin_old_get_connection(plugin: PNMVpnPluginOld): PGDBusConnection; cdecl; external libnm; deprecated;
function nm_vpn_plugin_old_get_state(plugin: PNMVpnPluginOld): TNMVpnServiceState; cdecl; external libnm; deprecated;
procedure nm_vpn_plugin_old_set_state(plugin: PNMVpnPluginOld; state: TNMVpnServiceState); cdecl; external libnm; deprecated;
procedure nm_vpn_plugin_old_secrets_required(plugin: PNMVpnPluginOld; message: pchar; hints: PPchar); cdecl; external libnm; deprecated;
procedure nm_vpn_plugin_old_set_login_banner(plugin: PNMVpnPluginOld; banner: pchar); cdecl; external libnm; deprecated;
procedure nm_vpn_plugin_old_failure(plugin: PNMVpnPluginOld; reason: TNMVpnPluginFailure); cdecl; external libnm; deprecated;
procedure nm_vpn_plugin_old_set_ip4_config(plugin: PNMVpnPluginOld; ip4_config: PGVariant); cdecl; external libnm; deprecated;
function nm_vpn_plugin_old_disconnect(plugin: PNMVpnPluginOld; err: PPGError): Tgboolean; cdecl; external libnm; deprecated;
function nm_vpn_plugin_old_read_vpn_details(fd: longint; out_data: PPGHashTable; out_secrets: PPGHashTable): Tgboolean; cdecl; external libnm; deprecated;
function nm_vpn_plugin_old_get_secret_flags(data: PGHashTable; secret_name: pchar; out_flags: PNMSettingSecretFlags): Tgboolean; cdecl; external libnm; deprecated;

// === Konventiert am: 19-4-26 19:18:58 ===

function NM_TYPE_VPN_PLUGIN_OLD: TGType;
function NM_VPN_PLUGIN_OLD(obj: Pointer): PNMVpnPluginOld;
function NM_VPN_PLUGIN_OLD_CLASS(klass: Pointer): PNMVpnPluginOldClass;
function NM_IS_VPN_PLUGIN_OLD(obj: Pointer): Tgboolean;
function NM_IS_VPN_PLUGIN_OLD_CLASS(klass: Pointer): Tgboolean;
function NM_VPN_PLUGIN_OLD_GET_CLASS(obj: Pointer): PNMVpnPluginOldClass;
{$ENDIF read_function}

implementation

function NM_TYPE_VPN_PLUGIN_OLD: TGType;
begin
  NM_TYPE_VPN_PLUGIN_OLD := nm_vpn_plugin_old_get_type;
end;

function NM_VPN_PLUGIN_OLD(obj: Pointer): PNMVpnPluginOld;
begin
  Result := PNMVpnPluginOld(g_type_check_instance_cast(obj, NM_TYPE_VPN_PLUGIN_OLD));
end;

function NM_VPN_PLUGIN_OLD_CLASS(klass: Pointer): PNMVpnPluginOldClass;
begin
  Result := PNMVpnPluginOldClass(g_type_check_class_cast(klass, NM_TYPE_VPN_PLUGIN_OLD));
end;

function NM_IS_VPN_PLUGIN_OLD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_VPN_PLUGIN_OLD);
end;

function NM_IS_VPN_PLUGIN_OLD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_VPN_PLUGIN_OLD);
end;

function NM_VPN_PLUGIN_OLD_GET_CLASS(obj: Pointer): PNMVpnPluginOldClass;
begin
  Result := PNMVpnPluginOldClass(PGTypeInstance(obj)^.g_class);
end;



end.
