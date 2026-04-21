unit nm_setting_veth;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2020 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_VETH_H__}
{$define __NM_SETTING_VETH_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_VETH_SETTING_NAME = 'veth';  
  NM_SETTING_VETH_PEER = 'peer';  
type

function nm_setting_veth_get_type:TGType;cdecl;external libnm;
function nm_setting_veth_new:PNMSetting;cdecl;external libnm;
function nm_setting_veth_get_peer(setting:PNMSettingVeth):Pchar;cdecl;external libnm;
{$endif}
{ __NM_SETTING_VETH_H__  }

// === Konventiert am: 19-4-26 19:24:31 ===

function NM_TYPE_SETTING_VETH : TGType;
function NM_SETTING_VETH(obj : Pointer) : PNMSettingVeth;
function NM_IS_SETTING_VETH(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_VETH_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_VETH_GET_CLASS(obj : Pointer) : ;

implementation

function NM_TYPE_SETTING_VETH : TGType;
  begin
    NM_TYPE_SETTING_VETH:=nm_setting_veth_get_type;
  end;

function NM_SETTING_VETH(obj : Pointer) : PNMSettingVeth;
begin
  Result := PNMSettingVeth(g_type_check_instance_cast(obj, NM_TYPE_SETTING_VETH));
end;

function NM_IS_SETTING_VETH(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_VETH);
end;

function NM_IS_SETTING_VETH_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_VETH);
end;

function NM_SETTING_VETH_GET_CLASS(obj : Pointer) : ;
begin
  Result := (PGTypeInstance(obj)^.g_class);
end;



end.
