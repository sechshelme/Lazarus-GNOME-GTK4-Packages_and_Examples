unit nm_setting_6lowpan;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_6LOWPAN_H__}
{$define __NM_SETTING_6LOWPAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_6LOWPAN_SETTING_NAME = '6lowpan';  
  NM_SETTING_6LOWPAN_PARENT = 'parent';  
type

function nm_setting_6lowpan_get_type:TGType;cdecl;external libnm;
function nm_setting_6lowpan_new:PNMSetting;cdecl;external libnm;
function nm_setting_6lowpan_get_parent(setting:PNMSetting6Lowpan):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_6LOWPAN_H__  }

// === Konventiert am: 19-4-26 19:28:20 ===

function NM_TYPE_SETTING_6LOWPAN : TGType;
function NM_SETTING_6LOWPAN(obj : Pointer) : PNMSetting6Lowpan;
function NM_SETTING_6LOWPAN_CLASS(klass : Pointer) : PNMSetting6LowpanClass;
function NM_IS_SETTING_6LOWPAN(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_6LOWPAN_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_6LOWPAN_GET_CLASS(obj : Pointer) : PNMSetting6LowpanClass;

implementation

function NM_TYPE_SETTING_6LOWPAN : TGType;
  begin
    NM_TYPE_SETTING_6LOWPAN:=nm_setting_6lowpan_get_type;
  end;

function NM_SETTING_6LOWPAN(obj : Pointer) : PNMSetting6Lowpan;
begin
  Result := PNMSetting6Lowpan(g_type_check_instance_cast(obj, NM_TYPE_SETTING_6LOWPAN));
end;

function NM_SETTING_6LOWPAN_CLASS(klass : Pointer) : PNMSetting6LowpanClass;
begin
  Result := PNMSetting6LowpanClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_6LOWPAN));
end;

function NM_IS_SETTING_6LOWPAN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_6LOWPAN);
end;

function NM_IS_SETTING_6LOWPAN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_6LOWPAN);
end;

function NM_SETTING_6LOWPAN_GET_CLASS(obj : Pointer) : PNMSetting6LowpanClass;
begin
  Result := PNMSetting6LowpanClass(PGTypeInstance(obj)^.g_class);
end;



end.
