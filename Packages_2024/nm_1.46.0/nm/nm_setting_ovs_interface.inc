

  {$IFDEF read_enum}
const
  NM_SETTING_OVS_INTERFACE_SETTING_NAME = 'ovs-interface';
  NM_SETTING_OVS_INTERFACE_TYPE = 'type';
  NM_SETTING_OVS_INTERFACE_OFPORT_REQUEST = 'ofport-request';
  {$ENDIF read_enum}
  {$IFDEF read_struct}
type
  PNMSettingOvsInterface = type Pointer;
  PNMSettingOvsInterfaceClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_ovs_interface_get_type: TGType; cdecl; external libnm;
function nm_setting_ovs_interface_new: PNMSetting; cdecl; external libnm;
function nm_setting_ovs_interface_get_interface_type(self: PNMSettingOvsInterface): pchar; cdecl; external libnm;
function nm_setting_ovs_interface_get_ofport_request(self: PNMSettingOvsInterface): Tguint32; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:48 ===

function NM_TYPE_SETTING_OVS_INTERFACE: TGType;
function NM_SETTING_OVS_INTERFACE(obj: Pointer): PNMSettingOvsInterface;
function NM_SETTING_OVS_INTERFACE_CLASS(klass: Pointer): PNMSettingOvsInterfaceClass;
function NM_IS_SETTING_OVS_INTERFACE(obj: Pointer): Tgboolean;
function NM_IS_SETTING_OVS_INTERFACE_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_OVS_INTERFACE_GET_CLASS(obj: Pointer): PNMSettingOvsInterfaceClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

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



{$ENDIF read_implementation}
