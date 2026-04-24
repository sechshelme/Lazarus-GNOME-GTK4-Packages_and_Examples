unit nm_device_6lowpan;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_DEVICE_6LOWPAN_PARENT = 'parent';
  NM_DEVICE_6LOWPAN_HW_ADDRESS = 'hw-address';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDevice6Lowpan = type Pointer;
  PNMDevice6LowpanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_6lowpan_get_type: TGType; cdecl; external libnm;
function nm_device_6lowpan_get_parent(device: PNMDevice6Lowpan): PNMDevice; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:31:25 ===

function NM_TYPE_DEVICE_6LOWPAN: TGType;
function NM_DEVICE_6LOWPAN(obj: Pointer): PNMDevice6Lowpan;
function NM_DEVICE_6LOWPAN_CLASS(klass: Pointer): PNMDevice6LowpanClass;
function NM_IS_DEVICE_6LOWPAN(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_6LOWPAN_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_6LOWPAN_GET_CLASS(obj: Pointer): PNMDevice6LowpanClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_6LOWPAN: TGType;
begin
  NM_TYPE_DEVICE_6LOWPAN := nm_device_6lowpan_get_type;
end;

function NM_DEVICE_6LOWPAN(obj: Pointer): PNMDevice6Lowpan;
begin
  Result := PNMDevice6Lowpan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_6LOWPAN));
end;

function NM_DEVICE_6LOWPAN_CLASS(klass: Pointer): PNMDevice6LowpanClass;
begin
  Result := PNMDevice6LowpanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_6LOWPAN));
end;

function NM_IS_DEVICE_6LOWPAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_6LOWPAN);
end;

function NM_IS_DEVICE_6LOWPAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_6LOWPAN);
end;

function NM_DEVICE_6LOWPAN_GET_CLASS(obj: Pointer): PNMDevice6LowpanClass;
begin
  Result := PNMDevice6LowpanClass(PGTypeInstance(obj)^.g_class);
end;



end.
