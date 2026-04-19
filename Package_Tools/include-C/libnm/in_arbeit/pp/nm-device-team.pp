
unit nm-device-team;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-team.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-team.h
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
PGPtrArray  = ^GPtrArray;
PNMDeviceTeam  = ^NMDeviceTeam;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 Jiri Pirko <jiri@resnulli.us>
  }
{$ifndef __NM_DEVICE_TEAM_H__}
{$define __NM_DEVICE_TEAM_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_TEAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TEAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TEAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_TEAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_TEAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TEAM_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_TEAM_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_TEAM_CARRIER = 'carrier';  
  NM_DEVICE_TEAM_SLAVES = 'slaves';  
  NM_DEVICE_TEAM_CONFIG = 'config';  
{*
 * NMDeviceTeam:
  }
type

function nm_device_team_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_team_get_hw_address(device:PNMDeviceTeam):Pchar;cdecl;external;
function nm_device_team_get_carrier(device:PNMDeviceTeam):Tgboolean;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_34_FOR(nm_device_get_ports) }
(* Const before type ignored *)
function nm_device_team_get_slaves(device:PNMDeviceTeam):PGPtrArray;cdecl;external;
(* Const before type ignored *)
function nm_device_team_get_config(device:PNMDeviceTeam):Pchar;cdecl;external;
{$endif}
{ __NM_DEVICE_TEAM_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_TEAM : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_TEAM:=nm_device_team_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TEAM(obj : longint) : longint;
begin
  NM_DEVICE_TEAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_TEAM,NMDeviceTeam);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TEAM_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_TEAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_TEAM,NMDeviceTeamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_TEAM(obj : longint) : longint;
begin
  NM_IS_DEVICE_TEAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_TEAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_TEAM_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_TEAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_TEAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_TEAM_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_TEAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_TEAM,NMDeviceTeamClass);
end;


end.
