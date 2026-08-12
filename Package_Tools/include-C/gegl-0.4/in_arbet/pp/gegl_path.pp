
unit gegl_path;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_path.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_path.h
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
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
PGeglFlattenerFunc  = ^GeglFlattenerFunc;
PGeglMatrix3  = ^GeglMatrix3;
PGeglPath  = ^GeglPath;
PGeglPathItem  = ^GeglPathItem;
PGeglPathList  = ^GeglPathList;
PGeglPathPoint  = ^GeglPathPoint;
Pgint  = ^gint;
PGParamSpec  = ^GParamSpec;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2011 Michael Muré <batolettre@gmail.com>
 * Copyright 2007 Øyvind Kolås <pippin@gimp.org>
  }
{**
 * GeglPath:
 *
 * GeglPath is GEGLs means of storing the nodes and other knots and the
 * instructions for rendering 2d paths like poly lines, bezier curves and other
 * curve representations.
  }
{$ifndef __GEGL_PATH_H__}
{$define __GEGL_PATH_H__}
{$include <glib-object.h>}
{$include <gegl-matrix.h>}

{ was #define dname def_expr }
function GEGL_TYPE_PATH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PATH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PATH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PATH(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PATH_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PATH_GET_CLASS(obj : longint) : longint;

type
  PGeglPath = ^TGeglPath;
  TGeglPath = record
      parent_instance : TGObject;
    end;


function gegl_path_get_type:TGType;cdecl;external;
{ Internally the following structures are used, parts
 * of the internal implementation are exposed through
 * the path access API. The linked list api is currently
 * only used for adding new path interpolators/flatteners
 * with new knot interpretations.
  }
{**
 * GeglPathItem:
 *
 * A #GeglPathItem contains the type of instruction to perform as
 * well as it's arguments. In the public API the PathItem always has
 * 4 points internally only the needed amount of memory is stored
 * for a GeglPathItem.
 *
 *  </p><pre>typedef struct GeglPathPoint
 * 
 *   gfloat x;
 *   gfloat y;
 *  GeglPathPoint;</pre></p>
 * </p><pre>typedef struct GeglPathItem
 * 
 *   gchar  type;
 *   GeglPathPoint  point[4];
 *  GeglPathItem;</pre></p>
 *
  }
type
  PGeglPathPoint = ^TGeglPathPoint;
  TGeglPathPoint = record
      x : Tgfloat;
      y : Tgfloat;
    end;
{ should perhaps be padded out?  }
{ Note: internally GeglPath operates with paths that
                    * have the exact number of pairs allocated.
                     }

  PGeglPathItem = ^TGeglPathItem;
  TGeglPathItem = record
      _type : Tgchar;
      point : array[0..3] of TGeglPathPoint;
    end;
{*
 * gegl_path_new:
 *
 * Creates a new #GeglPath with no nodes.
 *
 * Returns the newly created #GeglPath
  }

function gegl_path_new:PGeglPath;cdecl;external;
{*
 * gegl_path_new_from_string:
 * @instructions: a string describing the path.
 *
 * Creates a new #GeglPath with the nodes described in the string
 * @instructions. See gegl_path_parse_string() for details of the
 * format of the string.
 *
 * Returns the newly created #GeglPath
  }
(* Const before type ignored *)
function gegl_path_new_from_string(instructions:Pgchar):PGeglPath;cdecl;external;
{*
 * gegl_path_is_empty:
 * @path: a #GeglPath
 *
 * Check if the path contains any nodes.
 *
 * Returns TRUE if the path has no nodes.
  }
function gegl_path_is_empty(path:PGeglPath):Tgboolean;cdecl;external;
{*
 * gegl_path_get_n_nodes:
 * @path: a #GeglPath
 *
 * Retrieves the number of nodes in the path.
 *
 * Return value: the number of nodes in the path.
  }
function gegl_path_get_n_nodes(path:PGeglPath):Tgint;cdecl;external;
{*
 * gegl_path_get_length:
 * @path: a #GeglPath
 *
 * Returns the total length of the path.
 *
 * Return value: the length of the path.
  }
function gegl_path_get_length(path:PGeglPath):Tgdouble;cdecl;external;
{*
 * gegl_path_get_node:
 * @path: a #GeglPath
 * @index: the node number to retrieve
 * @node: (out): a pointer to a #GeglPathItem record to be written.
 *
 * Retrieve the node of the path at position @pos.
 *
 * Returns TRUE if the node was successfully retrieved.
  }
function gegl_path_get_node(path:PGeglPath; index:Tgint; node:PGeglPathItem):Tgboolean;cdecl;external;
{*
 * gegl_path_to_string:
 * @path: a #GeglPath
 *
 * Serialize the paths nodes to a string.
 *
 * Return value: return a string with instructions describing the string you
 * need to free this with g_free().
  }
function gegl_path_to_string(path:PGeglPath):Pgchar;cdecl;external;
{*
 * gegl_path_set_matrix:
 * @path: a #GeglPath
 * @matrix: (in) (transfer none): a #GeglMatrix3 to copy the matrix from
 *
 * Set the transformation matrix of the path.
 *
 * The path is transformed through this matrix when being evaluated,
 * causing the calculated positions and length to be changed by the transform.
  }
procedure gegl_path_set_matrix(path:PGeglPath; matrix:PGeglMatrix3);cdecl;external;
{*
 * gegl_path_get_matrix:
 * @path: a #GeglPath
 * @matrix: (out caller-allocates): a #GeglMatrix3 to copy the matrix into
 *
 * Get the transformation matrix of the path.
  }
procedure gegl_path_get_matrix(path:PGeglPath; matrix:PGeglMatrix3);cdecl;external;
{*
 * gegl_path_closest_point:
 * @path: a #GeglPath
 * @x: x coordinate.
 * @y: y coordinate
 * @on_path_x: (out): return location for x coordinate on the path that was closest
 * @on_path_y: (out): return location for y coordinate on the path that was closest
 * @node_pos_before: (out): the node position interpreted before this position
 * was deemed the closest coordinate.
 *
 * Figure out what and where on a path is closest to arbitrary coordinates.
 *
 * Returns the length along the path where the closest point was encountered.
  }
function gegl_path_closest_point(path:PGeglPath; x:Tgdouble; y:Tgdouble; on_path_x:Pgdouble; on_path_y:Pgdouble; 
           node_pos_before:Pgint):Tgdouble;cdecl;external;
{*
 * gegl_path_calc_y_for_x:
 * @path: a #GeglPath
 * @x: x coordinate to compute for
 * @y: (out): return location for y coordinate
 *
 * Compute a corresponding y coordinate for a given x input coordinate,
 * returns 0 if computed correctly and -1 if the path doesn't exist for the
 * specified x coordinate.
  }
function gegl_path_calc_y_for_x(path:PGeglPath; x:Tgdouble; y:Pgdouble):Tgint;cdecl;external;
{*
 * gegl_path_calc:
 * @path: a #GeglPath
 * @pos: how far along the path.
 * @x: (out): return location for x coordinate.
 * @y: (out): return location for y coordinate
 *
 * Compute the coordinates of the path at the @position (length measured from
 * start of path, not including discontinuities).
  }
function gegl_path_calc(path:PGeglPath; pos:Tgdouble; x:Pgdouble; y:Pgdouble):Tgboolean;cdecl;external;
{*
 * gegl_path_calc_values: (skip)
 * @path: a #GeglPath
 * @num_samples: number of samples to compute
 * @xs: (out caller-allocates) (array length=num_samples): return location for x coordinates
 * @ys: (out caller-allocates) (array length=num_samples): return location for y coordinates
 *
 * Compute @num_samples for a path into the provided arrays @xs and @ys
 * the returned values include the start and end positions of the path.
  }
procedure gegl_path_calc_values(path:PGeglPath; num_samples:Tguint; xs:Pgdouble; ys:Pgdouble);cdecl;external;
{*
 * gegl_path_get_bounds:
 * @self: a #GeglPath.
 * @min_x: (out): return location for minimum x coordinate
 * @max_x: (out): return location for maximum x coordinate
 * @min_y: (out): return location for minimum y coordinate
 * @max_y: (out): return location for maximum y coordinate
 *
 * Compute the bounding box of a path.
  }
procedure gegl_path_get_bounds(self:PGeglPath; min_x:Pgdouble; max_x:Pgdouble; min_y:Pgdouble; max_y:Pgdouble);cdecl;external;
{ XXX: LP and RP are nasty hacks because the GEGL docs code scanner gets
 * confused, need to be fixed there
  }
(* Const before type ignored *)
type

  TGeglNodeFunction = procedure (node:PGeglPathItem; user_data:Tgpointer);cdecl;
{*
 * gegl_path_foreach:
 * @path: a #GeglPath
 * @each_item: (closure user_data) (scope call): a function to call for each node in the path.
 * @user_data: user data to pass to the function (in addition to the GeglPathItem).
 *
 * Execute a provided function for every node in the path (useful for
 * drawing and otherwise traversing a path.)
  }

procedure gegl_path_foreach(path:PGeglPath; each_item:TGeglNodeFunction; user_data:Tgpointer);cdecl;external;
{*
 * gegl_path_foreach_flat:
 * @path: a #GeglPath
 * @each_item: (closure user_data) (scope call): a function to call for each node in the path.
 * @user_data: user data to pass to a node.
 *
 * Execute a provided function for the segments of a poly line approximating
 * the path.
  }
procedure gegl_path_foreach_flat(path:PGeglPath; each_item:TGeglNodeFunction; user_data:Tgpointer);cdecl;external;
{*
 * gegl_path_clear:
 * @path: a #GeglPath
 *
 * Remove all nods from a @path.
  }
procedure gegl_path_clear(path:PGeglPath);cdecl;external;
{*
 * gegl_path_insert_node:
 * @path: a #GeglPath
 * @pos: the position we want the new node to have.
 * @node: pointer to a structure describing the GeglPathItem we want to store
 *
 * Insert the new node @node at position @pos in @path.
 * if @pos = -1, the node is added in the last position.
  }
(* Const before type ignored *)
procedure gegl_path_insert_node(path:PGeglPath; pos:Tgint; node:PGeglPathItem);cdecl;external;
{*
 * gegl_path_replace_node:
 * @path: a #GeglPath
 * @pos: the position we want the new node to have.
 * @node: pointer to a structure describing the GeglPathItem we want to store.
 *
 * Replaces the exiting node at position @pos in @path.
  }
(* Const before type ignored *)
procedure gegl_path_replace_node(path:PGeglPath; pos:Tgint; node:PGeglPathItem);cdecl;external;
{*
 * gegl_path_remove_node:
 * @path: a #GeglPath
 * @pos: a node in the path.
 *
 * Removes the node number @pos in @path.
  }
procedure gegl_path_remove_node(path:PGeglPath; pos:Tgint);cdecl;external;
{*
 * gegl_path_parse_string:
 * @path: a #GeglPath
 * @instructions: a string describing a path.
 *
 * Parses @instructions and appends corresponding nodes to path (call
 * gegl_path_clean() first if you want to replace the existing path.
  }
(* Const before type ignored *)
procedure gegl_path_parse_string(path:PGeglPath; instructions:Pgchar);cdecl;external;
{*
 * gegl_path_append:
 * @path: a #GeglPath
 * @...: first instruction.
 *
 * Use as follows: gegl_path_append (path, 'M', 0.0, 0.0);
 * and gegl_path_append (path, 'C', 10.0, 10.0, 50.0, 10.0, 60.0, 0.0) the
 * number of arguments are determined from the instruction provided.
  }
procedure gegl_path_append(path:PGeglPath; args:array of const);cdecl;external;
procedure gegl_path_append(path:PGeglPath);cdecl;external;
{*
 * gegl_path_freeze:
 * @path: a @GeglPath
 *
 * Make the @GeglPath stop firing signals as it changes must be paired with a
 * gegl_path_thaw() for the signals to start again.
  }
procedure gegl_path_freeze(path:PGeglPath);cdecl;external;
{*
 * gegl_path_thaw:
 * @path: a @GeglPath
 *
 * Restart firing signals (unless the path has been frozen multiple times).
  }
procedure gegl_path_thaw(path:PGeglPath);cdecl;external;
{*
 * gegl_param_spec_path:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @default_path: the default value for the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GParamSpec instance specifying a #GeglPath property.
 *
 * Returns: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_path(name:Pgchar; nick:Pgchar; blurb:Pgchar; default_path:PGeglPath; flags:TGParamFlags):PGParamSpec;cdecl;external;
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_PATH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_PATH(obj : longint) : longint;

function gegl_param_path_get_type:TGType;cdecl;external;
{*
 * gegl_path_add_type:
 * @type: a gchar to recognize in path descriptions.
 * @items: the number of floating point data items the instruction takes
 * @description: a human readable description of this entry
 *
 * Adds a new type to the path system, FIXME this should probably
 * return something on registration conflicts, for now it expects
 * all registered paths to be aware of each other.
  }
(* Const before type ignored *)
procedure gegl_path_add_type(_type:Tgchar; items:Tgint; description:Pgchar);cdecl;external;
{**
 * GeglPathList: (skip)
 *  
 * Linked list used internally, and for the plug-in API for new path
 * interpolators.
  }
type
  PGeglPathList = ^TGeglPathList;
  TGeglPathList = record
      next : PGeglPathList;
      d : TGeglPathItem;
    end;
{*
 * gegl_path_list_append: (skip)
 * @head: a #GeglPathList
 * @...: additional #GeglPathList items to append
 *
 * Appends to path list, if head is NULL a new list is created
  }
function gegl_path_list_append(head:PGeglPathList; args:array of const):PGeglPathList;cdecl;external;
function gegl_path_list_append(head:PGeglPathList):PGeglPathList;cdecl;external;
{*
 * gegl_path_list_destroy: (skip)
 * @path: A #GeglPathList
 *
 * Frees up a path list
  }
function gegl_path_list_destroy(path:PGeglPathList):PGeglPathList;cdecl;external;
{**
 * GeglFlattenerFunc: (skip)
 *
 * prototype of function passed to gegl_path_add_flattener()
  }
type
  PGeglFlattenerFunc = ^TGeglFlattenerFunc;
  TGeglFlattenerFunc = function (original:PGeglPathList):PGeglPathList;cdecl;
{* 
 * gegl_path_add_flattener: (skip)
 * @func: a #GeglFlattenerFunc
 *
 * Add a new flattener, the flattener should produce a type of path that
 * GeglPath already understands, if the flattener is unable to flatten
 * the incoming path (doesn't understand the instructions), the original
 * path should be returned.
  }

procedure gegl_path_add_flattener(func:TGeglFlattenerFunc);cdecl;external;
{*
 * gegl_path_get_path: (skip)
 * @path: a #GeglPath
 *
 * Return the internal untouched #GeglPathList
  }
function gegl_path_get_path(path:PGeglPath):PGeglPathList;cdecl;external;
{*
 * gegl_path_get_flat_path: (skip)
 * @path: a #GeglPath
 *
 * Return a polyline version of @path
  }
function gegl_path_get_flat_path(path:PGeglPath):PGeglPathList;cdecl;external;
{**
 * GeglPathPoint: (skip)
  }
{*
 * gegl_path_point_lerp: (skip)
 * @dest: return location for the result
 * @a: origin GeglPathPoint
 * @b: destination GeglPathPoint
 * @t: ratio between @a and @b
 *
 * linear interpolation between two #GeglPathPoint
  }
procedure gegl_path_point_lerp(dest:PGeglPathPoint; a:PGeglPathPoint; b:PGeglPathPoint; t:Tgfloat);cdecl;external;
{*
 * gegl_path_point_dist: (skip)
 * @a: an arbitrary GeglPathPoint
 * @b: an arbitrary GeglPathPoint
 *
 * Compute the distance between #GeglPathPoint @a and @b
  }
function gegl_path_point_dist(a:PGeglPathPoint; b:PGeglPathPoint):Tgdouble;cdecl;external;
{*
 * gegl_path_dirty:
 * @path: a #GeglPath
 *
 * Marks the path as dirty and issues an invalidation for the path rendering,
 * use this if modifying the values of a GeglPathPoint inline.
  }
procedure gegl_path_dirty(path:PGeglPath);cdecl;external;
{$endif}
{ __GEGL_PATH_H__  }

implementation

{ was #define dname def_expr }
function GEGL_TYPE_PATH : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PATH:=gegl_path_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PATH(obj : longint) : longint;
begin
  GEGL_PATH:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEGL_TYPE_PATH,GeglPath);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PATH_CLASS(klass : longint) : longint;
begin
  GEGL_PATH_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEGL_TYPE_PATH,GeglPathClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PATH(obj : longint) : longint;
begin
  GEGL_IS_PATH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_PATH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PATH_CLASS(klass : longint) : longint;
begin
  GEGL_IS_PATH_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEGL_TYPE_PATH);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PATH_GET_CLASS(obj : longint) : longint;
begin
  GEGL_PATH_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEGL_TYPE_PATH,GeglPathClass);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_PATH : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_PATH:=gegl_param_path_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_PATH(obj : longint) : longint;
begin
  GEGL_IS_PARAM_PATH:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_PARAM_PATH);
end;


end.
