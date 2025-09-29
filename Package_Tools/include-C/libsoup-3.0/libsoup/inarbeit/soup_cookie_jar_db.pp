
unit soup_cookie_jar_db;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_cookie_jar_db.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_cookie_jar_db.h
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
PSoupCookieJar  = ^SoupCookieJar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2008 Diego Escalante Urrelo
  }
(** unsupported pragma#pragma once*)
{$include "soup-cookie-jar.h"}

{ was #define dname def_expr }
function SOUP_TYPE_COOKIE_JAR_DB : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupCookieJarDB, soup_cookie_jar_db, SOUP, COOKIE_JAR_DB, SoupCookieJar) }
(* Const before type ignored *)
function soup_cookie_jar_db_new(filename:Pchar; read_only:Tgboolean):PSoupCookieJar;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_COOKIE_JAR_DB : longint; { return type might be wrong }
  begin
    SOUP_TYPE_COOKIE_JAR_DB:=soup_cookie_jar_db_get_type;
  end;


end.
