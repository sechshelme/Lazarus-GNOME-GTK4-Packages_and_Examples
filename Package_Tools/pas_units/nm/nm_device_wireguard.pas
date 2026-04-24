unit nm_device_wireguard;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PNMDeviceWireGuard = type Pointer;
  PNMDeviceWireGuardClass = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  NM_DEVICE_WIREGUARD_PUBLIC_KEY = 'public-key';
  NM_DEVICE_WIREGUARD_LISTEN_PORT = 'listen-port';
  NM_DEVICE_WIREGUARD_FWMARK = 'fwmark';
  {$ENDIF read_enum}

{$IFDEF read_function}
function nm_device_wireguard_get_type: TGType; cdecl; external libnm;
function nm_device_wireguard_get_public_key(device: PNMDeviceWireGuard): PGBytes; cdecl; external libnm;
function nm_device_wireguard_get_listen_port(device: PNMDeviceWireGuard): Tguint16; cdecl; external libnm;
function nm_device_wireguard_get_fwmark(device: PNMDeviceWireGuard): Tguint32; cdecl; external libnm;
{$ENDIF read_function}

// === Konventiert am: 19-4-26 19:29:48 ===

function NM_TYPE_DEVICE_WIREGUARD: TGType;
function NM_DEVICE_WIREGUARD(obj: Pointer): PNMDeviceWireGuard;
function NM_DEVICE_WIREGUARD_CLASS(klass: Pointer): PNMDeviceWireGuardClass;
function NM_IS_DEVICE_WIREGUARD(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_WIREGUARD_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_WIREGUARD_GET_CLASS(obj: Pointer): PNMDeviceWireGuardClass;

implementation

function NM_TYPE_DEVICE_WIREGUARD: TGType;
begin
  NM_TYPE_DEVICE_WIREGUARD := nm_device_wireguard_get_type;
end;

function NM_DEVICE_WIREGUARD(obj: Pointer): PNMDeviceWireGuard;
begin
  Result := PNMDeviceWireGuard(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_WIREGUARD));
end;

function NM_DEVICE_WIREGUARD_CLASS(klass: Pointer): PNMDeviceWireGuardClass;
begin
  Result := PNMDeviceWireGuardClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_WIREGUARD));
end;

function NM_IS_DEVICE_WIREGUARD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_WIREGUARD);
end;

function NM_IS_DEVICE_WIREGUARD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_WIREGUARD);
end;

function NM_DEVICE_WIREGUARD_GET_CLASS(obj: Pointer): PNMDeviceWireGuardClass;
begin
  Result := PNMDeviceWireGuardClass(PGTypeInstance(obj)^.g_class);
end;



end.
