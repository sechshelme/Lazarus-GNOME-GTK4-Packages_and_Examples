
unit nm-device-vrf;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-vrf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-vrf.h
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
PNMDeviceVrf  = ^NMDeviceVrf;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{$ifndef __NM_DEVICE_VRF_H__}
{$define __NM_DEVICE_VRF_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_VRF : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VRF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VRF_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VRF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VRF_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VRF_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_VRF_TABLE = 'table';  
{*
 * NMDeviceVrf:
 *
 * Since: 1.24
  }
type

function nm_device_vrf_get_type:TGType;cdecl;external;
function nm_device_vrf_get_table(device:PNMDeviceVrf):Tguint32;cdecl;external;
{$endif}
{ __NM_DEVICE_VRF_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_VRF : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_VRF:=nm_device_vrf_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VRF(obj : longint) : longint;
begin
  NM_DEVICE_VRF:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_VRF,NMDeviceVrf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VRF_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_VRF_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_VRF,NMDeviceVrfClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VRF(obj : longint) : longint;
begin
  NM_IS_DEVICE_VRF:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_VRF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_VRF_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_VRF_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_VRF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_VRF_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_VRF_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_VRF,NMDeviceVrfClass);
end;


end.
