

  {$IFDEF read_enum}
const
  NM_DEVICE_TUN_HW_ADDRESS = 'hw-address';
  NM_DEVICE_TUN_OWNER = 'owner';
  NM_DEVICE_TUN_GROUP = 'group';
  NM_DEVICE_TUN_MODE = 'mode';
  NM_DEVICE_TUN_NO_PI = 'no-pi';
  NM_DEVICE_TUN_VNET_HDR = 'vnet-hdr';
  NM_DEVICE_TUN_MULTI_QUEUE = 'multi-queue';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceTun = type Pointer;
  PNMDeviceTunClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_tun_get_type: TGType; cdecl; external libnm;
function nm_device_tun_get_hw_address(device: PNMDeviceTun): pchar; cdecl; external libnm; deprecated;
function nm_device_tun_get_mode(device: PNMDeviceTun): pchar; cdecl; external libnm;
function nm_device_tun_get_owner(device: PNMDeviceTun): Tgint64; cdecl; external libnm;
function nm_device_tun_get_group(device: PNMDeviceTun): Tgint64; cdecl; external libnm;
function nm_device_tun_get_no_pi(device: PNMDeviceTun): Tgboolean; cdecl; external libnm;
function nm_device_tun_get_vnet_hdr(device: PNMDeviceTun): Tgboolean; cdecl; external libnm;
function nm_device_tun_get_multi_queue(device: PNMDeviceTun): Tgboolean; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:35:39 ===

function NM_TYPE_DEVICE_TUN: TGType;
function NM_DEVICE_TUN(obj: Pointer): PNMDeviceTun;
function NM_DEVICE_TUN_CLASS(klass: Pointer): PNMDeviceTunClass;
function NM_IS_DEVICE_TUN(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_TUN_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_TUN_GET_CLASS(obj: Pointer): PNMDeviceTunClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_TUN: TGType;
begin
  NM_TYPE_DEVICE_TUN := nm_device_tun_get_type;
end;

function NM_DEVICE_TUN(obj: Pointer): PNMDeviceTun;
begin
  Result := PNMDeviceTun(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_TUN));
end;

function NM_DEVICE_TUN_CLASS(klass: Pointer): PNMDeviceTunClass;
begin
  Result := PNMDeviceTunClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_TUN));
end;

function NM_IS_DEVICE_TUN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_TUN);
end;

function NM_IS_DEVICE_TUN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_TUN);
end;

function NM_DEVICE_TUN_GET_CLASS(obj: Pointer): PNMDeviceTunClass;
begin
  Result := PNMDeviceTunClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
