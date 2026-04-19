
unit nm-setting-team-port;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-team-port.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-team-port.h
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
PNMSettingTeamPort  = ^NMSettingTeamPort;
PNMTeamLinkWatcher  = ^NMTeamLinkWatcher;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 Jiri Pirko <jiri@resnulli.us>
  }
{$ifndef __NM_SETTING_TEAM_PORT_H__}
{$define __NM_SETTING_TEAM_PORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{$include "nm-setting-team.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_TEAM_PORT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TEAM_PORT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TEAM_PORT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_PORT_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_TEAM_PORT_SETTING_NAME = 'team-port';  
  NM_SETTING_TEAM_PORT_CONFIG = 'config';  
  NM_SETTING_TEAM_PORT_QUEUE_ID = 'queue-id';  
  NM_SETTING_TEAM_PORT_PRIO = 'prio';  
  NM_SETTING_TEAM_PORT_STICKY = 'sticky';  
  NM_SETTING_TEAM_PORT_LACP_PRIO = 'lacp-prio';  
  NM_SETTING_TEAM_PORT_LACP_KEY = 'lacp-key';  
  NM_SETTING_TEAM_PORT_LINK_WATCHERS = 'link-watchers';  
  NM_SETTING_TEAM_PORT_QUEUE_ID_DEFAULT = -(1);  
  NM_SETTING_TEAM_PORT_LACP_PRIO_DEFAULT = 255;  
type

function nm_setting_team_port_get_type:TGType;cdecl;external;
function nm_setting_team_port_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_team_port_get_config(setting:PNMSettingTeamPort):Pchar;cdecl;external;
function nm_setting_team_port_get_queue_id(setting:PNMSettingTeamPort):longint;cdecl;external;
function nm_setting_team_port_get_prio(setting:PNMSettingTeamPort):longint;cdecl;external;
function nm_setting_team_port_get_sticky(setting:PNMSettingTeamPort):Tgboolean;cdecl;external;
function nm_setting_team_port_get_lacp_prio(setting:PNMSettingTeamPort):longint;cdecl;external;
function nm_setting_team_port_get_lacp_key(setting:PNMSettingTeamPort):longint;cdecl;external;
function nm_setting_team_port_get_num_link_watchers(setting:PNMSettingTeamPort):Tguint;cdecl;external;
function nm_setting_team_port_get_link_watcher(setting:PNMSettingTeamPort; idx:Tguint):PNMTeamLinkWatcher;cdecl;external;
function nm_setting_team_port_add_link_watcher(setting:PNMSettingTeamPort; link_watcher:PNMTeamLinkWatcher):Tgboolean;cdecl;external;
procedure nm_setting_team_port_remove_link_watcher(setting:PNMSettingTeamPort; idx:Tguint);cdecl;external;
function nm_setting_team_port_remove_link_watcher_by_value(setting:PNMSettingTeamPort; link_watcher:PNMTeamLinkWatcher):Tgboolean;cdecl;external;
procedure nm_setting_team_port_clear_link_watchers(setting:PNMSettingTeamPort);cdecl;external;
{$endif}
{ __NM_SETTING_TEAM_PORT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_TEAM_PORT : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_TEAM_PORT:=nm_setting_team_port_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_PORT(obj : longint) : longint;
begin
  NM_SETTING_TEAM_PORT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_TEAM_PORT,NMSettingTeamPort);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_PORT_CLASS(klass : longint) : longint;
begin
  NM_SETTING_TEAM_PORT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_TEAM_PORT,NMSettingTeamPortClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TEAM_PORT(obj : longint) : longint;
begin
  NM_IS_SETTING_TEAM_PORT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_TEAM_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_TEAM_PORT_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_TEAM_PORT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_TEAM_PORT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_TEAM_PORT_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_TEAM_PORT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_TEAM_PORT,NMSettingTeamPortClass);
end;


end.
