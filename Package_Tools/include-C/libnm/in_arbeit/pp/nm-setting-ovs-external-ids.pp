
unit nm-setting-ovs-external-ids;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ovs-external-ids.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ovs-external-ids.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGError  = ^GError;
Pguint  = ^guint;
PNMSetting  = ^NMSetting;
PNMSettingOvsExternalIDs  = ^NMSettingOvsExternalIDs;
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

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_EXTERNAL_IDS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_EXTERNAL_IDS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_EXTERNAL_IDS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_EXTERNAL_IDS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_EXTERNAL_IDS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_EXTERNAL_IDS_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_OVS_EXTERNAL_IDS_SETTING_NAME = 'ovs-external-ids';  
  NM_SETTING_OVS_EXTERNAL_IDS_DATA = 'data';  
type

function nm_setting_ovs_external_ids_get_type:TGType;cdecl;external;
function nm_setting_ovs_external_ids_new:PNMSetting;cdecl;external;
{*************************************************************************** }
(* Const before type ignored *)
(* Const before declarator ignored *)
function nm_setting_ovs_external_ids_get_data_keys(setting:PNMSettingOvsExternalIDs; out_len:Pguint):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function nm_setting_ovs_external_ids_get_data(setting:PNMSettingOvsExternalIDs; key:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure nm_setting_ovs_external_ids_set_data(setting:PNMSettingOvsExternalIDs; key:Pchar; val:Pchar);cdecl;external;
{*************************************************************************** }
(* Const before type ignored *)
function nm_setting_ovs_external_ids_check_key(key:Pchar; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_external_ids_check_val(val:Pchar; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __NM_SETTING_OVS_EXTERNAL_IDS_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_EXTERNAL_IDS : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_OVS_EXTERNAL_IDS:=nm_setting_ovs_external_ids_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_EXTERNAL_IDS(obj : longint) : longint;
begin
  NM_SETTING_OVS_EXTERNAL_IDS:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_OVS_EXTERNAL_IDS,NMSettingOvsExternalIDs);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_EXTERNAL_IDS_CLASS(klass : longint) : longint;
begin
  NM_SETTING_OVS_EXTERNAL_IDS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_OVS_EXTERNAL_IDS,NMSettingOvsExternalIDsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_EXTERNAL_IDS(obj : longint) : longint;
begin
  NM_IS_SETTING_OVS_EXTERNAL_IDS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_OVS_EXTERNAL_IDS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_EXTERNAL_IDS_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_OVS_EXTERNAL_IDS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_OVS_EXTERNAL_IDS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_EXTERNAL_IDS_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_OVS_EXTERNAL_IDS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_OVS_EXTERNAL_IDS,NMSettingOvsExternalIDsClass);
end;


end.
