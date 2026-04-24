unit nm_device_wifi;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_WIFI_HW_ADDRESS = 'hw-address';
  NM_DEVICE_WIFI_PERMANENT_HW_ADDRESS = 'perm-hw-address';
  NM_DEVICE_WIFI_MODE = 'mode';
  NM_DEVICE_WIFI_BITRATE = 'bitrate';
  NM_DEVICE_WIFI_ACTIVE_ACCESS_POINT = 'active-access-point';
  NM_DEVICE_WIFI_CAPABILITIES = 'wireless-capabilities';
  NM_DEVICE_WIFI_ACCESS_POINTS = 'access-points';
  NM_DEVICE_WIFI_LAST_SCAN = 'last-scan';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceWifi = type Pointer;
  PNMDeviceWifiClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_wifi_get_type: TGType; cdecl; external libnm;
function nm_device_wifi_get_hw_address(device: PNMDeviceWifi): pchar; cdecl; external libnm; deprecated;
function nm_device_wifi_get_permanent_hw_address(device: PNMDeviceWifi): pchar; cdecl; external libnm;
function nm_device_wifi_get_mode(device: PNMDeviceWifi): TNM80211Mode; cdecl; external libnm;
function nm_device_wifi_get_bitrate(device: PNMDeviceWifi): Tguint32; cdecl; external libnm;
function nm_device_wifi_get_capabilities(device: PNMDeviceWifi): TNMDeviceWifiCapabilities; cdecl; external libnm;
function nm_device_wifi_get_active_access_point(device: PNMDeviceWifi): PNMAccessPoint; cdecl; external libnm;
function nm_device_wifi_get_access_point_by_path(device: PNMDeviceWifi; path: pchar): PNMAccessPoint; cdecl; external libnm;
function nm_device_wifi_get_access_points(device: PNMDeviceWifi): PGPtrArray; cdecl; external libnm;
function nm_device_wifi_get_last_scan(device: PNMDeviceWifi): Tgint64; cdecl; external libnm;
function nm_device_wifi_request_scan(device: PNMDeviceWifi; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
function nm_device_wifi_request_scan_options(device: PNMDeviceWifi; options: PGVariant; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libnm; deprecated;
procedure nm_device_wifi_request_scan_async(device: PNMDeviceWifi; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
procedure nm_device_wifi_request_scan_options_async(device: PNMDeviceWifi; options: PGVariant; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libnm;
function nm_device_wifi_request_scan_finish(device: PNMDeviceWifi; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:00 ===

function NM_TYPE_DEVICE_WIFI: TGType;
function NM_DEVICE_WIFI(obj: Pointer): PNMDeviceWifi;
function NM_DEVICE_WIFI_CLASS(klass: Pointer): PNMDeviceWifiClass;
function NM_IS_DEVICE_WIFI(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_WIFI_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_WIFI_GET_CLASS(obj: Pointer): PNMDeviceWifiClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_WIFI: TGType;
begin
  NM_TYPE_DEVICE_WIFI := nm_device_wifi_get_type;
end;

function NM_DEVICE_WIFI(obj: Pointer): PNMDeviceWifi;
begin
  Result := PNMDeviceWifi(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_WIFI));
end;

function NM_DEVICE_WIFI_CLASS(klass: Pointer): PNMDeviceWifiClass;
begin
  Result := PNMDeviceWifiClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_WIFI));
end;

function NM_IS_DEVICE_WIFI(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_WIFI);
end;

function NM_IS_DEVICE_WIFI_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_WIFI);
end;

function NM_DEVICE_WIFI_GET_CLASS(obj: Pointer): PNMDeviceWifiClass;
begin
  Result := PNMDeviceWifiClass(PGTypeInstance(obj)^.g_class);
end;



end.
