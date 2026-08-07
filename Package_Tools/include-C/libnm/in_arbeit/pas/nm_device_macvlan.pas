unit nm_device_macvlan;

interface

uses
  fp_glib2, fp_nm, nm_device;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_DEVICE_MACVLAN_PARENT = 'parent';
  NM_DEVICE_MACVLAN_MODE = 'mode';
  NM_DEVICE_MACVLAN_NO_PROMISC = 'no-promisc';
  NM_DEVICE_MACVLAN_TAP = 'tap';
  NM_DEVICE_MACVLAN_HW_ADDRESS = 'hw-address';

type
  PNMDeviceMacvlan = type Pointer;
  PNMDeviceMacvlanClass = type Pointer;

function nm_device_macvlan_get_type: TGType; cdecl; external libnm;
function nm_device_macvlan_get_parent(device: PNMDeviceMacvlan): PNMDevice; cdecl; external libnm;
function nm_device_macvlan_get_mode(device: PNMDeviceMacvlan): pchar; cdecl; external libnm;
function nm_device_macvlan_get_no_promisc(device: PNMDeviceMacvlan): Tgboolean; cdecl; external libnm;
function nm_device_macvlan_get_tap(device: PNMDeviceMacvlan): Tgboolean; cdecl; external libnm;
function nm_device_macvlan_get_hw_address(device: PNMDeviceMacvlan): pchar; cdecl; external libnm; deprecated;

// === Konventiert am: 5-8-26 17:21:56 ===

function NM_TYPE_DEVICE_MACVLAN: TGType;
function NM_DEVICE_MACVLAN(obj: Pointer): PNMDeviceMacvlan;
function NM_DEVICE_MACVLAN_CLASS(klass: Pointer): PNMDeviceMacvlanClass;
function NM_IS_DEVICE_MACVLAN(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_MACVLAN_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_MACVLAN_GET_CLASS(obj: Pointer): PNMDeviceMacvlanClass;

implementation

function NM_TYPE_DEVICE_MACVLAN: TGType;
begin
  NM_TYPE_DEVICE_MACVLAN := nm_device_macvlan_get_type;
end;

function NM_DEVICE_MACVLAN(obj: Pointer): PNMDeviceMacvlan;
begin
  Result := PNMDeviceMacvlan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_MACVLAN));
end;

function NM_DEVICE_MACVLAN_CLASS(klass: Pointer): PNMDeviceMacvlanClass;
begin
  Result := PNMDeviceMacvlanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_MACVLAN));
end;

function NM_IS_DEVICE_MACVLAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_MACVLAN);
end;

function NM_IS_DEVICE_MACVLAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_MACVLAN);
end;

function NM_DEVICE_MACVLAN_GET_CLASS(obj: Pointer): PNMDeviceMacvlanClass;
begin
  Result := PNMDeviceMacvlanClass(PGTypeInstance(obj)^.g_class);
end;



end.
