
unit gtkrender;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkrender.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkrender.h
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
PGdkTexture  = ^GdkTexture;
PGtkSnapshot  = ^GtkSnapshot;
PGtkStyleContext  = ^GtkStyleContext;
PPangoLayout  = ^PangoLayout;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2010 Carlos Garnacho <carlosg@gnome.org>
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
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <cairo.h>}
{$include <pango/pango.h>}
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}
{$include <gtk/gtktypes.h>}
{$include <gtk/gtksnapshot.h>}
{xxxxxGLIB_DEPRECATED_IN_4_10 }

procedure gtk_render_check(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_option(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_arrow(context:PGtkStyleContext; cr:Pcairo_t; angle:Tdouble; x:Tdouble; y:Tdouble; 
            size:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_background(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_frame(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_expander(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_focus(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_layout(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; layout:PPangoLayout);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_line(context:PGtkStyleContext; cr:Pcairo_t; x0:Tdouble; y0:Tdouble; x1:Tdouble; 
            y1:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_handle(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_activity(context:PGtkStyleContext; cr:Pcairo_t; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_render_icon(context:PGtkStyleContext; cr:Pcairo_t; texture:PGdkTexture; x:Tdouble; y:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_snapshot_render_background(snapshot:PGtkSnapshot; context:PGtkStyleContext; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_snapshot_render_frame(snapshot:PGtkSnapshot; context:PGtkStyleContext; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_snapshot_render_focus(snapshot:PGtkSnapshot; context:PGtkStyleContext; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_snapshot_render_layout(snapshot:PGtkSnapshot; context:PGtkStyleContext; x:Tdouble; y:Tdouble; layout:PPangoLayout);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_snapshot_render_insertion_cursor(snapshot:PGtkSnapshot; context:PGtkStyleContext; x:Tdouble; y:Tdouble; layout:PPangoLayout; 
            index:longint; direction:TPangoDirection);cdecl;external;

implementation


end.
