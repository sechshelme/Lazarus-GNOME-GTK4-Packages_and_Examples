unit nm_setting_olpc_mesh;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_OLPC_MESH_SETTING_NAME = '802-11-olpc-mesh';
  NM_SETTING_OLPC_MESH_SSID = 'ssid';
  NM_SETTING_OLPC_MESH_CHANNEL = 'channel';
  NM_SETTING_OLPC_MESH_DHCP_ANYCAST_ADDRESS = 'dhcp-anycast-address';

type
  PNMSettingOlpcMesh = type Pointer;
  PNMSettingOlpcMeshClass = type Pointer;

function nm_setting_olpc_mesh_get_type: TGType; cdecl; external libnm;
function nm_setting_olpc_mesh_new: PNMSetting; cdecl; external libnm;
function nm_setting_olpc_mesh_get_ssid(setting: PNMSettingOlpcMesh): PGBytes; cdecl; external libnm;
function nm_setting_olpc_mesh_get_channel(setting: PNMSettingOlpcMesh): Tguint32; cdecl; external libnm;
function nm_setting_olpc_mesh_get_dhcp_anycast_address(setting: PNMSettingOlpcMesh): pchar; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:51:15 ===

function NM_TYPE_SETTING_OLPC_MESH: TGType;
function NM_SETTING_OLPC_MESH(obj: Pointer): PNMSettingOlpcMesh;
function NM_SETTING_OLPC_MESH_CLASS(klass: Pointer): PNMSettingOlpcMeshClass;
function NM_IS_SETTING_OLPC_MESH(obj: Pointer): Tgboolean;
function NM_IS_SETTING_OLPC_MESH_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_OLPC_MESH_GET_CLASS(obj: Pointer): PNMSettingOlpcMeshClass;

implementation

function NM_TYPE_SETTING_OLPC_MESH: TGType;
begin
  NM_TYPE_SETTING_OLPC_MESH := nm_setting_olpc_mesh_get_type;
end;

function NM_SETTING_OLPC_MESH(obj: Pointer): PNMSettingOlpcMesh;
begin
  Result := PNMSettingOlpcMesh(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OLPC_MESH));
end;

function NM_SETTING_OLPC_MESH_CLASS(klass: Pointer): PNMSettingOlpcMeshClass;
begin
  Result := PNMSettingOlpcMeshClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OLPC_MESH));
end;

function NM_IS_SETTING_OLPC_MESH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_OLPC_MESH);
end;

function NM_IS_SETTING_OLPC_MESH_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_OLPC_MESH);
end;

function NM_SETTING_OLPC_MESH_GET_CLASS(obj: Pointer): PNMSettingOlpcMeshClass;
begin
  Result := PNMSettingOlpcMeshClass(PGTypeInstance(obj)^.g_class);
end;



end.
