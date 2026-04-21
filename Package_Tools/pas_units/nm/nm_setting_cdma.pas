unit nm_setting_cdma;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2011 Red Hat, Inc.
 * Copyright (C) 2007 - 2008 Novell, Inc.
  }
{$ifndef __NM_SETTING_CDMA_H__}
{$define __NM_SETTING_CDMA_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_CDMA_SETTING_NAME = 'cdma';  
  NM_SETTING_CDMA_NUMBER = 'number';  
  NM_SETTING_CDMA_USERNAME = 'username';  
  NM_SETTING_CDMA_PASSWORD = 'password';  
  NM_SETTING_CDMA_PASSWORD_FLAGS = 'password-flags';  
  NM_SETTING_CDMA_MTU = 'mtu';  
type

function nm_setting_cdma_get_type:TGType;cdecl;external libnm;
function nm_setting_cdma_new:PNMSetting;cdecl;external libnm;
function nm_setting_cdma_get_number(setting:PNMSettingCdma):Pchar;cdecl;external libnm;
function nm_setting_cdma_get_username(setting:PNMSettingCdma):Pchar;cdecl;external libnm;
function nm_setting_cdma_get_password(setting:PNMSettingCdma):Pchar;cdecl;external libnm;
function nm_setting_cdma_get_password_flags(setting:PNMSettingCdma):TNMSettingSecretFlags;cdecl;external libnm;
function nm_setting_cdma_get_mtu(setting:PNMSettingCdma):Tguint32;cdecl;external libnm;
{$endif}
{ __NM_SETTING_CDMA_H__  }

// === Konventiert am: 19-4-26 19:27:46 ===

function NM_TYPE_SETTING_CDMA : TGType;
function NM_SETTING_CDMA(obj : Pointer) : PNMSettingCdma;
function NM_SETTING_CDMA_CLASS(klass : Pointer) : PNMSettingCdmaClass;
function NM_IS_SETTING_CDMA(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_CDMA_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_CDMA_GET_CLASS(obj : Pointer) : PNMSettingCdmaClass;

implementation

function NM_TYPE_SETTING_CDMA : TGType;
  begin
    NM_TYPE_SETTING_CDMA:=nm_setting_cdma_get_type;
  end;

function NM_SETTING_CDMA(obj : Pointer) : PNMSettingCdma;
begin
  Result := PNMSettingCdma(g_type_check_instance_cast(obj, NM_TYPE_SETTING_CDMA));
end;

function NM_SETTING_CDMA_CLASS(klass : Pointer) : PNMSettingCdmaClass;
begin
  Result := PNMSettingCdmaClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_CDMA));
end;

function NM_IS_SETTING_CDMA(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_CDMA);
end;

function NM_IS_SETTING_CDMA_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_CDMA);
end;

function NM_SETTING_CDMA_GET_CLASS(obj : Pointer) : PNMSettingCdmaClass;
begin
  Result := PNMSettingCdmaClass(PGTypeInstance(obj)^.g_class);
end;



end.
