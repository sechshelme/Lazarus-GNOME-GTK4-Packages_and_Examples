
unit gdkpango;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkpango.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkpango.h
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
Pcairo_region_t  = ^cairo_region_t;
Plongint  = ^longint;
PPangoLayout  = ^PangoLayout;
PPangoLayoutLine  = ^PangoLayoutLine;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GDK - The GIMP Drawing Kit
 * Copyright (C) 2000 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
{ Get a clip region to draw only part of a layout or
 * line. index_ranges contains alternating range starts/stops. The
 * region is the region which contains the given ranges, i.e. if you
 * draw with the region as clip, only the given ranges are drawn.
  }
(* Const before type ignored *)

function gdk_pango_layout_line_get_clip_region(line:PPangoLayoutLine; x_origin:longint; y_origin:longint; index_ranges:Plongint; n_ranges:longint):Pcairo_region_t;cdecl;external;
(* Const before type ignored *)
function gdk_pango_layout_get_clip_region(layout:PPangoLayout; x_origin:longint; y_origin:longint; index_ranges:Plongint; n_ranges:longint):Pcairo_region_t;cdecl;external;

implementation


end.
