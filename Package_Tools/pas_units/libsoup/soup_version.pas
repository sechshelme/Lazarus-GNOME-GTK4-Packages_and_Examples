unit soup_version;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * soup-version.h: Version information
 *
 * Copyright (C) 2012 Igalia S.L.
  }
(** unsupported pragma#pragma once*)
{$include <glib.h>}

const
  SOUP_MAJOR_VERSION = 3;  
  SOUP_MINOR_VERSION = 4;  
  SOUP_MICRO_VERSION = 4;  
{ xxxxxxxxx
#define SOUP_CHECK_VERSION(major, minor, micro) \
    (SOUP_MAJOR_VERSION > (major) || \
    (SOUP_MAJOR_VERSION == (major) && SOUP_MINOR_VERSION > (minor)) || \
    (SOUP_MAJOR_VERSION == (major) && SOUP_MINOR_VERSION == (minor) && \
     SOUP_MICRO_VERSION >= (micro)))
 }
{ Deprecation / Availability macros  }
{*
 * SOUP_VERSION_3_0:
 *
 * A macro that evaluates to the 3.0 version of libsoup, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 3.0
  }

{ was #define dname def_expr }
function SOUP_VERSION_3_0 : longint; { return type might be wrong }

{*
 * SOUP_VERSION_3_2:
 *
 * A macro that evaluates to the 3.2 version of libsoup, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 3.2
  }
{ was #define dname def_expr }
function SOUP_VERSION_3_2 : longint; { return type might be wrong }

{*
 * SOUP_VERSION_3_4:
 *
 * A macro that evaluates to the 3.4 version of libsoup, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 3.4
  }
{ was #define dname def_expr }
function SOUP_VERSION_3_4 : longint; { return type might be wrong }

{ evaluates to the current stable version; for development cycles,
 * this means the next stable target
  }
function soup_get_major_version:Tguint;cdecl;external libsoup;
function soup_get_minor_version:Tguint;cdecl;external libsoup;
function soup_get_micro_version:Tguint;cdecl;external libsoup;
function soup_check_version(major:Tguint; minor:Tguint; micro:Tguint):Tgboolean;cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:43:44 ===


implementation


{ was #define dname def_expr }
function SOUP_VERSION_3_0 : longint; { return type might be wrong }
  begin
    SOUP_VERSION_3_0:=G_ENCODE_VERSION(3,0);
  end;

{ was #define dname def_expr }
function SOUP_VERSION_3_2 : longint; { return type might be wrong }
  begin
    SOUP_VERSION_3_2:=G_ENCODE_VERSION(3,2);
  end;

{ was #define dname def_expr }
function SOUP_VERSION_3_4 : longint; { return type might be wrong }
  begin
    SOUP_VERSION_3_4:=G_ENCODE_VERSION(3,4);
  end;


end.
