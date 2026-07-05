
unit gskpathpoint;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskpathpoint.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskpathpoint.h
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
    Pgraphene_point_t  = ^graphene_point_t;
    Pgraphene_vec2_t  = ^graphene_vec2_t;
    PGskPath  = ^GskPath;
    PGskPathMeasure  = ^GskPathMeasure;
    PGskPathPoint  = ^GskPathPoint;
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

{ was #define dname def_expr }
function GSK_TYPE_PATH_POINT : longint; { return type might be wrong }

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

function gsk_path_point_get_type:TGType;cdecl;external;
function gsk_path_point_copy(point:PGskPathPoint):PGskPathPoint;cdecl;external;
procedure gsk_path_point_free(point:PGskPathPoint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_path_point_equal(point1:PGskPathPoint; point2:PGskPathPoint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_path_point_compare(point1:PGskPathPoint; point2:PGskPathPoint):longint;cdecl;external;
(* Const before type ignored *)
procedure gsk_path_point_get_position(point:PGskPathPoint; path:PGskPath; position:Pgraphene_point_t);cdecl;external;
(* Const before type ignored *)
procedure gsk_path_point_get_tangent(point:PGskPathPoint; path:PGskPath; direction:TGskPathDirection; tangent:Pgraphene_vec2_t);cdecl;external;
(* Const before type ignored *)
function gsk_path_point_get_rotation(point:PGskPathPoint; path:PGskPath; direction:TGskPathDirection):single;cdecl;external;
(* Const before type ignored *)
function gsk_path_point_get_curvature(point:PGskPathPoint; path:PGskPath; direction:TGskPathDirection; center:Pgraphene_point_t):single;cdecl;external;
(* Const before type ignored *)
function gsk_path_point_get_distance(point:PGskPathPoint; measure:PGskPathMeasure):single;cdecl;external;

implementation

{ was #define dname def_expr }
function GSK_TYPE_PATH_POINT : longint; { return type might be wrong }
  begin
    GSK_TYPE_PATH_POINT:=gsk_path_point_get_type;
  end;


end.
