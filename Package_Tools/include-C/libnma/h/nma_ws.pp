
unit nma_ws;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_ws.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_ws
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
PGError  = ^GError;
PGtkSizeGroup  = ^GtkSizeGroup;
PNMAWs  = ^NMAWs;
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
{$ifndef NMA_WS_H}
{$define NMA_WS_H}
{$include "nma-version.h"}
type

{ was #define dname def_expr }
function NMA_TYPE_WS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_GET_INTERFACE(obj : longint) : longint;

function nma_ws_get_type:TGType;cdecl;external;
function nma_ws_validate(self:PNMAWs; error:PPGError):Tgboolean;cdecl;external;
procedure nma_ws_add_to_size_group(self:PNMAWs; group:PGtkSizeGroup);cdecl;external;
procedure nma_ws_fill_connection(self:PNMAWs; connection:PNMConnection);cdecl;external;
procedure nma_ws_update_secrets(self:PNMAWs; connection:PNMConnection);cdecl;external;
procedure nma_ws_focus_secrets_default(self:PNMAWs);cdecl;external;
function nma_ws_adhoc_compatible(self:PNMAWs):Tgboolean;cdecl;external;
function nma_ws_hotspot_compatible(self:PNMAWs):Tgboolean;cdecl;external;
{$include "nma-ws-802-1x.h"}
{$include "nma-ws-dynamic-wep.h"}
{$include "nma-ws-leap.h"}
{$include "nma-ws-owe.h"}
{$include "nma-ws-sae.h"}
{$include "nma-ws-wep-key.h"}
{$include "nma-ws-wpa-eap.h"}
{$include "nma-ws-wpa-psk.h"}
{$endif}
{ NMA_WS_H  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_WS : longint; { return type might be wrong }
  begin
    NMA_TYPE_WS:=nma_ws_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS(obj : longint) : longint;
begin
  NMA_WS:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_WS,NMAWs);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WS(obj : longint) : longint;
begin
  NMA_IS_WS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_WS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WS_GET_INTERFACE(obj : longint) : longint;
begin
  NMA_WS_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,NMA_TYPE_WS,NMAWsInterface);
end;


end.
