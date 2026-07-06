
unit gtksymbolicpaintable;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksymbolicpaintable.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksymbolicpaintable.h
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
PGdkRGBA  = ^GdkRGBA;
PGdkSnapshot  = ^GdkSnapshot;
PGtkSymbolicPaintable  = ^GtkSymbolicPaintable;
PGtkSymbolicPaintableInterface  = ^GtkSymbolicPaintableInterface;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2021 Benjamin Otte
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_SYMBOLIC_PAINTABLE : longint; { return type might be wrong }

{G_DECLARE_INTERFACE (GtkSymbolicPaintable, gtk_symbolic_paintable, GTK, SYMBOLIC_PAINTABLE, GdkPaintable) }
{*
 * GtkSymbolicPaintableInterface:
 * @snapshot_symbolic: Snapshot the paintable using the given colors.
 *   See `GtkSymbolicPaintable::snapshot_symbolic()` for details.
 *   If this function is not implemented, [vfunc@Gdk.Paintable.snapshot]
 *   will be called.
 * @snapshot_with_weight: Like @snapshot_symbolic, but additionally takes
 *   a font weight argument. Since: 4.22
 *
 * The list of virtual functions for the `GtkSymbolicPaintable` interface.
 * No function must be implemented, default implementations exist for each one.
  }
{< private > }
{< public > }
(* Const before type ignored *)
(* Const before type ignored *)
type
  PGtkSymbolicPaintableInterface = ^TGtkSymbolicPaintableInterface;
  TGtkSymbolicPaintableInterface = record
      g_iface : TGTypeInterface;
      snapshot_symbolic : procedure (paintable:PGtkSymbolicPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble; colors:PGdkRGBA; 
                    n_colors:Tgsize);cdecl;
      snapshot_with_weight : procedure (paintable:PGtkSymbolicPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble; colors:PGdkRGBA; 
                    n_colors:Tgsize; weight:Tdouble);cdecl;
    end;

(* Const before type ignored *)

procedure gtk_symbolic_paintable_snapshot_symbolic(paintable:PGtkSymbolicPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble; colors:PGdkRGBA; 
            n_colors:Tgsize);cdecl;external;
(* Const before type ignored *)
procedure gtk_symbolic_paintable_snapshot_with_weight(paintable:PGtkSymbolicPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble; colors:PGdkRGBA; 
            n_colors:Tgsize; weight:Tdouble);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_SYMBOLIC_PAINTABLE : longint; { return type might be wrong }
  begin
    GTK_TYPE_SYMBOLIC_PAINTABLE:=gtk_symbolic_paintable_get_type;
  end;


end.
