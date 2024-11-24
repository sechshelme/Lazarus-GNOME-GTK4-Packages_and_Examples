
unit pango_coverage;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_coverage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_coverage.h
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
Pguchar  = ^guchar;
Plongint  = ^longint;
PPangoCoverage  = ^PangoCoverage;
PPangoCoverageLevel  = ^PangoCoverageLevel;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-coverage.h: Coverage sets for fonts
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
{$ifndef __PANGO_COVERAGE_H__}
{$define __PANGO_COVERAGE_H__}
{$include <glib-object.h>}
{$include <pango/pango-version-macros.h>}
{$include <hb.h>}
{*
 * PangoCoverage:
 *
 * A `PangoCoverage` structure is a map from Unicode characters
 * to [enum@Pango.CoverageLevel] values.
 *
 * It is often necessary in Pango to determine if a particular
 * font can represent a particular character, and also how well
 * it can represent that character. The `PangoCoverage` is a data
 * structure that is used to represent that information. It is an
 * opaque structure with no public fields.
  }
type
{*
 * PangoCoverageLevel:
 * @PANGO_COVERAGE_NONE: The character is not representable with
 *   the font.
 * @PANGO_COVERAGE_FALLBACK: The character is represented in a
 *   way that may be comprehensible but is not the correct
 *   graphical form. For instance, a Hangul character represented
 *   as a a sequence of Jamos, or a Latin transliteration of a
 *   Cyrillic word.
 * @PANGO_COVERAGE_APPROXIMATE: The character is represented as
 *   basically the correct graphical form, but with a stylistic
 *   variant inappropriate for the current script.
 * @PANGO_COVERAGE_EXACT: The character is represented as the
 *   correct graphical form.
 *
 * `PangoCoverageLevel` is used to indicate how well a font can
 * represent a particular Unicode character for a particular script.
 *
 * Since 1.44, only %PANGO_COVERAGE_NONE and %PANGO_COVERAGE_EXACT
 * will be returned.
  }

  PPangoCoverageLevel = ^TPangoCoverageLevel;
  TPangoCoverageLevel =  Longint;
  Const
    PANGO_COVERAGE_NONE = 0;
    PANGO_COVERAGE_FALLBACK = 1;
    PANGO_COVERAGE_APPROXIMATE = 2;
    PANGO_COVERAGE_EXACT = 3;
;

function pango_coverage_get_type:TGType;cdecl;external;
function pango_coverage_new:PPangoCoverage;cdecl;external;
function pango_coverage_ref(coverage:PPangoCoverage):PPangoCoverage;cdecl;external;
procedure pango_coverage_unref(coverage:PPangoCoverage);cdecl;external;
function pango_coverage_copy(coverage:PPangoCoverage):PPangoCoverage;cdecl;external;
function pango_coverage_get(coverage:PPangoCoverage; index_:longint):TPangoCoverageLevel;cdecl;external;
procedure pango_coverage_set(coverage:PPangoCoverage; index_:longint; level:TPangoCoverageLevel);cdecl;external;
procedure pango_coverage_max(coverage:PPangoCoverage; other:PPangoCoverage);cdecl;external;
procedure pango_coverage_to_bytes(coverage:PPangoCoverage; bytes:PPguchar; n_bytes:Plongint);cdecl;external;
function pango_coverage_from_bytes(bytes:Pguchar; n_bytes:longint):PPangoCoverage;cdecl;external;
{$endif}
{ __PANGO_COVERAGE_H__  }

implementation


end.
