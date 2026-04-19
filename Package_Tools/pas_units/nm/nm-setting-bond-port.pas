unit nm_setting_bond_port;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2012 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_BOND_PORT_H__}
{$define __NM_SETTING_BOND_PORT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}
{$include "nm-setting-bond.h"}

const
  NM_SETTING_BOND_PORT_SETTING_NAME = 'bond-port';  
  NM_SETTING_BOND_PORT_QUEUE_ID = 'queue-id';  
  NM_SETTING_BOND_PORT_PRIO = 'prio';  
type

function nm_setting_bond_port_get_type:TGType;cdecl;external libnm;
function nm_setting_bond_port_new:PNMSetting;cdecl;external libnm;
function nm_setting_bond_port_get_queue_id(setting:PNMSettingBondPort):Tguint32;cdecl;external libnm;
function nm_setting_bond_port_get_prio(setting:PNMSettingBondPort):Tgint32;cdecl;external libnm;
{$endif}
{ __NM_SETTING_BOND_PORT_H__  }

// === Konventiert am: 19-4-26 19:27:58 ===

function NM_TYPE_SETTING_BOND_PORT : TGType;
function NM_SETTING_BOND_PORT(obj : Pointer) : PNMSettingBondPort;
function NM_SETTING_BOND_PORT_CLASS(klass : Pointer) : PNMSettingBondPortClass;
function NM_IS_SETTING_BOND_PORT(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_BOND_PORT_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_BOND_PORT_GET_CLASS(obj : Pointer) : PNMSettingBondPortClass;

implementation

function NM_TYPE_SETTING_BOND_PORT : TGType;
  begin
    NM_TYPE_SETTING_BOND_PORT:=nm_setting_bond_port_get_type;
  end;

function NM_SETTING_BOND_PORT(obj : Pointer) : PNMSettingBondPort;
begin
  Result := PNMSettingBondPort(g_type_check_instance_cast(obj, NM_TYPE_SETTING_BOND_PORT));
end;

function NM_SETTING_BOND_PORT_CLASS(klass : Pointer) : PNMSettingBondPortClass;
begin
  Result := PNMSettingBondPortClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_BOND_PORT));
end;

function NM_IS_SETTING_BOND_PORT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_BOND_PORT);
end;

function NM_IS_SETTING_BOND_PORT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_BOND_PORT);
end;

function NM_SETTING_BOND_PORT_GET_CLASS(obj : Pointer) : PNMSettingBondPortClass;
begin
  Result := PNMSettingBondPortClass(PGTypeInstance(obj)^.g_class);
end;



end.
