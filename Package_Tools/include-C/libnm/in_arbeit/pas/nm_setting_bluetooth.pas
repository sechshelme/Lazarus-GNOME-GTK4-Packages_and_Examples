unit nm_setting_bluetooth;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_BLUETOOTH_SETTING_NAME = 'bluetooth';
  NM_SETTING_BLUETOOTH_BDADDR = 'bdaddr';
  NM_SETTING_BLUETOOTH_TYPE = 'type';
  NM_SETTING_BLUETOOTH_TYPE_DUN = 'dun';
  NM_SETTING_BLUETOOTH_TYPE_PANU = 'panu';
  NM_SETTING_BLUETOOTH_TYPE_NAP = 'nap';

type
  PNMSettingBluetooth = type Pointer;
  PNMSettingBluetoothClass = type Pointer;

function nm_setting_bluetooth_get_type: TGType; cdecl; external libnm;
function nm_setting_bluetooth_new: PNMSetting; cdecl; external libnm;
function nm_setting_bluetooth_get_bdaddr(setting: PNMSettingBluetooth): pchar; cdecl; external libnm;
function nm_setting_bluetooth_get_connection_type(setting: PNMSettingBluetooth): pchar; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:35:42 ===

function NM_TYPE_SETTING_BLUETOOTH: TGType;
function NM_SETTING_BLUETOOTH(obj: Pointer): PNMSettingBluetooth;
function NM_SETTING_BLUETOOTH_CLASS(klass: Pointer): PNMSettingBluetoothClass;
function NM_IS_SETTING_BLUETOOTH(obj: Pointer): Tgboolean;
function NM_IS_SETTING_BLUETOOTH_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_BLUETOOTH_GET_CLASS(obj: Pointer): PNMSettingBluetoothClass;

implementation

function NM_TYPE_SETTING_BLUETOOTH: TGType;
begin
  NM_TYPE_SETTING_BLUETOOTH := nm_setting_bluetooth_get_type;
end;

function NM_SETTING_BLUETOOTH(obj: Pointer): PNMSettingBluetooth;
begin
  Result := PNMSettingBluetooth(g_type_check_instance_cast(obj, NM_TYPE_SETTING_BLUETOOTH));
end;

function NM_SETTING_BLUETOOTH_CLASS(klass: Pointer): PNMSettingBluetoothClass;
begin
  Result := PNMSettingBluetoothClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_BLUETOOTH));
end;

function NM_IS_SETTING_BLUETOOTH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_BLUETOOTH);
end;

function NM_IS_SETTING_BLUETOOTH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_BLUETOOTH);
end;

function NM_SETTING_BLUETOOTH_GET_CLASS(obj: Pointer): PNMSettingBluetoothClass;
begin
  Result := PNMSettingBluetoothClass(PGTypeInstance(obj)^.g_class);
end;



end.
