unit nm_device_macvlan;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_MACVLAN_PARENT = 'parent';
  NM_DEVICE_MACVLAN_MODE = 'mode';
  NM_DEVICE_MACVLAN_NO_PROMISC = 'no-promisc';
  NM_DEVICE_MACVLAN_TAP = 'tap';
  NM_DEVICE_MACVLAN_HW_ADDRESS = 'hw-address';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceMacvlan = type Pointer;
  PNMDeviceMacvlanClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_macvlan_get_type: TGType; cdecl; external libnm;
function nm_device_macvlan_get_parent(device: PNMDeviceMacvlan): PNMDevice; cdecl; external libnm;
function nm_device_macvlan_get_mode(device: PNMDeviceMacvlan): pchar; cdecl; external libnm;
function nm_device_macvlan_get_no_promisc(device: PNMDeviceMacvlan): Tgboolean; cdecl; external libnm;
function nm_device_macvlan_get_tap(device: PNMDeviceMacvlan): Tgboolean; cdecl; external libnm;
function nm_device_macvlan_get_hw_address(device: PNMDeviceMacvlan): pchar; cdecl; external libnm; deprecated;

// === Konventiert am: 19-4-26 19:30:45 ===

function NM_TYPE_DEVICE_MACVLAN: TGType;
function NM_DEVICE_MACVLAN(obj: Pointer): PNMDeviceMacvlan;
function NM_DEVICE_MACVLAN_CLASS(klass: Pointer): PNMDeviceMacvlanClass;
function NM_IS_DEVICE_MACVLAN(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_MACVLAN_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_MACVLAN_GET_CLASS(obj: Pointer): PNMDeviceMacvlanClass;
{$ENDIF read_function}

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
