unit gskpathbuilder;

interface

uses
  fp_glib2, fp_gtk4;

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

function gsk_path_builder_get_type:TGType;cdecl;external libgtk4;
function gsk_path_builder_new:PGskPathBuilder;cdecl;external libgtk4;
function gsk_path_builder_ref(self:PGskPathBuilder):PGskPathBuilder;cdecl;external libgtk4;
procedure gsk_path_builder_unref(self:PGskPathBuilder);cdecl;external libgtk4;
function gsk_path_builder_free_to_path(self:PGskPathBuilder):PGskPath;cdecl;external libgtk4;
function gsk_path_builder_to_path(self:PGskPathBuilder):PGskPath;cdecl;external libgtk4;
function gsk_path_builder_get_current_point(self:PGskPathBuilder):Pgraphene_point_t;cdecl;external libgtk4;
procedure gsk_path_builder_add_path(self:PGskPathBuilder; path:PGskPath);cdecl;external libgtk4;
procedure gsk_path_builder_add_reverse_path(self:PGskPathBuilder; path:PGskPath);cdecl;external libgtk4;
procedure gsk_path_builder_add_cairo_path(self:PGskPathBuilder; path:Pcairo_path_t);cdecl;external libgtk4;
procedure gsk_path_builder_add_layout(self:PGskPathBuilder; layout:PPangoLayout);cdecl;external libgtk4;
procedure gsk_path_builder_add_rect(self:PGskPathBuilder; rect:Pgraphene_rect_t);cdecl;external libgtk4;
procedure gsk_path_builder_add_rounded_rect(self:PGskPathBuilder; rect:PGskRoundedRect);cdecl;external libgtk4;
procedure gsk_path_builder_add_circle(self:PGskPathBuilder; center:Pgraphene_point_t; radius:single);cdecl;external libgtk4;
procedure gsk_path_builder_add_segment(self:PGskPathBuilder; path:PGskPath; start:PGskPathPoint; end:PGskPathPoint);cdecl;external libgtk4;
procedure gsk_path_builder_move_to(self:PGskPathBuilder; x:single; y:single);cdecl;external libgtk4;
procedure gsk_path_builder_rel_move_to(self:PGskPathBuilder; x:single; y:single);cdecl;external libgtk4;
procedure gsk_path_builder_line_to(self:PGskPathBuilder; x:single; y:single);cdecl;external libgtk4;
procedure gsk_path_builder_rel_line_to(self:PGskPathBuilder; x:single; y:single);cdecl;external libgtk4;
procedure gsk_path_builder_quad_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single);cdecl;external libgtk4;
procedure gsk_path_builder_rel_quad_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single);cdecl;external libgtk4;
procedure gsk_path_builder_cubic_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            x3:single; y3:single);cdecl;external libgtk4;
procedure gsk_path_builder_rel_cubic_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            x3:single; y3:single);cdecl;external libgtk4;
procedure gsk_path_builder_conic_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            weight:single);cdecl;external libgtk4;
procedure gsk_path_builder_rel_conic_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            weight:single);cdecl;external libgtk4;
procedure gsk_path_builder_arc_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single);cdecl;external libgtk4;
procedure gsk_path_builder_rel_arc_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single);cdecl;external libgtk4;
procedure gsk_path_builder_svg_arc_to(self:PGskPathBuilder; rx:single; ry:single; x_axis_rotation:single; large_arc:Tgboolean; 
            positive_sweep:Tgboolean; x:single; y:single);cdecl;external libgtk4;
procedure gsk_path_builder_rel_svg_arc_to(self:PGskPathBuilder; rx:single; ry:single; x_axis_rotation:single; large_arc:Tgboolean; 
            positive_sweep:Tgboolean; x:single; y:single);cdecl;external libgtk4;
procedure gsk_path_builder_html_arc_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            radius:single);cdecl;external libgtk4;
procedure gsk_path_builder_rel_html_arc_to(self:PGskPathBuilder; x1:single; y1:single; x2:single; y2:single; 
            radius:single);cdecl;external libgtk4;
procedure gsk_path_builder_close(self:PGskPathBuilder);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskPathBuilder, gsk_path_builder_unref) }

// === Konventiert am: 5-7-26 13:31:24 ===

function GSK_TYPE_PATH_BUILDER : TGType;

implementation

function GSK_TYPE_PATH_BUILDER : TGType;
  begin
    GSK_TYPE_PATH_BUILDER:=gsk_path_builder_get_type;
  end;



end.
