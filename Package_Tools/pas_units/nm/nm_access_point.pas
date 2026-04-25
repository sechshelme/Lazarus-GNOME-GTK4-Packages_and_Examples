unit nm_access_point;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm,nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_ACCESS_POINT_FLAGS = 'flags';
  NM_ACCESS_POINT_WPA_FLAGS = 'wpa-flags';
  NM_ACCESS_POINT_RSN_FLAGS = 'rsn-flags';
  NM_ACCESS_POINT_SSID = 'ssid';
  NM_ACCESS_POINT_BSSID = 'bssid';
  NM_ACCESS_POINT_FREQUENCY = 'frequency';
  NM_ACCESS_POINT_MODE = 'mode';
  NM_ACCESS_POINT_MAX_BITRATE = 'max-bitrate';
  NM_ACCESS_POINT_STRENGTH = 'strength';
  NM_ACCESS_POINT_LAST_SEEN = 'last-seen';
  NM_ACCESS_POINT_BANDWIDTH = 'bandwidth';
  NM_ACCESS_POINT_HW_ADDRESS = 'hw-address';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMAccessPoint = type Pointer;
  PNMAccessPointClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_access_point_get_type: TGType; cdecl; external libnm;
function nm_access_point_get_flags(ap: PNMAccessPoint): TNM80211ApFlags; cdecl; external libnm;
function nm_access_point_get_wpa_flags(ap: PNMAccessPoint): TNM80211ApSecurityFlags; cdecl; external libnm;
function nm_access_point_get_rsn_flags(ap: PNMAccessPoint): TNM80211ApSecurityFlags; cdecl; external libnm;
function nm_access_point_get_ssid(ap: PNMAccessPoint): PGBytes; cdecl; external libnm;
function nm_access_point_get_bssid(ap: PNMAccessPoint): pchar; cdecl; external libnm;
function nm_access_point_get_frequency(ap: PNMAccessPoint): Tguint32; cdecl; external libnm;
function nm_access_point_get_mode(ap: PNMAccessPoint): TNM80211Mode; cdecl; external libnm;
function nm_access_point_get_max_bitrate(ap: PNMAccessPoint): Tguint32; cdecl; external libnm;
function nm_access_point_get_strength(ap: PNMAccessPoint): Tguint8; cdecl; external libnm;
function nm_access_point_get_last_seen(ap: PNMAccessPoint): longint; cdecl; external libnm;
function nm_access_point_get_bandwidth(ap: PNMAccessPoint): Tguint32; cdecl; external libnm;
function nm_access_point_filter_connections(ap: PNMAccessPoint; connections: PGPtrArray): PGPtrArray; cdecl; external libnm;
function nm_access_point_connection_valid(ap: PNMAccessPoint; connection: PNMConnection): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:34:40 ===

function NM_TYPE_ACCESS_POINT: TGType;
function NM_ACCESS_POINT(obj: Pointer): PNMAccessPoint;
function NM_ACCESS_POINT_CLASS(klass: Pointer): PNMAccessPointClass;
function NM_IS_ACCESS_POINT(obj: Pointer): Tgboolean;
function NM_IS_ACCESS_POINT_CLASS(klass: Pointer): Tgboolean;
function NM_ACCESS_POINT_GET_CLASS(obj: Pointer): PNMAccessPointClass;
{$ENDIF read_function}

implementation

function NM_TYPE_ACCESS_POINT: TGType;
begin
  NM_TYPE_ACCESS_POINT := nm_access_point_get_type;
end;

function NM_ACCESS_POINT(obj: Pointer): PNMAccessPoint;
begin
  Result := PNMAccessPoint(g_type_check_instance_cast(obj, NM_TYPE_ACCESS_POINT));
end;

function NM_ACCESS_POINT_CLASS(klass: Pointer): PNMAccessPointClass;
begin
  Result := PNMAccessPointClass(g_type_check_class_cast(klass, NM_TYPE_ACCESS_POINT));
end;

function NM_IS_ACCESS_POINT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_ACCESS_POINT);
end;

function NM_IS_ACCESS_POINT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_ACCESS_POINT);
end;

function NM_ACCESS_POINT_GET_CLASS(obj: Pointer): PNMAccessPointClass;
begin
  Result := PNMAccessPointClass(PGTypeInstance(obj)^.g_class);
end;



end.
