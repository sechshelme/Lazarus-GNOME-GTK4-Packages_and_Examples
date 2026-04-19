
unit nm-setting-link;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-setting-link.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-setting-link.h
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
PNMSettingLink  = ^NMSettingLink;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2020 Red Hat, Inc.
  }
{$ifndef __NM_SETTING_LINK_H__}
{$define __NM_SETTING_LINK_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-setting.h"}

{ was #define dname def_expr }
function NM_TYPE_SETTING_LINK : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_LINK(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_LINK_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LINK_GET_CLASS(obj : longint) : longint;

const
  NM_SETTING_LINK_SETTING_NAME = 'link';  
  NM_SETTING_LINK_TX_QUEUE_LENGTH = 'tx-queue-length';  
  NM_SETTING_LINK_GSO_MAX_SIZE = 'gso-max-size';  
  NM_SETTING_LINK_GSO_MAX_SEGMENTS = 'gso-max-segments';  
  NM_SETTING_LINK_GRO_MAX_SIZE = 'gro-max-size';  
type

function nm_setting_link_get_type:TGType;cdecl;external;
function nm_setting_link_new:PNMSetting;cdecl;external;
function nm_setting_link_get_tx_queue_length(setting:PNMSettingLink):Tgint64;cdecl;external;
function nm_setting_link_get_gso_max_size(setting:PNMSettingLink):Tgint64;cdecl;external;
function nm_setting_link_get_gso_max_segments(setting:PNMSettingLink):Tgint64;cdecl;external;
function nm_setting_link_get_gro_max_size(setting:PNMSettingLink):Tgint64;cdecl;external;
{$endif}
{ __NM_SETTING_LINK_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SETTING_LINK : longint; { return type might be wrong }
  begin
    NM_TYPE_SETTING_LINK:=nm_setting_link_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LINK(obj : longint) : longint;
begin
  NM_SETTING_LINK:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SETTING_LINK,NMSettingLink);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LINK_CLASS(klass : longint) : longint;
begin
  NM_SETTING_LINK_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SETTING_LINK,NMSettingLinkClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_LINK(obj : longint) : longint;
begin
  NM_IS_SETTING_LINK:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SETTING_LINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SETTING_LINK_CLASS(klass : longint) : longint;
begin
  NM_IS_SETTING_LINK_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SETTING_LINK);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SETTING_LINK_GET_CLASS(obj : longint) : longint;
begin
  NM_SETTING_LINK_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SETTING_LINK,NMSettingLinkClass);
end;


end.
