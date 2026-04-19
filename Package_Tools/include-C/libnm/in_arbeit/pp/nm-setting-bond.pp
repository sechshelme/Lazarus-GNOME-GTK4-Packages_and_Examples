
unit nm-setting-bond;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-bond.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-bond
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
PNMSetting  = ^NMSetting;
PNMSettingBond  = ^NMSettingBond;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 - 2013 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_BOND_H__}
{$define __NM_SETTING_BOND_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_BOND : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BOND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BOND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_BOND_SETTING_NAME = 'bond';  
  NM_SETTING_BOND_OPTIONS = 'options';  
{ Valid options for the 'options' property  }
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
type

function nm_setting_bond_get_type:TGType;cdecl;external;
function nm_setting_bond_new:PNMSetting;cdecl;external;
function nm_setting_bond_get_num_options(setting:PNMSettingBond):Tguint32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_bond_get_option(setting:PNMSettingBond; idx:Tguint32; out_name:PPchar; out_value:PPchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_bond_get_option_by_name(setting:PNMSettingBond; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_bond_add_option(setting:PNMSettingBond; name:Pchar; value:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_bond_remove_option(setting:PNMSettingBond; name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_bond_validate_option(name:Pchar; value:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_bond_get_valid_options(setting:PNMSettingBond):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_bond_get_option_default(setting:PNMSettingBond; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_bond_get_option_normalized(setting:PNMSettingBond; name:Pchar):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_BOND_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_BOND : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_BOND:=nm_setting_bond_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND(obj : longint) : longint;
begin
  NM_SETTING_BOND:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_BOND,NMSettingBond);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_CLASS(klass : longint) : longint;
begin
  NM_SETTING_BOND_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_BOND,NMSettingBondClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BOND(obj : longint) : longint;
begin
  NM_IS_SETTING_BOND:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_BOND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BOND_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_BOND_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_BOND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_BOND_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_BOND,NMSettingBondClass);
end;


end.
