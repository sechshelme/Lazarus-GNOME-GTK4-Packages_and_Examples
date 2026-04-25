
  {$IFDEF read_enum}
type
  PNMTeamLinkWatcherArpPingFlags = ^TNMTeamLinkWatcherArpPingFlags;
  TNMTeamLinkWatcherArpPingFlags = longint;

const
  NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_NONE = 0;
  NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_VALIDATE_ACTIVE = $2;
  NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_VALIDATE_INACTIVE = $4;
  NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_SEND_ALWAYS = $8;

const
  NM_TEAM_LINK_WATCHER_ETHTOOL = 'ethtool';
  NM_TEAM_LINK_WATCHER_ARP_PING = 'arp_ping';
  NM_TEAM_LINK_WATCHER_NSNA_PING = 'nsna_ping';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMTeamLinkWatcher = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_team_link_watcher_get_type: TGType; cdecl; external libnm;
function nm_team_link_watcher_new_ethtool(delay_up: longint; delay_down: longint; error: PPGError): PNMTeamLinkWatcher; cdecl; external libnm;
function nm_team_link_watcher_new_nsna_ping(init_wait: longint; interval: longint; missed_max: longint; target_host: pchar; error: PPGError): PNMTeamLinkWatcher; cdecl; external libnm;
function nm_team_link_watcher_new_arp_ping(init_wait: longint; interval: longint; missed_max: longint; target_host: pchar; source_host: pchar;
  flags: TNMTeamLinkWatcherArpPingFlags; error: PPGError): PNMTeamLinkWatcher; cdecl; external libnm;
function nm_team_link_watcher_new_arp_ping2(init_wait: longint; interval: longint; missed_max: longint; vlanid: longint; target_host: pchar;
  source_host: pchar; flags: TNMTeamLinkWatcherArpPingFlags; error: PPGError): PNMTeamLinkWatcher; cdecl; external libnm;
procedure nm_team_link_watcher_ref(watcher: PNMTeamLinkWatcher); cdecl; external libnm;
procedure nm_team_link_watcher_unref(watcher: PNMTeamLinkWatcher); cdecl; external libnm;
function nm_team_link_watcher_equal(watcher: PNMTeamLinkWatcher; other: PNMTeamLinkWatcher): Tgboolean; cdecl; external libnm;
function nm_team_link_watcher_dup(watcher: PNMTeamLinkWatcher): PNMTeamLinkWatcher; cdecl; external libnm;
function nm_team_link_watcher_get_name(watcher: PNMTeamLinkWatcher): pchar; cdecl; external libnm;
function nm_team_link_watcher_get_delay_up(watcher: PNMTeamLinkWatcher): longint; cdecl; external libnm;
function nm_team_link_watcher_get_delay_down(watcher: PNMTeamLinkWatcher): longint; cdecl; external libnm;
function nm_team_link_watcher_get_init_wait(watcher: PNMTeamLinkWatcher): longint; cdecl; external libnm;
function nm_team_link_watcher_get_interval(watcher: PNMTeamLinkWatcher): longint; cdecl; external libnm;
function nm_team_link_watcher_get_missed_max(watcher: PNMTeamLinkWatcher): longint; cdecl; external libnm;
function nm_team_link_watcher_get_target_host(watcher: PNMTeamLinkWatcher): pchar; cdecl; external libnm;
function nm_team_link_watcher_get_source_host(watcher: PNMTeamLinkWatcher): pchar; cdecl; external libnm;
function nm_team_link_watcher_get_flags(watcher: PNMTeamLinkWatcher): TNMTeamLinkWatcherArpPingFlags; cdecl; external libnm;
function nm_team_link_watcher_get_vlanid(watcher: PNMTeamLinkWatcher): longint; cdecl; external libnm;
{$ENDIF read_function}

{$IFDEF read_enum}
const
  NM_SETTING_TEAM_SETTING_NAME = 'team';
  NM_SETTING_TEAM_CONFIG = 'config';
  NM_SETTING_TEAM_NOTIFY_PEERS_COUNT = 'notify-peers-count';
  NM_SETTING_TEAM_NOTIFY_PEERS_INTERVAL = 'notify-peers-interval';
  NM_SETTING_TEAM_MCAST_REJOIN_COUNT = 'mcast-rejoin-count';
  NM_SETTING_TEAM_MCAST_REJOIN_INTERVAL = 'mcast-rejoin-interval';
  NM_SETTING_TEAM_RUNNER = 'runner';
  NM_SETTING_TEAM_RUNNER_HWADDR_POLICY = 'runner-hwaddr-policy';
  NM_SETTING_TEAM_RUNNER_TX_HASH = 'runner-tx-hash';
  NM_SETTING_TEAM_RUNNER_TX_BALANCER = 'runner-tx-balancer';
  NM_SETTING_TEAM_RUNNER_TX_BALANCER_INTERVAL = 'runner-tx-balancer-interval';
  NM_SETTING_TEAM_RUNNER_ACTIVE = 'runner-active';
  NM_SETTING_TEAM_RUNNER_FAST_RATE = 'runner-fast-rate';
  NM_SETTING_TEAM_RUNNER_SYS_PRIO = 'runner-sys-prio';
  NM_SETTING_TEAM_RUNNER_MIN_PORTS = 'runner-min-ports';
  NM_SETTING_TEAM_RUNNER_AGG_SELECT_POLICY = 'runner-agg-select-policy';
  NM_SETTING_TEAM_LINK_WATCHERS = 'link-watchers';
  NM_SETTING_TEAM_RUNNER_BROADCAST = 'broadcast';
  NM_SETTING_TEAM_RUNNER_ROUNDROBIN = 'roundrobin';
  NM_SETTING_TEAM_RUNNER_RANDOM = 'random';
  NM_SETTING_TEAM_RUNNER_ACTIVEBACKUP = 'activebackup';
  NM_SETTING_TEAM_RUNNER_LOADBALANCE = 'loadbalance';
  NM_SETTING_TEAM_RUNNER_LACP = 'lacp';
  NM_SETTING_TEAM_RUNNER_HWADDR_POLICY_SAME_ALL = 'same_all';
  NM_SETTING_TEAM_RUNNER_HWADDR_POLICY_BY_ACTIVE = 'by_active';
  NM_SETTING_TEAM_RUNNER_HWADDR_POLICY_ONLY_ACTIVE = 'only_active';
  NM_SETTING_TEAM_RUNNER_AGG_SELECT_POLICY_LACP_PRIO = 'lacp_prio';
  NM_SETTING_TEAM_RUNNER_AGG_SELECT_POLICY_LACP_PRIO_STABLE = 'lacp_prio_stable';
  NM_SETTING_TEAM_RUNNER_AGG_SELECT_POLICY_BANDWIDTH = 'bandwidth';
  NM_SETTING_TEAM_RUNNER_AGG_SELECT_POLICY_COUNT = 'count';
  NM_SETTING_TEAM_RUNNER_AGG_SELECT_POLICY_PORT_CONFIG = 'port_config';
  NM_SETTING_TEAM_NOTIFY_PEERS_COUNT_ACTIVEBACKUP_DEFAULT = 1;
  NM_SETTING_TEAM_NOTIFY_MCAST_COUNT_ACTIVEBACKUP_DEFAULT = 1;
  NM_SETTING_TEAM_RUNNER_DEFAULT = NM_SETTING_TEAM_RUNNER_ROUNDROBIN;
  NM_SETTING_TEAM_RUNNER_HWADDR_POLICY_DEFAULT = NM_SETTING_TEAM_RUNNER_HWADDR_POLICY_SAME_ALL;
  NM_SETTING_TEAM_RUNNER_TX_BALANCER_INTERVAL_DEFAULT = 50;
  NM_SETTING_TEAM_RUNNER_SYS_PRIO_DEFAULT = 65535;
  NM_SETTING_TEAM_RUNNER_AGG_SELECT_POLICY_DEFAULT = NM_SETTING_TEAM_RUNNER_AGG_SELECT_POLICY_LACP_PRIO;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PNMSettingTeam = type Pointer;
  PNMSettingTeamClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function nm_setting_team_get_type: TGType; cdecl; external libnm;
function nm_setting_team_new: PNMSetting; cdecl; external libnm;
function nm_setting_team_get_config(setting: PNMSettingTeam): pchar; cdecl; external libnm;
function nm_setting_team_get_notify_peers_count(setting: PNMSettingTeam): longint; cdecl; external libnm;
function nm_setting_team_get_notify_peers_interval(setting: PNMSettingTeam): longint; cdecl; external libnm;
function nm_setting_team_get_mcast_rejoin_count(setting: PNMSettingTeam): longint; cdecl; external libnm;
function nm_setting_team_get_mcast_rejoin_interval(setting: PNMSettingTeam): longint; cdecl; external libnm;
function nm_setting_team_get_runner(setting: PNMSettingTeam): pchar; cdecl; external libnm;
function nm_setting_team_get_runner_hwaddr_policy(setting: PNMSettingTeam): pchar; cdecl; external libnm;
function nm_setting_team_get_runner_tx_balancer(setting: PNMSettingTeam): pchar; cdecl; external libnm;
function nm_setting_team_get_runner_tx_balancer_interval(setting: PNMSettingTeam): longint; cdecl; external libnm;
function nm_setting_team_get_runner_active(setting: PNMSettingTeam): Tgboolean; cdecl; external libnm;
function nm_setting_team_get_runner_fast_rate(setting: PNMSettingTeam): Tgboolean; cdecl; external libnm;
function nm_setting_team_get_runner_sys_prio(setting: PNMSettingTeam): longint; cdecl; external libnm;
function nm_setting_team_get_runner_min_ports(setting: PNMSettingTeam): longint; cdecl; external libnm;
function nm_setting_team_get_runner_agg_select_policy(setting: PNMSettingTeam): pchar; cdecl; external libnm;
function nm_setting_team_remove_runner_tx_hash_by_value(setting: PNMSettingTeam; txhash: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_team_get_num_runner_tx_hash(setting: PNMSettingTeam): Tguint; cdecl; external libnm;
function nm_setting_team_get_runner_tx_hash(setting: PNMSettingTeam; idx: Tguint): pchar; cdecl; external libnm;
procedure nm_setting_team_remove_runner_tx_hash(setting: PNMSettingTeam; idx: Tguint); cdecl; external libnm;
function nm_setting_team_add_runner_tx_hash(setting: PNMSettingTeam; txhash: pchar): Tgboolean; cdecl; external libnm;
function nm_setting_team_get_num_link_watchers(setting: PNMSettingTeam): Tguint; cdecl; external libnm;
function nm_setting_team_get_link_watcher(setting: PNMSettingTeam; idx: Tguint): PNMTeamLinkWatcher; cdecl; external libnm;
function nm_setting_team_add_link_watcher(setting: PNMSettingTeam; link_watcher: PNMTeamLinkWatcher): Tgboolean; cdecl; external libnm;
procedure nm_setting_team_remove_link_watcher(setting: PNMSettingTeam; idx: Tguint); cdecl; external libnm;
function nm_setting_team_remove_link_watcher_by_value(setting: PNMSettingTeam; link_watcher: PNMTeamLinkWatcher): Tgboolean; cdecl; external libnm;
procedure nm_setting_team_clear_link_watchers(setting: PNMSettingTeam); cdecl; external libnm;

// === Konventiert am: 19-4-26 19:25:00 ===

function NM_TYPE_SETTING_TEAM: TGType;
function NM_SETTING_TEAM(obj: Pointer): PNMSettingTeam;
function NM_SETTING_TEAM_CLASS(klass: Pointer): PNMSettingTeamClass;
function NM_IS_SETTING_TEAM(obj: Pointer): Tgboolean;
function NM_IS_SETTING_TEAM_CLASS(klass: Pointer): Tgboolean;
function NM_SETTING_TEAM_GET_CLASS(obj: Pointer): PNMSettingTeamClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function NM_TYPE_SETTING_TEAM: TGType;
begin
  NM_TYPE_SETTING_TEAM := nm_setting_team_get_type;
end;

function NM_SETTING_TEAM(obj: Pointer): PNMSettingTeam;
begin
  Result := PNMSettingTeam(g_type_check_instance_cast(obj, NM_TYPE_SETTING_TEAM));
end;

function NM_SETTING_TEAM_CLASS(klass: Pointer): PNMSettingTeamClass;
begin
  Result := PNMSettingTeamClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_TEAM));
end;

function NM_IS_SETTING_TEAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_SETTING_TEAM);
end;

function NM_IS_SETTING_TEAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_SETTING_TEAM);
end;

function NM_SETTING_TEAM_GET_CLASS(obj: Pointer): PNMSettingTeamClass;
begin
  Result := PNMSettingTeamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
