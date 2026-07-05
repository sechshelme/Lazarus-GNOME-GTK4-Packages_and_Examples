unit gskpathpoint;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2023 Red Hat, Inc.
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
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{$include <gsk/gsktypes.h>}

type
(* error 
G_GNUC_EXTENSION struct _GskPathPoint
{< private > }
in declaration at line 40 *)
      var
        idx : Tgsize;cvar;public;
        t : single;cvar;public;
(* error 
    };
in declaration at line 43 *)
        padding : array[0..7] of Tgpointer;cvar;public;
        alignment : Tgraphene_vec4_t;cvar;public;
(* error 
  };
in declaration at line 46 *)
(* error 
};
in declaration at line 47 *)

function gsk_path_point_get_type:TGType;cdecl;external libgtk4;
function gsk_path_point_copy(point:PGskPathPoint):PGskPathPoint;cdecl;external libgtk4;
procedure gsk_path_point_free(point:PGskPathPoint);cdecl;external libgtk4;
function gsk_path_point_equal(point1:PGskPathPoint; point2:PGskPathPoint):Tgboolean;cdecl;external libgtk4;
function gsk_path_point_compare(point1:PGskPathPoint; point2:PGskPathPoint):longint;cdecl;external libgtk4;
procedure gsk_path_point_get_position(point:PGskPathPoint; path:PGskPath; position:Pgraphene_point_t);cdecl;external libgtk4;
procedure gsk_path_point_get_tangent(point:PGskPathPoint; path:PGskPath; direction:TGskPathDirection; tangent:Pgraphene_vec2_t);cdecl;external libgtk4;
function gsk_path_point_get_rotation(point:PGskPathPoint; path:PGskPath; direction:TGskPathDirection):single;cdecl;external libgtk4;
function gsk_path_point_get_curvature(point:PGskPathPoint; path:PGskPath; direction:TGskPathDirection; center:Pgraphene_point_t):single;cdecl;external libgtk4;
function gsk_path_point_get_distance(point:PGskPathPoint; measure:PGskPathMeasure):single;cdecl;external libgtk4;

// === Konventiert am: 5-7-26 13:36:57 ===

function GSK_TYPE_PATH_POINT : TGType;

implementation

function GSK_TYPE_PATH_POINT : TGType;
  begin
    GSK_TYPE_PATH_POINT:=gsk_path_point_get_type;
  end;



end.
