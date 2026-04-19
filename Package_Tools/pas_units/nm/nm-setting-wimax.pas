unit nm_setting_wimax;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2009 Novell, Inc.
  }
{$ifndef __NM_SETTING_WIMAX_H__}
{$define __NM_SETTING_WIMAX_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_WIMAX_SETTING_NAME = 'wimax';  
  NM_SETTING_WIMAX_NETWORK_NAME = 'network-name';  
  NM_SETTING_WIMAX_MAC_ADDRESS = 'mac-address';  
type
{xxxx NM_DEPRECATED_IN__1_2 }

function nm_setting_wimax_get_type:TGType;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_setting_wimax_new:PNMSetting;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_setting_wimax_get_network_name(setting:PNMSettingWimax):Pchar;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_setting_wimax_get_mac_address(setting:PNMSettingWimax):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_WIMAX_H__  }

// === Konventiert am: 19-4-26 19:21:18 ===

function NM_TYPE_SETTING_WIMAX : TGType;
function NM_SETTING_WIMAX(obj : Pointer) : PNMSettingWimax;
function NM_SETTING_WIMAX_CLASS(klass : Pointer) : PNMSettingWimaxClass;
function NM_IS_SETTING_WIMAX(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_WIMAX_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_WIMAX_GET_CLASS(obj : Pointer) : PNMSettingWimaxClass;

implementation

function NM_TYPE_SETTING_WIMAX : TGType;
  begin
    NM_TYPE_SETTING_WIMAX:=nm_setting_wimax_get_type;
  end;

function NM_SETTING_WIMAX(obj : Pointer) : PNMSettingWimax;
begin
  Result := PNMSettingWimax(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WIMAX));
end;

function NM_SETTING_WIMAX_CLASS(klass : Pointer) : PNMSettingWimaxClass;
begin
  Result := PNMSettingWimaxClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WIMAX));
end;

function NM_IS_SETTING_WIMAX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_WIMAX);
end;

function NM_IS_SETTING_WIMAX_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_WIMAX);
end;

function NM_SETTING_WIMAX_GET_CLASS(obj : Pointer) : PNMSettingWimaxClass;
begin
  Result := PNMSettingWimaxClass(PGTypeInstance(obj)^.g_class);
end;



end.
