unit nm_device_vlan;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_VLAN_HW_ADDRESS = 'hw-address';
  NM_DEVICE_VLAN_CARRIER = 'carrier';
  NM_DEVICE_VLAN_PARENT = 'parent';
  NM_DEVICE_VLAN_VLAN_ID = 'vlan-id';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceVlan = type Pointer;
  PNMDeviceVlanClass = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_function}

function nm_device_vlan_get_type: TGType; cdecl; external libnm;
function nm_device_vlan_get_hw_address(device: PNMDeviceVlan): pchar; cdecl; external libnm; deprecated;
function nm_device_vlan_get_carrier(device: PNMDeviceVlan): Tgboolean; cdecl; external libnm;
function nm_device_vlan_get_parent(device: PNMDeviceVlan): PNMDevice; cdecl; external libnm;
function nm_device_vlan_get_vlan_id(device: PNMDeviceVlan): Tguint; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:12 ===

function NM_TYPE_DEVICE_VLAN: TGType;
function NM_DEVICE_VLAN(obj: Pointer): PNMDeviceVlan;
function NM_DEVICE_VLAN_CLASS(klass: Pointer): PNMDeviceVlanClass;
function NM_IS_DEVICE_VLAN(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_VLAN_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_VLAN_GET_CLASS(obj: Pointer): PNMDeviceVlanClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_VLAN: TGType;
begin
  NM_TYPE_DEVICE_VLAN := nm_device_vlan_get_type;
end;

function NM_DEVICE_VLAN(obj: Pointer): PNMDeviceVlan;
begin
  Result := PNMDeviceVlan(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_VLAN));
end;

function NM_DEVICE_VLAN_CLASS(klass: Pointer): PNMDeviceVlanClass;
begin
  Result := PNMDeviceVlanClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_VLAN));
end;

function NM_IS_DEVICE_VLAN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_VLAN);
end;

function NM_IS_DEVICE_VLAN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_VLAN);
end;

function NM_DEVICE_VLAN_GET_CLASS(obj: Pointer): PNMDeviceVlanClass;
begin
  Result := PNMDeviceVlanClass(PGTypeInstance(obj)^.g_class);
end;



end.
