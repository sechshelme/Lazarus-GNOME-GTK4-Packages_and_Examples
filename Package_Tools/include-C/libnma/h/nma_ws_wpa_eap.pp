
unit nma_ws_wpa_eap;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_ws_wpa_eap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_ws_wpa_eap.h
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
PNMAWsWpaEap  = ^NMAWsWpaEap;
PNMConnection  = ^NMConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0+ }
{
 * Dan Williams <dcbw@redhat.com>
 *
 * Copyright 2007 - 2019 Red Hat, Inc.
  }
{$ifndef NMA_WS_WPA_EAP_H}
{$define NMA_WS_WPA_EAP_H}
{$include "nma-version.h"}
type

{ was #define dname def_expr }
function NMA_TYPE_WS_WPA_EAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_WPA_EAP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_WPA_EAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_WPA_EAP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_WPA_EAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_WPA_EAP_GET_CLASS(obj : longint) : longint;

function nma_ws_wpa_eap_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function nma_ws_wpa_eap_new(connection:PNMConnection; is_editor:Tgboolean; secrets_only:Tgboolean; secrets_hints:PPchar):PNMAWsWpaEap;cdecl;external;
{$endif}
{ NMA_WS_WPA_EAP_H  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_WS_WPA_EAP : longint; { return type might be wrong }
  begin
    NMA_TYPE_WS_WPA_EAP:=nma_ws_wpa_eap_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_WPA_EAP(obj : longint) : longint;
begin
  NMA_WS_WPA_EAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_WS_SAE,NMAWsWpaEap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_WPA_EAP_CLASS(klass : longint) : longint;
begin
  NMA_WS_WPA_EAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_WS_SAE,NMAWsWpaEapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_WPA_EAP(obj : longint) : longint;
begin
  NMA_IS_WS_WPA_EAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_WS_SAE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_WPA_EAP_CLASS(klass : longint) : longint;
begin
  NMA_IS_WS_WPA_EAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_WS_SAE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_WPA_EAP_GET_CLASS(obj : longint) : longint;
begin
  NMA_WS_WPA_EAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_WS_SAE,NMAWsWpaEapClass);
end;


end.
