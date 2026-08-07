unit nm_device_olpc_mesh;

interface

uses
  fp_glib2, fp_nm, nm_device_wifi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_DEVICE_OLPC_MESH_HW_ADDRESS = 'hw-address';
  NM_DEVICE_OLPC_MESH_COMPANION = 'companion';
  NM_DEVICE_OLPC_MESH_ACTIVE_CHANNEL = 'active-channel';

type
  PNMDeviceOlpcMesh = type Pointer;
  PNMDeviceOlpcMeshClass = type Pointer;

function nm_device_olpc_mesh_get_type: TGType; cdecl; external libnm;
function nm_device_olpc_mesh_get_hw_address(device: PNMDeviceOlpcMesh): pchar; cdecl; external libnm; deprecated;
function nm_device_olpc_mesh_get_companion(device: PNMDeviceOlpcMesh): PNMDeviceWifi; cdecl; external libnm;
function nm_device_olpc_mesh_get_active_channel(device: PNMDeviceOlpcMesh): Tguint32; cdecl; external libnm;

// === Konventiert am: 5-8-26 17:21:49 ===

function NM_TYPE_DEVICE_OLPC_MESH: TGType;
function NM_DEVICE_OLPC_MESH(obj: Pointer): PNMDeviceOlpcMesh;
function NM_DEVICE_OLPC_MESH_CLASS(klass: Pointer): PNMDeviceOlpcMeshClass;
function NM_IS_DEVICE_OLPC_MESH(obj: Pointer): Tgboolean;
function NM_IS_DEVICE_OLPC_MESH_CLASS(klass: Pointer): Tgboolean;
function NM_DEVICE_OLPC_MESH_GET_CLASS(obj: Pointer): PNMDeviceOlpcMeshClass;

implementation

function NM_TYPE_DEVICE_OLPC_MESH: TGType;
begin
  NM_TYPE_DEVICE_OLPC_MESH := nm_device_olpc_mesh_get_type;
end;

function NM_DEVICE_OLPC_MESH(obj: Pointer): PNMDeviceOlpcMesh;
begin
  Result := PNMDeviceOlpcMesh(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_OLPC_MESH));
end;

function NM_DEVICE_OLPC_MESH_CLASS(klass: Pointer): PNMDeviceOlpcMeshClass;
begin
  Result := PNMDeviceOlpcMeshClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_OLPC_MESH));
end;

function NM_IS_DEVICE_OLPC_MESH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_DEVICE_OLPC_MESH);
end;

function NM_IS_DEVICE_OLPC_MESH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_DEVICE_OLPC_MESH);
end;

function NM_DEVICE_OLPC_MESH_GET_CLASS(obj: Pointer): PNMDeviceOlpcMeshClass;
begin
  Result := PNMDeviceOlpcMeshClass(PGTypeInstance(obj)^.g_class);
end;



end.
