
unit nm-device-ppp;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-ppp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-ppp.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_PPP_H__}
{$define __NM_DEVICE_PPP_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_PPP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_PPP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_PPP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_PPP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_PPP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_PPP_GET_CLASS(obj : longint) : longint;

{*
 * NMDevicePpp:
 *
 * Since: 1.10
  }
type

function nm_device_ppp_get_type:TGType;cdecl;external;
{$endif}
{ __NM_DEVICE_PPP_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_PPP : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_PPP:=nm_device_ppp_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_PPP(obj : longint) : longint;
begin
  NM_DEVICE_PPP:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_PPP,NMDevicePpp);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_PPP_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_PPP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_PPP,NMDevicePppClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_PPP(obj : longint) : longint;
begin
  NM_IS_DEVICE_PPP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_PPP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_PPP_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_PPP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_PPP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_PPP_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_PPP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_PPP,NMDevicePppClass);
end;


end.
