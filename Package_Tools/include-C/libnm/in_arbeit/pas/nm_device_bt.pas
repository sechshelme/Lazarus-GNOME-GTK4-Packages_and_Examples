unit nm_device_bt;

interface

uses
  fp_glib2, fp_nm, nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_DEVICE_BT_HW_ADDRESS = 'hw-address';
  NM_DEVICE_BT_NAME = 'name';
  NM_DEVICE_BT_CAPABILITIES = 'bt-capabilities';

type
  PNMDeviceBt = type Pointer;
  PNMDeviceBtClass = type Pointer;

function nm_device_bt_get_type: TGType; cdecl; external libnm;
function nm_device_bt_get_hw_address(device: PNMDeviceBt): pchar; cdecl; external libnm; deprecated;
function nm_device_bt_get_name(device: PNMDeviceBt): pchar; cdecl; external libnm;
function nm_device_bt_get_capabilities(device: PNMDeviceBt): TNMBluetoothCapabilities; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:16:46 ===

function NM_TYPE_DEVICE_BT: TGType;
function NM_DEVICE_BT(obj: Pointer): PNMDeviceBt;
function NM_DEVICE_BT_CLASS(klass: Pointer): PNMDeviceBtClass;
function NM_IS_DEVICE_BT(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_BT_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_BT_GET_CLASS(obj: Pointer): PNMDeviceBtClass;

implementation

function NM_TYPE_DEVICE_BT: TGType;
begin
  NM_TYPE_DEVICE_BT := nm_device_bt_get_type;
end;

function NM_DEVICE_BT(obj: Pointer): PNMDeviceBt;
begin
  Result := PNMDeviceBt(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_BT));
end;

function NM_DEVICE_BT_CLASS(klass: Pointer): PNMDeviceBtClass;
begin
  Result := PNMDeviceBtClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_BT));
end;

function NM_IS_DEVICE_BT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_BT);
end;

function NM_IS_DEVICE_BT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_BT);
end;

function NM_DEVICE_BT_GET_CLASS(obj: Pointer): PNMDeviceBtClass;
begin
  Result := PNMDeviceBtClass(PGTypeInstance(obj)^.g_class);
end;



end.
