
unit nm-device-adsl;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-adsl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-adsl.h
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
PNMDeviceAdsl  = ^NMDeviceAdsl;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 Pantelis Koukousoulas <pktoss@gmail.com>
  }
{$ifndef __NM_DEVICE_ADSL_H__}
{$define __NM_DEVICE_ADSL_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_ADSL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_ADSL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_ADSL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_ADSL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_ADSL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_ADSL_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_ADSL_CARRIER = 'carrier';  
{*
 * NMDeviceAdsl:
  }
type

function nm_device_adsl_get_type:TGType;cdecl;external;
function nm_device_adsl_get_carrier(device:PNMDeviceAdsl):Tgboolean;cdecl;external;
{$endif}
{ __NM_DEVICE_ADSL_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_ADSL : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_ADSL:=nm_device_adsl_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_ADSL(obj : longint) : longint;
begin
  NM_DEVICE_ADSL:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_ADSL,NMDeviceAdsl);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_ADSL_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_ADSL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_ADSL,NMDeviceAdslClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_ADSL(obj : longint) : longint;
begin
  NM_IS_DEVICE_ADSL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_ADSL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_ADSL_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_ADSL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_ADSL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_ADSL_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_ADSL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_ADSL,NMDeviceAdslClass);
end;


end.
