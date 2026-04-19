
unit nm-setting-ovs-interface;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ovs-interface.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ovs-interface.h
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
PNMSettingOvsInterface  = ^NMSettingOvsInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_INTERFACE_H__}
{$define __NM_SETTING_OVS_INTERFACE_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_INTERFACE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_INTERFACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_INTERFACE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_INTERFACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_INTERFACE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_INTERFACE_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_OVS_INTERFACE_SETTING_NAME = 'ovs-interface';  
  NM_SETTING_OVS_INTERFACE_TYPE = 'type';  
  NM_SETTING_OVS_INTERFACE_OFPORT_REQUEST = 'ofport-request';  
type

function nm_setting_ovs_interface_get_type:TGType;cdecl;external;
function nm_setting_ovs_interface_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_interface_get_interface_type(self:PNMSettingOvsInterface):Pchar;cdecl;external;
function nm_setting_ovs_interface_get_ofport_request(self:PNMSettingOvsInterface):Tguint32;cdecl;external;
{$endif}
{ __NM_SETTING_OVS_INTERFACE_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_INTERFACE : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_OVS_INTERFACE:=nm_setting_ovs_interface_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_INTERFACE(obj : longint) : longint;
begin
  NM_SETTING_OVS_INTERFACE:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_OVS_INTERFACE,NMSettingOvsInterface);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_INTERFACE_CLASS(klass : longint) : longint;
begin
  NM_SETTING_OVS_INTERFACE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_OVS_INTERFACECONFIG,NMSettingOvsInterfaceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_INTERFACE(obj : longint) : longint;
begin
  NM_IS_SETTING_OVS_INTERFACE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_OVS_INTERFACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_INTERFACE_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_OVS_INTERFACE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_OVS_INTERFACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_INTERFACE_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_OVS_INTERFACE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_OVS_INTERFACE,NMSettingOvsInterfaceClass);
end;


end.
