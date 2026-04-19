
unit nm-device-wimax;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-wimax.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-wimax.h
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
PNMDeviceWimax  = ^NMDeviceWimax;
PNMWimaxNsp  = ^NMWimaxNsp;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 - 2012 Red Hat, Inc.
 * Copyright (C) 2009 Novell, Inc.
  }
{$ifndef __NM_DEVICE_WIMAX_H__}
{$define __NM_DEVICE_WIMAX_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_WIMAX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIMAX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIMAX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIMAX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIMAX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIMAX_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_WIMAX_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_WIMAX_ACTIVE_NSP = 'active-nsp';  
  NM_DEVICE_WIMAX_CENTER_FREQUENCY = 'center-frequency';  
  NM_DEVICE_WIMAX_RSSI = 'rssi';  
  NM_DEVICE_WIMAX_CINR = 'cinr';  
  NM_DEVICE_WIMAX_TX_POWER = 'tx-power';  
  NM_DEVICE_WIMAX_BSID = 'bsid';  
  NM_DEVICE_WIMAX_NSPS = 'nsps';  
{*
 * NMDeviceWimax:
 *
 * Deprecated: 1.22: WiMAX is no longer supported by NetworkManager since 1.2.0.
  }
type
{xxxx NM_DEPRECATED_IN__1_2 }

function nm_device_wimax_get_type:TGType;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
function nm_device_wimax_get_hw_address(wimax:PNMDeviceWimax):Pchar;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_active_nsp(wimax:PNMDeviceWimax):PNMWimaxNsp;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
function nm_device_wimax_get_nsp_by_path(wimax:PNMDeviceWimax; path:Pchar):PNMWimaxNsp;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
function nm_device_wimax_get_nsps(wimax:PNMDeviceWimax):PGPtrArray;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_center_frequency(self:PNMDeviceWimax):Tguint;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_rssi(self:PNMDeviceWimax):longint;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_cinr(self:PNMDeviceWimax):longint;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
function nm_device_wimax_get_tx_power(self:PNMDeviceWimax):longint;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_2 }
(* Const before type ignored *)
function nm_device_wimax_get_bsid(self:PNMDeviceWimax):Pchar;cdecl;external;
{$endif}
{ __NM_DEVICE_WIMAX_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_WIMAX : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_WIMAX:=nm_device_wimax_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIMAX(obj : longint) : longint;
begin
  NM_DEVICE_WIMAX:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_WIMAX,NMDeviceWimax);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIMAX_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_WIMAX_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_WIMAX,NMDeviceWimaxClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIMAX(obj : longint) : longint;
begin
  NM_IS_DEVICE_WIMAX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_WIMAX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_WIMAX_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_WIMAX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_WIMAX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_WIMAX_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_WIMAX_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_WIMAX,NMDeviceWimaxClass);
end;


end.
