
unit soup_auth_domain;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_auth_domain.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_auth_domain.h
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
PSoupAuthDomain  = ^SoupAuthDomain;
PSoupAuthDomainClass  = ^SoupAuthDomainClass;
PSoupServerMessage  = ^SoupServerMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2007 Novell, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DOMAIN : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (SoupAuthDomain, soup_auth_domain, SOUP, AUTH_DOMAIN, GObject) }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PSoupAuthDomainClass = ^TSoupAuthDomainClass;
  TSoupAuthDomainClass = record
      parent_class : TGObjectClass;
      accepts : function (domain:PSoupAuthDomain; msg:PSoupServerMessage; header:Pchar):Pchar;cdecl;
      challenge : function (domain:PSoupAuthDomain; msg:PSoupServerMessage):Pchar;cdecl;
      check_password : function (domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; password:Pchar):Tgboolean;cdecl;
      padding : array[0..5] of Tgpointer;
    end;


  TSoupAuthDomainFilter = function (domain:PSoupAuthDomain; msg:PSoupServerMessage; user_data:Tgpointer):Tgboolean;cdecl;
(* Const before type ignored *)

  TSoupAuthDomainGenericAuthCallback = function (domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; user_data:Tgpointer):Tgboolean;cdecl;
(* Const before type ignored *)

procedure soup_auth_domain_add_path(domain:PSoupAuthDomain; path:Pchar);cdecl;external;
(* Const before type ignored *)
procedure soup_auth_domain_remove_path(domain:PSoupAuthDomain; path:Pchar);cdecl;external;
procedure soup_auth_domain_set_filter(domain:PSoupAuthDomain; filter:TSoupAuthDomainFilter; filter_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
function soup_auth_domain_get_realm(domain:PSoupAuthDomain):Pchar;cdecl;external;
procedure soup_auth_domain_set_generic_auth_callback(domain:PSoupAuthDomain; auth_callback:TSoupAuthDomainGenericAuthCallback; auth_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function soup_auth_domain_check_password(domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; password:Pchar):Tgboolean;cdecl;external;
function soup_auth_domain_covers(domain:PSoupAuthDomain; msg:PSoupServerMessage):Tgboolean;cdecl;external;
function soup_auth_domain_accepts(domain:PSoupAuthDomain; msg:PSoupServerMessage):Pchar;cdecl;external;
procedure soup_auth_domain_challenge(domain:PSoupAuthDomain; msg:PSoupServerMessage);cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DOMAIN : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_DOMAIN:=soup_auth_domain_get_type;
  end;


end.
