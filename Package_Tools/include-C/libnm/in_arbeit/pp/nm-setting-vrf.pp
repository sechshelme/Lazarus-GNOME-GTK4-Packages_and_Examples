
unit nm-setting-vrf;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-vrf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-vrf.h
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
PNMSetting  = ^NMSetting;
PNMSettingVrf  = ^NMSettingVrf;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{$ifndef __NM_SETTING_VRF_H__}
{$define __NM_SETTING_VRF_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_VRF : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VRF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VRF_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VRF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VRF_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VRF_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_VRF_SETTING_NAME = 'vrf';  
  NM_SETTING_VRF_TABLE = 'table';  
type

function nm_setting_vrf_get_type:TGType;cdecl;external;
function nm_setting_vrf_new:PNMSetting;cdecl;external;
function nm_setting_vrf_get_table(setting:PNMSettingVrf):Tguint32;cdecl;external;
{$endif}
{ __NM_SETTING_VRF_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_VRF : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_VRF:=nm_setting_vrf_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VRF(obj : longint) : longint;
begin
  NM_SETTING_VRF:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_VRF,NMSettingVrf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VRF_CLASS(klass : longint) : longint;
begin
  NM_SETTING_VRF_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_VRFCONFIG,NMSettingVrfClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VRF(obj : longint) : longint;
begin
  NM_IS_SETTING_VRF:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_VRF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_VRF_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_VRF_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_VRF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_VRF_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_VRF_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_VRF,NMSettingVrfClass);
end;


end.
