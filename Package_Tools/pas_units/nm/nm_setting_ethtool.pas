unit nm_setting_ethtool;

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
{$ifndef __NM_SETTING_ETHTOOL_H__}
{$define __NM_SETTING_ETHTOOL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

function nm_ethtool_optname_is_feature(optname:Pchar):Tgboolean;cdecl;external libnm;
function nm_ethtool_optname_is_coalesce(optname:Pchar):Tgboolean;cdecl;external libnm;
function nm_ethtool_optname_is_ring(optname:Pchar):Tgboolean;cdecl;external libnm;
function nm_ethtool_optname_is_pause(optname:Pchar):Tgboolean;cdecl;external libnm;
function nm_ethtool_optname_is_channels(optname:Pchar):Tgboolean;cdecl;external libnm;
function nm_ethtool_optname_is_eee(optname:Pchar):Tgboolean;cdecl;external libnm;
{*************************************************************************** }
const
  NM_SETTING_ETHTOOL_SETTING_NAME = 'ethtool';  
{*************************************************************************** }
type

function nm_setting_ethtool_get_type:TGType;cdecl;external libnm;
function nm_setting_ethtool_new:PNMSetting;cdecl;external libnm;
{*************************************************************************** }
{xxxx NM_DEPRECATED_IN__1_26 }
function nm_setting_ethtool_get_optnames(setting:PNMSettingEthtool; out_length:Pguint):^Pchar;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_26 }
function nm_setting_ethtool_get_feature(setting:PNMSettingEthtool; optname:Pchar):TNMTernary;cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_26 }
procedure nm_setting_ethtool_set_feature(setting:PNMSettingEthtool; optname:Pchar; value:TNMTernary);cdecl;external libnm;
{xxxx NM_DEPRECATED_IN__1_26 }
procedure nm_setting_ethtool_clear_features(setting:PNMSettingEthtool);cdecl;external libnm;
{$endif}
{ __NM_SETTING_ETHTOOL_H__  }

// === Konventiert am: 19-4-26 19:27:29 ===

function NM_TYPE_SETTING_ETHTOOL : TGType;
function NM_SETTING_ETHTOOL(obj : Pointer) : PNMSettingEthtool;
function NM_SETTING_ETHTOOL_CLASS(klass : Pointer) : PNMSettingEthtoolClass;
function NM_IS_SETTING_ETHTOOL(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_ETHTOOL_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_ETHTOOL_GET_CLASS(obj : Pointer) : PNMSettingEthtoolClass;

implementation

function NM_TYPE_SETTING_ETHTOOL : TGType;
  begin
    NM_TYPE_SETTING_ETHTOOL:=nm_setting_ethtool_get_type;
  end;

function NM_SETTING_ETHTOOL(obj : Pointer) : PNMSettingEthtool;
begin
  Result := PNMSettingEthtool(g_type_check_instance_cast(obj, NM_TYPE_SETTING_ETHTOOL));
end;

function NM_SETTING_ETHTOOL_CLASS(klass : Pointer) : PNMSettingEthtoolClass;
begin
  Result := PNMSettingEthtoolClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_ETHTOOL));
end;

function NM_IS_SETTING_ETHTOOL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_ETHTOOL);
end;

function NM_IS_SETTING_ETHTOOL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_ETHTOOL);
end;

function NM_SETTING_ETHTOOL_GET_CLASS(obj : Pointer) : PNMSettingEthtoolClass;
begin
  Result := PNMSettingEthtoolClass(PGTypeInstance(obj)^.g_class);
end;



end.
