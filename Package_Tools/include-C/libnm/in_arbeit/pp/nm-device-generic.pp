
unit nm-device-generic;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-generic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-generic.h
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
PNMDeviceGeneric  = ^NMDeviceGeneric;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2013 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_GENERIC_H__}
{$define __NM_DEVICE_GENERIC_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_GENERIC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_GENERIC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_GENERIC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_GENERIC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_GENERIC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_GENERIC_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_GENERIC_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_GENERIC_TYPE_DESCRIPTION = 'type-description';  
{*
 * NMDeviceGeneric:
  }
type

function nm_device_generic_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_generic_get_hw_address(device:PNMDeviceGeneric):Pchar;cdecl;external;
{$endif}
{ __NM_DEVICE_GENERIC_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_GENERIC : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_GENERIC:=nm_device_generic_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_GENERIC(obj : longint) : longint;
begin
  NM_DEVICE_GENERIC:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_GENERIC,NMDeviceGeneric);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_GENERIC_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_GENERIC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_GENERIC,NMDeviceGenericClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_GENERIC(obj : longint) : longint;
begin
  NM_IS_DEVICE_GENERIC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_GENERIC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_GENERIC_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_GENERIC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_GENERIC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_GENERIC_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_GENERIC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_GENERIC,NMDeviceGenericClass);
end;


end.
