
unit gdk_pixbuf_transform;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdk_pixbuf_transform.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixbuf_transform.h
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
PGdkInterpType  = ^GdkInterpType;
PGdkPixbuf  = ^GdkPixbuf;
PGdkPixbufRotation  = ^GdkPixbufRotation;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GdkPixbuf library - transformations
 *
 * Copyright (C) 2003 The Free Software Foundation
 *
 * Authors: Mark Crichton <crichton@gimp.org>
 *          Miguel de Icaza <miguel@gnu.org>
 *          Federico Mena-Quintero <federico@gimp.org>
 *          Havoc Pennington <hp@redhat.com>
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GDK_PIXBUF_TRANSFORM_H}
{$define GDK_PIXBUF_TRANSFORM_H}
{$if defined(GDK_PIXBUF_DISABLE_SINGLE_INCLUDES) && !defined (GDK_PIXBUF_H_INSIDE) && !defined (GDK_PIXBUF_COMPILATION)}
{$error "Only <gdk-pixbuf/gdk-pixbuf.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <gdk-pixbuf/gdk-pixbuf-core.h>}
{ Scaling  }
{*
 * GdkInterpType:
 * @GDK_INTERP_NEAREST: Nearest neighbor sampling; this is the fastest
 *  and lowest quality mode. Quality is normally unacceptable when scaling 
 *  down, but may be OK when scaling up.
 * @GDK_INTERP_TILES: This is an accurate simulation of the PostScript
 *  image operator without any interpolation enabled.  Each pixel is
 *  rendered as a tiny parallelogram of solid color, the edges of which
 *  are implemented with antialiasing.  It resembles nearest neighbor for
 *  enlargement, and bilinear for reduction.
 * @GDK_INTERP_BILINEAR: Best quality/speed balance; use this mode by
 *  default. Bilinear interpolation.  For enlargement, it is
 *  equivalent to point-sampling the ideal bilinear-interpolated image.
 *  For reduction, it is equivalent to laying down small tiles and
 *  integrating over the coverage area.
 * @GDK_INTERP_HYPER: This is the slowest and highest quality
 *  reconstruction function. It is derived from the hyperbolic filters in
 *  Wolberg's "Digital Image Warping", and is formally defined as the
 *  hyperbolic-filter sampling the ideal hyperbolic-filter interpolated
 *  image (the filter is designed to be idempotent for 1:1 pixel mapping).
 *  **Deprecated**: this interpolation filter is deprecated, as in reality
 *  it has a lower quality than the @GDK_INTERP_BILINEAR filter
 *  (Since: 2.38)
 *
 * Interpolation modes for scaling functions.
 *
 * The `GDK_INTERP_NEAREST` mode is the fastest scaling method, but has
 * horrible quality when scaling down; `GDK_INTERP_BILINEAR` is the best
 * choice if you aren't sure what to choose, it has a good speed/quality
 * balance.
 * 
 * **Note**: Cubic filtering is missing from the list; hyperbolic
 * interpolation is just as fast and results in higher quality.
  }
type
  PGdkInterpType = ^TGdkInterpType;
  TGdkInterpType =  Longint;
  Const
    GDK_INTERP_NEAREST = 0;
    GDK_INTERP_TILES = 1;
    GDK_INTERP_BILINEAR = 2;
    GDK_INTERP_HYPER = 3;
;
{*
 * GdkPixbufRotation:
 * @GDK_PIXBUF_ROTATE_NONE: No rotation.
 * @GDK_PIXBUF_ROTATE_COUNTERCLOCKWISE: Rotate by 90 degrees.
 * @GDK_PIXBUF_ROTATE_UPSIDEDOWN: Rotate by 180 degrees.
 * @GDK_PIXBUF_ROTATE_CLOCKWISE: Rotate by 270 degrees.
 * 
 * The possible rotations which can be passed to gdk_pixbuf_rotate_simple().
 *
 * To make them easier to use, their numerical values are the actual degrees.
  }
type
  PGdkPixbufRotation = ^TGdkPixbufRotation;
  TGdkPixbufRotation =  Longint;
  Const
    GDK_PIXBUF_ROTATE_NONE = 0;
    GDK_PIXBUF_ROTATE_COUNTERCLOCKWISE = 90;
    GDK_PIXBUF_ROTATE_UPSIDEDOWN = 180;
    GDK_PIXBUF_ROTATE_CLOCKWISE = 270;
;
(* Const before type ignored *)

procedure gdk_pixbuf_scale(src:PGdkPixbuf; dest:PGdkPixbuf; dest_x:longint; dest_y:longint; dest_width:longint; 
            dest_height:longint; offset_x:Tdouble; offset_y:Tdouble; scale_x:Tdouble; scale_y:Tdouble; 
            interp_type:TGdkInterpType);cdecl;external;
(* Const before type ignored *)
procedure gdk_pixbuf_composite(src:PGdkPixbuf; dest:PGdkPixbuf; dest_x:longint; dest_y:longint; dest_width:longint; 
            dest_height:longint; offset_x:Tdouble; offset_y:Tdouble; scale_x:Tdouble; scale_y:Tdouble; 
            interp_type:TGdkInterpType; overall_alpha:longint);cdecl;external;
(* Const before type ignored *)
procedure gdk_pixbuf_composite_color(src:PGdkPixbuf; dest:PGdkPixbuf; dest_x:longint; dest_y:longint; dest_width:longint; 
            dest_height:longint; offset_x:Tdouble; offset_y:Tdouble; scale_x:Tdouble; scale_y:Tdouble; 
            interp_type:TGdkInterpType; overall_alpha:longint; check_x:longint; check_y:longint; check_size:longint; 
            color1:Tguint32; color2:Tguint32);cdecl;external;
(* Const before type ignored *)
function gdk_pixbuf_scale_simple(src:PGdkPixbuf; dest_width:longint; dest_height:longint; interp_type:TGdkInterpType):PGdkPixbuf;cdecl;external;
(* Const before type ignored *)
function gdk_pixbuf_composite_color_simple(src:PGdkPixbuf; dest_width:longint; dest_height:longint; interp_type:TGdkInterpType; overall_alpha:longint; 
           check_size:longint; color1:Tguint32; color2:Tguint32):PGdkPixbuf;cdecl;external;
(* Const before type ignored *)
function gdk_pixbuf_rotate_simple(src:PGdkPixbuf; angle:TGdkPixbufRotation):PGdkPixbuf;cdecl;external;
(* Const before type ignored *)
function gdk_pixbuf_flip(src:PGdkPixbuf; horizontal:Tgboolean):PGdkPixbuf;cdecl;external;
{$endif}
{ GDK_PIXBUF_TRANSFORM_H  }

implementation


end.
