
unit nm-setting-ppp;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ppp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ppp.h
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
PNMSetting  = ^NMSetting;
PNMSettingPpp  = ^NMSettingPpp;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_PPP_H__}
{$define __NM_SETTING_PPP_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_PPP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PPP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PPP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPP_GET_CLASS(obj : longint) : longint;

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
type

function nm_setting_ppp_get_type:TGType;cdecl;external;
function nm_setting_ppp_new:PNMSetting;cdecl;external;
function nm_setting_ppp_get_noauth(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_refuse_eap(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_refuse_pap(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_refuse_chap(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_refuse_mschap(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_refuse_mschapv2(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_nobsdcomp(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_nodeflate(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_no_vj_comp(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_require_mppe(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_require_mppe_128(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_mppe_stateful(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_crtscts(setting:PNMSettingPpp):Tgboolean;cdecl;external;
function nm_setting_ppp_get_baud(setting:PNMSettingPpp):Tguint32;cdecl;external;
function nm_setting_ppp_get_mru(setting:PNMSettingPpp):Tguint32;cdecl;external;
function nm_setting_ppp_get_mtu(setting:PNMSettingPpp):Tguint32;cdecl;external;
function nm_setting_ppp_get_lcp_echo_failure(setting:PNMSettingPpp):Tguint32;cdecl;external;
function nm_setting_ppp_get_lcp_echo_interval(setting:PNMSettingPpp):Tguint32;cdecl;external;
{$endif}
{ __NM_SETTING_PPP_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_PPP : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_PPP:=nm_setting_ppp_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPP(obj : longint) : longint;
begin
  NM_SETTING_PPP:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_PPP,NMSettingPpp);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPP_CLASS(klass : longint) : longint;
begin
  NM_SETTING_PPP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_PPP,NMSettingPppClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PPP(obj : longint) : longint;
begin
  NM_IS_SETTING_PPP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_PPP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_PPP_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_PPP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_PPP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_PPP_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_PPP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_PPP,NMSettingPppClass);
end;


end.
