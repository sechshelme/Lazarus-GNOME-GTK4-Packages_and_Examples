unit nm_setting_wpan;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Lubomir Rintel <lkundrak@v3.sk>
  }
{$ifndef __NM_SETTING_WPAN_H__}
{$define __NM_SETTING_WPAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_WPAN_SETTING_NAME = 'wpan';  
  NM_SETTING_WPAN_MAC_ADDRESS = 'mac-address';  
  NM_SETTING_WPAN_PAN_ID = 'pan-id';  
  NM_SETTING_WPAN_SHORT_ADDRESS = 'short-address';  
  NM_SETTING_WPAN_PAGE = 'page';  
  NM_SETTING_WPAN_CHANNEL = 'channel';  
  NM_SETTING_WPAN_PAGE_DEFAULT = -(1);  
  NM_SETTING_WPAN_CHANNEL_DEFAULT = -(1);  
type

function nm_setting_wpan_get_type:TGType;cdecl;external libnm;
function nm_setting_wpan_new:PNMSetting;cdecl;external libnm;
function nm_setting_wpan_get_mac_address(setting:PNMSettingWpan):Pchar;cdecl;external libnm;
function nm_setting_wpan_get_pan_id(setting:PNMSettingWpan):Tguint16;cdecl;external libnm;
function nm_setting_wpan_get_short_address(setting:PNMSettingWpan):Tguint16;cdecl;external libnm;
function nm_setting_wpan_get_page(setting:PNMSettingWpan):Tgint16;cdecl;external libnm;
function nm_setting_wpan_get_channel(setting:PNMSettingWpan):Tgint16;cdecl;external libnm;
{$endif}
{ __NM_SETTING_WPAN_H__  }

// === Konventiert am: 19-4-26 19:20:47 ===

function NM_TYPE_SETTING_WPAN : TGType;
function NM_SETTING_WPAN(obj : Pointer) : PNMSettingWpan;
function NM_SETTING_WPAN_CLASS(klass : Pointer) : PNMSettingWpanClass;
function NM_IS_SETTING_WPAN(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_WPAN_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_WPAN_GET_CLASS(obj : Pointer) : PNMSettingWpanClass;

implementation

function NM_TYPE_SETTING_WPAN : TGType;
  begin
    NM_TYPE_SETTING_WPAN:=nm_setting_wpan_get_type;
  end;

function NM_SETTING_WPAN(obj : Pointer) : PNMSettingWpan;
begin
  Result := PNMSettingWpan(g_type_check_instance_cast(obj, NM_TYPE_SETTING_WPAN));
end;

function NM_SETTING_WPAN_CLASS(klass : Pointer) : PNMSettingWpanClass;
begin
  Result := PNMSettingWpanClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_WPAN));
end;

function NM_IS_SETTING_WPAN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_WPAN);
end;

function NM_IS_SETTING_WPAN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_WPAN);
end;

function NM_SETTING_WPAN_GET_CLASS(obj : Pointer) : PNMSettingWpanClass;
begin
  Result := PNMSettingWpanClass(PGTypeInstance(obj)^.g_class);
end;



end.
