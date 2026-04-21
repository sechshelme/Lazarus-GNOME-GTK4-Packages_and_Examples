unit nm_setting_tun;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2015 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_TUN_H__}
{$define __NM_SETTING_TUN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_TUN_SETTING_NAME = 'tun';  
  NM_SETTING_TUN_MODE = 'mode';  
  NM_SETTING_TUN_OWNER = 'owner';  
  NM_SETTING_TUN_GROUP = 'group';  
  NM_SETTING_TUN_PI = 'pi';  
  NM_SETTING_TUN_VNET_HDR = 'vnet-hdr';  
  NM_SETTING_TUN_MULTI_QUEUE = 'multi-queue';  
{*
 * NMSettingTunMode:
 * @NM_SETTING_TUN_MODE_UNKNOWN: an unknown device type
 * @NM_SETTING_TUN_MODE_TUN: a TUN device
 * @NM_SETTING_TUN_MODE_TAP: a TAP device
 *
 * #NMSettingTunMode values indicate the device type (TUN/TAP)
 *
 * Since: 1.2
  }
type
  PNMSettingTunMode = ^TNMSettingTunMode;
  TNMSettingTunMode =  Longint;
  Const
    NM_SETTING_TUN_MODE_UNKNOWN = 0;
    NM_SETTING_TUN_MODE_TUN = 1;
    NM_SETTING_TUN_MODE_TAP = 2;
;
type

function nm_setting_tun_get_type:TGType;cdecl;external libnm;
function nm_setting_tun_new:PNMSetting;cdecl;external libnm;
function nm_setting_tun_get_mode(setting:PNMSettingTun):TNMSettingTunMode;cdecl;external libnm;
function nm_setting_tun_get_owner(setting:PNMSettingTun):Pchar;cdecl;external libnm;
function nm_setting_tun_get_group(setting:PNMSettingTun):Pchar;cdecl;external libnm;
function nm_setting_tun_get_pi(setting:PNMSettingTun):Tgboolean;cdecl;external libnm;
function nm_setting_tun_get_vnet_hdr(setting:PNMSettingTun):Tgboolean;cdecl;external libnm;
function nm_setting_tun_get_multi_queue(setting:PNMSettingTun):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_SETTING_TUN_H__  }

// === Konventiert am: 19-4-26 19:24:47 ===

function NM_TYPE_SETTING_TUN : TGType;
function NM_SETTING_TUN(obj : Pointer) : PNMSettingTun;
function NM_SETTING_TUN_CLASS(klass : Pointer) : PNMSettingTunClass;
function NM_IS_SETTING_TUN(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_TUN_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_TUN_GET_CLASS(obj : Pointer) : PNMSettingTunClass;

implementation

function NM_TYPE_SETTING_TUN : TGType;
  begin
    NM_TYPE_SETTING_TUN:=nm_setting_tun_get_type;
  end;

function NM_SETTING_TUN(obj : Pointer) : PNMSettingTun;
begin
  Result := PNMSettingTun(g_type_check_instance_cast(obj, NM_TYPE_SETTING_TUN));
end;

function NM_SETTING_TUN_CLASS(klass : Pointer) : PNMSettingTunClass;
begin
  Result := PNMSettingTunClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_TUN));
end;

function NM_IS_SETTING_TUN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_TUN);
end;

function NM_IS_SETTING_TUN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_TUN);
end;

function NM_SETTING_TUN_GET_CLASS(obj : Pointer) : PNMSettingTunClass;
begin
  Result := PNMSettingTunClass(PGTypeInstance(obj)^.g_class);
end;



end.
