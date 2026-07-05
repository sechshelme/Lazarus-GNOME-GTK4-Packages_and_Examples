
unit gskpath;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskpath.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskpath.h
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
Pchar  = ^char;
Pgraphene_point_t  = ^graphene_point_t;
Pgraphene_rect_t  = ^graphene_rect_t;
PGskPath  = ^GskPath;
PGskPathForeachFlags  = ^GskPathForeachFlags;
PGskPathIntersection  = ^GskPathIntersection;
PGskPathPoint  = ^GskPathPoint;
PGskStroke  = ^GskStroke;
PGString  = ^GString;
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
{*
 * GskPathForeachFlags:
 * @GSK_PATH_FOREACH_ALLOW_ONLY_LINES: The default behavior, only allow lines.
 * @GSK_PATH_FOREACH_ALLOW_QUAD: Allow emission of `GSK_PATH_QUAD` operations
 * @GSK_PATH_FOREACH_ALLOW_CUBIC: Allow emission of `GSK_PATH_CUBIC` operations.
 * @GSK_PATH_FOREACH_ALLOW_CONIC: Allow emission of `GSK_PATH_CONIC` operations.
 *
 * Flags that can be passed to gsk_path_foreach() to influence what
 * kinds of operations the path is decomposed into.
 *
 * By default, [method@Gsk.Path.foreach] will only emit a path with all
 * operations flattened to straight lines to allow for maximum compatibility.
 * The only operations emitted will be `GSK_PATH_MOVE`, `GSK_PATH_LINE` and
 * `GSK_PATH_CLOSE`.
 *
 * Since: 4.14
  }
{< prefix=GSK_PATH_FOREACH > }
type
  PGskPathForeachFlags = ^TGskPathForeachFlags;
  TGskPathForeachFlags =  Longint;
  Const
    GSK_PATH_FOREACH_ALLOW_ONLY_LINES = 0;
    GSK_PATH_FOREACH_ALLOW_QUAD = 1 shl 0;
    GSK_PATH_FOREACH_ALLOW_CUBIC = 1 shl 1;
    GSK_PATH_FOREACH_ALLOW_CONIC = 1 shl 2;
;
{*
 * GskPathForeachFunc:
 * @op: The operation
 * @pts: (array length=n_pts): The points of the operation
 * @n_pts: The number of points
 * @weight: The weight for conic curves, or unused if not a conic curve
 * @user_data: The user data provided with the function
 *
 * Type of the callback to iterate through the operations of a path.
 *
 * For each operation, the callback is given the @op itself, the points
 * that the operation is applied to in @pts, and a @weight for conic
 * curves. The @n_pts argument is somewhat redundant, since the number
 * of points can be inferred from the operation.
 *
 * Each contour of the path starts with a @GSK_PATH_MOVE operation.
 * Closed contours end with a @GSK_PATH_CLOSE operation.
 *
 * Returns: %TRUE to continue iterating the path, %FALSE to
 *   immediately abort and not call the function again.
  }
(* Const before type ignored *)
type

  TGskPathForeachFunc = function (op:TGskPathOperation; pts:Pgraphene_point_t; n_pts:Tgsize; weight:single; user_data:Tgpointer):Tgboolean;cdecl;

{ was #define dname def_expr }
function GSK_TYPE_PATH : longint; { return type might be wrong }

function gsk_path_get_type:TGType;cdecl;external;
function gsk_path_ref(self:PGskPath):PGskPath;cdecl;external;
procedure gsk_path_unref(self:PGskPath);cdecl;external;
procedure gsk_path_print(self:PGskPath; _string:PGString);cdecl;external;
function gsk_path_to_string(self:PGskPath):Pchar;cdecl;external;
(* Const before type ignored *)
function gsk_path_parse(_string:Pchar):PGskPath;cdecl;external;
procedure gsk_path_to_cairo(self:PGskPath; cr:Pcairo_t);cdecl;external;
function gsk_path_is_empty(self:PGskPath):Tgboolean;cdecl;external;
function gsk_path_is_closed(self:PGskPath):Tgboolean;cdecl;external;
function gsk_path_get_bounds(self:PGskPath; bounds:Pgraphene_rect_t):Tgboolean;cdecl;external;
function gsk_path_get_tight_bounds(self:PGskPath; bounds:Pgraphene_rect_t):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gsk_path_get_stroke_bounds(self:PGskPath; stroke:PGskStroke; bounds:Pgraphene_rect_t):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gsk_path_in_fill(self:PGskPath; point:Pgraphene_point_t; fill_rule:TGskFillRule):Tgboolean;cdecl;external;
function gsk_path_get_start_point(self:PGskPath; result:PGskPathPoint):Tgboolean;cdecl;external;
function gsk_path_get_end_point(self:PGskPath; result:PGskPathPoint):Tgboolean;cdecl;external;
function gsk_path_get_next(self:PGskPath; point:PGskPathPoint):Tgboolean;cdecl;external;
function gsk_path_get_previous(self:PGskPath; point:PGskPathPoint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gsk_path_get_closest_point(self:PGskPath; point:Pgraphene_point_t; threshold:single; result:PGskPathPoint; distance:Psingle):Tgboolean;cdecl;external;
function gsk_path_foreach(self:PGskPath; flags:TGskPathForeachFlags; func:TGskPathForeachFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsk_path_equal(path1:PGskPath; path2:PGskPath):Tgboolean;cdecl;external;
{*
 * GskPathIntersection:
 * @GSK_PATH_INTERSECTION_NONE: No intersection
 * @GSK_PATH_INTERSECTION_NORMAL: A normal intersection, where the two paths
 *   cross each other
 * @GSK_PATH_INTERSECTION_START: The start of a segment where the two paths coincide
 * @GSK_PATH_INTERSECTION_END: The end of a segment where the two paths coincide
 *
 * The values of this enumeration classify intersections
 * between paths.
 *
 * Since: 4.20
  }
type
  PGskPathIntersection = ^TGskPathIntersection;
  TGskPathIntersection =  Longint;
  Const
    GSK_PATH_INTERSECTION_NONE = 0;
    GSK_PATH_INTERSECTION_NORMAL = 1;
    GSK_PATH_INTERSECTION_START = 2;
    GSK_PATH_INTERSECTION_END = 3;
;
{*
 * GskPathIntersectionFunc:
 * @path1: the first path
 * @point1: the intersection as point on @path1
 * @path2: the second path
 * @point2: the intersection as point on @path2
 * @kind: the nature of the intersection
 * @user_data: user data
 *
 * Prototype of the callback to iterate through the
 * intersections of two paths.
 *
 * Returns: true to continue iterating, false to
 *   stop the iteration and not call the function again
 *
 * Since: 4.20
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGskPathIntersectionFunc = function (path1:PGskPath; point1:PGskPathPoint; path2:PGskPath; point2:PGskPathPoint; kind:TGskPathIntersection; 
               user_data:Tgpointer):Tgboolean;cdecl;

function gsk_path_foreach_intersection(path1:PGskPath; path2:PGskPath; func:TGskPathIntersectionFunc; user_data:Tgpointer):Tgboolean;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GskPath, gsk_path_unref) }

implementation

{ was #define dname def_expr }
function GSK_TYPE_PATH : longint; { return type might be wrong }
  begin
    GSK_TYPE_PATH:=gsk_path_get_type;
  end;


end.
