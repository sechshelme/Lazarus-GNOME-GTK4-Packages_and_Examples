unit nm_device_team;

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
{$ifndef __NM_DEVICE_TEAM_H__}
{$define __NM_DEVICE_TEAM_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

const
  NM_DEVICE_TEAM_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_TEAM_CARRIER = 'carrier';  
  NM_DEVICE_TEAM_SLAVES = 'slaves';  
  NM_DEVICE_TEAM_CONFIG = 'config';  
{*
 * NMDeviceTeam:
  }
type

function nm_device_team_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
function nm_device_team_get_hw_address(device:PNMDeviceTeam):Pchar;cdecl;external libnm;
function nm_device_team_get_carrier(device:PNMDeviceTeam):Tgboolean;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_34_FOR(nm_device_get_ports) }
function nm_device_team_get_slaves(device:PNMDeviceTeam):PGPtrArray;cdecl;external libnm;
function nm_device_team_get_config(device:PNMDeviceTeam):Pchar;cdecl;external libnm;
{$endif}
{ __NM_DEVICE_TEAM_H__  }

// === Konventiert am: 19-4-26 19:30:21 ===

function NM_TYPE_DEVICE_TEAM : TGType;
function NM_DEVICE_TEAM(obj : Pointer) : PNMDeviceTeam;
function NM_DEVICE_TEAM_CLASS(klass : Pointer) : PNMDeviceTeamClass;
function NM_IS_DEVICE_TEAM(obj : Pointer) : Tgboolean;
function NM_IS_DEVICE_TEAM_CLASS(klass : Pointer) : Tgboolean;
function NM_DEVICE_TEAM_GET_CLASS(obj : Pointer) : PNMDeviceTeamClass;

implementation

function NM_TYPE_DEVICE_TEAM : TGType;
  begin
    NM_TYPE_DEVICE_TEAM:=nm_device_team_get_type;
  end;

function NM_DEVICE_TEAM(obj : Pointer) : PNMDeviceTeam;
begin
  Result := PNMDeviceTeam(g_type_check_instance_cast(obj, NM_TYPE_DEVICE_TEAM));
end;

function NM_DEVICE_TEAM_CLASS(klass : Pointer) : PNMDeviceTeamClass;
begin
  Result := PNMDeviceTeamClass(g_type_check_class_cast(klass, NM_TYPE_DEVICE_TEAM));
end;

function NM_IS_DEVICE_TEAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_DEVICE_TEAM);
end;

function NM_IS_DEVICE_TEAM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_DEVICE_TEAM);
end;

function NM_DEVICE_TEAM_GET_CLASS(obj : Pointer) : PNMDeviceTeamClass;
begin
  Result := PNMDeviceTeamClass(PGTypeInstance(obj)^.g_class);
end;



end.
