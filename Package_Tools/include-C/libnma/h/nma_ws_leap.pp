
unit nma_ws_leap;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_ws_leap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_ws_leap.h
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
PNMAWsLeap  = ^NMAWsLeap;
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
{$ifndef NMA_WS_LEAP_H}
{$define NMA_WS_LEAP_H}
{$include "nma-version.h"}
type

{ was #define dname def_expr }
function NMA_TYPE_WS_LEAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_LEAP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_LEAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_LEAP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_LEAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_LEAP_GET_CLASS(obj : longint) : longint;

function nma_ws_leap_get_type:TGType;cdecl;external;
function nma_ws_leap_new(connection:PNMConnection; secrets_only:Tgboolean):PNMAWsLeap;cdecl;external;
{$endif}
{ NMA_WS_LEAP_H  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_WS_LEAP : longint; { return type might be wrong }
  begin
    NMA_TYPE_WS_LEAP:=nma_ws_leap_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_LEAP(obj : longint) : longint;
begin
  NMA_WS_LEAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_WS_LEAP,NMAWsLeap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_LEAP_CLASS(klass : longint) : longint;
begin
  NMA_WS_LEAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_WS_LEAP,NMAWsLeapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_LEAP(obj : longint) : longint;
begin
  NMA_IS_WS_LEAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_WS_LEAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_LEAP_CLASS(klass : longint) : longint;
begin
  NMA_IS_WS_LEAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_WS_LEAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_LEAP_GET_CLASS(obj : longint) : longint;
begin
  NMA_WS_LEAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_WS_LEAP,NMAWsLeapClass);
end;


end.
