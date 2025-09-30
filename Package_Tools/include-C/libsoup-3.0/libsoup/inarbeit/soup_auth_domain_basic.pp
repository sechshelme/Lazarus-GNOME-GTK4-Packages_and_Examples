
unit soup_auth_domain_basic;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_auth_domain_basic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_auth_domain_basic.h
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
PSoupServerMessage  = ^SoupServerMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2007 Novell, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-auth-domain.h"}

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DOMAIN_BASIC : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupAuthDomainBasic, soup_auth_domain_basic, SOUP, AUTH_DOMAIN_BASIC, SoupAuthDomain) }
(* Const before type ignored *)
function soup_auth_domain_basic_new(optname1:Pchar; args:array of const):PSoupAuthDomain;cdecl;external;
function soup_auth_domain_basic_new(optname1:Pchar):PSoupAuthDomain;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
type

  TSoupAuthDomainBasicAuthCallback = function (domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; password:Pchar; user_data:Tgpointer):Tgboolean;cdecl;

procedure soup_auth_domain_basic_set_auth_callback(domain:PSoupAuthDomain; callback:TSoupAuthDomainBasicAuthCallback; user_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DOMAIN_BASIC : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_DOMAIN_BASIC:=soup_auth_domain_basic_get_type;
  end;


end.
