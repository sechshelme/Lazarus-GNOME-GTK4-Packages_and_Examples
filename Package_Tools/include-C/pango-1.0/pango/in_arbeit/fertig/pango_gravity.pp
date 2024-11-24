
unit pango_gravity;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_gravity.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_gravity.h
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
PPangoGravity  = ^PangoGravity;
PPangoGravityHint  = ^PangoGravityHint;
PPangoMatrix  = ^PangoMatrix;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-gravity.h: Gravity routines
 *
 * Copyright (C) 2006, 2007 Red Hat Software
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
{$ifndef __PANGO_GRAVITY_H__}
{$define __PANGO_GRAVITY_H__}
{$include <glib.h>}
{*
 * PangoGravity:
 * @PANGO_GRAVITY_SOUTH: Glyphs stand upright (default) <img align="right" valign="center" src="m-south.png">
 * @PANGO_GRAVITY_EAST: Glyphs are rotated 90 degrees counter-clockwise. <img align="right" valign="center" src="m-east.png">
 * @PANGO_GRAVITY_NORTH: Glyphs are upside-down. <img align="right" valign="cener" src="m-north.png">
 * @PANGO_GRAVITY_WEST: Glyphs are rotated 90 degrees clockwise. <img align="right" valign="center" src="m-west.png">
 * @PANGO_GRAVITY_AUTO: Gravity is resolved from the context matrix
 *
 * `PangoGravity` represents the orientation of glyphs in a segment
 * of text.
 *
 * This is useful when rendering vertical text layouts. In those situations,
 * the layout is rotated using a non-identity [struct@Pango.Matrix], and then
 * glyph orientation is controlled using `PangoGravity`.
 *
 * Not every value in this enumeration makes sense for every usage of
 * `PangoGravity`; for example, %PANGO_GRAVITY_AUTO only can be passed to
 * [method@Pango.Context.set_base_gravity] and can only be returned by
 * [method@Pango.Context.get_base_gravity].
 *
 * See also: [enum@Pango.GravityHint]
 *
 * Since: 1.16
  }
type
  PPangoGravity = ^TPangoGravity;
  TPangoGravity =  Longint;
  Const
    PANGO_GRAVITY_SOUTH = 0;
    PANGO_GRAVITY_EAST = 1;
    PANGO_GRAVITY_NORTH = 2;
    PANGO_GRAVITY_WEST = 3;
    PANGO_GRAVITY_AUTO = 4;
;
{*
 * PangoGravityHint:
 * @PANGO_GRAVITY_HINT_NATURAL: scripts will take their natural gravity based
 *   on the base gravity and the script.  This is the default.
 * @PANGO_GRAVITY_HINT_STRONG: always use the base gravity set, regardless of
 *   the script.
 * @PANGO_GRAVITY_HINT_LINE: for scripts not in their natural direction (eg.
 *   Latin in East gravity), choose per-script gravity such that every script
 *   respects the line progression. This means, Latin and Arabic will take
 *   opposite gravities and both flow top-to-bottom for example.
 *
 * `PangoGravityHint` defines how horizontal scripts should behave in a
 * vertical context.
 *
 * That is, English excerpts in a vertical paragraph for example.
 *
 * See also [enum@Pango.Gravity]
 *
 * Since: 1.16
  }
type
  PPangoGravityHint = ^TPangoGravityHint;
  TPangoGravityHint =  Longint;
  Const
    PANGO_GRAVITY_HINT_NATURAL = 0;
    PANGO_GRAVITY_HINT_STRONG = 1;
    PANGO_GRAVITY_HINT_LINE = 2;
;
{*
 * PANGO_GRAVITY_IS_VERTICAL:
 * @gravity: the `PangoGravity` to check
 *
 * Whether a `PangoGravity` represents vertical writing directions.
 *
 * Returns: %TRUE if @gravity is %PANGO_GRAVITY_EAST or %PANGO_GRAVITY_WEST,
 *   %FALSE otherwise.
 *
 * Since: 1.16
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PANGO_GRAVITY_IS_VERTICAL(gravity : longint) : longint;

{*
 * PANGO_GRAVITY_IS_IMPROPER:
 * @gravity: the `PangoGravity` to check
 *
 * Whether a `PangoGravity` represents a gravity that results in reversal
 * of text direction.
 *
 * Returns: %TRUE if @gravity is %PANGO_GRAVITY_WEST or %PANGO_GRAVITY_NORTH,
 *   %FALSE otherwise.
 *
 * Since: 1.32
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_GRAVITY_IS_IMPROPER(gravity : longint) : longint;

{$include <pango/pango-matrix.h>}
{$include <pango/pango-script.h>}

function pango_gravity_to_rotation(gravity:TPangoGravity):Tdouble;cdecl;external;
(* Const before type ignored *)
function pango_gravity_get_for_matrix(matrix:PPangoMatrix):TPangoGravity;cdecl;external;
function pango_gravity_get_for_script(script:TPangoScript; base_gravity:TPangoGravity; hint:TPangoGravityHint):TPangoGravity;cdecl;external;
function pango_gravity_get_for_script_and_width(script:TPangoScript; wide:Tgboolean; base_gravity:TPangoGravity; hint:TPangoGravityHint):TPangoGravity;cdecl;external;
{$endif}
{ __PANGO_GRAVITY_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_GRAVITY_IS_VERTICAL(gravity : longint) : longint;
begin
  PANGO_GRAVITY_IS_VERTICAL:=(gravity=(PANGO_GRAVITY_EAST or gravity))=PANGO_GRAVITY_WEST;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_GRAVITY_IS_IMPROPER(gravity : longint) : longint;
begin
  PANGO_GRAVITY_IS_IMPROPER:=(gravity=(PANGO_GRAVITY_WEST or gravity))=PANGO_GRAVITY_NORTH;
end;


end.
