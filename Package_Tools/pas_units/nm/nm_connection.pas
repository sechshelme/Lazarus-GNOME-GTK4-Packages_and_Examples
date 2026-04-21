unit nm_connection;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2018 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_CONNECTION_H__}
{$define __NM_CONNECTION_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-core-types.h"}
{$include "nm-setting.h"}

{ Signals  }
const
  NM_CONNECTION_SECRETS_UPDATED = 'secrets-updated';  
  NM_CONNECTION_SECRETS_CLEARED = 'secrets-cleared';  
  NM_CONNECTION_CHANGED = 'changed';  
{
 * NM_CONNECTION_NORMALIZE_PARAM_IP4_CONFIG_METHOD: overwrite the ip4 method
 * when normalizing ip4 configuration. This only takes effect, if the profile
 * has no IPv4 settings and new settings are to be added. If omitted, this
 * defaults depends on the profile type but usually it is "auto".
 *
 * Since: 1.34
  }
  NM_CONNECTION_NORMALIZE_PARAM_IP4_CONFIG_METHOD = 'ip4-config-method';  
{
 * NM_CONNECTION_NORMALIZE_PARAM_IP6_CONFIG_METHOD: overwrite the ip6 method
 * when normalizing ip6 configuration. This only takes effect, if the profile
 * has no IPv6 settings and new settings are to be added. If omitted, this
 * defaults depends on the profile type but usually it is "auto".
  }
  NM_CONNECTION_NORMALIZE_PARAM_IP6_CONFIG_METHOD = 'ip6-config-method';  
{*
 * NMConnection:
 *
 * NMConnection is the interface implemented by #NMRemoteConnection on the
 * client side, and #NMSettingsConnection on the daemon side.
  }
{*
 * NMConnectionInterface:
 * @parent: the parent interface struct
 * @secrets_updated: emitted when the connection's secrets are updated
 * @secrets_cleared: emitted when the connection's secrets are cleared
 * @changed: emitted when any change to the connection's settings occurs
  }
{ Signals  }
type
  PNMConnectionInterface = ^TNMConnectionInterface;
  TNMConnectionInterface = record
      parent : TGTypeInterface;
      secrets_updated : procedure (connection:PNMConnection; setting:Pchar);cdecl;
      secrets_cleared : procedure (connection:PNMConnection);cdecl;
      changed : procedure (connection:PNMConnection);cdecl;
    end;

function nm_connection_get_type:TGType;cdecl;external libnm;
procedure nm_connection_add_setting(connection:PNMConnection; setting:PNMSetting);cdecl;external libnm;
procedure nm_connection_remove_setting(connection:PNMConnection; setting_type:TGType);cdecl;external libnm;
function nm_connection_get_setting(connection:PNMConnection; setting_type:TGType):PNMSetting;cdecl;external libnm;
function nm_connection_get_setting_by_name(connection:PNMConnection; name:Pchar):PNMSetting;cdecl;external libnm;
{*
 * NM_VARIANT_TYPE_CONNECTION:
 *
 * #GVariantType for a dictionary mapping from setting names to
 * %NM_VARIANT_TYPE_SETTING variants. This is used to represent an
 * #NMConnection, and is the type taken by nm_simple_connection_new_from_dbus()
 * and returned from nm_connection_to_dbus().
  }
{ was #define dname def_expr }
function NM_VARIANT_TYPE_CONNECTION : longint; { return type might be wrong }

{*
 * NM_VARIANT_TYPE_SETTING:
 *
 * #GVariantType for a dictionary mapping from property names to values. This is
 * an alias for %G_VARIANT_TYPE_VARDICT, and is the type of each element of
 * an %NM_VARIANT_TYPE_CONNECTION dictionary.
  }
const
  NM_VARIANT_TYPE_SETTING = G_VARIANT_TYPE_VARDICT;  
{*
 * NMConnectionSerializationFlags:
 * @NM_CONNECTION_SERIALIZE_ALL: serialize all properties (including secrets)
 * @NM_CONNECTION_SERIALIZE_WITH_NON_SECRET: serialize properties that are
 *   not secrets. Since 1.32.
 * @NM_CONNECTION_SERIALIZE_NO_SECRETS: this is a deprecated alias for
 *   @NM_CONNECTION_SERIALIZE_WITH_NON_SECRET.
 * @NM_CONNECTION_SERIALIZE_WITH_SECRETS: serialize all secrets. This flag is
 *   ignored if any of @NM_CONNECTION_SERIALIZE_WITH_SECRETS_AGENT_OWNED,
 *   @NM_CONNECTION_SERIALIZE_WITH_SECRETS_SYSTEM_OWNED or
 *   @NM_CONNECTION_SERIALIZE_WITH_SECRETS_NOT_SAVED is set. Since 1.32.
 * @NM_CONNECTION_SERIALIZE_ONLY_SECRETS: a deprecated alias for
 *   @NM_CONNECTION_SERIALIZE_WITH_SECRETS.
 * @NM_CONNECTION_SERIALIZE_WITH_SECRETS_AGENT_OWNED: serialize agent-owned
 *   secrets. Since: 1.20.
 * @NM_CONNECTION_SERIALIZE_WITH_SECRETS_SYSTEM_OWNED: serialize system-owned
 *   secrets. Since: 1.32.
 * @NM_CONNECTION_SERIALIZE_WITH_SECRETS_NOT_SAVED: serialize secrets that
 *   are marked as never saved. Since: 1.32.
 *
 * These flags determine which properties are serialized when calling
 * nm_connection_to_dbus().
 * }
{< flags > }type
  PNMConnectionSerializationFlags = ^TNMConnectionSerializationFlags;
  TNMConnectionSerializationFlags =  Longint;
  Const
    NM_CONNECTION_SERIALIZE_ALL = $00000000;
    NM_CONNECTION_SERIALIZE_WITH_NON_SECRET = $00000001;
    NM_CONNECTION_SERIALIZE_NO_SECRETS = $00000001;
    NM_CONNECTION_SERIALIZE_WITH_SECRETS = $00000002;
    NM_CONNECTION_SERIALIZE_ONLY_SECRETS = $00000002;
    NM_CONNECTION_SERIALIZE_WITH_SECRETS_AGENT_OWNED = $00000004;
    NM_CONNECTION_SERIALIZE_WITH_SECRETS_SYSTEM_OWNED = $00000008;
    NM_CONNECTION_SERIALIZE_WITH_SECRETS_NOT_SAVED = $00000010;
;

function nm_connection_to_dbus(connection:PNMConnection; flags:TNMConnectionSerializationFlags):PGVariant;cdecl;external libnm;
function nm_connection_replace_settings(connection:PNMConnection; new_settings:PGVariant; error:PPGError):Tgboolean;cdecl;external libnm;
procedure nm_connection_replace_settings_from_connection(connection:PNMConnection; new_connection:PNMConnection);cdecl;external libnm;
procedure nm_connection_clear_settings(connection:PNMConnection);cdecl;external libnm;
function nm_connection_compare(a:PNMConnection; b:PNMConnection; flags:TNMSettingCompareFlags):Tgboolean;cdecl;external libnm;
function nm_connection_diff(a:PNMConnection; b:PNMConnection; flags:TNMSettingCompareFlags; out_settings:PPGHashTable):Tgboolean;cdecl;external libnm;
function nm_connection_verify(connection:PNMConnection; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_connection_verify_secrets(connection:PNMConnection; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_connection_normalize(connection:PNMConnection; parameters:PGHashTable; modified:Pgboolean; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_connection_need_secrets(connection:PNMConnection; hints:PPGPtrArray):Pchar;cdecl;external libnm;
procedure nm_connection_clear_secrets(connection:PNMConnection);cdecl;external libnm;
procedure nm_connection_clear_secrets_with_flags(connection:PNMConnection; func:TNMSettingClearSecretsWithFlagsFn; user_data:Tgpointer);cdecl;external libnm;
function nm_connection_update_secrets(connection:PNMConnection; setting_name:Pchar; secrets:PGVariant; error:PPGError):Tgboolean;cdecl;external libnm;
procedure nm_connection_set_path(connection:PNMConnection; path:Pchar);cdecl;external libnm;
function nm_connection_get_path(connection:PNMConnection):Pchar;cdecl;external libnm;
function nm_connection_get_interface_name(connection:PNMConnection):Pchar;cdecl;external libnm;
function nm_connection_is_type(connection:PNMConnection; _type:Pchar):Tgboolean;cdecl;external libnm;
procedure nm_connection_for_each_setting_value(connection:PNMConnection; func:TNMSettingValueIterFn; user_data:Tgpointer);cdecl;external libnm;
function nm_connection_get_settings(connection:PNMConnection; out_length:Pguint):^PNMSetting;cdecl;external libnm;
procedure nm_connection_dump(connection:PNMConnection);cdecl;external libnm;
{ Helpers  }
function nm_connection_get_uuid(connection:PNMConnection):Pchar;cdecl;external libnm;
function nm_connection_get_id(connection:PNMConnection):Pchar;cdecl;external libnm;
function nm_connection_get_connection_type(connection:PNMConnection):Pchar;cdecl;external libnm;
function nm_connection_is_virtual(connection:PNMConnection):Tgboolean;cdecl;external libnm;
function nm_connection_get_virtual_device_description(connection:PNMConnection):Pchar;cdecl;external libnm;
function nm_connection_get_setting_802_1x(connection:PNMConnection):PNMSetting8021x;cdecl;external libnm;
function nm_connection_get_setting_bluetooth(connection:PNMConnection):PNMSettingBluetooth;cdecl;external libnm;
function nm_connection_get_setting_bond(connection:PNMConnection):PNMSettingBond;cdecl;external libnm;
function nm_connection_get_setting_team(connection:PNMConnection):PNMSettingTeam;cdecl;external libnm;
function nm_connection_get_setting_team_port(connection:PNMConnection):PNMSettingTeamPort;cdecl;external libnm;
function nm_connection_get_setting_bridge(connection:PNMConnection):PNMSettingBridge;cdecl;external libnm;
function nm_connection_get_setting_bridge_port(connection:PNMConnection):PNMSettingBridgePort;cdecl;external libnm;
function nm_connection_get_setting_cdma(connection:PNMConnection):PNMSettingCdma;cdecl;external libnm;
function nm_connection_get_setting_connection(connection:PNMConnection):PNMSettingConnection;cdecl;external libnm;
function nm_connection_get_setting_dcb(connection:PNMConnection):PNMSettingDcb;cdecl;external libnm;
function nm_connection_get_setting_dummy(connection:PNMConnection):PNMSettingDummy;cdecl;external libnm;
function nm_connection_get_setting_generic(connection:PNMConnection):PNMSettingGeneric;cdecl;external libnm;
function nm_connection_get_setting_gsm(connection:PNMConnection):PNMSettingGsm;cdecl;external libnm;
function nm_connection_get_setting_infiniband(connection:PNMConnection):PNMSettingInfiniband;cdecl;external libnm;
function nm_connection_get_setting_ip_tunnel(connection:PNMConnection):PNMSettingIPTunnel;cdecl;external libnm;
function nm_connection_get_setting_ip4_config(connection:PNMConnection):PNMSettingIPConfig;cdecl;external libnm;
function nm_connection_get_setting_ip6_config(connection:PNMConnection):PNMSettingIPConfig;cdecl;external libnm;
function nm_connection_get_setting_macsec(connection:PNMConnection):PNMSettingMacsec;cdecl;external libnm;
function nm_connection_get_setting_macvlan(connection:PNMConnection):PNMSettingMacvlan;cdecl;external libnm;
function nm_connection_get_setting_olpc_mesh(connection:PNMConnection):PNMSettingOlpcMesh;cdecl;external libnm;
function nm_connection_get_setting_ovs_bridge(connection:PNMConnection):PNMSettingOvsBridge;cdecl;external libnm;
function nm_connection_get_setting_ovs_interface(connection:PNMConnection):PNMSettingOvsInterface;cdecl;external libnm;
function nm_connection_get_setting_ovs_patch(connection:PNMConnection):PNMSettingOvsPatch;cdecl;external libnm;
function nm_connection_get_setting_ovs_port(connection:PNMConnection):PNMSettingOvsPort;cdecl;external libnm;
function nm_connection_get_setting_ppp(connection:PNMConnection):PNMSettingPpp;cdecl;external libnm;
function nm_connection_get_setting_pppoe(connection:PNMConnection):PNMSettingPppoe;cdecl;external libnm;
function nm_connection_get_setting_proxy(connection:PNMConnection):PNMSettingProxy;cdecl;external libnm;
function nm_connection_get_setting_serial(connection:PNMConnection):PNMSettingSerial;cdecl;external libnm;
function nm_connection_get_setting_tc_config(connection:PNMConnection):PNMSettingTCConfig;cdecl;external libnm;
function nm_connection_get_setting_tun(connection:PNMConnection):PNMSettingTun;cdecl;external libnm;
function nm_connection_get_setting_vpn(connection:PNMConnection):PNMSettingVpn;cdecl;external libnm;
function nm_connection_get_setting_wimax(connection:PNMConnection):PNMSettingWimax;cdecl;external libnm;
function nm_connection_get_setting_adsl(connection:PNMConnection):PNMSettingAdsl;cdecl;external libnm;
function nm_connection_get_setting_wired(connection:PNMConnection):PNMSettingWired;cdecl;external libnm;
function nm_connection_get_setting_wireless(connection:PNMConnection):PNMSettingWireless;cdecl;external libnm;
function nm_connection_get_setting_wireless_security(connection:PNMConnection):PNMSettingWirelessSecurity;cdecl;external libnm;
function nm_connection_get_setting_vlan(connection:PNMConnection):PNMSettingVlan;cdecl;external libnm;
function nm_connection_get_setting_vxlan(connection:PNMConnection):PNMSettingVxlan;cdecl;external libnm;
{$endif}
{ __NM_CONNECTION_H__  }

// === Konventiert am: 19-4-26 19:33:20 ===

function NM_TYPE_CONNECTION : TGType;
function NM_CONNECTION(obj : Pointer) : PNMConnection;
function NM_IS_CONNECTION(obj : Pointer) : Tgboolean;
function NM_CONNECTION_GET_INTERFACE(obj : Pointer) : PNMConnectionClass;

implementation

function NM_TYPE_CONNECTION : TGType;
  begin
    NM_TYPE_CONNECTION:=nm_connection_get_type;
  end;

function NM_CONNECTION(obj : Pointer) : PNMConnection;
begin
  Result := PNMConnection(g_type_check_instance_cast(obj, NM_TYPE_CONNECTION));
end;

function NM_IS_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_CONNECTION);
end;

function NM_CONNECTION_GET_INTERFACE(obj : Pointer) : PNMConnectionClass;
begin
  Result := g_type_interface_peek(obj, NM_TYPE_CONNECTION);
end;


{ was #define dname def_expr }
function NM_VARIANT_TYPE_CONNECTION : longint; { return type might be wrong }
  begin
    NM_VARIANT_TYPE_CONNECTION:=G_VARIANT_TYPE('a{sa{sv}}');
  end;


end.
