unit gskpathmeasure;

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
{$include <gsk/gskpath.h>}
{$include <gsk/gskpathpoint.h>}

function gsk_path_measure_get_type:TGType;cdecl;external libgtk4;
function gsk_path_measure_new(path:PGskPath):PGskPathMeasure;cdecl;external libgtk4;
function gsk_path_measure_new_with_tolerance(path:PGskPath; tolerance:single):PGskPathMeasure;cdecl;external libgtk4;
function gsk_path_measure_ref(self:PGskPathMeasure):PGskPathMeasure;cdecl;external libgtk4;
procedure gsk_path_measure_unref(self:PGskPathMeasure);cdecl;external libgtk4;
function gsk_path_measure_get_path(self:PGskPathMeasure):PGskPath;cdecl;external libgtk4;
function gsk_path_measure_get_tolerance(self:PGskPathMeasure):single;cdecl;external libgtk4;
function gsk_path_measure_get_length(self:PGskPathMeasure):single;cdecl;external libgtk4;
function gsk_path_measure_get_point(self:PGskPathMeasure; distance:single; result:PGskPathPoint):Tgboolean;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskPathMeasure, gsk_path_measure_unref) }

// === Konventiert am: 5-7-26 13:31:18 ===

function GSK_TYPE_PATH_MEASURE : TGType;

implementation

function GSK_TYPE_PATH_MEASURE : TGType;
  begin
    GSK_TYPE_PATH_MEASURE:=gsk_path_measure_get_type;
  end;



end.
