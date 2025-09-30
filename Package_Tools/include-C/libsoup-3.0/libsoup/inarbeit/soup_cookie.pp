
unit soup_cookie;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_cookie.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_cookie.h
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
PGDateTime  = ^GDateTime;
PGSList  = ^GSList;
PGUri  = ^GUri;
PSoupCookie  = ^SoupCookie;
PSoupMessage  = ^SoupMessage;
PSoupSameSitePolicy  = ^SoupSameSitePolicy;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{ 
 * Copyright 2007, 2008 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{*
 * SoupSameSitePolicy:
 * @SOUP_SAME_SITE_POLICY_NONE: The cookie is exposed with both cross-site and same-site requests
 * @SOUP_SAME_SITE_POLICY_LAX: The cookie is withheld on cross-site requests but exposed on cross-site navigations
 * @SOUP_SAME_SITE_POLICY_STRICT: The cookie is only exposed for same-site requests
 *
 * Represents the same-site policies of a cookie.
  }
type
  PSoupSameSitePolicy = ^TSoupSameSitePolicy;
  TSoupSameSitePolicy =  Longint;
  Const
    SOUP_SAME_SITE_POLICY_NONE = 0;
    SOUP_SAME_SITE_POLICY_LAX = 1;
    SOUP_SAME_SITE_POLICY_STRICT = 2;
;
type

function soup_cookie_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_COOKIE : longint; { return type might be wrong }

{ xxxxxxxxxx
#define SOUP_COOKIE_MAX_AGE_ONE_HOUR (60 * 60)
#define SOUP_COOKIE_MAX_AGE_ONE_DAY  (SOUP_COOKIE_MAX_AGE_ONE_HOUR * 24)
#define SOUP_COOKIE_MAX_AGE_ONE_WEEK (SOUP_COOKIE_MAX_AGE_ONE_DAY * 7)
#define SOUP_COOKIE_MAX_AGE_ONE_YEAR (SOUP_COOKIE_MAX_AGE_ONE_DAY * 365.2422)
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function soup_cookie_new(name:Pchar; value:Pchar; domain:Pchar; path:Pchar; max_age:longint):PSoupCookie;cdecl;external;
(* Const before type ignored *)
function soup_cookie_parse(header:Pchar; origin:PGUri):PSoupCookie;cdecl;external;
function soup_cookie_copy(cookie:PSoupCookie):PSoupCookie;cdecl;external;
(* Const before type ignored *)
function soup_cookie_get_name(cookie:PSoupCookie):Pchar;cdecl;external;
(* Const before type ignored *)
procedure soup_cookie_set_name(cookie:PSoupCookie; name:Pchar);cdecl;external;
(* Const before type ignored *)
function soup_cookie_get_value(cookie:PSoupCookie):Pchar;cdecl;external;
(* Const before type ignored *)
procedure soup_cookie_set_value(cookie:PSoupCookie; value:Pchar);cdecl;external;
(* Const before type ignored *)
function soup_cookie_get_domain(cookie:PSoupCookie):Pchar;cdecl;external;
(* Const before type ignored *)
procedure soup_cookie_set_domain(cookie:PSoupCookie; domain:Pchar);cdecl;external;
(* Const before type ignored *)
function soup_cookie_get_path(cookie:PSoupCookie):Pchar;cdecl;external;
(* Const before type ignored *)
procedure soup_cookie_set_path(cookie:PSoupCookie; path:Pchar);cdecl;external;
procedure soup_cookie_set_max_age(cookie:PSoupCookie; max_age:longint);cdecl;external;
function soup_cookie_get_expires(cookie:PSoupCookie):PGDateTime;cdecl;external;
procedure soup_cookie_set_expires(cookie:PSoupCookie; expires:PGDateTime);cdecl;external;
function soup_cookie_get_secure(cookie:PSoupCookie):Tgboolean;cdecl;external;
procedure soup_cookie_set_secure(cookie:PSoupCookie; secure:Tgboolean);cdecl;external;
function soup_cookie_get_http_only(cookie:PSoupCookie):Tgboolean;cdecl;external;
procedure soup_cookie_set_http_only(cookie:PSoupCookie; http_only:Tgboolean);cdecl;external;
procedure soup_cookie_set_same_site_policy(cookie:PSoupCookie; policy:TSoupSameSitePolicy);cdecl;external;
function soup_cookie_get_same_site_policy(cookie:PSoupCookie):TSoupSameSitePolicy;cdecl;external;
function soup_cookie_to_set_cookie_header(cookie:PSoupCookie):Pchar;cdecl;external;
function soup_cookie_to_cookie_header(cookie:PSoupCookie):Pchar;cdecl;external;
function soup_cookie_applies_to_uri(cookie:PSoupCookie; uri:PGUri):Tgboolean;cdecl;external;
function soup_cookie_equal(cookie1:PSoupCookie; cookie2:PSoupCookie):Tgboolean;cdecl;external;
procedure soup_cookie_free(cookie:PSoupCookie);cdecl;external;
function soup_cookies_from_response(msg:PSoupMessage):PGSList;cdecl;external;
function soup_cookies_from_request(msg:PSoupMessage):PGSList;cdecl;external;
procedure soup_cookies_to_response(cookies:PGSList; msg:PSoupMessage);cdecl;external;
procedure soup_cookies_to_request(cookies:PGSList; msg:PSoupMessage);cdecl;external;
procedure soup_cookies_free(cookies:PGSList);cdecl;external;
function soup_cookies_to_cookie_header(cookies:PGSList):Pchar;cdecl;external;
(* Const before type ignored *)
function soup_cookie_domain_matches(cookie:PSoupCookie; host:Pchar):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_COOKIE : longint; { return type might be wrong }
  begin
    SOUP_TYPE_COOKIE:=soup_cookie_get_type;
  end;


end.
