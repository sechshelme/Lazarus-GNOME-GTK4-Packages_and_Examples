
unit gskstroke;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskstroke.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskstroke.h
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
Pcairo_t  = ^cairo_t;
Pgsize  = ^gsize;
PGskStroke  = ^GskStroke;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <gsk/gsktypes.h>}

{ was #define dname def_expr }
function GSK_TYPE_STROKE : longint; { return type might be wrong }

function gsk_stroke_get_type:TGType;cdecl;external;
function gsk_stroke_new(line_width:single):PGskStroke;cdecl;external;
(* Const before type ignored *)
function gsk_stroke_copy(other:PGskStroke):PGskStroke;cdecl;external;
procedure gsk_stroke_free(self:PGskStroke);cdecl;external;
function gsk_stroke_equal(stroke1:Tgconstpointer; stroke2:Tgconstpointer):Tgboolean;cdecl;external;
procedure gsk_stroke_set_line_width(self:PGskStroke; line_width:single);cdecl;external;
(* Const before type ignored *)
function gsk_stroke_get_line_width(self:PGskStroke):single;cdecl;external;
procedure gsk_stroke_set_line_cap(self:PGskStroke; line_cap:TGskLineCap);cdecl;external;
(* Const before type ignored *)
function gsk_stroke_get_line_cap(self:PGskStroke):TGskLineCap;cdecl;external;
procedure gsk_stroke_set_line_join(self:PGskStroke; line_join:TGskLineJoin);cdecl;external;
(* Const before type ignored *)
function gsk_stroke_get_line_join(self:PGskStroke):TGskLineJoin;cdecl;external;
procedure gsk_stroke_set_miter_limit(self:PGskStroke; limit:single);cdecl;external;
(* Const before type ignored *)
function gsk_stroke_get_miter_limit(self:PGskStroke):single;cdecl;external;
(* Const before type ignored *)
procedure gsk_stroke_set_dash(self:PGskStroke; dash:Psingle; n_dash:Tgsize);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_stroke_get_dash(self:PGskStroke; n_dash:Pgsize):Psingle;cdecl;external;
procedure gsk_stroke_set_dash_offset(self:PGskStroke; offset:single);cdecl;external;
(* Const before type ignored *)
function gsk_stroke_get_dash_offset(self:PGskStroke):single;cdecl;external;
(* Const before type ignored *)
procedure gsk_stroke_to_cairo(self:PGskStroke; cr:Pcairo_t);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskStroke, gsk_stroke_free) }

implementation

{ was #define dname def_expr }
function GSK_TYPE_STROKE : longint; { return type might be wrong }
  begin
    GSK_TYPE_STROKE:=gsk_stroke_get_type;
  end;


end.
