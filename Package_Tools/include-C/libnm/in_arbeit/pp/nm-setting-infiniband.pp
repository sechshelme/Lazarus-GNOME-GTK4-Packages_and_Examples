
unit nm-setting-infiniband;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-infiniband.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-infiniband.h
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
PNMSettingInfiniband  = ^NMSettingInfiniband;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_INFINIBAND_H__}
{$define __NM_SETTING_INFINIBAND_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_INFINIBAND : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_INFINIBAND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_INFINIBAND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_INFINIBAND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_INFINIBAND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_INFINIBAND_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_INFINIBAND_SETTING_NAME = 'infiniband';  
  NM_SETTING_INFINIBAND_MAC_ADDRESS = 'mac-address';  
  NM_SETTING_INFINIBAND_MTU = 'mtu';  
  NM_SETTING_INFINIBAND_TRANSPORT_MODE = 'transport-mode';  
  NM_SETTING_INFINIBAND_P_KEY = 'p-key';  
  NM_SETTING_INFINIBAND_PARENT = 'parent';  
type

function nm_setting_infiniband_get_type:TGType;cdecl;external;
function nm_setting_infiniband_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_infiniband_get_mac_address(setting:PNMSettingInfiniband):Pchar;cdecl;external;
function nm_setting_infiniband_get_mtu(setting:PNMSettingInfiniband):Tguint32;cdecl;external;
(* Const before type ignored *)
function nm_setting_infiniband_get_transport_mode(setting:PNMSettingInfiniband):Pchar;cdecl;external;
function nm_setting_infiniband_get_p_key(setting:PNMSettingInfiniband):longint;cdecl;external;
(* Const before type ignored *)
function nm_setting_infiniband_get_parent(setting:PNMSettingInfiniband):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_setting_infiniband_get_virtual_interface_name(setting:PNMSettingInfiniband):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_INFINIBAND_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_INFINIBAND : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_INFINIBAND:=nm_setting_infiniband_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_INFINIBAND(obj : longint) : longint;
begin
  NM_SETTING_INFINIBAND:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_INFINIBAND,NMSettingInfiniband);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_INFINIBAND_CLASS(klass : longint) : longint;
begin
  NM_SETTING_INFINIBAND_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_INFINIBAND,NMSettingInfinibandClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_INFINIBAND(obj : longint) : longint;
begin
  NM_IS_SETTING_INFINIBAND:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_INFINIBAND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_INFINIBAND_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_INFINIBAND_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_INFINIBAND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_INFINIBAND_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_INFINIBAND_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_INFINIBAND,NMSettingInfinibandClass);
end;


end.
