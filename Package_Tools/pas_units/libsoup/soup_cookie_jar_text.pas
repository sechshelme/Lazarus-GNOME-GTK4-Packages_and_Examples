unit soup_cookie_jar_text;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2008 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-cookie-jar.h"}

{G_DECLARE_FINAL_TYPE (SoupCookieJarText, soup_cookie_jar_text, SOUP, COOKIE_JAR_TEXT, SoupCookieJar) }
function soup_cookie_jar_text_new(filename:Pchar; read_only:Tgboolean):PSoupCookieJar;cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:45:03 ===

function SOUP_TYPE_COOKIE_JAR_TEXT: TGType;
function SOUP_COOKIE_JAR_TEXT(obj: Pointer): PSoupCookieJarText;
function SOUP_IS_COOKIE_JAR_TEXT(obj: Pointer): Tgboolean;

implementation

function SOUP_TYPE_COOKIE_JAR_TEXT: TGType;
begin
  Result := soup_cookie_jar_text_get_type;
end;

function SOUP_COOKIE_JAR_TEXT(obj: Pointer): PSoupCookieJarText;
begin
  Result := PSoupCookieJarText(g_type_check_instance_cast(obj, SOUP_TYPE_COOKIE_JAR_TEXT));
end;

function SOUP_IS_COOKIE_JAR_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_COOKIE_JAR_TEXT);
end;

type 
  TSoupCookieJarText = record
  end;
  PSoupCookieJarText = ^TSoupCookieJarText;

  TSoupCookieJarTextClass = record
    parent_class: TSoupCookieJarClass;
  end;
  PSoupCookieJarTextClass = ^TSoupCookieJarTextClass;

function soup_cookie_jar_text_get_type: TGType; cdecl; external libgxxxxxxx;



end.
