unit pango_utils;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-utils.c: Utilities for internal functions and modules
 *
 * Copyright (C) 2000 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_UTILS_H__}
{$define __PANGO_UTILS_H__}
{$include <stdio.h>}
{$include <glib.h>}
{$include <pango/pango-font.h>}

function pango_split_file_list(str:Pchar):^Pchar;cdecl;external libpango;
function pango_trim_string(str:Pchar):Pchar;cdecl;external libpango;
function pango_read_line(stream:PFILE; str:PGString):Tgint;cdecl;external libpango;
function pango_skip_space(pos:PPchar):Tgboolean;cdecl;external libpango;
function pango_scan_word(pos:PPchar; out:PGString):Tgboolean;cdecl;external libpango;
function pango_scan_string(pos:PPchar; out:PGString):Tgboolean;cdecl;external libpango;
function pango_scan_int(pos:PPchar; out:Plongint):Tgboolean;cdecl;external libpango;
function pango_parse_enum(_type:TGType; str:Pchar; value:Plongint; warn:Tgboolean; possible_values:PPchar):Tgboolean;cdecl;external libpango;
{ Functions for parsing textual representations
 * of PangoFontDescription fields. They return TRUE if the input string
 * contains a valid value, which then has been assigned to the corresponding
 * field in the PangoFontDescription. If the warn parameter is TRUE,
 * a warning is printed (with g_warning) if the string does not
 * contain a valid value.
  }
function pango_parse_style(str:Pchar; style:PPangoStyle; warn:Tgboolean):Tgboolean;cdecl;external libpango;
function pango_parse_variant(str:Pchar; variant:PPangoVariant; warn:Tgboolean):Tgboolean;cdecl;external libpango;
function pango_parse_weight(str:Pchar; weight:PPangoWeight; warn:Tgboolean):Tgboolean;cdecl;external libpango;
function pango_parse_stretch(str:Pchar; stretch:PPangoStretch; warn:Tgboolean):Tgboolean;cdecl;external libpango;
{ Hint line position and thickness.
  }
procedure pango_quantize_line_geometry(thickness:Plongint; position:Plongint);cdecl;external libpango;
{ A routine from fribidi that we either wrap or provide ourselves.
  }
function pango_log2vis_get_embedding_levels(text:Pgchar; length:longint; pbase_dir:PPangoDirection):Pguint8;cdecl;external libpango;
{ Unicode characters that are zero-width and should not be rendered
 * normally.
  }
function pango_is_zero_width(ch:Tgunichar):Tgboolean;cdecl;external libpango;
procedure pango_find_paragraph_boundary(text:Pchar; length:longint; paragraph_delimiter_index:Plongint; next_paragraph_start:Plongint);cdecl;external libpango;
{ Pango version checking  }
{ Encode a Pango version as an integer  }
{*
 * PANGO_VERSION_ENCODE:
 * @major: the major component of the version number
 * @minor: the minor component of the version number
 * @micro: the micro component of the version number
 *
 * This macro encodes the given Pango version into an integer.  The numbers
 * returned by %PANGO_VERSION and pango_version() are encoded using this macro.
 * Two encoded version numbers can be compared as integers.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_VERSION_ENCODE(major,minor,micro : longint) : longint;

{ Encoded version of Pango at compile-time  }
{*
 * PANGO_VERSION:
 *
 * The version of Pango available at compile-time, encoded using PANGO_VERSION_ENCODE().
  }
{*
 * PANGO_VERSION_STRING:
 *
 * A string literal containing the version of Pango available at compile-time.
  }
{*
 * PANGO_VERSION_MAJOR:
 *
 * The major component of the version of Pango available at compile-time.
  }
{*
 * PANGO_VERSION_MINOR:
 *
 * The minor component of the version of Pango available at compile-time.
  }
{*
 * PANGO_VERSION_MICRO:
 *
 * The micro component of the version of Pango available at compile-time.
  }
{ was #define dname def_expr }
function PANGO_VERSION : longint; { return type might be wrong }

{ Check that compile-time Pango is as new as required  }
{*
 * PANGO_VERSION_CHECK:
 * @major: the major component of the version number
 * @minor: the minor component of the version number
 * @micro: the micro component of the version number
 *
 * Checks that the version of Pango available at compile-time is not older than
 * the provided version number.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_VERSION_CHECK(major,minor,micro : longint) : longint;

{ Return encoded version of Pango at run-time  }
function pango_version:longint;cdecl;external libpango;
{ Return run-time Pango version as an string  }
function pango_version_string:Pchar;cdecl;external libpango;
{ Check that run-time Pango is as new as required  }
function pango_version_check(required_major:longint; required_minor:longint; required_micro:longint):Pchar;cdecl;external libpango;
{$endif}
{ __PANGO_UTILS_H__  }

// === Konventiert am: 26-11-24 13:57:07 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_VERSION_ENCODE(major,minor,micro : longint) : longint;
begin
  PANGO_VERSION_ENCODE:=((major*10000)+(minor*100))+(micro*1);
end;

{ was #define dname def_expr }
function PANGO_VERSION : longint; { return type might be wrong }
  begin
    PANGO_VERSION:=PANGO_VERSION_ENCODE(PANGO_VERSION_MAJOR,PANGO_VERSION_MINOR,PANGO_VERSION_MICRO);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_VERSION_CHECK(major,minor,micro : longint) : longint;
begin
  PANGO_VERSION_CHECK:=PANGO_VERSION>=(PANGO_VERSION_ENCODE(major,minor,micro));
end;


end.
