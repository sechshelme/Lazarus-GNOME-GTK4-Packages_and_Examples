
unit gskenums;
interface

{
  Automatically converted by H2Pas 1.0.0 from gskenums.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gskenums.h
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
PGskBlendMode  = ^GskBlendMode;
PGskCorner  = ^GskCorner;
PGskFillRule  = ^GskFillRule;
PGskGLUniformType  = ^GskGLUniformType;
PGskIsolation  = ^GskIsolation;
PGskLineCap  = ^GskLineCap;
PGskLineJoin  = ^GskLineJoin;
PGskMaskMode  = ^GskMaskMode;
PGskPathDirection  = ^GskPathDirection;
PGskPathOperation  = ^GskPathOperation;
PGskPorterDuff  = ^GskPorterDuff;
PGskRenderNodeType  = ^GskRenderNodeType;
PGskScalingFilter  = ^GskScalingFilter;
PGskSerializationError  = ^GskSerializationError;
PGskTransformCategory  = ^GskTransformCategory;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GSK - The GTK Scene Kit
 * Copyright 2016  Endless
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GSK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gsk/gsk.h> can be included directly."}
{$endif}
{*
 * GskRenderNodeType:
 * @GSK_NOT_A_RENDER_NODE: Error type. No node will ever have this type.
 * @GSK_CONTAINER_NODE: A node containing a stack of children
 * @GSK_CAIRO_NODE: A node drawing a `cairo_surface_t`
 * @GSK_COLOR_NODE: A node drawing a single color rectangle
 * @GSK_LINEAR_GRADIENT_NODE: A node drawing a linear gradient
 * @GSK_REPEATING_LINEAR_GRADIENT_NODE: A node drawing a repeating linear gradient
 * @GSK_RADIAL_GRADIENT_NODE: A node drawing a radial gradient
 * @GSK_REPEATING_RADIAL_GRADIENT_NODE: A node drawing a repeating radial gradient
 * @GSK_CONIC_GRADIENT_NODE: A node drawing a conic gradient
 * @GSK_BORDER_NODE: A node stroking a border around an area
 * @GSK_TEXTURE_NODE: A node drawing a `GdkTexture`
 * @GSK_INSET_SHADOW_NODE: A node drawing an inset shadow
 * @GSK_OUTSET_SHADOW_NODE: A node drawing an outset shadow
 * @GSK_TRANSFORM_NODE: A node that renders its child after applying a matrix transform
 * @GSK_OPACITY_NODE: A node that changes the opacity of its child
 * @GSK_COLOR_MATRIX_NODE: A node that applies a color matrix to every pixel
 * @GSK_REPEAT_NODE: A node that repeats the child's contents
 * @GSK_CLIP_NODE: A node that clips its child to a rectangular area
 * @GSK_ROUNDED_CLIP_NODE: A node that clips its child to a rounded rectangle
 * @GSK_SHADOW_NODE: A node that draws a shadow below its child
 * @GSK_BLEND_NODE: A node that blends two children together
 * @GSK_CROSS_FADE_NODE: A node that cross-fades between two children
 * @GSK_TEXT_NODE: A node containing a glyph string
 * @GSK_BLUR_NODE: A node that applies a blur
 * @GSK_DEBUG_NODE: Debug information that does not affect the rendering
 * @GSK_GL_SHADER_NODE: A node that uses OpenGL fragment shaders to render
 *
 * The type of a node determines what the node is rendering.
  }
{*
 * GSK_TEXTURE_SCALE_NODE:
 *
 * A node drawing a `GdkTexture` scaled and filtered.
 *
 * Since: 4.10
  }
{*
 * GSK_MASK_NODE:
 *
 * A node that masks one child with another.
 *
 * Since: 4.10
  }
{*
 * GSK_STROKE_NODE:
 *
 * A node that strokes a path.
 *
 * Since: 4.14
  }
{*
 * GSK_FILL_NODE:
 *
 * A node that fills a path.
 *
 * Since: 4.14
  }
{*
 * GSK_SUBSURFACE_NODE:
 *
 * A node that possibly redirects part of the scene graph to a subsurface.
 *
 * Since: 4.14
  }
{*
 * GSK_COMPONENT_TRANSFER_NODE:
 *
 * A node that applies some function to each color component.
 *
 * Since: 4.20
  }
{*
 * GSK_COPY_NODE:
 *
 * A node that copies the rendering canvas to be pasted later.
 *
 * Since: 4.22
  }
{*
 * GSK_PASTE_NODE:
 *
 * A node that pastes a previously copied canvas.
 *
 * Since: 4.22
  }
{*
 * GSK_COMPOSITE_NODE:
 *
 * A node that combines a child with the background using Porter/Duff
 * operations.
 *
 * Since: 4.22
  }
{*
 * GSK_ISOLATION_NODE:
 *
 * A node that isolated content of its child from previous content.
 *
 * Since: 4.22
  }
{*
 * GSK_DISPLACEMENT_NODE:
 *
 * A node that displaces content according to some mask.
 *
 * Since: 4.22
  }
{*
 * GSK_ARITHMETIC_NODE:
 *
 * A node that combines two child nodes in an arithmetic way.
 *
 * Since: 4.22
  }
type
  PGskRenderNodeType = ^TGskRenderNodeType;
  TGskRenderNodeType =  Longint;
  Const
    GSK_NOT_A_RENDER_NODE = 0;
    GSK_CONTAINER_NODE = 1;
    GSK_CAIRO_NODE = 2;
    GSK_COLOR_NODE = 3;
    GSK_LINEAR_GRADIENT_NODE = 4;
    GSK_REPEATING_LINEAR_GRADIENT_NODE = 5;
    GSK_RADIAL_GRADIENT_NODE = 6;
    GSK_REPEATING_RADIAL_GRADIENT_NODE = 7;
    GSK_CONIC_GRADIENT_NODE = 8;
    GSK_BORDER_NODE = 9;
    GSK_TEXTURE_NODE = 10;
    GSK_INSET_SHADOW_NODE = 11;
    GSK_OUTSET_SHADOW_NODE = 12;
    GSK_TRANSFORM_NODE = 13;
    GSK_OPACITY_NODE = 14;
    GSK_COLOR_MATRIX_NODE = 15;
    GSK_REPEAT_NODE = 16;
    GSK_CLIP_NODE = 17;
    GSK_ROUNDED_CLIP_NODE = 18;
    GSK_SHADOW_NODE = 19;
    GSK_BLEND_NODE = 20;
    GSK_CROSS_FADE_NODE = 21;
    GSK_TEXT_NODE = 22;
    GSK_BLUR_NODE = 23;
    GSK_DEBUG_NODE = 24;
    GSK_GL_SHADER_NODE = 25;
    GSK_TEXTURE_SCALE_NODE = 26;
    GSK_MASK_NODE = 27;
    GSK_FILL_NODE = 28;
    GSK_STROKE_NODE = 29;
    GSK_SUBSURFACE_NODE = 30;
    GSK_COMPONENT_TRANSFER_NODE = 31;
    GSK_COPY_NODE = 32;
    GSK_PASTE_NODE = 33;
    GSK_COMPOSITE_NODE = 34;
    GSK_ISOLATION_NODE = 35;
    GSK_DISPLACEMENT_NODE = 36;
    GSK_ARITHMETIC_NODE = 37;
;
{*
 * GskScalingFilter:
 * @GSK_SCALING_FILTER_LINEAR: linear interpolation filter
 * @GSK_SCALING_FILTER_NEAREST: nearest neighbor interpolation filter
 * @GSK_SCALING_FILTER_TRILINEAR: linear interpolation along each axis,
 *   plus mipmap generation, with linear interpolation along the mipmap
 *   levels
 *
 * The filters used when scaling texture data.
 *
 * The actual implementation of each filter is deferred to the
 * rendering pipeline.
  }
type
  PGskScalingFilter = ^TGskScalingFilter;
  TGskScalingFilter =  Longint;
  Const
    GSK_SCALING_FILTER_LINEAR = 0;
    GSK_SCALING_FILTER_NEAREST = 1;
    GSK_SCALING_FILTER_TRILINEAR = 2;
;
{*
 * GskBlendMode:
 * @GSK_BLEND_MODE_DEFAULT: The default blend mode, which specifies no blending
 * @GSK_BLEND_MODE_MULTIPLY: The source color is multiplied by the destination
 *   and replaces the destination
 * @GSK_BLEND_MODE_SCREEN: Multiplies the complements of the destination and source
 *   color values, then complements the result.
 * @GSK_BLEND_MODE_OVERLAY: Multiplies or screens the colors, depending on the
 *   destination color value. This is the inverse of hard-list
 * @GSK_BLEND_MODE_DARKEN: Selects the darker of the destination and source colors
 * @GSK_BLEND_MODE_LIGHTEN: Selects the lighter of the destination and source colors
 * @GSK_BLEND_MODE_COLOR_DODGE: Brightens the destination color to reflect the source color
 * @GSK_BLEND_MODE_COLOR_BURN: Darkens the destination color to reflect the source color
 * @GSK_BLEND_MODE_HARD_LIGHT: Multiplies or screens the colors, depending on the source color value
 * @GSK_BLEND_MODE_SOFT_LIGHT: Darkens or lightens the colors, depending on the source color value
 * @GSK_BLEND_MODE_DIFFERENCE: Subtracts the darker of the two constituent colors from the lighter color
 * @GSK_BLEND_MODE_EXCLUSION: Produces an effect similar to that of the difference mode but lower in contrast
 * @GSK_BLEND_MODE_COLOR: Creates a color with the hue and saturation of the source color and the luminosity of the destination color
 * @GSK_BLEND_MODE_HUE: Creates a color with the hue of the source color and the saturation and luminosity of the destination color
 * @GSK_BLEND_MODE_SATURATION: Creates a color with the saturation of the source color and the hue and luminosity of the destination color
 * @GSK_BLEND_MODE_LUMINOSITY: Creates a color with the luminosity of the source color and the hue and saturation of the destination color
 *
 * The blend modes available for render nodes.
 *
 * The implementation of each blend mode is deferred to the
 * rendering pipeline.
 *
 * See <https://www.w3.org/TR/compositing-1/#blending> for more information
 * on blending and blend modes.
  }
type
  PGskBlendMode = ^TGskBlendMode;
  TGskBlendMode =  Longint;
  Const
    GSK_BLEND_MODE_DEFAULT = 0;
    GSK_BLEND_MODE_MULTIPLY = 1;
    GSK_BLEND_MODE_SCREEN = 2;
    GSK_BLEND_MODE_OVERLAY = 3;
    GSK_BLEND_MODE_DARKEN = 4;
    GSK_BLEND_MODE_LIGHTEN = 5;
    GSK_BLEND_MODE_COLOR_DODGE = 6;
    GSK_BLEND_MODE_COLOR_BURN = 7;
    GSK_BLEND_MODE_HARD_LIGHT = 8;
    GSK_BLEND_MODE_SOFT_LIGHT = 9;
    GSK_BLEND_MODE_DIFFERENCE = 10;
    GSK_BLEND_MODE_EXCLUSION = 11;
    GSK_BLEND_MODE_COLOR = 12;
    GSK_BLEND_MODE_HUE = 13;
    GSK_BLEND_MODE_SATURATION = 14;
    GSK_BLEND_MODE_LUMINOSITY = 15;
;
{*
 * GskPorterDuff:
 * GSK_PORTER_DUFF_SOURCE:
 * GSK_PORTER_DUFF_DEST:
 * GSK_PORTER_DUFF_SOURCE_OVER_DEST:
 * GSK_PORTER_DUFF_DEST_OVER_SOURCE:
 * GSK_PORTER_DUFF_SOURCE_IN_DEST:
 * GSK_PORTER_DUFF_DEST_IN_SOURCE:
 * GSK_PORTER_DUFF_SOURCE_OUT_DEST:
 * GSK_PORTER_DUFF_DEST_OUT_SOURCE:
 * GSK_PORTER_DUFF_SOURCE_ATOP_DEST:
 * GSK_PORTER_DUFF_DEST_ATOP_SOURCE:
 * GSK_PORTER_DUFF_XOR:
 * GSK_PORTER_DUFF_CLEAR:
 *
 * The 12 compositing modes defined by the seminal paper
 * by Thomas Porter and Tom Duff.
 *
 * They are used in SVG, PDF and in Cairo with `cairo_operator_t`.
 *
 * Since: 4.22
  }
type
  PGskPorterDuff = ^TGskPorterDuff;
  TGskPorterDuff =  Longint;
  Const
    GSK_PORTER_DUFF_SOURCE = 0;
    GSK_PORTER_DUFF_DEST = 1;
    GSK_PORTER_DUFF_SOURCE_OVER_DEST = 2;
    GSK_PORTER_DUFF_DEST_OVER_SOURCE = 3;
    GSK_PORTER_DUFF_SOURCE_IN_DEST = 4;
    GSK_PORTER_DUFF_DEST_IN_SOURCE = 5;
    GSK_PORTER_DUFF_SOURCE_OUT_DEST = 6;
    GSK_PORTER_DUFF_DEST_OUT_SOURCE = 7;
    GSK_PORTER_DUFF_SOURCE_ATOP_DEST = 8;
    GSK_PORTER_DUFF_DEST_ATOP_SOURCE = 9;
    GSK_PORTER_DUFF_XOR = 10;
    GSK_PORTER_DUFF_CLEAR = 11;
;
{*
 * GskCorner:
 * @GSK_CORNER_TOP_LEFT: The top left corner
 * @GSK_CORNER_TOP_RIGHT: The top right corner
 * @GSK_CORNER_BOTTOM_RIGHT: The bottom right corner
 * @GSK_CORNER_BOTTOM_LEFT: The bottom left corner
 *
 * The corner indices used by `GskRoundedRect`.
  }
type
  PGskCorner = ^TGskCorner;
  TGskCorner =  Longint;
  Const
    GSK_CORNER_TOP_LEFT = 0;
    GSK_CORNER_TOP_RIGHT = 1;
    GSK_CORNER_BOTTOM_RIGHT = 2;
    GSK_CORNER_BOTTOM_LEFT = 3;
;
{*
 * GskFillRule:
 * @GSK_FILL_RULE_WINDING: If the path crosses the ray from
 *   left-to-right, counts +1. If the path crosses the ray
 *   from right to left, counts -1. (Left and right are determined
 *   from the perspective of looking along the ray from the starting
 *   point.) If the total count is non-zero, the point will be filled.
 * @GSK_FILL_RULE_EVEN_ODD: Counts the total number of
 *   intersections, without regard to the orientation of the contour. If
 *   the total number of intersections is odd, the point will be
 *   filled.
 *
 * Specifies how paths are filled.
 *
 * Whether or not a point is included in the fill is determined by taking
 * a ray from that point to infinity and looking at intersections with the
 * path. The ray can be in any direction, as long as it doesn't pass through
 * the end point of a segment or have a tricky intersection such as
 * intersecting tangent to the path.
 *
 * (Note that filling is not actually implemented in this way. This
 * is just a description of the rule that is applied.)
 *
 * New entries may be added in future versions.
 *
 * Since: 4.14
  }
type
  PGskFillRule = ^TGskFillRule;
  TGskFillRule =  Longint;
  Const
    GSK_FILL_RULE_WINDING = 0;
    GSK_FILL_RULE_EVEN_ODD = 1;
;
{*
 * GskIsolation:
 * @GSK_ISOLATION_NONE: No isolation is defined.
 * @GSK_ISOLATION_BACKGROUND: If the background should be made available.
 *   If the background is not available, future operations will be rendered
 *   to a transparent background and added to the existing background later.
 * @GSK_ISOLATION_COPY_PASTE: If copies should be available to paste nodes.
 *   If copies are not available, paste nodes can only paste from copies that
 *   are made inside the isolated contents.
 * @GSK_ISOLATION_ALL: Isolate everything. This will include features that
 *   are added in the future.
 *
 * These flags describe the types of isolations possible with a
 * [class@Gsk.IsolationNode].
 *
 * More isolation options may be added in the future.
 *
 * Since: 4.22
  }
type
  PGskIsolation = ^TGskIsolation;
  TGskIsolation =  Longint;
  Const
    GSK_ISOLATION_NONE = 0;
    GSK_ISOLATION_BACKGROUND = 1 shl 0;
    GSK_ISOLATION_COPY_PASTE = 1 shl 1;
    GSK_ISOLATION_ALL = -(1);
;
{*
 * GskLineCap:
 * @GSK_LINE_CAP_BUTT: Start and stop the line exactly at the start
 *   and end point
 * @GSK_LINE_CAP_ROUND: Use a round ending, the center of the circle
 *   is the start or end point
 * @GSK_LINE_CAP_SQUARE: use squared ending, the center of the square
 *   is the start or end point
 *
 * Specifies how to render the start and end points of contours or
 * dashes when stroking.
 *
 * The default line cap style is `GSK_LINE_CAP_BUTT`.
 *
 * New entries may be added in future versions.
 *
 * <figure>
 *   <picture>
 *     <source srcset="caps-dark.png" media="(prefers-color-scheme: dark)">
 *     <img alt="Line Cap Styles" src="caps-light.png">
 *   </picture>
 *   <figcaption>GSK_LINE_CAP_BUTT, GSK_LINE_CAP_ROUND, GSK_LINE_CAP_SQUARE</figcaption>
 * </figure>
 *
 * Since: 4.14
  }
type
  PGskLineCap = ^TGskLineCap;
  TGskLineCap =  Longint;
  Const
    GSK_LINE_CAP_BUTT = 0;
    GSK_LINE_CAP_ROUND = 1;
    GSK_LINE_CAP_SQUARE = 2;
;
{*
 * GskLineJoin:
 * @GSK_LINE_JOIN_MITER: Use a sharp angled corner
 * @GSK_LINE_JOIN_ROUND: Use a round join, the center of the circle is
 *   the join point
 * @GSK_LINE_JOIN_BEVEL: use a cut-off join, the join is cut off at half
 *   the line width from the joint point
 *
 * Specifies how to render the junction of two lines when stroking.
 *
 * The default line join style is `GSK_LINE_JOIN_MITER`.
 *
 * New entries may be added in future versions.
 *
 * <figure>
 *   <picture>
 *     <source srcset="join-dark.png" media="(prefers-color-scheme: dark)">
 *     <img alt="Line Join Styles" src="join-light.png">
 *   </picture>
 *   <figcaption>GSK_LINE_JOINT_MITER, GSK_LINE_JOINT_ROUND, GSK_LINE_JOIN_BEVEL</figcaption>
 * </figure>
 *
 * Since: 4.14
  }
type
  PGskLineJoin = ^TGskLineJoin;
  TGskLineJoin =  Longint;
  Const
    GSK_LINE_JOIN_MITER = 0;
    GSK_LINE_JOIN_ROUND = 1;
    GSK_LINE_JOIN_BEVEL = 2;
;
{*
 * GskPathOperation:
 * @GSK_PATH_MOVE: A move-to operation, with 1 point describing the target point.
 * @GSK_PATH_CLOSE: A close operation ending the current contour with a line back
 *   to the starting point. Two points describe the start and end of the line.
 * @GSK_PATH_LINE: A line-to operation, with 2 points describing the start and
 *   end point of a straight line.
 * @GSK_PATH_QUAD: A curve-to operation describing a quadratic Bézier curve
 *   with 3 points describing the start point, the control point and the end
 *   point of the curve.
 * @GSK_PATH_CUBIC: A curve-to operation describing a cubic Bézier curve with 4
 *   points describing the start point, the two control points and the end point
 *   of the curve.
 * @GSK_PATH_CONIC: A rational quadratic Bézier curve with 3 points describing
 *   the start point, control point and end point of the curve. A weight for the
 *   curve will be passed, too.
 *
 * Describes the segments of a `GskPath`.
 *
 * More values may be added in the future.
 *
 * Since: 4.14
  }
type
  PGskPathOperation = ^TGskPathOperation;
  TGskPathOperation =  Longint;
  Const
    GSK_PATH_MOVE = 0;
    GSK_PATH_CLOSE = 1;
    GSK_PATH_LINE = 2;
    GSK_PATH_QUAD = 3;
    GSK_PATH_CUBIC = 4;
    GSK_PATH_CONIC = 5;
;
{*
 * GskPathDirection:
 * @GSK_PATH_FROM_START: The tangent in path direction of the incoming side
 *   of the path
 * @GSK_PATH_TO_START: The tangent against path direction of the incoming side
 *   of the path
 * @GSK_PATH_TO_END: The tangent in path direction of the outgoing side
 *   of the path
 * @GSK_PATH_FROM_END: The tangent against path direction of the outgoing
 *   side of the path
 *
 * Used to pick one of the four tangents at a given point on the path.
 *
 * Note that the directions for @GSK_PATH_FROM_START/@GSK_PATH_TO_END and
 * @GSK_PATH_TO_START/@GSK_PATH_FROM_END will coincide for smooth points.
 * Only sharp turns will exhibit four different directions.
 *
 * <picture>
 *   <source srcset="directions-dark.png" media="(prefers-color-scheme: dark)">
 *   <img alt="Path Tangents" src="directions-light.png">
 * </picture>
 *
 * Since: 4.14
  }
type
  PGskPathDirection = ^TGskPathDirection;
  TGskPathDirection =  Longint;
  Const
    GSK_PATH_FROM_START = 0;
    GSK_PATH_TO_START = 1;
    GSK_PATH_TO_END = 2;
    GSK_PATH_FROM_END = 3;
;
{*
 * GskSerializationError:
 * @GSK_SERIALIZATION_UNSUPPORTED_FORMAT: The format can not be identified
 * @GSK_SERIALIZATION_UNSUPPORTED_VERSION: The version of the data is not
 *   understood
 * @GSK_SERIALIZATION_INVALID_DATA: The given data may not exist in
 *   a proper serialization
 *
 * Errors that can happen during (de)serialization.
  }
type
  PGskSerializationError = ^TGskSerializationError;
  TGskSerializationError =  Longint;
  Const
    GSK_SERIALIZATION_UNSUPPORTED_FORMAT = 0;
    GSK_SERIALIZATION_UNSUPPORTED_VERSION = 1;
    GSK_SERIALIZATION_INVALID_DATA = 2;
;
{*
 * GskTransformCategory:
 * @GSK_TRANSFORM_CATEGORY_UNKNOWN: The category of the matrix has not been
 *   determined.
 * @GSK_TRANSFORM_CATEGORY_ANY: Analyzing the matrix concluded that it does
 *   not fit in any other category.
 * @GSK_TRANSFORM_CATEGORY_3D: The matrix is a 3D matrix. This means that
 *   the w column (the last column) has the values (0, 0, 0, 1).
 * @GSK_TRANSFORM_CATEGORY_2D: The matrix is a 2D matrix. This is equivalent
 *   to graphene_matrix_is_2d() returning %TRUE. In particular, this
 *   means that Cairo can deal with the matrix.
 * @GSK_TRANSFORM_CATEGORY_2D_AFFINE: The matrix is a combination of 2D scale
 *   and 2D translation operations. In particular, this means that any
 *   rectangle can be transformed exactly using this matrix.
 * @GSK_TRANSFORM_CATEGORY_2D_TRANSLATE: The matrix is a 2D translation.
 * @GSK_TRANSFORM_CATEGORY_IDENTITY: The matrix is the identity matrix.
 *
 * The categories of matrices relevant for GSK and GTK.
 *
 * Note that any category includes matrices of all later categories.
 * So if you want to for example check if a matrix is a 2D matrix,
 * `category >= GSK_TRANSFORM_CATEGORY_2D` is the way to do this.
 *
 * Also keep in mind that rounding errors may cause matrices to not
 * conform to their categories. Otherwise, matrix operations done via
 * multiplication will not worsen categories. So for the matrix
 * multiplication `C = A * B`, `category(C) = MIN (category(A), category(B))`.
  }
type
  PGskTransformCategory = ^TGskTransformCategory;
  TGskTransformCategory =  Longint;
  Const
    GSK_TRANSFORM_CATEGORY_UNKNOWN = 0;
    GSK_TRANSFORM_CATEGORY_ANY = 1;
    GSK_TRANSFORM_CATEGORY_3D = 2;
    GSK_TRANSFORM_CATEGORY_2D = 3;
    GSK_TRANSFORM_CATEGORY_2D_AFFINE = 4;
    GSK_TRANSFORM_CATEGORY_2D_TRANSLATE = 5;
    GSK_TRANSFORM_CATEGORY_IDENTITY = 6;
;
{*
 * GskGLUniformType:
 * @GSK_GL_UNIFORM_TYPE_NONE: No type, used for uninitialized or unspecified values.
 * @GSK_GL_UNIFORM_TYPE_FLOAT: A float uniform
 * @GSK_GL_UNIFORM_TYPE_INT: A GLSL int / gint32 uniform
 * @GSK_GL_UNIFORM_TYPE_UINT: A GLSL uint / guint32 uniform
 * @GSK_GL_UNIFORM_TYPE_BOOL: A GLSL bool / gboolean uniform
 * @GSK_GL_UNIFORM_TYPE_VEC2: A GLSL vec2 / graphene_vec2_t uniform
 * @GSK_GL_UNIFORM_TYPE_VEC3: A GLSL vec3 / graphene_vec3_t uniform
 * @GSK_GL_UNIFORM_TYPE_VEC4: A GLSL vec4 / graphene_vec4_t uniform
 *
 * Defines the types of the uniforms that `GskGLShaders` declare.
 *
 * It defines both what the type is called in the GLSL shader
 * code, and what the corresponding C type is on the Gtk side.
 *
 * Deprecated: 4.16
  }
type
  PGskGLUniformType = ^TGskGLUniformType;
  TGskGLUniformType =  Longint;
  Const
    GSK_GL_UNIFORM_TYPE_NONE = 0;
    GSK_GL_UNIFORM_TYPE_FLOAT = 1;
    GSK_GL_UNIFORM_TYPE_INT = 2;
    GSK_GL_UNIFORM_TYPE_UINT = 3;
    GSK_GL_UNIFORM_TYPE_BOOL = 4;
    GSK_GL_UNIFORM_TYPE_VEC2 = 5;
    GSK_GL_UNIFORM_TYPE_VEC3 = 6;
    GSK_GL_UNIFORM_TYPE_VEC4 = 7;
;
{*
 * GskMaskMode:
 * @GSK_MASK_MODE_ALPHA: Use the alpha channel of the mask
 * @GSK_MASK_MODE_INVERTED_ALPHA: Use the inverted alpha channel of the mask
 * @GSK_MASK_MODE_LUMINANCE: Use the luminance of the mask,
 *     multiplied by mask alpha
 * @GSK_MASK_MODE_INVERTED_LUMINANCE: Use the inverted luminance of the mask,
 *     multiplied by mask alpha
 *
 * The mask modes available for mask nodes.
 *
 * Since: 4.10
  }
type
  PGskMaskMode = ^TGskMaskMode;
  TGskMaskMode =  Longint;
  Const
    GSK_MASK_MODE_ALPHA = 0;
    GSK_MASK_MODE_INVERTED_ALPHA = 1;
    GSK_MASK_MODE_LUMINANCE = 2;
    GSK_MASK_MODE_INVERTED_LUMINANCE = 3;
;

implementation


end.
