unit nm_device_modem;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_dbus_interface;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_MODEM_MODEM_CAPABILITIES = 'modem-capabilities';
  NM_DEVICE_MODEM_CURRENT_CAPABILITIES = 'current-capabilities';
  NM_DEVICE_MODEM_DEVICE_ID = 'device-id';
  NM_DEVICE_MODEM_OPERATOR_CODE = 'operator-code';
  NM_DEVICE_MODEM_APN = 'apn';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceModem = type Pointer;
  PNMDeviceModemClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_modem_get_type: TGType; cdecl; external libnm;
function nm_device_modem_get_modem_capabilities(self: PNMDeviceModem): TNMDeviceModemCapabilities; cdecl; external libnm;
function nm_device_modem_get_current_capabilities(self: PNMDeviceModem): TNMDeviceModemCapabilities; cdecl; external libnm;
function nm_device_modem_get_device_id(self: PNMDeviceModem): pchar; cdecl; external libnm;
function nm_device_modem_get_operator_code(self: PNMDeviceModem): pchar; cdecl; external libnm;
function nm_device_modem_get_apn(self: PNMDeviceModem): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:42 ===

function NM_TYPE_DEVICE_MODEM: TGType;
function NM_DEVICE_MODEM(obj: Pointer): PNMDeviceModem;
function NM_DEVICE_MODEM_CLASS(klass: Pointer): PNMDeviceModemClass;
function NM_IS_DEVICE_MODEM(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_MODEM_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_MODEM_GET_CLASS(obj: Pointer): PNMDeviceModemClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_MODEM: TGType;
begin
  NM_TYPE_DEVICE_MODEM := nm_device_modem_get_type;
end;

function NM_DEVICE_MODEM(obj: Pointer): PNMDeviceModem;
begin
  Result := PNMDeviceModem(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_MODEM));
end;

function NM_DEVICE_MODEM_CLASS(klass: Pointer): PNMDeviceModemClass;
begin
  Result := PNMDeviceModemClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_MODEM));
end;

function NM_IS_DEVICE_MODEM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_MODEM);
end;

function NM_IS_DEVICE_MODEM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_MODEM);
end;

function NM_DEVICE_MODEM_GET_CLASS(obj: Pointer): PNMDeviceModemClass;
begin
  Result := PNMDeviceModemClass(PGTypeInstance(obj)^.g_class);
end;



end.
