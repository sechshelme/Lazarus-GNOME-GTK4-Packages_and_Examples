
unit soup_auth_domain_digest;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_auth_domain_digest.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_auth_domain_digest.h
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
PSoupAuthDomainDigestAuthCallback  = ^SoupAuthDomainDigestAuthCallback;
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
function SOUP_TYPE_AUTH_DOMAIN_DIGEST : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupAuthDomainDigest, soup_auth_domain_digest, SOUP, AUTH_DOMAIN_DIGEST, SoupAuthDomain) }
(* Const before type ignored *)
function soup_auth_domain_digest_new(optname1:Pchar; args:array of const):PSoupAuthDomain;cdecl;external;
function soup_auth_domain_digest_new(optname1:Pchar):PSoupAuthDomain;cdecl;external;
(* Const before type ignored *)
type
  PSoupAuthDomainDigestAuthCallback = ^TSoupAuthDomainDigestAuthCallback;
  TSoupAuthDomainDigestAuthCallback = function (domain:PSoupAuthDomain; msg:PSoupServerMessage; username:Pchar; user_data:Tgpointer):Pchar;cdecl;

procedure soup_auth_domain_digest_set_auth_callback(domain:PSoupAuthDomain; callback:TSoupAuthDomainDigestAuthCallback; user_data:Tgpointer; dnotify:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function soup_auth_domain_digest_encode_password(username:Pchar; realm:Pchar; password:Pchar):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_AUTH_DOMAIN_DIGEST : longint; { return type might be wrong }
  begin
    SOUP_TYPE_AUTH_DOMAIN_DIGEST:=soup_auth_domain_digest_get_type;
  end;


end.
