unit nm_setting_infiniband;

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_SETTING_INFINIBAND_SETTING_NAME = 'infiniband';
  NM_SETTING_INFINIBAND_MAC_ADDRESS = 'mac-address';
  NM_SETTING_INFINIBAND_MTU = 'mtu';
  NM_SETTING_INFINIBAND_TRANSPORT_MODE = 'transport-mode';
  NM_SETTING_INFINIBAND_P_KEY = 'p-key';
  NM_SETTING_INFINIBAND_PARENT = 'parent';

type
  PNMSettingInfiniband = type Pointer;
  PNMSettingInfinibandClass = type Pointer;

function nm_setting_infiniband_get_type: TGType; cdecl; external libnm;
function nm_setting_infiniband_new: PNMSetting; cdecl; external libnm;
function nm_setting_infiniband_get_mac_address(setting: PNMSettingInfiniband): pchar; cdecl; external libnm;
function nm_setting_infiniband_get_mtu(setting: PNMSettingInfiniband): Tguint32; cdecl; external libnm;
function nm_setting_infiniband_get_transport_mode(setting: PNMSettingInfiniband): pchar; cdecl; external libnm;
function nm_setting_infiniband_get_p_key(setting: PNMSettingInfiniband): longint; cdecl; external libnm;
function nm_setting_infiniband_get_parent(setting: PNMSettingInfiniband): pchar; cdecl; external libnm;
function nm_setting_infiniband_get_virtual_interface_name(setting: PNMSettingInfiniband): pchar; cdecl; external libnm;

// === Konventiert am: 5-8-26 19:43:56 ===

function NM_TYPE_SETTING_INFINIBAND: TGType;
function NM_SETTING_INFINIBAND(obj: Pointer): PNMSettingInfiniband;
function NM_SETTING_INFINIBAND_CLASS(klass: Pointer): PNMSettingInfinibandClass;
function NM_IS_SETTING_INFINIBAND(obj: Pointer): Tgboolean;
function NM_IS_SETTING_INFINIBAND_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_INFINIBAND_GET_CLASS(obj: Pointer): PNMSettingInfinibandClass;

implementation

function NM_TYPE_SETTING_INFINIBAND: TGType;
begin
  NM_TYPE_SETTING_INFINIBAND := nm_setting_infiniband_get_type;
end;

function NM_SETTING_INFINIBAND(obj: Pointer): PNMSettingInfiniband;
begin
  Result := PNMSettingInfiniband(g_type_check_instance_cast(obj, NM_TYPE_SETTING_INFINIBAND));
end;

function NM_SETTING_INFINIBAND_CLASS(klass: Pointer): PNMSettingInfinibandClass;
begin
  Result := PNMSettingInfinibandClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_INFINIBAND));
end;

function NM_IS_SETTING_INFINIBAND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_INFINIBAND);
end;

function NM_IS_SETTING_INFINIBAND_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_INFINIBAND);
end;

function NM_SETTING_INFINIBAND_GET_CLASS(obj: Pointer): PNMSettingInfinibandClass;
begin
  Result := PNMSettingInfinibandClass(PGTypeInstance(obj)^.g_class);
end;



end.
