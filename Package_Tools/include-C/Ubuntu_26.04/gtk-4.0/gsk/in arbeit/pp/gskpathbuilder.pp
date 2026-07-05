
unit gskpathbuilder;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskpathbuilder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskpathbuilder.h
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
Pcairo_path_t  = ^cairo_path_t;
Pgraphene_point_t  = ^graphene_point_t;
Pgraphene_rect_t  = ^graphene_rect_t;
PGskPath  = ^GskPath;
PGskPathBuilder  = ^GskPathBuilder;
PGskPathPoint  = ^GskPathPoint;
PGskRoundedRect  = ^GskRoundedRect;
PPangoLayout  = ^PangoLayout;
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
{$include <gsk/gskroundedrect.h>}
{$include <gsk/gsktypes.h>}

{ was #define dname def_expr }
function GSK_TYPE_PATH_BUILDER : longint; { return type might be wrong }

function gsk_path_builder_get_type:TGType;cdecl;external;
function gsk_path_builder_new:PGskPathBuilder;cdecl;external;
function gsk_path_builder_ref(self:PGskPathBuilder):PGskPathBuilder;cdecl;external;
procedure gsk_path_builder_unref(self:PGskPathBuilder);cdecl;external;
function gsk_path_builder_free_to_path(self:PGskPathBuilder):PGskPath;cdecl;external;
function gsk_path_builder_to_path(self:PGskPathBuilder):PGskPath;cdecl;external;
(* Const before type ignored *)
function gsk_path_builder_get_current_point(self:PGskPathBuilder):Pgraphene_point_t;cdecl;external;
procedure gsk_path_builder_add_path(self:PGskPathBuilder; path:PGskPath);cdecl;external;
procedure gsk_path_builder_add_reverse_path(self:PGskPathBuilder; path:PGskPath);cdecl;external;
(* Const before type ignored *)
procedure gsk_path_builder_add_cairo_path(self:PGskPathBuilder; path:Pcairo_path_t);cdecl;external;
procedure gsk_path_builder_add_layout(self:PGskPathBuilder; layout:PPangoLayout);cdecl;external;
(* Const before type ignored *)
procedure gsk_path_builder_add_rect(self:PGskPathBuilder; rect:Pgraphene_rect_t);cdecl;external;
(* Const before type ignored *)
procedure gsk_path_builder_add_rounded_rect(self:PGskPathBuilder; rect:PGskRoundedRect);cdecl;external;
(* Const before type ignored *)
procedure gsk_path_builder_add_circle(self:PGskPathBuilder; center:Pgraphene_point_t; radius:single);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsk_path_builder_add_segment(self:PGskPathBuilder; path:PGskPath; start:PGskPathPoint; end:PGskPathPoint);cdecl;external;
procedure gsk_path_builder_move_to(self:PGskPathBuilder; x:single; y:single);cdecl;external;
procedure gsk_path_builder_rel_move_to(self:PGskPathBuilder; x:single; y:single);cdecl;external;
procedure gsk_path_builder_line_to(self:PGskPathBuilder; x:single; y:single);cdecl;external;
procedure gsk_path_builder_rel_line_to(self:PGskPathBuilder; x:single; y:single);cdecl;external;
procedure gsk_path_builder_quad_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single);cdecl;external;
procedure gsk_path_builder_rel_quad_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single);cdecl;external;
procedure gsk_path_builder_cubic_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            x3:single; y3:single);cdecl;external;
procedure gsk_path_builder_rel_cubic_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            x3:single; y3:single);cdecl;external;
procedure gsk_path_builder_conic_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            weight:single);cdecl;external;
procedure gsk_path_builder_rel_conic_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            weight:single);cdecl;external;
procedure gsk_path_builder_arc_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single);cdecl;external;
procedure gsk_path_builder_rel_arc_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single);cdecl;external;
procedure gsk_path_builder_svg_arc_to(self:PGskPathBuilder; rx:single; ry:single; x_axis_rotation:single; large_arc:Tgboolean; 
            positive_sweep:Tgboolean; x:single; y:single);cdecl;external;
procedure gsk_path_builder_rel_svg_arc_to(self:PGskPathBuilder; rx:single; ry:single; x_axis_rotation:single; large_arc:Tgboolean; 
            positive_sweep:Tgboolean; x:single; y:single);cdecl;external;
procedure gsk_path_builder_html_arc_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            radius:single);cdecl;external;
procedure gsk_path_builder_rel_html_arc_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            radius:single);cdecl;external;
procedure gsk_path_builder_close(self:PGskPathBuilder);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskPathBuilder, gsk_path_builder_unref) }

implementation

{ was #define dname def_expr }
function GSK_TYPE_PATH_BUILDER : longint; { return type might be wrong }
  begin
    GSK_TYPE_PATH_BUILDER:=gsk_path_builder_get_type;
  end;


end.
