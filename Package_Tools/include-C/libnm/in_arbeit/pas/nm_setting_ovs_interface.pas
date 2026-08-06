unit nm_setting_ovs_interface;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_OVS_INTERFACE_SETTING_NAME = 'ovs-interface';
  NM_SETTING_OVS_INTERFACE_TYPE = 'type';
  NM_SETTING_OVS_INTERFACE_OFPORT_REQUEST = 'ofport-request';

type
  PNMSettingOvsInterface = type Pointer;
  PNMSettingOvsInterfaceClass = type Pointer;

function nm_setting_ovs_interface_get_type: TGType; cdecl; external libnm;
function nm_setting_ovs_interface_new: PNMSetting; cdecl; external libnm;
function nm_setting_ovs_interface_get_interface_type(self: PNMSettingOvsInterface): pchar; cdecl; external libnm;
function nm_setting_ovs_interface_get_ofport_request(self: PNMSettingOvsInterface): Tguint32; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:54:26 ===

function NM_TYPE_SETTING_OVS_INTERFACE: TGType;
function NM_SETTING_OVS_INTERFACE(obj: Pointer): PNMSettingOvsInterface;
function NM_SETTING_OVS_INTERFACE_CLASS(klass: Pointer): PNMSettingOvsInterfaceClass;
function NM_IS_SETTING_OVS_INTERFACE(obj: Pointer): Tgboolean;
function NM_IS_SETTING_OVS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_OVS_INTERFACE_GET_CLASS(obj: Pointer): PNMSettingOvsInterfaceClass;

implementation

function NM_TYPE_SETTING_OVS_INTERFACE: TGType;
begin
  NM_TYPE_SETTING_OVS_INTERFACE := nm_setting_ovs_interface_get_type;
end;

function NM_SETTING_OVS_INTERFACE(obj: Pointer): PNMSettingOvsInterface;
begin
  Result := PNMSettingOvsInterface(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_INTERFACE));
end;

function NM_SETTING_OVS_INTERFACE_CLASS(klass: Pointer): PNMSettingOvsInterfaceClass;
begin
  Result := PNMSettingOvsInterfaceClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_INTERFACE));
end;

function NM_IS_SETTING_OVS_INTERFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_OVS_INTERFACE);
end;

function NM_IS_SETTING_OVS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_OVS_INTERFACE);
end;

function NM_SETTING_OVS_INTERFACE_GET_CLASS(obj: Pointer): PNMSettingOvsInterfaceClass;
begin
  Result := PNMSettingOvsInterfaceClass(PGTypeInstance(obj)^.g_class);
end;



end.
