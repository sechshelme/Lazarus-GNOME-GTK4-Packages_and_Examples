

  {$IFDEF read_enum}
const
  NM_DEVICE_BOND_HW_ADDRESS = 'hw-address';
  NM_DEVICE_BOND_CARRIER = 'carrier';
  NM_DEVICE_BOND_SLAVES = 'slaves';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceBond = type Pointer;
  PNMDeviceBondClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_bond_get_type: TGType; cdecl; external libnm;
function nm_device_bond_get_hw_address(device: PNMDeviceBond): pchar; cdecl; external libnm; deprecated;
function nm_device_bond_get_carrier(device: PNMDeviceBond): Tgboolean; cdecl; external libnm;
function nm_device_bond_get_slaves(device: PNMDeviceBond): PGPtrArray; cdecl; external libnm; deprecated;

// === Konventiert am: 19-4-26 19:31:19 ===

function NM_TYPE_DEVICE_BOND: TGType;
function NM_DEVICE_BOND(obj: Pointer): PNMDeviceBond;
function NM_DEVICE_BOND_CLASS(klass: Pointer): PNMDeviceBondClass;
function NM_IS_DEVICE_BOND(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_BOND_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_BOND_GET_CLASS(obj: Pointer): PNMDeviceBondClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_DEVICE_BOND: TGType;
begin
  NM_TYPE_DEVICE_BOND := nm_device_bond_get_type;
end;

function NM_DEVICE_BOND(obj: Pointer): PNMDeviceBond;
begin
  Result := PNMDeviceBond(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_BOND));
end;

function NM_DEVICE_BOND_CLASS(klass: Pointer): PNMDeviceBondClass;
begin
  Result := PNMDeviceBondClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_BOND));
end;

function NM_IS_DEVICE_BOND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_BOND);
end;

function NM_IS_DEVICE_BOND_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_BOND);
end;

function NM_DEVICE_BOND_GET_CLASS(obj: Pointer): PNMDeviceBondClass;
begin
  Result := PNMDeviceBondClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
