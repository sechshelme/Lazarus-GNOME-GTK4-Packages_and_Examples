
unit gegl_rectangle;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_rectangle.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_rectangle.h
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
PGeglBuffer  = ^GeglBuffer;
PGeglRectangle  = ^GeglRectangle;
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
 * Copyright 2003 Calvin Williamson
  }
{$ifndef __GEGL_RECTANGLE_H__}
{$define __GEGL_RECTANGLE_H__}

function gegl_rectangle_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GEGL_TYPE_RECTANGLE : longint; { return type might be wrong }

{xxxxx#define  GEGL_RECTANGLE(x,y,w,h) (&((GeglRectangle)(x), (y),   (w), (h))) }
{**
 * GeglRectangle:
 *
 * GeglRectangles are used in #gegl_node_get_bounding_box and #gegl_node_blit
 * for specifying rectangles.
 *
 * </p><pre>struct GeglRectangle
 * 
 *   gint x;
 *   gint y;
 *   gint width;
 *   gint height;
 * ;</pre><p>
 *
  }
{*
 * gegl_rectangle_new:
 * @x: upper left x coordinate
 * @y: upper left y coordinate
 * @width: width in pixels.
 * @height: height in pixels.
 *
 * Creates a new rectangle set with the values from @x, @y, @width and @height.
  }
function gegl_rectangle_new(x:Tgint; y:Tgint; width:Tguint; height:Tguint):PGeglRectangle;cdecl;external;
{*
 * gegl_rectangle_set:
 * @rectangle: a #GeglRectangle
 * @x: upper left x coordinate
 * @y: upper left y coordinate
 * @width: width in pixels.
 * @height: height in pixels.
 *
 * Sets the @x, @y, @width and @height on @rectangle.
  }
procedure gegl_rectangle_set(rectangle:PGeglRectangle; x:Tgint; y:Tgint; width:Tguint; height:Tguint);cdecl;external;
{*
 * gegl_rectangle_equal:
 * @rectangle1: a #GeglRectangle
 * @rectangle2: a #GeglRectangle
 *
 * Check if two #GeglRectangles are equal.
 *
 * Returns TRUE if @rectangle and @rectangle2 are equal.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_rectangle_equal(rectangle1:PGeglRectangle; rectangle2:PGeglRectangle):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_equal_coords:
 * @rectangle: a #GeglRectangle
 * @x: X coordinate
 * @y: Y coordinate
 * @width: width of rectangle
 * @height: height of rectangle
 *
 * Check if a rectangle is equal to a set of parameters.
 *
 * Returns TRUE if @rectangle and @x,@y @width x @height are equal.
  }
(* Const before type ignored *)
function gegl_rectangle_equal_coords(rectangle:PGeglRectangle; x:Tgint; y:Tgint; width:Tgint; height:Tgint):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_is_empty:
 * @rectangle: a #GeglRectangle
 *
 * Check if a rectangle has zero area.
 *
 * Returns TRUE if the width or height of @rectangle is 0.
  }
(* Const before type ignored *)
function gegl_rectangle_is_empty(rectangle:PGeglRectangle):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_dup:
 * @rectangle: the #GeglRectangle to duplicate
 *
 * Create a new copy of @rectangle.
 *
 * Return value: (transfer full): a #GeglRectangle
  }
(* Const before type ignored *)
function gegl_rectangle_dup(rectangle:PGeglRectangle):PGeglRectangle;cdecl;external;
{*
 * gegl_rectangle_copy:
 * @destination: a #GeglRectangle
 * @source: a #GeglRectangle
 *
 * Copies the rectangle information stored in @source over the information in
 * @destination.
 *
 * @destination may point to the same object as @source.
  }
(* Const before type ignored *)
procedure gegl_rectangle_copy(destination:PGeglRectangle; source:PGeglRectangle);cdecl;external;
{*
 * gegl_rectangle_align:
 * @destination: a #GeglRectangle
 * @rectangle: a #GeglRectangle
 * @tile: a #GeglRectangle
 * @alignment: a #GeglRectangleAlignment value
 *
 * Aligns @rectangle to a regular tile grid, of which @tile is a representative
 * tile, and stores the result in @destination.
 *
 * @alignment can be one of:
 *
 *   GEGL_RECTANGLE_ALIGNMENT_SUBSET:  Calculate the biggest aligned rectangle
 *   contained in @rectangle.
 *
 *   GEGL_RECTANGLE_ALIGNMENT_SUPERSET:  Calculate the smallest aligned
 *   rectangle containing @rectangle.
 *
 *   GEGL_RECTANGLE_ALIGNMENT_NEAREST:  Calculate the nearest aligned rectangle
 *   to @rectangle.
 *
 * @destination may point to the same object as @rectangle or @tile.
 *
 * Returns TRUE if the result is not empty.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_rectangle_align(destination:PGeglRectangle; rectangle:PGeglRectangle; tile:PGeglRectangle; alignment:TGeglRectangleAlignment):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_align_to_buffer:
 * @destination: a #GeglRectangle
 * @rectangle: a #GeglRectangle
 * @buffer: a #GeglBuffer
 * @alignment: a #GeglRectangleAlignment value
 *
 * Aligns @rectangle to the tile grid of @buffer, and stores the result in
 * @destination.
 *
 * @alignment has the same meaning as for gegl_rectangle_align().
 *
 * @destination may point to the same object as @rectangle.
 *
 * Returns TRUE if the result is not empty.
  }
(* Const before type ignored *)
function gegl_rectangle_align_to_buffer(destination:PGeglRectangle; rectangle:PGeglRectangle; buffer:PGeglBuffer; alignment:TGeglRectangleAlignment):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_bounding_box:
 * @destination: a #GeglRectangle
 * @source1: a #GeglRectangle
 * @source2: a #GeglRectangle
 *
 * Computes the bounding box of the rectangles @source1 and @source2 and stores the
 * resulting bounding box in @destination.
 *
 * @destination may point to the same object as @source1 or @source2.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure gegl_rectangle_bounding_box(destination:PGeglRectangle; source1:PGeglRectangle; source2:PGeglRectangle);cdecl;external;
{*
 * gegl_rectangle_intersect:
 * @dest: return location for the intersection of @src1 and @src2, or NULL.
 * @src1: a #GeglRectangle
 * @src2: a #GeglRectangle
 *
 * Calculates the intersection of two rectangles. If the rectangles do not
 * intersect, dest's width and height are set to 0 and its x and y values
 * are undefined.
 *
 * @dest may point to the same object as @src1 or @src2.
 *
 * Returns TRUE if the rectangles intersect.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_rectangle_intersect(dest:PGeglRectangle; src1:PGeglRectangle; src2:PGeglRectangle):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_subtract:
 * @destination: an array of 4 #GeglRectangle elements
 * @minuend: a #GeglRectangle
 * @subtrahend: a #GeglRectangle
 *
 * Subtracts @subtrahend from @minuend, and stores the resulting rectangles in
 * @destination.  Between 0 and 4 disjoint rectangles may be produced.
 *
 * @destination may contain @minuend or @subtrahend.
 *
 * Returns the number of resulting rectangles.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_rectangle_subtract(destination:array[0..3] of TGeglRectangle; minuend:PGeglRectangle; subtrahend:PGeglRectangle):Tgint;cdecl;external;
{*
 * gegl_rectangle_subtract_bounding_box:
 * @destination: a #GeglRectangle
 * @minuend: a #GeglRectangle
 * @subtrahend: a #GeglRectangle
 *
 * Computes the bounding box of the area formed by subtracting @subtrahend
 * from @minuend, and stores the result in @destination.
 *
 * @destination may point to the same object as @minuend or @subtrahend.
 *
 * Returns TRUE if the result is not empty.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_rectangle_subtract_bounding_box(destination:PGeglRectangle; minuend:PGeglRectangle; subtrahend:PGeglRectangle):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_xor:
 * @destination: an array of 4 #GeglRectangle elements
 * @source1: a #GeglRectangle
 * @source2: a #GeglRectangle
 *
 * Computes the symmetric difference of the rectangles @source1 and @source2,
 * and stores the resulting rectangles in @destination.  Between 0 and 4
 * disjoint rectangles may be produced.
 *
 * @destination may contain @rectangle1 or @rectangle2.
 *
 * Returns the number of resulting rectangles.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_rectangle_xor(destination:array[0..3] of TGeglRectangle; source1:PGeglRectangle; source2:PGeglRectangle):Tgint;cdecl;external;
{*
 * gegl_rectangle_contains:
 * @parent: a #GeglRectangle
 * @child: a #GeglRectangle
 *
 * Checks if the #GeglRectangle @child is fully contained within @parent.
 *
 * Returns TRUE if the @child is fully contained in @parent.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_rectangle_contains(parent:PGeglRectangle; child:PGeglRectangle):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_infinite_plane:
 *
 * Returns a GeglRectangle that represents an infininte plane.
  }
function gegl_rectangle_infinite_plane:TGeglRectangle;cdecl;external;
{*
 * gegl_rectangle_is_infinite_plane:
 * @rectangle: A GeglRectangle.
 *
 * Returns TRUE if the GeglRectangle represents an infininte plane,
 * FALSE otherwise.
  }
(* Const before type ignored *)
function gegl_rectangle_is_infinite_plane(rectangle:PGeglRectangle):Tgboolean;cdecl;external;
{*
 * gegl_rectangle_dump:
 * @rectangle: A GeglRectangle.
 *
 * For debugging purposes, not stable API.
  }
(* Const before type ignored *)
procedure gegl_rectangle_dump(rectangle:PGeglRectangle);cdecl;external;
const
  GEGL_FLOAT_EPSILON = 1e-5;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GEGL_FLOAT_IS_ZERO(value : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_FLOAT_EQUAL(v1,v2 : longint) : longint;

function _gegl_float_epsilon_zero(value:single):Tgint;cdecl;external;
function _gegl_float_epsilon_equal(v1:single; v2:single):Tgint;cdecl;external;
{$endif}
{ __GEGL_UTILS_H__  }

implementation

{ was #define dname def_expr }
function GEGL_TYPE_RECTANGLE : longint; { return type might be wrong }
  begin
    GEGL_TYPE_RECTANGLE:=gegl_rectangle_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_FLOAT_IS_ZERO(value : longint) : longint;
begin
  GEGL_FLOAT_IS_ZERO:=_gegl_float_epsilon_zero(value);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_FLOAT_EQUAL(v1,v2 : longint) : longint;
begin
  GEGL_FLOAT_EQUAL:=_gegl_float_epsilon_equal(v1,v2);
end;


end.
