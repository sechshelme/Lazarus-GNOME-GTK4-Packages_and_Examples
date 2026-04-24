unit nm_setting_bond;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_nm,nm_setting;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  NM_SETTING_BOND_SETTING_NAME = 'bond';
  NM_SETTING_BOND_OPTIONS = 'options';
  NM_SETTING_BOND_OPTION_MODE = 'mode';
  NM_SETTING_BOND_OPTION_MIIMON = 'miimon';
  NM_SETTING_BOND_OPTION_DOWNDELAY = 'downdelay';
  NM_SETTING_BOND_OPTION_UPDELAY = 'updelay';
  NM_SETTING_BOND_OPTION_ARP_INTERVAL = 'arp_interval';
  NM_SETTING_BOND_OPTION_ARP_IP_TARGET = 'arp_ip_target';
  NM_SETTING_BOND_OPTION_ARP_VALIDATE = 'arp_validate';
  NM_SETTING_BOND_OPTION_PRIMARY = 'primary';
  NM_SETTING_BOND_OPTION_BALANCE_SLB = 'balance-slb';
  NM_SETTING_BOND_OPTION_PRIMARY_RESELECT = 'primary_reselect';
  NM_SETTING_BOND_OPTION_FAIL_OVER_MAC = 'fail_over_mac';
  NM_SETTING_BOND_OPTION_USE_CARRIER = 'use_carrier';
  NM_SETTING_BOND_OPTION_AD_SELECT = 'ad_select';
  NM_SETTING_BOND_OPTION_XMIT_HASH_POLICY = 'xmit_hash_policy';
  NM_SETTING_BOND_OPTION_RESEND_IGMP = 'resend_igmp';
  NM_SETTING_BOND_OPTION_LACP_RATE = 'lacp_rate';
  NM_SETTING_BOND_OPTION_ACTIVE_SLAVE = 'active_slave';
  NM_SETTING_BOND_OPTION_AD_ACTOR_SYS_PRIO = 'ad_actor_sys_prio';
  NM_SETTING_BOND_OPTION_AD_ACTOR_SYSTEM = 'ad_actor_system';
  NM_SETTING_BOND_OPTION_AD_USER_PORT_KEY = 'ad_user_port_key';
  NM_SETTING_BOND_OPTION_ALL_SLAVES_ACTIVE = 'all_slaves_active';
  NM_SETTING_BOND_OPTION_ARP_ALL_TARGETS = 'arp_all_targets';
  NM_SETTING_BOND_OPTION_MIN_LINKS = 'min_links';
  NM_SETTING_BOND_OPTION_NUM_GRAT_ARP = 'num_grat_arp';
  NM_SETTING_BOND_OPTION_NUM_UNSOL_NA = 'num_unsol_na';
  NM_SETTING_BOND_OPTION_PACKETS_PER_SLAVE = 'packets_per_slave';
  NM_SETTING_BOND_OPTION_TLB_DYNAMIC_LB = 'tlb_dynamic_lb';
  NM_SETTING_BOND_OPTION_LP_INTERVAL = 'lp_interval';
  NM_SETTING_BOND_OPTION_PEER_NOTIF_DELAY = 'peer_notif_delay';
  NM_SETTING_BOND_OPTION_ARP_MISSED_MAX = 'arp_missed_max';
  NM_SETTING_BOND_OPTION_LACP_ACTIVE = 'lacp_active';
  NM_SETTING_BOND_OPTION_NS_IP6_TARGET = 'ns_ip6_target';
  {$ENDIF read_enum}
  {$IFDEF read_struct}
type
  PNMSettingBond = type Pointer;
  PNMSettingBondClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_bond_get_type: TGType; cdecl; external libnm;
function nm_setting_bond_new: PNMSetting; cdecl; external libnm;
function nm_setting_bond_get_num_options(setting: PNMSettingBond): Tguint32; cdecl; external libnm;
function nm_setting_bond_get_option(setting: PNMSettingBond; idx: Tguint32; out_name: PPchar; out_value: PPchar): Tgboolean; cdecl; external libnm;
function nm_setting_bond_get_option_by_name(setting: PNMSettingBond; name: pchar): pchar; cdecl; external libnm;
function nm_setting_bond_add_option(setting: PNMSettingBond; name: pchar; value: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_bond_remove_option(setting: PNMSettingBond; name: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_bond_validate_option(name: pchar; value: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_bond_get_valid_options(setting: PNMSettingBond): PPchar; cdecl; external libnm;
function nm_setting_bond_get_option_default(setting: PNMSettingBond; name: pchar): pchar; cdecl; external libnm;
function nm_setting_bond_get_option_normalized(setting: PNMSettingBond; name: pchar): pchar; cdecl; external libnm;

// === Konventiert am: 19-4-26 19:28:02 ===

function NM_TYPE_SETTING_BOND: TGType;
function NM_SETTING_BOND(obj: Pointer): PNMSettingBond;
function NM_SETTING_BOND_CLASS(klass: Pointer): PNMSettingBondClass;
function NM_IS_SETTING_BOND(obj: Pointer): Tgboolean;
function NM_IS_SETTING_BOND_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_BOND_GET_CLASS(obj: Pointer): PNMSettingBondClass;
{$ENDIF read_function}

implementation

function NM_TYPE_SETTING_BOND: TGType;
begin
  NM_TYPE_SETTING_BOND := nm_setting_bond_get_type;
end;

function NM_SETTING_BOND(obj: Pointer): PNMSettingBond;
begin
  Result := PNMSettingBond(g_type_check_instance_cast(obj, NM_TYPE_SETTING_BOND));
end;

function NM_SETTING_BOND_CLASS(klass: Pointer): PNMSettingBondClass;
begin
  Result := PNMSettingBondClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_BOND));
end;

function NM_IS_SETTING_BOND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_BOND);
end;

function NM_IS_SETTING_BOND_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_BOND);
end;

function NM_SETTING_BOND_GET_CLASS(obj: Pointer): PNMSettingBondClass;
begin
  Result := PNMSettingBondClass(PGTypeInstance(obj)^.g_class);
end;



end.
