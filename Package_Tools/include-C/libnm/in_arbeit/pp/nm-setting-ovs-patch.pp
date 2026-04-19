
unit nm-setting-ovs-patch;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-ovs-patch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-ovs-patch.h
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
PNMSetting  = ^NMSetting;
PNMSettingOvsPatch  = ^NMSettingOvsPatch;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_OVS_PATCH_H__}
{$define __NM_SETTING_OVS_PATCH_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_PATCH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PATCH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PATCH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_PATCH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_PATCH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PATCH_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_OVS_PATCH_SETTING_NAME = 'ovs-patch';  
  NM_SETTING_OVS_PATCH_PEER = 'peer';  
type

function nm_setting_ovs_patch_get_type:TGType;cdecl;external;
function nm_setting_ovs_patch_new:PNMSetting;cdecl;external;
(* Const before type ignored *)
function nm_setting_ovs_patch_get_peer(self:PNMSettingOvsPatch):Pchar;cdecl;external;
{$endif}
{ __NM_SETTING_OVS_PATCH_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_OVS_PATCH : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_OVS_PATCH:=nm_setting_ovs_patch_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PATCH(obj : longint) : longint;
begin
  NM_SETTING_OVS_PATCH:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_OVS_PATCH,NMSettingOvsPatch);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PATCH_CLASS(klass : longint) : longint;
begin
  NM_SETTING_OVS_PATCH_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_OVS_PATCHCONFIG,NMSettingOvsPatchClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_PATCH(obj : longint) : longint;
begin
  NM_IS_SETTING_OVS_PATCH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_OVS_PATCH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_OVS_PATCH_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_OVS_PATCH_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_OVS_PATCH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_OVS_PATCH_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_OVS_PATCH_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_OVS_PATCH,NMSettingOvsPatchClass);
end;


end.
