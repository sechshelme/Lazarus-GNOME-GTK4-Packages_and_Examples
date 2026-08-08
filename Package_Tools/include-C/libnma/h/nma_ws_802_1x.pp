
unit nma_ws_802_1x;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_ws_802_1x.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_ws_802_1x.h
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
PNMAWs8021x  = ^NMAWs8021x;
PNMConnection  = ^NMConnection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0+ }
{
 * Copyright 2007 - 2019 Red Hat, Inc.
  }
{$ifndef NMA_WS_802_1X_H}
{$define NMA_WS_802_1X_H}
{$include "nma-version.h"}
type

{ was #define dname def_expr }
function NMA_TYPE_WS_802_1X : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_802_1X(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_802_1X_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_802_1X(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_802_1X_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_802_1X_GET_CLASS(obj : longint) : longint;

function nma_ws_802_1x_get_type:TGType;cdecl;external;
function nma_ws_802_1x_new(connection:PNMConnection; is_editor:Tgboolean; secrets_only:Tgboolean):PNMAWs8021x;cdecl;external;
{$endif}
{ NMA_WS_802_1X_H  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_WS_802_1X : longint; { return type might be wrong }
  begin
    NMA_TYPE_WS_802_1X:=nma_ws_802_1x_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_802_1X(obj : longint) : longint;
begin
  NMA_WS_802_1X:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_WS_802_1X,NMAWs8021x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_802_1X_CLASS(klass : longint) : longint;
begin
  NMA_WS_802_1X_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_WS_802_1X,NMAWs8021xClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_802_1X(obj : longint) : longint;
begin
  NMA_IS_WS_802_1X:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_WS_802_1X);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_802_1X_CLASS(klass : longint) : longint;
begin
  NMA_IS_WS_802_1X_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_WS_802_1X);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_802_1X_GET_CLASS(obj : longint) : longint;
begin
  NMA_WS_802_1X_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_WS_802_1X,NMAWs8021xClass);
end;


end.
