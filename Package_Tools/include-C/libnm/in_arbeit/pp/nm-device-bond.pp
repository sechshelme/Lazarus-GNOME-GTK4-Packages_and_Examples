
unit nm-device-bond;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-bond.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-bond.h
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
PGPtrArray  = ^GPtrArray;
PNMDeviceBond  = ^NMDeviceBond;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2012 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_BOND_H__}
{$define __NM_DEVICE_BOND_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_BOND : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BOND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BOND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_BOND(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_BOND_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BOND_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_BOND_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_BOND_CARRIER = 'carrier';  
  NM_DEVICE_BOND_SLAVES = 'slaves';  
{*
 * NMDeviceBond:
  }
type

function nm_device_bond_get_type:TGType;cdecl;external;
{xxxxxxNM_DEPRECATED_IN_1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_bond_get_hw_address(device:PNMDeviceBond):Pchar;cdecl;external;
function nm_device_bond_get_carrier(device:PNMDeviceBond):Tgboolean;cdecl;external;
{xxxxxxNM_DEPRECATED_IN_1_34_FOR(nm_device_get_ports) }
(* Const before type ignored *)
function nm_device_bond_get_slaves(device:PNMDeviceBond):PGPtrArray;cdecl;external;
{$endif}
{ __NM_DEVICE_BOND_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_BOND : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_BOND:=nm_device_bond_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BOND(obj : longint) : longint;
begin
  NM_DEVICE_BOND:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_BOND,NMDeviceBond);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BOND_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_BOND_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_BOND,NMDeviceBondClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_BOND(obj : longint) : longint;
begin
  NM_IS_DEVICE_BOND:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_BOND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_BOND_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_BOND_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_BOND);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_BOND_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_BOND_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_BOND,NMDeviceBondClass);
end;


end.
