
unit lsmcairo;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmcairo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmcairo.h
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
PGdkPixbuf  = ^GdkPixbuf;
PLsmBox  = ^LsmBox;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2012 Emmanuel Pacaud
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_CAIRO_H}
{$define LSM_CAIRO_H}
{$include <lsmtypes.h>}
{$include <cairo.h>}
{$include <gdk-pixbuf/gdk-pixbuf.h>}

procedure lsm_cairo_quadratic_curve_to(cr:Pcairo_t; x1:Tdouble; y1:Tdouble; x:Tdouble; y:Tdouble);cdecl;external;
procedure lsm_cairo_rel_quadratic_curve_to(cr:Pcairo_t; dx1:Tdouble; dy1:Tdouble; dx:Tdouble; dy:Tdouble);cdecl;external;
procedure lsm_cairo_elliptical_arc(cairo:Pcairo_t; rx:Tdouble; ry:Tdouble; x_axis_rotation:Tdouble; large_arc_flag:Tgboolean; 
            sweep_flag:Tgboolean; x:Tdouble; y:Tdouble);cdecl;external;
procedure lsm_cairo_rel_elliptical_arc(cairo:Pcairo_t; rx:Tdouble; ry:Tdouble; x_axis_rotation:Tdouble; large_arc_flag:Tgboolean; 
            sweep_flag:Tgboolean; dx:Tdouble; dy:Tdouble);cdecl;external;
procedure lsm_cairo_vertical(cairo:Pcairo_t; y:Tdouble);cdecl;external;
procedure lsm_cairo_rel_vertical(cairo:Pcairo_t; dy:Tdouble);cdecl;external;
procedure lsm_cairo_horizontal(cairo:Pcairo_t; x:Tdouble);cdecl;external;
procedure lsm_cairo_rel_horizontal(cairo:Pcairo_t; dx:Tdouble);cdecl;external;
(* Const before declarator ignored *)
procedure lsm_cairo_emit_svg_path(cr:Pcairo_t; path:Pchar);cdecl;external;
(* Const before type ignored *)
procedure lsm_cairo_box_user_to_device(cairo:Pcairo_t; to:PLsmBox; from:PLsmBox);cdecl;external;
(* Const before type ignored *)
procedure lsm_cairo_box_device_to_user(cairo:Pcairo_t; to:PLsmBox; from:PLsmBox);cdecl;external;
(* Const before type ignored *)
procedure lsm_cairo_set_source_pixbuf(cairo:Pcairo_t; pixbuf:PGdkPixbuf; pixbuf_x:Tdouble; pixbuf_y:Tdouble);cdecl;external;
{$endif}

implementation


end.
