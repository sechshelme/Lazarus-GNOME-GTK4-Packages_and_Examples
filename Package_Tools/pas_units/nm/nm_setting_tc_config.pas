unit nm_setting_tc_config;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm, nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PNMTCQdisc = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_tc_qdisc_get_type: TGType; cdecl; external libnm;
function nm_tc_qdisc_new(kind: pchar; parent: Tguint32; error: PPGError): PNMTCQdisc; cdecl; external libnm;
procedure nm_tc_qdisc_ref(qdisc: PNMTCQdisc); cdecl; external libnm;
procedure nm_tc_qdisc_unref(qdisc: PNMTCQdisc); cdecl; external libnm;
function nm_tc_qdisc_equal(qdisc: PNMTCQdisc; other: PNMTCQdisc): Tgboolean; cdecl; external libnm;
function nm_tc_qdisc_dup(qdisc: PNMTCQdisc): PNMTCQdisc; cdecl; external libnm;
function nm_tc_qdisc_get_kind(qdisc: PNMTCQdisc): pchar; cdecl; external libnm;
function nm_tc_qdisc_get_handle(qdisc: PNMTCQdisc): Tguint32; cdecl; external libnm;
procedure nm_tc_qdisc_set_handle(qdisc: PNMTCQdisc; handle: Tguint32); cdecl; external libnm;
function nm_tc_qdisc_get_parent(qdisc: PNMTCQdisc): Tguint32; cdecl; external libnm;
function nm_tc_qdisc_get_attribute_names(qdisc: PNMTCQdisc): PPchar; cdecl; external libnm;
function nm_tc_qdisc_get_attribute(qdisc: PNMTCQdisc; name: pchar): PGVariant; cdecl; external libnm;
procedure nm_tc_qdisc_set_attribute(qdisc: PNMTCQdisc; name: pchar; value: PGVariant); cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  PNMTCAction = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_tc_action_get_type: TGType; cdecl; external libnm;
function nm_tc_action_new(kind: pchar; error: PPGError): PNMTCAction; cdecl; external libnm;
procedure nm_tc_action_ref(action: PNMTCAction); cdecl; external libnm;
procedure nm_tc_action_unref(action: PNMTCAction); cdecl; external libnm;
function nm_tc_action_equal(action: PNMTCAction; other: PNMTCAction): Tgboolean; cdecl; external libnm;
function nm_tc_action_dup(action: PNMTCAction): PNMTCAction; cdecl; external libnm;
function nm_tc_action_get_kind(action: PNMTCAction): pchar; cdecl; external libnm;
function nm_tc_action_get_attribute_names(action: PNMTCAction): PPchar; cdecl; external libnm;
function nm_tc_action_get_attribute(action: PNMTCAction; name: pchar): PGVariant; cdecl; external libnm;
procedure nm_tc_action_set_attribute(action: PNMTCAction; name: pchar; value: PGVariant); cdecl; external libnm;
{$ENDIF read_function}{$IFDEF read_struct}
type
  PNMTCTfilter = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_tc_tfilter_get_type: TGType; cdecl; external libnm;
function nm_tc_tfilter_new(kind: pchar; parent: Tguint32; error: PPGError): PNMTCTfilter; cdecl; external libnm;
procedure nm_tc_tfilter_ref(tfilter: PNMTCTfilter); cdecl; external libnm;
procedure nm_tc_tfilter_unref(tfilter: PNMTCTfilter); cdecl; external libnm;
function nm_tc_tfilter_equal(tfilter: PNMTCTfilter; other: PNMTCTfilter): Tgboolean; cdecl; external libnm;
function nm_tc_tfilter_dup(tfilter: PNMTCTfilter): PNMTCTfilter; cdecl; external libnm;
function nm_tc_tfilter_get_kind(tfilter: PNMTCTfilter): pchar; cdecl; external libnm;
function nm_tc_tfilter_get_handle(tfilter: PNMTCTfilter): Tguint32; cdecl; external libnm;
procedure nm_tc_tfilter_set_handle(tfilter: PNMTCTfilter; handle: Tguint32); cdecl; external libnm;
function nm_tc_tfilter_get_parent(tfilter: PNMTCTfilter): Tguint32; cdecl; external libnm;
function nm_tc_tfilter_get_action(tfilter: PNMTCTfilter): PNMTCAction; cdecl; external libnm;
procedure nm_tc_tfilter_set_action(tfilter: PNMTCTfilter; action: PNMTCAction); cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_struct}
const
  NM_SETTING_TC_CONFIG_SETTING_NAME = 'tc';
  NM_SETTING_TC_CONFIG_QDISCS = 'qdiscs';
  NM_SETTING_TC_CONFIG_TFILTERS = 'tfilters';
  {$ENDIF read_struct}

  {$IFDEF read_function}
type
  PNMSettingTCConfig = type Pointer;
  PNMSettingTCConfigClass = type Pointer;
  {$ENDIF read_function}

{$IFDEF read_function}
function nm_setting_tc_config_get_type: TGType; cdecl; external libnm;
function nm_setting_tc_config_new: PNMSetting; cdecl; external libnm;
function nm_setting_tc_config_get_num_qdiscs(setting: PNMSettingTCConfig): Tguint; cdecl; external libnm;
function nm_setting_tc_config_get_qdisc(setting: PNMSettingTCConfig; idx: Tguint): PNMTCQdisc; cdecl; external libnm;
function nm_setting_tc_config_add_qdisc(setting: PNMSettingTCConfig; qdisc: PNMTCQdisc): Tgboolean; cdecl; external libnm;
procedure nm_setting_tc_config_remove_qdisc(setting: PNMSettingTCConfig; idx: Tguint); cdecl; external libnm;
function nm_setting_tc_config_remove_qdisc_by_value(setting: PNMSettingTCConfig; qdisc: PNMTCQdisc): Tgboolean; cdecl; external libnm;
procedure nm_setting_tc_config_clear_qdiscs(setting: PNMSettingTCConfig); cdecl; external libnm;
function nm_setting_tc_config_get_num_tfilters(setting: PNMSettingTCConfig): Tguint; cdecl; external libnm;
function nm_setting_tc_config_get_tfilter(setting: PNMSettingTCConfig; idx: Tguint): PNMTCTfilter; cdecl; external libnm;
function nm_setting_tc_config_add_tfilter(setting: PNMSettingTCConfig; tfilter: PNMTCTfilter): Tgboolean; cdecl; external libnm;
procedure nm_setting_tc_config_remove_tfilter(setting: PNMSettingTCConfig; idx: Tguint); cdecl; external libnm;
function nm_setting_tc_config_remove_tfilter_by_value(setting: PNMSettingTCConfig; tfilter: PNMTCTfilter): Tgboolean; cdecl; external libnm;
procedure nm_setting_tc_config_clear_tfilters(setting: PNMSettingTCConfig); cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:04 ===

function NM_TYPE_SETTING_TC_CONFIG: TGType;
function NM_SETTING_TC_CONFIG(obj: Pointer): PNMSettingTCConfig;
function NM_SETTING_TC_CONFIG_CLASS(klass: Pointer): PNMSettingTCConfigClass;
function NM_IS_SETTING_TC_CONFIG(obj: Pointer): Tgboolean;
function NM_IS_SETTING_TC_CONFIG_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_TC_CONFIG_GET_CLASS(obj: Pointer): PNMSettingTCConfigClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_TC_CONFIG: TGType;
begin
  NM_TYPE_SETTING_TC_CONFIG := nm_setting_tc_config_get_type;
end;

function NM_SETTING_TC_CONFIG(obj: Pointer): PNMSettingTCConfig;
begin
  Result := PNMSettingTCConfig(g_type_check_instance_cast(obj, NM_TYPE_SETTING_TC_CONFIG));
end;

function NM_SETTING_TC_CONFIG_CLASS(klass: Pointer): PNMSettingTCConfigClass;
begin
  Result := PNMSettingTCConfigClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_TC_CONFIG));
end;

function NM_IS_SETTING_TC_CONFIG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_TC_CONFIG);
end;

function NM_IS_SETTING_TC_CONFIG_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_TC_CONFIG);
end;

function NM_SETTING_TC_CONFIG_GET_CLASS(obj: Pointer): PNMSettingTCConfigClass;
begin
  Result := PNMSettingTCConfigClass(PGTypeInstance(obj)^.g_class);
end;



end.
