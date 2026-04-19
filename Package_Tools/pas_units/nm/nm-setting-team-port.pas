unit nm_setting_team_port;

interface

uses
  fp_glib2, fp_nm;

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

function nm_setting_team_port_get_type:TGType;cdecl;external libnm;
function nm_setting_team_port_new:PNMSetting;cdecl;external libnm;
function nm_setting_team_port_get_config(setting:PNMSettingTeamPort):Pchar;cdecl;external libnm;
function nm_setting_team_port_get_queue_id(setting:PNMSettingTeamPort):longint;cdecl;external libnm;
function nm_setting_team_port_get_prio(setting:PNMSettingTeamPort):longint;cdecl;external libnm;
function nm_setting_team_port_get_sticky(setting:PNMSettingTeamPort):Tgboolean;cdecl;external libnm;
function nm_setting_team_port_get_lacp_prio(setting:PNMSettingTeamPort):longint;cdecl;external libnm;
function nm_setting_team_port_get_lacp_key(setting:PNMSettingTeamPort):longint;cdecl;external libnm;
function nm_setting_team_port_get_num_link_watchers(setting:PNMSettingTeamPort):Tguint;cdecl;external libnm;
function nm_setting_team_port_get_link_watcher(setting:PNMSettingTeamPort; idx:Tguint):PNMTeamLinkWatcher;cdecl;external libnm;
function nm_setting_team_port_add_link_watcher(setting:PNMSettingTeamPort; link_watcher:PNMTeamLinkWatcher):Tgboolean;cdecl;external libnm;
procedure nm_setting_team_port_remove_link_watcher(setting:PNMSettingTeamPort; idx:Tguint);cdecl;external libnm;
function nm_setting_team_port_remove_link_watcher_by_value(setting:PNMSettingTeamPort; link_watcher:PNMTeamLinkWatcher):Tgboolean;cdecl;external libnm;
procedure nm_setting_team_port_clear_link_watchers(setting:PNMSettingTeamPort);cdecl;external libnm;
{$endif}
{ __NM_SETTING_TEAM_PORT_H__  }

// === Konventiert am: 19-4-26 19:24:53 ===

function NM_TYPE_SETTING_TEAM_PORT : TGType;
function NM_SETTING_TEAM_PORT(obj : Pointer) : PNMSettingTeamPort;
function NM_SETTING_TEAM_PORT_CLASS(klass : Pointer) : PNMSettingTeamPortClass;
function NM_IS_SETTING_TEAM_PORT(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_TEAM_PORT_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_TEAM_PORT_GET_CLASS(obj : Pointer) : PNMSettingTeamPortClass;

implementation

function NM_TYPE_SETTING_TEAM_PORT : TGType;
  begin
    NM_TYPE_SETTING_TEAM_PORT:=nm_setting_team_port_get_type;
  end;

function NM_SETTING_TEAM_PORT(obj : Pointer) : PNMSettingTeamPort;
begin
  Result := PNMSettingTeamPort(g_type_check_instance_cast(obj, NM_TYPE_SETTING_TEAM_PORT));
end;

function NM_SETTING_TEAM_PORT_CLASS(klass : Pointer) : PNMSettingTeamPortClass;
begin
  Result := PNMSettingTeamPortClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_TEAM_PORT));
end;

function NM_IS_SETTING_TEAM_PORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_TEAM_PORT);
end;

function NM_IS_SETTING_TEAM_PORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_TEAM_PORT);
end;

function NM_SETTING_TEAM_PORT_GET_CLASS(obj : Pointer) : PNMSettingTeamPortClass;
begin
  Result := PNMSettingTeamPortClass(PGTypeInstance(obj)^.g_class);
end;



end.
