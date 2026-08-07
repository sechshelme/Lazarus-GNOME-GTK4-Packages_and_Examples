unit nm_device_dummy;

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_DEVICE_DUMMY_HW_ADDRESS = 'hw-address';

type
  PNMDeviceDummy = type Pointer;
  PNMDeviceDummyClass = type Pointer;

function nm_device_dummy_get_type: TGType; cdecl; external libnm;
function nm_device_dummy_get_hw_address(device: PNMDeviceDummy): pchar; cdecl; external libnm; deprecated;

// === Konventiert am: 5-8-26 17:16:43 ===

function NM_TYPE_DEVICE_DUMMY: TGType;
function NM_DEVICE_DUMMY(obj: Pointer): PNMDeviceDummy;
function NM_DEVICE_DUMMY_CLASS(klass: Pointer): PNMDeviceDummyClass;
function NM_IS_DEVICE_DUMMY(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_DUMMY_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_DUMMY_GET_CLASS(obj: Pointer): PNMDeviceDummyClass;

implementation

function NM_TYPE_DEVICE_DUMMY: TGType;
begin
  NM_TYPE_DEVICE_DUMMY := nm_device_dummy_get_type;
end;

function NM_DEVICE_DUMMY(obj: Pointer): PNMDeviceDummy;
begin
  Result := PNMDeviceDummy(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_DUMMY));
end;

function NM_DEVICE_DUMMY_CLASS(klass: Pointer): PNMDeviceDummyClass;
begin
  Result := PNMDeviceDummyClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_DUMMY));
end;

function NM_IS_DEVICE_DUMMY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_DUMMY);
end;

function NM_IS_DEVICE_DUMMY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_DUMMY);
end;

function NM_DEVICE_DUMMY_GET_CLASS(obj: Pointer): PNMDeviceDummyClass;
begin
  Result := PNMDeviceDummyClass(PGTypeInstance(obj)^.g_class);
end;



end.
