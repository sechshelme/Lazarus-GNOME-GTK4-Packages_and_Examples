unit nm_device_adsl;

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_DEVICE_ADSL_CARRIER = 'carrier';

type
  PNMDeviceAdsl = type Pointer;
  PNMDeviceAdslClass = type Pointer;

function nm_device_adsl_get_type: TGType; cdecl; external libnm;
function nm_device_adsl_get_carrier(device: PNMDeviceAdsl): Tgboolean; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:16:56 ===

function NM_TYPE_DEVICE_ADSL: TGType;
function NM_DEVICE_ADSL(obj: Pointer): PNMDeviceAdsl;
function NM_DEVICE_ADSL_CLASS(klass: Pointer): PNMDeviceAdslClass;
function NM_IS_DEVICE_ADSL(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_ADSL_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_ADSL_GET_CLASS(obj: Pointer): PNMDeviceAdslClass;

implementation

function NM_TYPE_DEVICE_ADSL: TGType;
begin
  NM_TYPE_DEVICE_ADSL := nm_device_adsl_get_type;
end;

function NM_DEVICE_ADSL(obj: Pointer): PNMDeviceAdsl;
begin
  Result := PNMDeviceAdsl(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_ADSL));
end;

function NM_DEVICE_ADSL_CLASS(klass: Pointer): PNMDeviceAdslClass;
begin
  Result := PNMDeviceAdslClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_ADSL));
end;

function NM_IS_DEVICE_ADSL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_ADSL);
end;

function NM_IS_DEVICE_ADSL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_ADSL);
end;

function NM_DEVICE_ADSL_GET_CLASS(obj: Pointer): PNMDeviceAdslClass;
begin
  Result := PNMDeviceAdslClass(PGTypeInstance(obj)^.g_class);
end;



end.
