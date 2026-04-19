
unit nm-device-macsec;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-device-macsec.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-device-macsec.h
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
PNMDevice  = ^NMDevice;
PNMDeviceMacsec  = ^NMDeviceMacsec;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2017 Red Hat, Inc.
  }
{$ifndef __NM_DEVICE_MACSEC_H__}
{$define __NM_DEVICE_MACSEC_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-device.h"}

{ was #define dname def_expr }
function NM_TYPE_DEVICE_MACSEC : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACSEC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACSEC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MACSEC(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MACSEC_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACSEC_GET_CLASS(obj : longint) : longint;

const
  NM_DEVICE_MACSEC_PARENT = 'parent';  
  NM_DEVICE_MACSEC_HW_ADDRESS = 'hw-address';  
  NM_DEVICE_MACSEC_SCI = 'sci';  
  NM_DEVICE_MACSEC_ICV_LENGTH = 'icv-length';  
  NM_DEVICE_MACSEC_CIPHER_SUITE = 'cipher-suite';  
  NM_DEVICE_MACSEC_WINDOW = 'window';  
  NM_DEVICE_MACSEC_ENCODING_SA = 'encoding-sa';  
  NM_DEVICE_MACSEC_VALIDATION = 'validation';  
  NM_DEVICE_MACSEC_ENCRYPT = 'encrypt';  
  NM_DEVICE_MACSEC_PROTECT = 'protect';  
  NM_DEVICE_MACSEC_INCLUDE_SCI = 'include-sci';  
  NM_DEVICE_MACSEC_ES = 'es';  
  NM_DEVICE_MACSEC_SCB = 'scb';  
  NM_DEVICE_MACSEC_REPLAY_PROTECT = 'replay-protect';  
{*
 * NMDeviceMacsec:
 *
 * Since: 1.6
  }
type

function nm_device_macsec_get_type:TGType;cdecl;external;
function nm_device_macsec_get_parent(device:PNMDeviceMacsec):PNMDevice;cdecl;external;
{xxxx NM_DEPRECATED_IN__1_24_FOR(nm_device_get_hw_address) }
(* Const before type ignored *)
function nm_device_macsec_get_hw_address(device:PNMDeviceMacsec):Pchar;cdecl;external;
function nm_device_macsec_get_sci(device:PNMDeviceMacsec):Tguint64;cdecl;external;
function nm_device_macsec_get_icv_length(device:PNMDeviceMacsec):Tguint8;cdecl;external;
function nm_device_macsec_get_cipher_suite(device:PNMDeviceMacsec):Tguint64;cdecl;external;
function nm_device_macsec_get_window(device:PNMDeviceMacsec):Tguint;cdecl;external;
function nm_device_macsec_get_encoding_sa(device:PNMDeviceMacsec):Tguint8;cdecl;external;
(* Const before type ignored *)
function nm_device_macsec_get_validation(device:PNMDeviceMacsec):Pchar;cdecl;external;
function nm_device_macsec_get_encrypt(device:PNMDeviceMacsec):Tgboolean;cdecl;external;
function nm_device_macsec_get_protect(device:PNMDeviceMacsec):Tgboolean;cdecl;external;
function nm_device_macsec_get_include_sci(device:PNMDeviceMacsec):Tgboolean;cdecl;external;
function nm_device_macsec_get_es(device:PNMDeviceMacsec):Tgboolean;cdecl;external;
function nm_device_macsec_get_scb(device:PNMDeviceMacsec):Tgboolean;cdecl;external;
function nm_device_macsec_get_replay_protect(device:PNMDeviceMacsec):Tgboolean;cdecl;external;
{$endif}
{ __NM_DEVICE_MACSEC_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_DEVICE_MACSEC : longint; { return type might be wrong }
  begin
    NM_TYPE_DEVICE_MACSEC:=nm_device_macsec_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACSEC(obj : longint) : longint;
begin
  NM_DEVICE_MACSEC:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_DEVICE_MACSEC,NMDeviceMacsec);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACSEC_CLASS(klass : longint) : longint;
begin
  NM_DEVICE_MACSEC_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_DEVICE_MACSEC,NMDeviceMacsecClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MACSEC(obj : longint) : longint;
begin
  NM_IS_DEVICE_MACSEC:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_DEVICE_MACSEC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_DEVICE_MACSEC_CLASS(klass : longint) : longint;
begin
  NM_IS_DEVICE_MACSEC_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_DEVICE_MACSEC);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_DEVICE_MACSEC_GET_CLASS(obj : longint) : longint;
begin
  NM_DEVICE_MACSEC_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_DEVICE_MACSEC,NMDeviceMacsecClass);
end;


end.
