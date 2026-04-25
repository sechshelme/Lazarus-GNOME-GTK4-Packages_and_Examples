
  {$IFDEF read_enum}
const
  NM_SETTING_PPP_SETTING_NAME = 'ppp';
  NM_SETTING_PPP_NOAUTH = 'noauth';
  NM_SETTING_PPP_REFUSE_EAP = 'refuse-eap';
  NM_SETTING_PPP_REFUSE_PAP = 'refuse-pap';
  NM_SETTING_PPP_REFUSE_CHAP = 'refuse-chap';
  NM_SETTING_PPP_REFUSE_MSCHAP = 'refuse-mschap';
  NM_SETTING_PPP_REFUSE_MSCHAPV2 = 'refuse-mschapv2';
  NM_SETTING_PPP_NOBSDCOMP = 'nobsdcomp';
  NM_SETTING_PPP_NODEFLATE = 'nodeflate';
  NM_SETTING_PPP_NO_VJ_COMP = 'no-vj-comp';
  NM_SETTING_PPP_REQUIRE_MPPE = 'require-mppe';
  NM_SETTING_PPP_REQUIRE_MPPE_128 = 'require-mppe-128';
  NM_SETTING_PPP_MPPE_STATEFUL = 'mppe-stateful';
  NM_SETTING_PPP_CRTSCTS = 'crtscts';
  NM_SETTING_PPP_BAUD = 'baud';
  NM_SETTING_PPP_MRU = 'mru';
  NM_SETTING_PPP_MTU = 'mtu';
  NM_SETTING_PPP_LCP_ECHO_FAILURE = 'lcp-echo-failure';
  NM_SETTING_PPP_LCP_ECHO_INTERVAL = 'lcp-echo-interval';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingPpp = type Pointer;
  PNMSettingPppClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_ppp_get_type: TGType; cdecl; external libnm;
function nm_setting_ppp_new: PNMSetting; cdecl; external libnm;
function nm_setting_ppp_get_noauth(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_refuse_eap(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_refuse_pap(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_refuse_chap(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_refuse_mschap(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_refuse_mschapv2(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_nobsdcomp(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_nodeflate(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_no_vj_comp(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_require_mppe(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_require_mppe_128(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_mppe_stateful(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_crtscts(setting: PNMSettingPpp): Tgboolean; cdecl; external libnm;
function nm_setting_ppp_get_baud(setting: PNMSettingPpp): Tguint32; cdecl; external libnm;
function nm_setting_ppp_get_mru(setting: PNMSettingPpp): Tguint32; cdecl; external libnm;
function nm_setting_ppp_get_mtu(setting: PNMSettingPpp): Tguint32; cdecl; external libnm;
function nm_setting_ppp_get_lcp_echo_failure(setting: PNMSettingPpp): Tguint32; cdecl; external libnm;
function nm_setting_ppp_get_lcp_echo_interval(setting: PNMSettingPpp): Tguint32; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:28 ===

function NM_TYPE_SETTING_PPP: TGType;
function NM_SETTING_PPP(obj: Pointer): PNMSettingPpp;
function NM_SETTING_PPP_CLASS(klass: Pointer): PNMSettingPppClass;
function NM_IS_SETTING_PPP(obj: Pointer): Tgboolean;
function NM_IS_SETTING_PPP_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_PPP_GET_CLASS(obj: Pointer): PNMSettingPppClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_PPP: TGType;
begin
  NM_TYPE_SETTING_PPP := nm_setting_ppp_get_type;
end;

function NM_SETTING_PPP(obj: Pointer): PNMSettingPpp;
begin
  Result := PNMSettingPpp(g_type_check_instance_cast(obj, NM_TYPE_SETTING_PPP));
end;

function NM_SETTING_PPP_CLASS(klass: Pointer): PNMSettingPppClass;
begin
  Result := PNMSettingPppClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_PPP));
end;

function NM_IS_SETTING_PPP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_PPP);
end;

function NM_IS_SETTING_PPP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_PPP);
end;

function NM_SETTING_PPP_GET_CLASS(obj: Pointer): PNMSettingPppClass;
begin
  Result := PNMSettingPppClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
