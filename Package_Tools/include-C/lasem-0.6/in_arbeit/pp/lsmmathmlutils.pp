
unit lsmmathmlutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmmathmlutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmmathmlutils.h
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
PLsmMathmlBbox  = ^LsmMathmlBbox;
PLsmMathmlPadding  = ^LsmMathmlPadding;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_MATHML_UTILS_H}
{$define LSM_MATHML_UTILS_H}
{$include <lsmmathmltypes.h>}
type
  PLsmMathmlBbox = ^TLsmMathmlBbox;
  TLsmMathmlBbox = record
      width : Tdouble;
      height : Tdouble;
      depth : Tdouble;
      is_defined : Tgboolean;
    end;

  PLsmMathmlPadding = ^TLsmMathmlPadding;
  TLsmMathmlPadding = record
      left : Tdouble;
      right : Tdouble;
      top : Tdouble;
      bottom : Tdouble;
    end;
(* Const before type ignored *)
  var
    lsm_mathml_bbox_null : TLsmMathmlBbox;cvar;external;
(* Const before type ignored *)

procedure lsm_mathml_bbox_add_horizontally(bbox:PLsmMathmlBbox; new_bbox:PLsmMathmlBbox);cdecl;external;
(* Const before type ignored *)
procedure lsm_mathml_bbox_add_over(self:PLsmMathmlBbox; bbox:PLsmMathmlBbox);cdecl;external;
(* Const before type ignored *)
procedure lsm_mathml_bbox_add_under(self:PLsmMathmlBbox; bbox:PLsmMathmlBbox);cdecl;external;
(* Const before type ignored *)
procedure lsm_mathml_bbox_merge_vertically(self:PLsmMathmlBbox; bbox:PLsmMathmlBbox; offset:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure lsm_mathml_bbox_stretch(self:PLsmMathmlBbox; bbox:PLsmMathmlBbox);cdecl;external;
(* Const before type ignored *)
procedure lsm_mathml_bbox_stretch_vertically(self:PLsmMathmlBbox; bbox:PLsmMathmlBbox);cdecl;external;
(* Const before type ignored *)
procedure lsm_mathml_bbox_stretch_horizontally(self:PLsmMathmlBbox; bbox:PLsmMathmlBbox);cdecl;external;
{$endif}

implementation


end.
