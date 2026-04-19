
unit nm-setting-bond-port;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-bond-port.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-bond-port.h
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
PNMSettingBondPort  = ^NMSettingBondPort;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2012 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_BOND_PORT_H__}
{$define __NM_SETTING_BOND_PORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{$include "nm-setting-bond.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_BOND_PORT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BOND_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BOND_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_PORT_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_BOND_PORT_SETTING_NAME = 'bond-port';  
  NM_SETTING_BOND_PORT_QUEUE_ID = 'queue-id';  
  NM_SETTING_BOND_PORT_PRIO = 'prio';  
type

function nm_setting_bond_port_get_type:TGType;cdecl;external;
function nm_setting_bond_port_new:PNMSetting;cdecl;external;
function nm_setting_bond_port_get_queue_id(setting:PNMSettingBondPort):Tguint32;cdecl;external;
function nm_setting_bond_port_get_prio(setting:PNMSettingBondPort):Tgint32;cdecl;external;
{$endif}
{ __NM_SETTING_BOND_PORT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_BOND_PORT : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_BOND_PORT:=nm_setting_bond_port_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_PORT(obj : longint) : longint;
begin
  NM_SETTING_BOND_PORT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_BOND_PORT,NMSettingBondPort);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_PORT_CLASS(klass : longint) : longint;
begin
  NM_SETTING_BOND_PORT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_BOND_PORT,NMSettingBondPortClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BOND_PORT(obj : longint) : longint;
begin
  NM_IS_SETTING_BOND_PORT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_BOND_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_BOND_PORT_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_BOND_PORT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_BOND_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_BOND_PORT_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_BOND_PORT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_BOND_PORT,NMSettingBondPortClass);
end;


end.
