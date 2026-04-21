unit nm_setting_hsr;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2023 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_HSR_H__}
{$define __NM_SETTING_HSR_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_HSR_SETTING_NAME = 'hsr';  
  NM_SETTING_HSR_PORT1 = 'port1';  
  NM_SETTING_HSR_PORT2 = 'port2';  
  NM_SETTING_HSR_MULTICAST_SPEC = 'multicast-spec';  
  NM_SETTING_HSR_PRP = 'prp';  
type

function nm_setting_hsr_get_type:TGType;cdecl;external libnm;
function nm_setting_hsr_new:PNMSetting;cdecl;external libnm;
function nm_setting_hsr_get_port1(setting:PNMSettingHsr):Pchar;cdecl;external libnm;
function nm_setting_hsr_get_port2(setting:PNMSettingHsr):Pchar;cdecl;external libnm;
function nm_setting_hsr_get_multicast_spec(setting:PNMSettingHsr):Tguint32;cdecl;external libnm;
function nm_setting_hsr_get_prp(setting:PNMSettingHsr):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_SETTING_HSR_H__  }

// === Konventiert am: 19-4-26 19:27:10 ===

function NM_TYPE_SETTING_HSR : TGType;
function NM_SETTING_HSR(obj : Pointer) : PNMSettingHsr;
function NM_IS_SETTING_HSR(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_HSR_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_HSR_GET_CLASS(obj : Pointer) : ;

implementation

function NM_TYPE_SETTING_HSR : TGType;
  begin
    NM_TYPE_SETTING_HSR:=nm_setting_hsr_get_type;
  end;

function NM_SETTING_HSR(obj : Pointer) : PNMSettingHsr;
begin
  Result := PNMSettingHsr(g_type_check_instance_cast(obj, NM_TYPE_SETTING_HSR));
end;

function NM_IS_SETTING_HSR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_HSR);
end;

function NM_IS_SETTING_HSR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_HSR);
end;

function NM_SETTING_HSR_GET_CLASS(obj : Pointer) : ;
begin
  Result := (PGTypeInstance(obj)^.g_class);
end;



end.
