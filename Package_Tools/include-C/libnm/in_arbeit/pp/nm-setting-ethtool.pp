
unit nm-setting-ethtool;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ethtool.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ethtool.h
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
Pguint  = ^guint;
PNMSetting  = ^NMSetting;
PNMSettingEthtool  = ^NMSettingEthtool;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_ETHTOOL_H__}
{$define __NM_SETTING_ETHTOOL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
(* Const before type ignored *)

function nm_ethtool_optname_is_feature(optname:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_ethtool_optname_is_coalesce(optname:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_ethtool_optname_is_ring(optname:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_ethtool_optname_is_pause(optname:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_ethtool_optname_is_channels(optname:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_ethtool_optname_is_eee(optname:Pchar):Tgboolean;cdecl;external;
{*************************************************************************** }
{ was #define dname def_expr }
function NM_TYPE_SETTING_ETHTOOL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ETHTOOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ETHTOOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_ETHTOOL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_ETHTOOL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ETHTOOL_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_ETHTOOL_SETTING_NAME = 'ethtool';  
{*************************************************************************** }
type

function nm_setting_ethtool_get_type:TGType;cdecl;external;
function nm_setting_ethtool_new:PNMSetting;cdecl;external;
{*************************************************************************** }
{xxxx NM_DEPRECATED_IN__1_26 }
(* Const before type ignored *)
function nm_setting_ethtool_get_optnames(setting:PNMSettingEthtool; out_length:Pguint):^Pchar;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_26 }
(* Const before type ignored *)
function nm_setting_ethtool_get_feature(setting:PNMSettingEthtool; optname:Pchar):TNMTernary;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_26 }
(* Const before type ignored *)
procedure nm_setting_ethtool_set_feature(setting:PNMSettingEthtool; optname:Pchar; value:TNMTernary);cdecl;external;
{xxxx NM_DEPRECATED_IN__1_26 }
procedure nm_setting_ethtool_clear_features(setting:PNMSettingEthtool);cdecl;external;
{$endif}
{ __NM_SETTING_ETHTOOL_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_ETHTOOL : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_ETHTOOL:=nm_setting_ethtool_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ETHTOOL(obj : longint) : longint;
begin
  NM_SETTING_ETHTOOL:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_ETHTOOL,NMSettingEthtool);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ETHTOOL_CLASS(klass : longint) : longint;
begin
  NM_SETTING_ETHTOOL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_ETHTOOL,NMSettingEthtoolClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_ETHTOOL(obj : longint) : longint;
begin
  NM_IS_SETTING_ETHTOOL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_ETHTOOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_ETHTOOL_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_ETHTOOL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_ETHTOOL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_ETHTOOL_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_ETHTOOL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_ETHTOOL,NMSettingEthtoolClass);
end;


end.
