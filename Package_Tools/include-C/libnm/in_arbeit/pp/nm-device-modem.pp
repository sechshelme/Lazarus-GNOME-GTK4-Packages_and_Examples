
unit nm-device-modem;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-modem.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-modem.h
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
PNMDeviceModem  = ^NMDeviceModem;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 - 2012 Red Hat, Inc.
 * Copyright (C) 2008 Novell, Inc.
  }
{$ifndef __NM_DEVICE_MODEM_H__}
{$define __NM_DEVICE_MODEM_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_MODEM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MODEM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MODEM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MODEM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MODEM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MODEM_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_MODEM_MODEM_CAPABILITIES = 'modem-capabilities';  
  NM_DEVICE_MODEM_CURRENT_CAPABILITIES = 'current-capabilities';  
  NM_DEVICE_MODEM_DEVICE_ID = 'device-id';  
  NM_DEVICE_MODEM_OPERATOR_CODE = 'operator-code';  
  NM_DEVICE_MODEM_APN = 'apn';  
{*
 * NMDeviceModem:
  }
type

function nm_device_modem_get_type:TGType;cdecl;external;
function nm_device_modem_get_modem_capabilities(self:PNMDeviceModem):TNMDeviceModemCapabilities;cdecl;external;
function nm_device_modem_get_current_capabilities(self:PNMDeviceModem):TNMDeviceModemCapabilities;cdecl;external;
(* Const before type ignored *)
function nm_device_modem_get_device_id(self:PNMDeviceModem):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_modem_get_operator_code(self:PNMDeviceModem):Pchar;cdecl;external;
(* Const before type ignored *)
function nm_device_modem_get_apn(self:PNMDeviceModem):Pchar;cdecl;external;
{$endif}
{ __NM_DEVICE_MODEM_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_MODEM : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_MODEM:=nm_device_modem_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MODEM(obj : longint) : longint;
begin
  NM_DEVICE_MODEM:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_MODEM,NMDeviceModem);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MODEM_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_MODEM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_MODEM,NMDeviceModemClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MODEM(obj : longint) : longint;
begin
  NM_IS_DEVICE_MODEM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_MODEM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MODEM_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_MODEM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_MODEM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MODEM_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_MODEM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_MODEM,NMDeviceModemClass);
end;


end.
