
unit soup_cookie_jar;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_cookie_jar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_cookie_jar.h
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
PGSList  = ^GSList;
PGUri  = ^GUri;
PSoupCookie  = ^SoupCookie;
PSoupCookieJar  = ^SoupCookieJar;
PSoupCookieJarAcceptPolicy  = ^SoupCookieJarAcceptPolicy;
PSoupCookieJarClass  = ^SoupCookieJarClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2008 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}

{ was #define dname def_expr }
function SOUP_TYPE_COOKIE_JAR : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (SoupCookieJar, soup_cookie_jar, SOUP, COOKIE_JAR, GObject) }
{ signals  }
{ Padding for future expansion  }
type
  PSoupCookieJarClass = ^TSoupCookieJarClass;
  TSoupCookieJarClass = record
      parent_class : TGObjectClass;
      save : procedure (jar:PSoupCookieJar);cdecl;
      is_persistent : function (jar:PSoupCookieJar):Tgboolean;cdecl;
      changed : procedure (jar:PSoupCookieJar; old_cookie:PSoupCookie; new_cookie:PSoupCookie);cdecl;
      padding : array[0..5] of Tgpointer;
    end;


  PSoupCookieJarAcceptPolicy = ^TSoupCookieJarAcceptPolicy;
  TSoupCookieJarAcceptPolicy =  Longint;
  Const
    SOUP_COOKIE_JAR_ACCEPT_ALWAYS = 0;
    SOUP_COOKIE_JAR_ACCEPT_NEVER = 1;
    SOUP_COOKIE_JAR_ACCEPT_NO_THIRD_PARTY = 2;
    SOUP_COOKIE_JAR_ACCEPT_GRANDFATHERED_THIRD_PARTY = 3;
;

function soup_cookie_jar_new:PSoupCookieJar;cdecl;external;
function soup_cookie_jar_get_cookies(jar:PSoupCookieJar; uri:PGUri; for_http:Tgboolean):Pchar;cdecl;external;
function soup_cookie_jar_get_cookie_list(jar:PSoupCookieJar; uri:PGUri; for_http:Tgboolean):PGSList;cdecl;external;
function soup_cookie_jar_get_cookie_list_with_same_site_info(jar:PSoupCookieJar; uri:PGUri; top_level:PGUri; site_for_cookies:PGUri; for_http:Tgboolean; 
           is_safe_method:Tgboolean; is_top_level_navigation:Tgboolean):PGSList;cdecl;external;
(* Const before type ignored *)
procedure soup_cookie_jar_set_cookie(jar:PSoupCookieJar; uri:PGUri; cookie:Pchar);cdecl;external;
(* Const before type ignored *)
procedure soup_cookie_jar_set_cookie_with_first_party(jar:PSoupCookieJar; uri:PGUri; first_party:PGUri; cookie:Pchar);cdecl;external;
procedure soup_cookie_jar_add_cookie(jar:PSoupCookieJar; cookie:PSoupCookie);cdecl;external;
procedure soup_cookie_jar_add_cookie_with_first_party(jar:PSoupCookieJar; first_party:PGUri; cookie:PSoupCookie);cdecl;external;
procedure soup_cookie_jar_add_cookie_full(jar:PSoupCookieJar; cookie:PSoupCookie; uri:PGUri; first_party:PGUri);cdecl;external;
procedure soup_cookie_jar_delete_cookie(jar:PSoupCookieJar; cookie:PSoupCookie);cdecl;external;
function soup_cookie_jar_all_cookies(jar:PSoupCookieJar):PGSList;cdecl;external;
procedure soup_cookie_jar_set_accept_policy(jar:PSoupCookieJar; policy:TSoupCookieJarAcceptPolicy);cdecl;external;
function soup_cookie_jar_get_accept_policy(jar:PSoupCookieJar):TSoupCookieJarAcceptPolicy;cdecl;external;
function soup_cookie_jar_is_persistent(jar:PSoupCookieJar):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_COOKIE_JAR : longint; { return type might be wrong }
  begin
    SOUP_TYPE_COOKIE_JAR:=soup_cookie_jar_get_type;
  end;


end.
