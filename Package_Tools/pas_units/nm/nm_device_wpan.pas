unit nm_device_wpan;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_DEVICE_WPAN_HW_ADDRESS = 'hw-address';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceWpan = type Pointer;
  PNMDeviceWpanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_wpan_get_type: TGType; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:29:45 ===

function NM_TYPE_DEVICE_WPAN: TGType;
function NM_DEVICE_WPAN(obj: Pointer): PNMDeviceWpan;
function NM_DEVICE_WPAN_CLASS(klass: Pointer): PNMDeviceWpanClass;
function NM_IS_DEVICE_WPAN(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_WPAN_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_WPAN_GET_CLASS(obj: Pointer): PNMDeviceWpanClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_WPAN: TGType;
begin
  NM_TYPE_DEVICE_WPAN := nm_device_wpan_get_type;
end;

function NM_DEVICE_WPAN(obj: Pointer): PNMDeviceWpan;
begin
  Result := PNMDeviceWpan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_WPAN));
end;

function NM_DEVICE_WPAN_CLASS(klass: Pointer): PNMDeviceWpanClass;
begin
  Result := PNMDeviceWpanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_WPAN));
end;

function NM_IS_DEVICE_WPAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_WPAN);
end;

function NM_IS_DEVICE_WPAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_WPAN);
end;

function NM_DEVICE_WPAN_GET_CLASS(obj: Pointer): PNMDeviceWpanClass;
begin
  Result := PNMDeviceWpanClass(PGTypeInstance(obj)^.g_class);
end;



end.
