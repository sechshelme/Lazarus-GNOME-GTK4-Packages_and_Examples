unit nm_device_wifi_p2p;

interface

uses
  fp_glib2, fp_nm, nm_wifi_p2p_peer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_DEVICE_WIFI_P2P_HW_ADDRESS = 'hw-address';
  NM_DEVICE_WIFI_P2P_PEERS = 'peers';
  NM_DEVICE_WIFI_P2P_WFDIES = 'wfdies';

type
  PNMDeviceWifiP2P = type Pointer;
  PNMDeviceWifiP2PClass = type Pointer;

function nm_device_wifi_p2p_get_type: TGType; cdecl; external libnm;
function nm_device_wifi_p2p_get_hw_address(device: PNMDeviceWifiP2P): pchar; cdecl; external libnm; deprecated;
function nm_device_wifi_p2p_get_peer_by_path(device: PNMDeviceWifiP2P; path: pchar): PNMWifiP2PPeer; cdecl; external libnm;
function nm_device_wifi_p2p_get_peers(device: PNMDeviceWifiP2P): PGPtrArray; cdecl; external libnm;
procedure nm_device_wifi_p2p_start_find(device: PNMDeviceWifiP2P; options: PGVariant; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_device_wifi_p2p_start_find_finish(device: PNMDeviceWifiP2P; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;
procedure nm_device_wifi_p2p_stop_find(device: PNMDeviceWifiP2P; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_device_wifi_p2p_stop_find_finish(device: PNMDeviceWifiP2P; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:25:42 ===

function NM_TYPE_DEVICE_WIFI_P2P: TGType;
function NM_DEVICE_WIFI_P2P(obj: Pointer): PNMDeviceWifiP2P;
function NM_DEVICE_WIFI_P2P_CLASS(klass: Pointer): PNMDeviceWifiP2PClass;
function NM_IS_DEVICE_WIFI_P2P(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_WIFI_P2P_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_WIFI_P2P_GET_CLASS(obj: Pointer): PNMDeviceWifiP2PClass;

implementation

function NM_TYPE_DEVICE_WIFI_P2P: TGType;
begin
  NM_TYPE_DEVICE_WIFI_P2P := nm_device_wifi_p2p_get_type;
end;

function NM_DEVICE_WIFI_P2P(obj: Pointer): PNMDeviceWifiP2P;
begin
  Result := PNMDeviceWifiP2P(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_WIFI_P2P));
end;

function NM_DEVICE_WIFI_P2P_CLASS(klass: Pointer): PNMDeviceWifiP2PClass;
begin
  Result := PNMDeviceWifiP2PClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_WIFI_P2P));
end;

function NM_IS_DEVICE_WIFI_P2P(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_WIFI_P2P);
end;

function NM_IS_DEVICE_WIFI_P2P_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_WIFI_P2P);
end;

function NM_DEVICE_WIFI_P2P_GET_CLASS(obj: Pointer): PNMDeviceWifiP2PClass;
begin
  Result := PNMDeviceWifiP2PClass(PGTypeInstance(obj)^.g_class);
end;



end.
