unit nm_vpn_connection;

interface

uses
  fp_glib2, fp_nm, nm_vpn_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_VPN_CONNECTION_VPN_STATE = 'vpn-state';
  NM_VPN_CONNECTION_BANNER = 'banner';

type
  PNMVpnConnection = type Pointer;
  PNMVpnConnectionClass = type Pointer;

function nm_vpn_connection_get_type: TGType; cdecl; external libnm;
function nm_vpn_connection_get_vpn_state(vpn: PNMVpnConnection): TNMVpnConnectionState; cdecl; external libnm;
function nm_vpn_connection_get_banner(vpn: PNMVpnConnection): pchar; cdecl; external libnm;

// === Konventiert am: 5-8-26 20:08:49 ===

function NM_TYPE_VPN_CONNECTION: TGType;
function NM_VPN_CONNECTION(obj: Pointer): PNMVpnConnection;
function NM_VPN_CONNECTION_CLASS(klass: Pointer): PNMVpnConnectionClass;
function NM_IS_VPN_CONNECTION(obj: Pointer): Tgboolean;
function NM_IS_VPN_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function NM_VPN_CONNECTION_GET_CLASS(obj: Pointer): PNMVpnConnectionClass;

implementation

function NM_TYPE_VPN_CONNECTION: TGType;
begin
  NM_TYPE_VPN_CONNECTION := nm_vpn_connection_get_type;
end;

function NM_VPN_CONNECTION(obj: Pointer): PNMVpnConnection;
begin
  Result := PNMVpnConnection(g_type_check_instance_cast(obj, NM_TYPE_VPN_CONNECTION));
end;

function NM_VPN_CONNECTION_CLASS(klass: Pointer): PNMVpnConnectionClass;
begin
  Result := PNMVpnConnectionClass(g_type_check_class_cast(klass, NM_TYPE_VPN_CONNECTION));
end;

function NM_IS_VPN_CONNECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_VPN_CONNECTION);
end;

function NM_IS_VPN_CONNECTION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_VPN_CONNECTION);
end;

function NM_VPN_CONNECTION_GET_CLASS(obj: Pointer): PNMVpnConnectionClass;
begin
  Result := PNMVpnConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
