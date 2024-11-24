
unit pango_color;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_color.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_color.h
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
Pguint16  = ^guint16;
PPangoColor  = ^PangoColor;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-color.h: A color struct
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
{$ifndef __PANGO_COLOR_H__}
{$define __PANGO_COLOR_H__}
{$include <pango/pango-types.h>}
{$include <glib-object.h>}
type
{*
 * PangoColor:
 * @red: value of red component
 * @green: value of green component
 * @blue: value of blue component
 *
 * The `PangoColor` structure is used to
 * represent a color in an uncalibrated RGB color-space.
  }
  PPangoColor = ^TPangoColor;
  TPangoColor = record
      red : Tguint16;
      green : Tguint16;
      blue : Tguint16;
    end;


{ was #define dname def_expr }
function PANGO_TYPE_COLOR : longint; { return type might be wrong }

function pango_color_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function pango_color_copy(src:PPangoColor):PPangoColor;cdecl;external;
procedure pango_color_free(color:PPangoColor);cdecl;external;
(* Const before type ignored *)
function pango_color_parse(color:PPangoColor; spec:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pango_color_parse_with_alpha(color:PPangoColor; alpha:Pguint16; spec:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pango_color_to_string(color:PPangoColor):Pchar;cdecl;external;
{$endif}
{ __PANGO_COLOR_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_COLOR : longint; { return type might be wrong }
  begin
    PANGO_TYPE_COLOR:=pango_color_get_type;
  end;


end.
