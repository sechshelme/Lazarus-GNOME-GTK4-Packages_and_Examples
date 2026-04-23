unit nm_vpn_connection;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_vpn_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_VPN_CONNECTION_VPN_STATE = 'vpn-state';
  NM_VPN_CONNECTION_BANNER = 'banner';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMVpnConnectionClass = type Pointer;
  PNMVpnConnection = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_vpn_connection_get_type: TGType; cdecl; external libnm;
function nm_vpn_connection_get_vpn_state(vpn: PNMVpnConnection): TNMVpnConnectionState; cdecl; external libnm;
function nm_vpn_connection_get_banner(vpn: PNMVpnConnection): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:20:09 ===

function NM_TYPE_VPN_CONNECTION: TGType;
function NM_VPN_CONNECTION(obj: Pointer): PNMVpnConnection;
function NM_VPN_CONNECTION_CLASS(klass: Pointer): PNMVpnConnectionClass;
function NM_IS_VPN_CONNECTION(obj: Pointer): Tgboolean;
function NM_IS_VPN_CONNECTION_CLASS(klass: Pointer): Tgboolean;
function NM_VPN_CONNECTION_GET_CLASS(obj: Pointer): PNMVpnConnectionClass;
{$ENDIF read_function}

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
