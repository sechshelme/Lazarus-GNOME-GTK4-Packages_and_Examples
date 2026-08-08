
unit nma_ws_dynamic_wep;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_ws_dynamic_wep.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_ws_dynamic_wep.h
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
PNMAWsDynamicWep  = ^NMAWsDynamicWep;
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
{$ifndef NMA_WS_DYNAMIC_WEP_H}
{$define NMA_WS_DYNAMIC_WEP_H}
{$include "nma-version.h"}
type

{ was #define dname def_expr }
function NMA_TYPE_WS_DYNAMIC_WEP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_DYNAMIC_WEP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_DYNAMIC_WEP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_DYNAMIC_WEP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_DYNAMIC_WEP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_DYNAMIC_WEP_GET_CLASS(obj : longint) : longint;

function nma_ws_dynamic_wep_get_type:TGType;cdecl;external;
function nma_ws_dynamic_wep_new(connection:PNMConnection; is_editor:Tgboolean; secrets_only:Tgboolean):PNMAWsDynamicWep;cdecl;external;
{$endif}
{ NMA_WS_DYNAMIC_WEP_H  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_WS_DYNAMIC_WEP : longint; { return type might be wrong }
  begin
    NMA_TYPE_WS_DYNAMIC_WEP:=nma_ws_dynamic_wep_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_DYNAMIC_WEP(obj : longint) : longint;
begin
  NMA_WS_DYNAMIC_WEP:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_WS_SAE,NMAWsDynamicWep);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_DYNAMIC_WEP_CLASS(klass : longint) : longint;
begin
  NMA_WS_DYNAMIC_WEP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_WS_SAE,NMAWsDynamicWepClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_DYNAMIC_WEP(obj : longint) : longint;
begin
  NMA_IS_WS_DYNAMIC_WEP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_WS_SAE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS_DYNAMIC_WEP_CLASS(klass : longint) : longint;
begin
  NMA_IS_WS_DYNAMIC_WEP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_WS_SAE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_DYNAMIC_WEP_GET_CLASS(obj : longint) : longint;
begin
  NMA_WS_DYNAMIC_WEP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_WS_SAE,NMAWsDynamicWepClass);
end;


end.
