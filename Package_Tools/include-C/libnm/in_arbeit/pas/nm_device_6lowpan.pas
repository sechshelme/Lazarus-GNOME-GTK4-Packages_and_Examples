unit nm_device_6lowpan;

interface

uses
  fp_glib2, fp_nm, nm_device;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_DEVICE_6LOWPAN_PARENT = 'parent';
  NM_DEVICE_6LOWPAN_HW_ADDRESS = 'hw-address';

type
  PNMDevice6Lowpan = type Pointer;
  PNMDevice6LowpanClass = type Pointer;

function nm_device_6lowpan_get_type: TGType; cdecl; external libnm;
function nm_device_6lowpan_get_parent(device: PNMDevice6Lowpan): PNMDevice; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:16:59 ===

function NM_TYPE_DEVICE_6LOWPAN: TGType;
function NM_DEVICE_6LOWPAN(obj: Pointer): PNMDevice6Lowpan;
function NM_DEVICE_6LOWPAN_CLASS(klass: Pointer): PNMDevice6LowpanClass;
function NM_IS_DEVICE_6LOWPAN(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_6LOWPAN_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_6LOWPAN_GET_CLASS(obj: Pointer): PNMDevice6LowpanClass;

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
