
unit nm-device-dummy;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-dummy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-dummy.h
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
PNMDeviceDummy  = ^NMDeviceDummy;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_DUMMY_H__}
{$define __NM_DEVICE_DUMMY_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_DUMMY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_DUMMY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_DUMMY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_DUMMY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_DUMMY_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_DUMMY_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_DUMMY_HW_ADDRESS = 'hw-address';  
{*
 * NMDeviceDummy:
 *
 * Since: 1.8
  }
type

function nm_device_dummy_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_dummy_get_hw_address(device:PNMDeviceDummy):Pchar;cdecl;external;
{$endif}
{ __NM_DEVICE_DUMMY_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_DUMMY : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_DUMMY:=nm_device_dummy_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_DUMMY(obj : longint) : longint;
begin
  NM_DEVICE_DUMMY:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_DUMMY,NMDeviceDummy);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_DUMMY_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_DUMMY_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_DUMMY,NMDeviceDummyClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_DUMMY(obj : longint) : longint;
begin
  NM_IS_DEVICE_DUMMY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_DUMMY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_DUMMY_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_DUMMY_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_DUMMY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_DUMMY_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_DUMMY_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_DUMMY,NMDeviceDummyClass);
end;


end.
