
unit pango_types;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_types.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_types.h
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
PPangoGlyph  = ^PangoGlyph;
PPangoRectangle  = ^PangoRectangle;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-types.h:
 *
 * Copyright (C) 1999 Red Hat Software
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
{$ifndef __PANGO_TYPES_H__}
{$define __PANGO_TYPES_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <pango/pango-version-macros.h>}
type
{$ifndef __GI_SCANNER__}
type
{$endif}
type
{ A index of a glyph into a font. Rendering system dependent  }
{*
 * PangoGlyph:
 *
 * A `PangoGlyph` represents a single glyph in the output form of a string.
  }

  PPangoGlyph = ^TPangoGlyph;
  TPangoGlyph = Tguint32;
{*
 * PANGO_SCALE:
 *
 * The scale between dimensions used for Pango distances and device units.
 *
 * The definition of device units is dependent on the output device; it will
 * typically be pixels for a screen, and points for a printer. %PANGO_SCALE is
 * currently 1024, but this may be changed in the future.
 *
 * When setting font sizes, device units are always considered to be
 * points (as in "12 point font"), rather than pixels.
  }
{*
 * PANGO_PIXELS:
 * @d: a dimension in Pango units.
 *
 * Converts a dimension to device units by rounding.
 *
 * Return value: rounded dimension in device units.
  }
{*
 * PANGO_PIXELS_FLOOR:
 * @d: a dimension in Pango units.
 *
 * Converts a dimension to device units by flooring.
 *
 * Return value: floored dimension in device units.
 * Since: 1.14
  }
{*
 * PANGO_PIXELS_CEIL:
 * @d: a dimension in Pango units.
 *
 * Converts a dimension to device units by ceiling.
 *
 * Return value: ceiled dimension in device units.
 * Since: 1.14
  }

const
  PANGO_SCALE = 1024;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PANGO_PIXELS(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_PIXELS_FLOOR(d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_PIXELS_CEIL(d : longint) : longint;

{ The above expressions are just slightly wrong for floating point d;
 * For example we'd expect PANGO_PIXELS(-512.5) => -1 but instead we get 0.
 * That's unlikely to matter for practical use and the expression is much
 * more compact and faster than alternatives that work exactly for both
 * integers and floating point.
 *
 * PANGO_PIXELS also behaves differently for +512 and -512.
  }
{*
 * PANGO_UNITS_FLOOR:
 * @d: a dimension in Pango units.
 *
 * Rounds a dimension down to whole device units, but does not
 * convert it to device units.
 *
 * Return value: rounded down dimension in Pango units.
 * Since: 1.50
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PANGO_UNITS_FLOOR(d : longint) : Td;

{*
 * PANGO_UNITS_CEIL:
 * @d: a dimension in Pango units.
 *
 * Rounds a dimension up to whole device units, but does not
 * convert it to device units.
 *
 * Return value: rounded up dimension in Pango units.
 * Since: 1.50
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_UNITS_CEIL(d : longint) : longint;

{*
 * PANGO_UNITS_ROUND:
 * @d: a dimension in Pango units.
 *
 * Rounds a dimension to whole device units, but does not
 * convert it to device units.
 *
 * Return value: rounded dimension in Pango units.
 * Since: 1.18
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_UNITS_ROUND(d : longint) : longint;

function pango_units_from_double(d:Tdouble):longint;cdecl;external;
function pango_units_to_double(i:longint):Tdouble;cdecl;external;
{*
 * PangoRectangle:
 * @x: X coordinate of the left side of the rectangle.
 * @y: Y coordinate of the the top side of the rectangle.
 * @width: width of the rectangle.
 * @height: height of the rectangle.
 *
 * The `PangoRectangle` structure represents a rectangle.
 *
 * `PangoRectangle` is frequently used to represent the logical or ink
 * extents of a single glyph or section of text. (See, for instance,
 * [method@Pango.Font.get_glyph_extents].)
  }
type
  PPangoRectangle = ^TPangoRectangle;
  TPangoRectangle = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
    end;

{ Macros to translate from extents rectangles to ascent/descent/lbearing/rbearing
  }
{*
 * PANGO_ASCENT:
 * @rect: a `PangoRectangle`
 *
 * Extracts the *ascent* from a `PangoRectangle`
 * representing glyph extents.
 *
 * The ascent is the distance from the baseline to the
 * highest point of the character. This is positive if the
 * glyph ascends above the baseline.
  }
{*
 * PANGO_DESCENT:
 * @rect: a `PangoRectangle`
 *
 * Extracts the *descent* from a `PangoRectangle`
 * representing glyph extents.
 *
 * The descent is the distance from the baseline to the
 * lowest point of the character. This is positive if the
 * glyph descends below the baseline.
  }
{*
 * PANGO_LBEARING:
 * @rect: a `PangoRectangle`
 *
 * Extracts the *left bearing* from a `PangoRectangle`
 * representing glyph extents.
 *
 * The left bearing is the distance from the horizontal
 * origin to the farthest left point of the character.
 * This is positive for characters drawn completely to
 * the right of the glyph origin.
  }
{*
 * PANGO_RBEARING:
 * @rect: a `PangoRectangle`
 *
 * Extracts the *right bearing* from a `PangoRectangle`
 * representing glyph extents.
 *
 * The right bearing is the distance from the horizontal
 * origin to the farthest right point of the character.
 * This is positive except for characters drawn completely
 * to the left of the horizontal origin.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function PANGO_ASCENT(rect : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_DESCENT(rect : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LBEARING(rect : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RBEARING(rect : longint) : longint;

procedure pango_extents_to_pixels(inclusive:PPangoRectangle; nearest:PPangoRectangle);cdecl;external;
{$include <pango/pango-gravity.h>}
{$include <pango/pango-language.h>}
{$include <pango/pango-matrix.h>}
{$include <pango/pango-script.h>}
{$include <pango/pango-bidi-type.h>}
{$endif}
{ __PANGO_TYPES_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_PIXELS(d : longint) : longint;
begin
  PANGO_PIXELS:=(longint(Td(+(512)))) shr 10;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_PIXELS_FLOOR(d : longint) : longint;
begin
  PANGO_PIXELS_FLOOR:=(longint(d)) shr 10;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_PIXELS_CEIL(d : longint) : longint;
begin
  PANGO_PIXELS_CEIL:=(longint(Td(+(1023)))) shr 10;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function PANGO_UNITS_FLOOR(d : longint) : Td;
begin
  PANGO_UNITS_FLOOR:=Td(@( not (PANGO_SCALE-1)));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_UNITS_CEIL(d : longint) : longint;
begin
  PANGO_UNITS_CEIL:=(Td(+(PANGO_SCALE-1))) and ( not (PANGO_SCALE-1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_UNITS_ROUND(d : longint) : longint;
begin
  PANGO_UNITS_ROUND:=(Td(+(PANGO_SCALE shr 1))) and ( not (PANGO_SCALE-1));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ASCENT(rect : longint) : longint;
begin
  PANGO_ASCENT:=-(rect.y);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_DESCENT(rect : longint) : longint;
begin
  PANGO_DESCENT:=(rect.y)+(rect.height);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LBEARING(rect : longint) : longint;
begin
  PANGO_LBEARING:=rect.x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RBEARING(rect : longint) : longint;
begin
  PANGO_RBEARING:=(rect.x)+(rect.width);
end;


end.
