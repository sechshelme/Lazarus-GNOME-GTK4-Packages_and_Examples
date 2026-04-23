unit nm_setting_serial;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_SETTING_SERIAL_SETTING_NAME = 'serial';

type
  PNMSettingSerialParity = ^TNMSettingSerialParity;
  TNMSettingSerialParity = longint;

const
  NM_SETTING_SERIAL_PARITY_NONE = 0;
  NM_SETTING_SERIAL_PARITY_EVEN = 1;
  NM_SETTING_SERIAL_PARITY_ODD = 2;

const
  NM_SETTING_SERIAL_BAUD = 'baud';
  NM_SETTING_SERIAL_BITS = 'bits';
  NM_SETTING_SERIAL_PARITY = 'parity';
  NM_SETTING_SERIAL_STOPBITS = 'stopbits';
  NM_SETTING_SERIAL_SEND_DELAY = 'send-delay';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingSerial = type Pointer;
  PNMSettingSerialClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_serial_get_type: TGType; cdecl; external libnm;
function nm_setting_serial_new: PNMSetting; cdecl; external libnm;
function nm_setting_serial_get_baud(setting: PNMSettingSerial): Tguint; cdecl; external libnm;
function nm_setting_serial_get_bits(setting: PNMSettingSerial): Tguint; cdecl; external libnm;
function nm_setting_serial_get_parity(setting: PNMSettingSerial): TNMSettingSerialParity; cdecl; external libnm;
function nm_setting_serial_get_stopbits(setting: PNMSettingSerial): Tguint; cdecl; external libnm;
function nm_setting_serial_get_send_delay(setting: PNMSettingSerial): Tguint64; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:15 ===

function NM_TYPE_SETTING_SERIAL: TGType;
function NM_SETTING_SERIAL(obj: Pointer): PNMSettingSerial;
function NM_SETTING_SERIAL_CLASS(klass: Pointer): PNMSettingSerialClass;
function NM_IS_SETTING_SERIAL(obj: Pointer): Tgboolean;
function NM_IS_SETTING_SERIAL_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_SERIAL_GET_CLASS(obj: Pointer): PNMSettingSerialClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_SERIAL: TGType;
begin
  NM_TYPE_SETTING_SERIAL := nm_setting_serial_get_type;
end;

function NM_SETTING_SERIAL(obj: Pointer): PNMSettingSerial;
begin
  Result := PNMSettingSerial(g_type_check_instance_cast(obj, NM_TYPE_SETTING_SERIAL));
end;

function NM_SETTING_SERIAL_CLASS(klass: Pointer): PNMSettingSerialClass;
begin
  Result := PNMSettingSerialClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_SERIAL));
end;

function NM_IS_SETTING_SERIAL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_SERIAL);
end;

function NM_IS_SETTING_SERIAL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_SERIAL);
end;

function NM_SETTING_SERIAL_GET_CLASS(obj: Pointer): PNMSettingSerialClass;
begin
  Result := PNMSettingSerialClass(PGTypeInstance(obj)^.g_class);
end;



end.
