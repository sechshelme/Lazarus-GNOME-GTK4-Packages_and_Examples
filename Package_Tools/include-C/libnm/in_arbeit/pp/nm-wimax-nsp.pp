
unit nm-wimax-nsp;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-wimax-nsp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-wimax-nsp.h
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
PNMConnection  = ^NMConnection;
PNMWimaxNsp  = ^NMWimaxNsp;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 Red Hat, Inc.
 * Copyright (C) 2009 Novell, Inc.
  }
{$ifndef __NM_WIMAX_NSP_H__}
{$define __NM_WIMAX_NSP_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

{ was #define dname def_expr }
function NM_TYPE_WIMAX_NSP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIMAX_NSP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIMAX_NSP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_WIMAX_NSP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_WIMAX_NSP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIMAX_NSP_GET_CLASS(obj : longint) : longint;

const
  NM_WIMAX_NSP_NAME = 'name';  
  NM_WIMAX_NSP_SIGNAL_QUALITY = 'signal-quality';  
  NM_WIMAX_NSP_NETWORK_TYPE = 'network-type';  
{*
 * NMWimaxNsp:
 *
 * Deprecated: 1.22: WiMAX is no longer supported by NetworkManager since 1.2.0.
  }
type

function nm_wimax_nsp_get_type:TGType;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
(* Const before type ignored *)
function nm_wimax_nsp_get_name(nsp:PNMWimaxNsp):Pchar;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
function nm_wimax_nsp_get_signal_quality(nsp:PNMWimaxNsp):Tguint32;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
function nm_wimax_nsp_get_network_type(nsp:PNMWimaxNsp):TNMWimaxNspNetworkType;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
(* Const before type ignored *)
function nm_wimax_nsp_filter_connections(nsp:PNMWimaxNsp; connections:PGPtrArray):PGPtrArray;cdecl;external;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
function nm_wimax_nsp_connection_valid(nsp:PNMWimaxNsp; connection:PNMConnection):Tgboolean;cdecl;external;
{$endif}
{ __NM_WIMAX_NSP_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_WIMAX_NSP : longint; { return type might be wrong }
  begin
    NM_TYPE_WIMAX_NSP:=nm_wimax_nsp_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIMAX_NSP(obj : longint) : longint;
begin
  NM_WIMAX_NSP:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_WIMAX_NSP,NMWimaxNsp);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIMAX_NSP_CLASS(klass : longint) : longint;
begin
  NM_WIMAX_NSP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_WIMAX_NSP,NMWimaxNspClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_WIMAX_NSP(obj : longint) : longint;
begin
  NM_IS_WIMAX_NSP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_WIMAX_NSP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_WIMAX_NSP_CLASS(klass : longint) : longint;
begin
  NM_IS_WIMAX_NSP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_WIMAX_NSP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_WIMAX_NSP_GET_CLASS(obj : longint) : longint;
begin
  NM_WIMAX_NSP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_WIMAX_NSP,NMWimaxNspClass);
end;


end.
