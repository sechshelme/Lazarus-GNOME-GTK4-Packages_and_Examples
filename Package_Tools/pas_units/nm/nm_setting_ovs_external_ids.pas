unit nm_setting_ovs_external_ids;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 - 2020 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_EXTERNAL_IDS_H__}
{$define __NM_SETTING_OVS_EXTERNAL_IDS_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_OVS_EXTERNAL_IDS_SETTING_NAME = 'ovs-external-ids';  
  NM_SETTING_OVS_EXTERNAL_IDS_DATA = 'data';  
type

function nm_setting_ovs_external_ids_get_type:TGType;cdecl;external libnm;
function nm_setting_ovs_external_ids_new:PNMSetting;cdecl;external libnm;
{*************************************************************************** }
function nm_setting_ovs_external_ids_get_data_keys(setting:PNMSettingOvsExternalIDs; out_len:Pguint):^Pchar;cdecl;external libnm;
function nm_setting_ovs_external_ids_get_data(setting:PNMSettingOvsExternalIDs; key:Pchar):Pchar;cdecl;external libnm;
procedure nm_setting_ovs_external_ids_set_data(setting:PNMSettingOvsExternalIDs; key:Pchar; val:Pchar);cdecl;external libnm;
{*************************************************************************** }
function nm_setting_ovs_external_ids_check_key(key:Pchar; error:PPGError):Tgboolean;cdecl;external libnm;
function nm_setting_ovs_external_ids_check_val(val:Pchar; error:PPGError):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_SETTING_OVS_EXTERNAL_IDS_H__  }

// === Konventiert am: 19-4-26 19:25:53 ===

function NM_TYPE_SETTING_OVS_EXTERNAL_IDS : TGType;
function NM_SETTING_OVS_EXTERNAL_IDS(obj : Pointer) : PNMSettingOvsExternalIDs;
function NM_SETTING_OVS_EXTERNAL_IDS_CLASS(klass : Pointer) : PNMSettingOvsExternalIDsClass;
function NM_IS_SETTING_OVS_EXTERNAL_IDS(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_OVS_EXTERNAL_IDS_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_OVS_EXTERNAL_IDS_GET_CLASS(obj : Pointer) : PNMSettingOvsExternalIDsClass;

implementation

function NM_TYPE_SETTING_OVS_EXTERNAL_IDS : TGType;
  begin
    NM_TYPE_SETTING_OVS_EXTERNAL_IDS:=nm_setting_ovs_external_ids_get_type;
  end;

function NM_SETTING_OVS_EXTERNAL_IDS(obj : Pointer) : PNMSettingOvsExternalIDs;
begin
  Result := PNMSettingOvsExternalIDs(g_type_check_instance_cast(obj, NM_TYPE_SETTING_OVS_EXTERNAL_IDS));
end;

function NM_SETTING_OVS_EXTERNAL_IDS_CLASS(klass : Pointer) : PNMSettingOvsExternalIDsClass;
begin
  Result := PNMSettingOvsExternalIDsClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_OVS_EXTERNAL_IDS));
end;

function NM_IS_SETTING_OVS_EXTERNAL_IDS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_OVS_EXTERNAL_IDS);
end;

function NM_IS_SETTING_OVS_EXTERNAL_IDS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_OVS_EXTERNAL_IDS);
end;

function NM_SETTING_OVS_EXTERNAL_IDS_GET_CLASS(obj : Pointer) : PNMSettingOvsExternalIDsClass;
begin
  Result := PNMSettingOvsExternalIDsClass(PGTypeInstance(obj)^.g_class);
end;



end.
