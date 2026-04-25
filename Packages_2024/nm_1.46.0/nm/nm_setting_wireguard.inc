
  {$IFDEF read_enum}
const
  NM_WIREGUARD_PUBLIC_KEY_LEN = 32;
  NM_WIREGUARD_SYMMETRIC_KEY_LEN = 32;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMWireGuardPeer = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_wireguard_peer_get_type: TGType; cdecl; external libnm;
function nm_wireguard_peer_new: PNMWireGuardPeer; cdecl; external libnm;
function nm_wireguard_peer_new_clone(self: PNMWireGuardPeer; with_secrets: Tgboolean): PNMWireGuardPeer; cdecl; external libnm;
function nm_wireguard_peer_ref(self: PNMWireGuardPeer): PNMWireGuardPeer; cdecl; external libnm;
procedure nm_wireguard_peer_unref(self: PNMWireGuardPeer); cdecl; external libnm;
procedure nm_wireguard_peer_seal(self: PNMWireGuardPeer); cdecl; external libnm;
function nm_wireguard_peer_is_sealed(self: PNMWireGuardPeer): Tgboolean; cdecl; external libnm;
function nm_wireguard_peer_get_public_key(self: PNMWireGuardPeer): pchar; cdecl; external libnm;
function nm_wireguard_peer_set_public_key(self: PNMWireGuardPeer; public_key: pchar; accept_invalid: Tgboolean): Tgboolean; cdecl; external libnm;
function nm_wireguard_peer_get_preshared_key(self: PNMWireGuardPeer): pchar; cdecl; external libnm;
function nm_wireguard_peer_set_preshared_key(self: PNMWireGuardPeer; preshared_key: pchar; accept_invalid: Tgboolean): Tgboolean; cdecl; external libnm;
function nm_wireguard_peer_get_preshared_key_flags(self: PNMWireGuardPeer): TNMSettingSecretFlags; cdecl; external libnm;
procedure nm_wireguard_peer_set_preshared_key_flags(self: PNMWireGuardPeer; preshared_key_flags: TNMSettingSecretFlags); cdecl; external libnm;
function nm_wireguard_peer_get_persistent_keepalive(self: PNMWireGuardPeer): Tguint16; cdecl; external libnm;
procedure nm_wireguard_peer_set_persistent_keepalive(self: PNMWireGuardPeer; persistent_keepalive: Tguint16); cdecl; external libnm;
function nm_wireguard_peer_get_endpoint(self: PNMWireGuardPeer): pchar; cdecl; external libnm;
function nm_wireguard_peer_set_endpoint(self: PNMWireGuardPeer; endpoint: pchar; allow_invalid: Tgboolean): Tgboolean; cdecl; external libnm;
function nm_wireguard_peer_get_allowed_ips_len(self: PNMWireGuardPeer): Tguint; cdecl; external libnm;
function nm_wireguard_peer_get_allowed_ip(self: PNMWireGuardPeer; idx: Tguint; out_is_valid: Pgboolean): pchar; cdecl; external libnm;
procedure nm_wireguard_peer_clear_allowed_ips(self: PNMWireGuardPeer); cdecl; external libnm;
function nm_wireguard_peer_append_allowed_ip(self: PNMWireGuardPeer; allowed_ip: pchar; accept_invalid: Tgboolean): Tgboolean; cdecl; external libnm;
function nm_wireguard_peer_remove_allowed_ip(self: PNMWireGuardPeer; idx: Tguint): Tgboolean; cdecl; external libnm;
function nm_wireguard_peer_is_valid(self: PNMWireGuardPeer; check_non_secrets: Tgboolean; check_secrets: Tgboolean; error: PPGError): Tgboolean; cdecl; external libnm;
function nm_wireguard_peer_cmp(a: PNMWireGuardPeer; b: PNMWireGuardPeer; compare_flags: TNMSettingCompareFlags): longint; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  NM_SETTING_WIREGUARD_SETTING_NAME = 'wireguard';
  NM_SETTING_WIREGUARD_FWMARK = 'fwmark';
  NM_SETTING_WIREGUARD_LISTEN_PORT = 'listen-port';
  NM_SETTING_WIREGUARD_PRIVATE_KEY = 'private-key';
  NM_SETTING_WIREGUARD_PRIVATE_KEY_FLAGS = 'private-key-flags';
  NM_SETTING_WIREGUARD_PEERS = 'peers';
  NM_SETTING_WIREGUARD_MTU = 'mtu';
  NM_SETTING_WIREGUARD_PEER_ROUTES = 'peer-routes';
  NM_SETTING_WIREGUARD_IP4_AUTO_DEFAULT_ROUTE = 'ip4-auto-default-route';
  NM_SETTING_WIREGUARD_IP6_AUTO_DEFAULT_ROUTE = 'ip6-auto-default-route';
  NM_WIREGUARD_PEER_ATTR_ALLOWED_IPS = 'allowed-ips';
  NM_WIREGUARD_PEER_ATTR_ENDPOINT = 'endpoint';
  NM_WIREGUARD_PEER_ATTR_PERSISTENT_KEEPALIVE = 'persistent-keepalive';
  NM_WIREGUARD_PEER_ATTR_PRESHARED_KEY = 'preshared-key';
  NM_WIREGUARD_PEER_ATTR_PRESHARED_KEY_FLAGS = 'preshared-key-flags';
  NM_WIREGUARD_PEER_ATTR_PUBLIC_KEY = 'public-key';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingWireGuardClass = type Pointer;
  PNMSettingWireGuard = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_wireguard_get_type: TGType; cdecl; external libnm;
function nm_setting_wireguard_new: PNMSetting; cdecl; external libnm;

function nm_setting_wireguard_get_private_key(self: PNMSettingWireGuard): pchar; cdecl; external libnm;
function nm_setting_wireguard_get_private_key_flags(self: PNMSettingWireGuard): TNMSettingSecretFlags; cdecl; external libnm;
function nm_setting_wireguard_get_listen_port(self: PNMSettingWireGuard): Tguint16; cdecl; external libnm;
function nm_setting_wireguard_get_fwmark(self: PNMSettingWireGuard): Tguint32; cdecl; external libnm;

function nm_setting_wireguard_get_peers_len(self: PNMSettingWireGuard): Tguint; cdecl; external libnm;
function nm_setting_wireguard_get_peer(self: PNMSettingWireGuard; idx: Tguint): PNMWireGuardPeer; cdecl; external libnm;
function nm_setting_wireguard_get_peer_by_public_key(self: PNMSettingWireGuard; public_key: pchar; out_idx: Pguint): PNMWireGuardPeer; cdecl; external libnm;
procedure nm_setting_wireguard_set_peer(self: PNMSettingWireGuard; peer: PNMWireGuardPeer; idx: Tguint); cdecl; external libnm;
procedure nm_setting_wireguard_append_peer(self: PNMSettingWireGuard; peer: PNMWireGuardPeer); cdecl; external libnm;
function nm_setting_wireguard_remove_peer(self: PNMSettingWireGuard; idx: Tguint): Tgboolean; cdecl; external libnm;
function nm_setting_wireguard_clear_peers(self: PNMSettingWireGuard): Tguint; cdecl; external libnm;
function nm_setting_wireguard_get_peer_routes(self: PNMSettingWireGuard): Tgboolean; cdecl; external libnm;
function nm_setting_wireguard_get_mtu(self: PNMSettingWireGuard): Tguint32; cdecl; external libnm;
function nm_setting_wireguard_get_ip4_auto_default_route(self: PNMSettingWireGuard): TNMTernary; cdecl; external libnm;
function nm_setting_wireguard_get_ip6_auto_default_route(self: PNMSettingWireGuard): TNMTernary; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:21:06 ===

function NM_TYPE_SETTING_WIREGUARD: TGType;
function NM_SETTING_WIREGUARD(obj: Pointer): PNMSettingWireGuard;
function NM_SETTING_WIREGUARD_CLASS(klass: Pointer): PNMSettingWireGuardClass;
function NM_IS_SETTING_WIREGUARD(obj: Pointer): Tgboolean;
function NM_IS_SETTING_WIREGUARD_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_WIREGUARD_GET_CLASS(obj: Pointer): PNMSettingWireGuardClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_WIREGUARD: TGType;
begin
  NM_TYPE_SETTING_WIREGUARD := nm_setting_wireguard_get_type;
end;

function NM_SETTING_WIREGUARD(obj: Pointer): PNMSettingWireGuard;
begin
  Result := PNMSettingWireGuard(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WIREGUARD));
end;

function NM_SETTING_WIREGUARD_CLASS(klass: Pointer): PNMSettingWireGuardClass;
begin
  Result := PNMSettingWireGuardClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WIREGUARD));
end;

function NM_IS_SETTING_WIREGUARD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_WIREGUARD);
end;

function NM_IS_SETTING_WIREGUARD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_WIREGUARD);
end;

function NM_SETTING_WIREGUARD_GET_CLASS(obj: Pointer): PNMSettingWireGuardClass;
begin
  Result := PNMSettingWireGuardClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
