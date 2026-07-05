unit gskstroke;

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
{$include <gsk/gsktypes.h>}

function gsk_stroke_get_type:TGType;cdecl;external libgtk4;
function gsk_stroke_new(line_width:single):PGskStroke;cdecl;external libgtk4;
function gsk_stroke_copy(other:PGskStroke):PGskStroke;cdecl;external libgtk4;
procedure gsk_stroke_free(self:PGskStroke);cdecl;external libgtk4;
function gsk_stroke_equal(stroke1:Tgconstpointer; stroke2:Tgconstpointer):Tgboolean;cdecl;external libgtk4;
procedure gsk_stroke_set_line_width(self:PGskStroke; line_width:single);cdecl;external libgtk4;
function gsk_stroke_get_line_width(self:PGskStroke):single;cdecl;external libgtk4;
procedure gsk_stroke_set_line_cap(self:PGskStroke; line_cap:TGskLineCap);cdecl;external libgtk4;
function gsk_stroke_get_line_cap(self:PGskStroke):TGskLineCap;cdecl;external libgtk4;
procedure gsk_stroke_set_line_join(self:PGskStroke; line_join:TGskLineJoin);cdecl;external libgtk4;
function gsk_stroke_get_line_join(self:PGskStroke):TGskLineJoin;cdecl;external libgtk4;
procedure gsk_stroke_set_miter_limit(self:PGskStroke; limit:single);cdecl;external libgtk4;
function gsk_stroke_get_miter_limit(self:PGskStroke):single;cdecl;external libgtk4;
procedure gsk_stroke_set_dash(self:PGskStroke; dash:Psingle; n_dash:Tgsize);cdecl;external libgtk4;
function gsk_stroke_get_dash(self:PGskStroke; n_dash:Pgsize):Psingle;cdecl;external libgtk4;
procedure gsk_stroke_set_dash_offset(self:PGskStroke; offset:single);cdecl;external libgtk4;
function gsk_stroke_get_dash_offset(self:PGskStroke):single;cdecl;external libgtk4;
procedure gsk_stroke_to_cairo(self:PGskStroke; cr:Pcairo_t);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskStroke, gsk_stroke_free) }

// === Konventiert am: 5-7-26 13:35:25 ===

function GSK_TYPE_STROKE : TGType;

implementation

function GSK_TYPE_STROKE : TGType;
  begin
    GSK_TYPE_STROKE:=gsk_stroke_get_type;
  end;



end.
