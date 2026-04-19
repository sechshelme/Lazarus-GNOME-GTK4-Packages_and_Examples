
unit nm-device-6lowpan;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-6lowpan.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-6lowpan.h
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
PNMDevice  = ^NMDevice;
PNMDevice6Lowpan  = ^NMDevice6Lowpan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_6LOWPAN_H__}
{$define __NM_DEVICE_6LOWPAN_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_6LOWPAN : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_6LOWPAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_6LOWPAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_6LOWPAN(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_6LOWPAN_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_6LOWPAN_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_6LOWPAN_PARENT = 'parent';  
  NM_DEVICE_6LOWPAN_HW_ADDRESS = 'hw-address';  
{*
 * NMDevice6Lowpan:
 *
 * Since: 1.14
  }
type

function nm_device_6lowpan_get_type:TGType;cdecl;external;
function nm_device_6lowpan_get_parent(device:PNMDevice6Lowpan):PNMDevice;cdecl;external;
{$endif}
{ __NM_DEVICE_6LOWPAN_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_6LOWPAN : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_6LOWPAN:=nm_device_6lowpan_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_6LOWPAN(obj : longint) : longint;
begin
  NM_DEVICE_6LOWPAN:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_6LOWPAN,NMDevice6Lowpan);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_6LOWPAN_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_6LOWPAN_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_6LOWPAN,NMDevice6LowpanClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_6LOWPAN(obj : longint) : longint;
begin
  NM_IS_DEVICE_6LOWPAN:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_6LOWPAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_6LOWPAN_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_6LOWPAN_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_6LOWPAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_6LOWPAN_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_6LOWPAN_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_6LOWPAN,NMDevice6LowpanClass);
end;


end.
