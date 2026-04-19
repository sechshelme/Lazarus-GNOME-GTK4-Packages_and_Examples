
unit nm-setting-team;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-team.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-team.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGError  = ^GError;
PNMSetting  = ^NMSetting;
PNMSettingTeam  = ^NMSettingTeam;
PNMTeamLinkWatcher  = ^NMTeamLinkWatcher;
PNMTeamLinkWatcherArpPingFlags  = ^NMTeamLinkWatcherArpPingFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 Jiri Pirko <jiri@resnulli.us>
  }
{$ifndef __NM_SETTING_TEAM_H__}
{$define __NM_SETTING_TEAM_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{*
 * NMTeamLinkWatcherArpPingFlags:
 * @NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_NONE: no one among the arp_ping link watcher
 *    boolean options ('validate_active', 'validate_inactive', 'send_always') is
 *    enabled (set to true).
 * @NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_VALIDATE_ACTIVE: the arp_ping link watcher
 *    option 'validate_active' is enabled (set to true).
 * @NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_VALIDATE_INACTIVE: the arp_ping link watcher
 *    option 'validate_inactive' is enabled (set to true).
 * @NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_SEND_ALWAYS: the arp_ping link watcher option
 *    'send_always' is enabled (set to true).
 *
 * Since: 1.12
  }
{< flags > }{< skip > }
type
  PNMTeamLinkWatcherArpPingFlags = ^TNMTeamLinkWatcherArpPingFlags;
  TNMTeamLinkWatcherArpPingFlags =  Longint;
  Const
    NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_NONE = 0;
    NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_VALIDATE_ACTIVE = $2;
    NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_VALIDATE_INACTIVE = $4;
    NM_TEAM_LINK_WATCHER_ARP_PING_FLAG_SEND_ALWAYS = $8;
;
  NM_TEAM_LINK_WATCHER_ETHTOOL = 'ethtool';  
  NM_TEAM_LINK_WATCHER_ARP_PING = 'arp_ping';  
  NM_TEAM_LINK_WATCHER_NSNA_PING = 'nsna_ping';  
type

function nm_team_link_watcher_get_type:TGType;cdecl;external;
function nm_team_link_watcher_new_ethtool(delay_up:longint; delay_down:longint; error:PPGError):PNMTeamLinkWatcher;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_new_nsna_ping(init_wait:longint; interval:longint; missed_max:longint; target_host:Pchar; error:PPGError):PNMTeamLinkWatcher;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_team_link_watcher_new_arp_ping(init_wait:longint; interval:longint; missed_max:longint; target_host:Pchar; source_host:Pchar; 
           flags:TNMTeamLinkWatcherArpPingFlags; error:PPGError):PNMTeamLinkWatcher;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_team_link_watcher_new_arp_ping2(init_wait:longint; interval:longint; missed_max:longint; vlanid:longint; target_host:Pchar; 
           source_host:Pchar; flags:TNMTeamLinkWatcherArpPingFlags; error:PPGError):PNMTeamLinkWatcher;cdecl;external;
procedure nm_team_link_watcher_ref(watcher:PNMTeamLinkWatcher);cdecl;external;
procedure nm_team_link_watcher_unref(watcher:PNMTeamLinkWatcher);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_team_link_watcher_equal(watcher:PNMTeamLinkWatcher; other:PNMTeamLinkWatcher):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_dup(watcher:PNMTeamLinkWatcher):PNMTeamLinkWatcher;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_team_link_watcher_get_name(watcher:PNMTeamLinkWatcher):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_get_delay_up(watcher:PNMTeamLinkWatcher):longint;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_get_delay_down(watcher:PNMTeamLinkWatcher):longint;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_get_init_wait(watcher:PNMTeamLinkWatcher):longint;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_get_interval(watcher:PNMTeamLinkWatcher):longint;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_get_missed_max(watcher:PNMTeamLinkWatcher):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_team_link_watcher_get_target_host(watcher:PNMTeamLinkWatcher):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_team_link_watcher_get_source_host(watcher:PNMTeamLinkWatcher):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_get_flags(watcher:PNMTeamLinkWatcher):TNMTeamLinkWatcherArpPingFlags;cdecl;external;
(* Const before type ignored *)
function nm_team_link_watcher_get_vlanid(watcher:PNMTeamLinkWatcher):longint;cdecl;external;
{ was #define dname def_expr }
function NM_TYPE_SETTING_TEAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TEAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TEAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_GET_CLASS(obj : longint) : longint;

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
type

function nm_setting_team_get_type:TGType;cdecl;external;
function nm_setting_team_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_team_get_config(setting:PNMSettingTeam):Pchar;cdecl;external;
function nm_setting_team_get_notify_peers_count(setting:PNMSettingTeam):longint;cdecl;external;
function nm_setting_team_get_notify_peers_interval(setting:PNMSettingTeam):longint;cdecl;external;
function nm_setting_team_get_mcast_rejoin_count(setting:PNMSettingTeam):longint;cdecl;external;
function nm_setting_team_get_mcast_rejoin_interval(setting:PNMSettingTeam):longint;cdecl;external;
(* Const before type ignored *)
function nm_setting_team_get_runner(setting:PNMSettingTeam):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_team_get_runner_hwaddr_policy(setting:PNMSettingTeam):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_team_get_runner_tx_balancer(setting:PNMSettingTeam):Pchar;cdecl;external;
function nm_setting_team_get_runner_tx_balancer_interval(setting:PNMSettingTeam):longint;cdecl;external;
function nm_setting_team_get_runner_active(setting:PNMSettingTeam):Tgboolean;cdecl;external;
function nm_setting_team_get_runner_fast_rate(setting:PNMSettingTeam):Tgboolean;cdecl;external;
function nm_setting_team_get_runner_sys_prio(setting:PNMSettingTeam):longint;cdecl;external;
function nm_setting_team_get_runner_min_ports(setting:PNMSettingTeam):longint;cdecl;external;
(* Const before type ignored *)
function nm_setting_team_get_runner_agg_select_policy(setting:PNMSettingTeam):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_team_remove_runner_tx_hash_by_value(setting:PNMSettingTeam; txhash:Pchar):Tgboolean;cdecl;external;
function nm_setting_team_get_num_runner_tx_hash(setting:PNMSettingTeam):Tguint;cdecl;external;
(* Const before type ignored *)
function nm_setting_team_get_runner_tx_hash(setting:PNMSettingTeam; idx:Tguint):Pchar;cdecl;external;
procedure nm_setting_team_remove_runner_tx_hash(setting:PNMSettingTeam; idx:Tguint);cdecl;external;
(* Const before type ignored *)
function nm_setting_team_add_runner_tx_hash(setting:PNMSettingTeam; txhash:Pchar):Tgboolean;cdecl;external;
function nm_setting_team_get_num_link_watchers(setting:PNMSettingTeam):Tguint;cdecl;external;
function nm_setting_team_get_link_watcher(setting:PNMSettingTeam; idx:Tguint):PNMTeamLinkWatcher;cdecl;external;
function nm_setting_team_add_link_watcher(setting:PNMSettingTeam; link_watcher:PNMTeamLinkWatcher):Tgboolean;cdecl;external;
procedure nm_setting_team_remove_link_watcher(setting:PNMSettingTeam; idx:Tguint);cdecl;external;
function nm_setting_team_remove_link_watcher_by_value(setting:PNMSettingTeam; link_watcher:PNMTeamLinkWatcher):Tgboolean;cdecl;external;
procedure nm_setting_team_clear_link_watchers(setting:PNMSettingTeam);cdecl;external;
{$endif}
{ __NM_SETTING_TEAM_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_TEAM : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_TEAM:=nm_setting_team_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM(obj : longint) : longint;
begin
  NM_SETTING_TEAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_TEAM,NMSettingTeam);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_CLASS(klass : longint) : longint;
begin
  NM_SETTING_TEAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_TEAM,NMSettingTeamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TEAM(obj : longint) : longint;
begin
  NM_IS_SETTING_TEAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_TEAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TEAM_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_TEAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_TEAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_TEAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_TEAM,NMSettingTeamClass);
end;


end.
