
unit soup_auth;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_auth.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_auth.h
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
PGHashTable  = ^GHashTable;
PGSList  = ^GSList;
PGUri  = ^GUri;
PSoupAuth  = ^SoupAuth;
PSoupAuthClass  = ^SoupAuthClass;
PSoupMessage  = ^SoupMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2001-2003, Ximian, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-headers.h"}

{ was #define dname def_expr }
function SOUP_TYPE_AUTH : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (SoupAuth, soup_auth, SOUP, AUTH, GObject) }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PSoupAuthClass = ^TSoupAuthClass;
  TSoupAuthClass = record
      parent_class : TGObjectClass;
      scheme_name : Pchar;
      strength : Tguint;
      update : function (auth:PSoupAuth; msg:PSoupMessage; auth_header:PGHashTable):Tgboolean;cdecl;
      get_protection_space : function (auth:PSoupAuth; source_uri:PGUri):PGSList;cdecl;
      authenticate : procedure (auth:PSoupAuth; username:Pchar; password:Pchar);cdecl;
      is_authenticated : function (auth:PSoupAuth):Tgboolean;cdecl;
      get_authorization : function (auth:PSoupAuth; msg:PSoupMessage):Pchar;cdecl;
      is_ready : function (auth:PSoupAuth; msg:PSoupMessage):Tgboolean;cdecl;
      can_authenticate : function (auth:PSoupAuth):Tgboolean;cdecl;
      padding : array[0..5] of Tgpointer;
    end;

(* Const before type ignored *)

function soup_auth_new(_type:TGType; msg:PSoupMessage; auth_header:Pchar):PSoupAuth;cdecl;external;
(* Const before type ignored *)
function soup_auth_update(auth:PSoupAuth; msg:PSoupMessage; auth_header:Pchar):Tgboolean;cdecl;external;
function soup_auth_is_for_proxy(auth:PSoupAuth):Tgboolean;cdecl;external;
(* Const before type ignored *)
function soup_auth_get_scheme_name(auth:PSoupAuth):Pchar;cdecl;external;
(* Const before type ignored *)
function soup_auth_get_authority(auth:PSoupAuth):Pchar;cdecl;external;
(* Const before type ignored *)
function soup_auth_get_realm(auth:PSoupAuth):Pchar;cdecl;external;
function soup_auth_get_info(auth:PSoupAuth):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure soup_auth_authenticate(auth:PSoupAuth; username:Pchar; password:Pchar);cdecl;external;
procedure soup_auth_cancel(auth:PSoupAuth);cdecl;external;
function soup_auth_is_authenticated(auth:PSoupAuth):Tgboolean;cdecl;external;
function soup_auth_is_cancelled(auth:PSoupAuth):Tgboolean;cdecl;external;
function soup_auth_is_ready(auth:PSoupAuth; msg:PSoupMessage):Tgboolean;cdecl;external;
function soup_auth_can_authenticate(auth:PSoupAuth):Tgboolean;cdecl;external;
function soup_auth_get_authorization(auth:PSoupAuth; msg:PSoupMessage):Pchar;cdecl;external;
function soup_auth_get_protection_space(auth:PSoupAuth; source_uri:PGUri):PGSList;cdecl;external;
procedure soup_auth_free_protection_space(auth:PSoupAuth; space:PGSList);cdecl;external;
function soup_auth_negotiate_supported:Tgboolean;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_AUTH_BASIC : longint; { return type might be wrong }

function soup_auth_basic_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DIGEST : longint; { return type might be wrong }

function soup_auth_digest_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_AUTH_NTLM : longint; { return type might be wrong }

function soup_auth_ntlm_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_AUTH_NEGOTIATE : longint; { return type might be wrong }

function soup_auth_negotiate_get_type:TGType;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_AUTH : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH:=soup_auth_get_type;
  end;

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_BASIC : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_BASIC:=soup_auth_basic_get_type;
  end;

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DIGEST : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_DIGEST:=soup_auth_digest_get_type;
  end;

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_NTLM : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_NTLM:=soup_auth_ntlm_get_type;
  end;

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_NEGOTIATE : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_NEGOTIATE:=soup_auth_negotiate_get_type;
  end;


end.
