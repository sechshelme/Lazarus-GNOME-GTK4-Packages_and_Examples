
unit nm-setting-ovs-dpdk;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ovs-dpdk.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ovs-dpdk.h
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
PNMSettingOvsDpdk  = ^NMSettingOvsDpdk;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2019 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_DPDK_H__}
{$define __NM_SETTING_OVS_DPDK_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_DPDK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_DPDK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_DPDK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_DPDK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_DPDK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_DPDK_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_OVS_DPDK_SETTING_NAME = 'ovs-dpdk';  
  NM_SETTING_OVS_DPDK_DEVARGS = 'devargs';  
  NM_SETTING_OVS_DPDK_N_RXQ = 'n-rxq';  
  NM_SETTING_OVS_DPDK_N_RXQ_DESC = 'n-rxq-desc';  
  NM_SETTING_OVS_DPDK_N_TXQ_DESC = 'n-txq-desc';  
type

function nm_setting_ovs_dpdk_get_type:TGType;cdecl;external;
function nm_setting_ovs_dpdk_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_dpdk_get_devargs(self:PNMSettingOvsDpdk):Pchar;cdecl;external;
function nm_setting_ovs_dpdk_get_n_rxq(self:PNMSettingOvsDpdk):Tguint32;cdecl;external;
function nm_setting_ovs_dpdk_get_n_rxq_desc(self:PNMSettingOvsDpdk):Tguint32;cdecl;external;
function nm_setting_ovs_dpdk_get_n_txq_desc(self:PNMSettingOvsDpdk):Tguint32;cdecl;external;
{$endif}
{ __NM_SETTING_OVS_DPDK_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_DPDK : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_OVS_DPDK:=nm_setting_ovs_dpdk_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_DPDK(obj : longint) : longint;
begin
  NM_SETTING_OVS_DPDK:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_OVS_DPDK,NMSettingOvsDpdk);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_DPDK_CLASS(klass : longint) : longint;
begin
  NM_SETTING_OVS_DPDK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_OVS_DPDKCONFIG,NMSettingOvsDpdkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_DPDK(obj : longint) : longint;
begin
  NM_IS_SETTING_OVS_DPDK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_OVS_DPDK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_DPDK_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_OVS_DPDK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_OVS_DPDK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_DPDK_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_OVS_DPDK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_OVS_DPDK,NMSettingOvsDpdkClass);
end;


end.
