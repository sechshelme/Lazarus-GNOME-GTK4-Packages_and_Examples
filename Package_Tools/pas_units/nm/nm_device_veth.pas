unit nm_device_veth;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  NM_DEVICE_VETH_PEER = 'peer';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMDeviceVeth = type Pointer;
  PNMDeviceVethClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_device_veth_get_type: TGType; cdecl; external libnm;
function nm_device_veth_get_peer(device: PNMDeviceVeth): PNMDevice; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:30:14 ===

function NM_TYPE_DEVICE_VETH: TGType;
function NM_DEVICE_VETH(obj: Pointer): PNMDeviceVeth;
function NM_DEVICE_VETH_CLASS(klass: Pointer): PNMDeviceVethClass;
function NM_IS_DEVICE_VETH(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_VETH_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_VETH_GET_CLASS(obj: Pointer): PNMDeviceVethClass;
{$ENDIF read_function}

implementation

function NM_TYPE_DEVICE_VETH: TGType;
begin
  NM_TYPE_DEVICE_VETH := nm_device_veth_get_type;
end;

function NM_DEVICE_VETH(obj: Pointer): PNMDeviceVeth;
begin
  Result := PNMDeviceVeth(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_VETH));
end;

function NM_DEVICE_VETH_CLASS(klass: Pointer): PNMDeviceVethClass;
begin
  Result := PNMDeviceVethClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_VETH));
end;

function NM_IS_DEVICE_VETH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_VETH);
end;

function NM_IS_DEVICE_VETH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_VETH);
end;

function NM_DEVICE_VETH_GET_CLASS(obj: Pointer): PNMDeviceVethClass;
begin
  Result := PNMDeviceVethClass(PGTypeInstance(obj)^.g_class);
end;



end.
