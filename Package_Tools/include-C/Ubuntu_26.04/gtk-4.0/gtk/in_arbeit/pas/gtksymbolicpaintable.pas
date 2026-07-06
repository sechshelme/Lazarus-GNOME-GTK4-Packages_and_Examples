unit gtksymbolicpaintable;

interface

uses
  fp_glib2, fp_gtk4;

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
type
  PGtkSymbolicPaintableInterface = ^TGtkSymbolicPaintableInterface;
  TGtkSymbolicPaintableInterface = record
      g_iface : TGTypeInterface;
      snapshot_symbolic : procedure (paintable:PGtkSymbolicPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble; colors:PGdkRGBA; 
                    n_colors:Tgsize);cdecl;
      snapshot_with_weight : procedure (paintable:PGtkSymbolicPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble; colors:PGdkRGBA; 
                    n_colors:Tgsize; weight:Tdouble);cdecl;
    end;


procedure gtk_symbolic_paintable_snapshot_symbolic(paintable:PGtkSymbolicPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble; colors:PGdkRGBA; 
            n_colors:Tgsize);cdecl;external libgtk4;
procedure gtk_symbolic_paintable_snapshot_with_weight(paintable:PGtkSymbolicPaintable; snapshot:PGdkSnapshot; width:Tdouble; height:Tdouble; colors:PGdkRGBA; 
            n_colors:Tgsize; weight:Tdouble);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:24:43 ===

function GTK_TYPE_SYMBOLIC_PAINTABLE: TGType;
function GTK_SYMBOLIC_PAINTABLE(obj: Pointer): PGtkSymbolicPaintable;
function GTK_IS_SYMBOLIC_PAINTABLE(obj: Pointer): Tgboolean;
function GTK_SYMBOLIC_PAINTABLE_GET_IFACE(obj: Pointer): PGtkSymbolicPaintableInterface;

implementation

function GTK_TYPE_SYMBOLIC_PAINTABLE: TGType;
begin
  Result := gtk_symbolic_paintable_get_type;
end;

function GTK_SYMBOLIC_PAINTABLE(obj: Pointer): PGtkSymbolicPaintable;
begin
  Result := PGtkSymbolicPaintable(g_type_check_instance_cast(obj, GTK_TYPE_SYMBOLIC_PAINTABLE));
end;

function GTK_IS_SYMBOLIC_PAINTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SYMBOLIC_PAINTABLE);
end;

function GTK_SYMBOLIC_PAINTABLE_GET_IFACE(obj: Pointer): PGtkSymbolicPaintableInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_SYMBOLIC_PAINTABLE);
end;

type 
  PGtkSymbolicPaintable = type Pointer;

  PGtkSymbolicPaintableInterface = type Pointer

function gtk_symbolic_paintable_get_type: TGType; cdecl; external libgxxxxxxx;



end.
