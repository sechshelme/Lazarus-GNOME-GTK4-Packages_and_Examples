unit nm_setting_hostname;

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
{$ifndef NM_SETTING_HOSTNAME_H}
{$define NM_SETTING_HOSTNAME_H}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

const
  NM_SETTING_HOSTNAME_SETTING_NAME = 'hostname';  
  NM_SETTING_HOSTNAME_PRIORITY = 'priority';  
  NM_SETTING_HOSTNAME_FROM_DHCP = 'from-dhcp';  
  NM_SETTING_HOSTNAME_FROM_DNS_LOOKUP = 'from-dns-lookup';  
  NM_SETTING_HOSTNAME_ONLY_FROM_DEFAULT = 'only-from-default';  
type

function nm_setting_hostname_get_type:TGType;cdecl;external libnm;
function nm_setting_hostname_new:PNMSetting;cdecl;external libnm;
function nm_setting_hostname_get_priority(setting:PNMSettingHostname):longint;cdecl;external libnm;
function nm_setting_hostname_get_from_dhcp(setting:PNMSettingHostname):TNMTernary;cdecl;external libnm;
function nm_setting_hostname_get_from_dns_lookup(setting:PNMSettingHostname):TNMTernary;cdecl;external libnm;
function nm_setting_hostname_get_only_from_default(setting:PNMSettingHostname):TNMTernary;cdecl;external libnm;
{$endif}
{ NM_SETTING_HOSTNAME_H  }

// === Konventiert am: 19-4-26 19:27:18 ===

function NM_TYPE_SETTING_HOSTNAME : TGType;
function NM_SETTING_HOSTNAME(obj : Pointer) : PNMSettingHostname;
function NM_SETTING_HOSTNAME_CLASS(klass : Pointer) : PNMSettingHostnameClass;
function NM_IS_SETTING_HOSTNAME(obj : Pointer) : Tgboolean;
function NM_IS_SETTING_HOSTNAME_CLASS(klass : Pointer) : Tgboolean;
function NM_SETTING_HOSTNAME_GET_CLASS(obj : Pointer) : PNMSettingHostnameClass;

implementation

function NM_TYPE_SETTING_HOSTNAME : TGType;
  begin
    NM_TYPE_SETTING_HOSTNAME:=nm_setting_hostname_get_type;
  end;

function NM_SETTING_HOSTNAME(obj : Pointer) : PNMSettingHostname;
begin
  Result := PNMSettingHostname(g_type_check_instance_cast(obj, NM_TYPE_SETTING_HOSTNAME));
end;

function NM_SETTING_HOSTNAME_CLASS(klass : Pointer) : PNMSettingHostnameClass;
begin
  Result := PNMSettingHostnameClass(g_type_check_class_cast(klass, NM_TYPE_SETTING_HOSTNAME));
end;

function NM_IS_SETTING_HOSTNAME(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SETTING_HOSTNAME);
end;

function NM_IS_SETTING_HOSTNAME_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SETTING_HOSTNAME);
end;

function NM_SETTING_HOSTNAME_GET_CLASS(obj : Pointer) : PNMSettingHostnameClass;
begin
  Result := PNMSettingHostnameClass(PGTypeInstance(obj)^.g_class);
end;



end.
