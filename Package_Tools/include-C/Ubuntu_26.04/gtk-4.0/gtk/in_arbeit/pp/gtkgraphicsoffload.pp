
unit gtkgraphicsoffload;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkgraphicsoffload.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkgraphicsoffload.h
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
PGtkGraphicsOffload  = ^GtkGraphicsOffload;
PGtkGraphicsOffloadEnabled  = ^GtkGraphicsOffloadEnabled;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2023 Red Hat, Inc.
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
 *
 * Author:
 *      Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_GRAPHICS_OFFLOAD : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkGraphicsOffload, gtk_graphics_offload, GTK, GRAPHICS_OFFLOAD, GtkWidget) }
function gtk_graphics_offload_new(child:PGtkWidget):PGtkWidget;cdecl;external;
procedure gtk_graphics_offload_set_child(self:PGtkGraphicsOffload; child:PGtkWidget);cdecl;external;
function gtk_graphics_offload_get_child(self:PGtkGraphicsOffload):PGtkWidget;cdecl;external;
{*
 * GtkGraphicsOffloadEnabled:
 * @GTK_GRAPHICS_OFFLOAD_ENABLED: Graphics offloading is enabled.
 * @GTK_GRAPHICS_OFFLOAD_DISABLED: Graphics offloading is disabled.
 *
 * Represents the state of graphics offloading.
 *
 * Since: 4.14
  }
type
  PGtkGraphicsOffloadEnabled = ^TGtkGraphicsOffloadEnabled;
  TGtkGraphicsOffloadEnabled =  Longint;
  Const
    GTK_GRAPHICS_OFFLOAD_ENABLED = 0;
    GTK_GRAPHICS_OFFLOAD_DISABLED = 1;
;

procedure gtk_graphics_offload_set_enabled(self:PGtkGraphicsOffload; enabled:TGtkGraphicsOffloadEnabled);cdecl;external;
function gtk_graphics_offload_get_enabled(self:PGtkGraphicsOffload):TGtkGraphicsOffloadEnabled;cdecl;external;
procedure gtk_graphics_offload_set_black_background(self:PGtkGraphicsOffload; value:Tgboolean);cdecl;external;
function gtk_graphics_offload_get_black_background(self:PGtkGraphicsOffload):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_GRAPHICS_OFFLOAD : longint; { return type might be wrong }
  begin
    GTK_TYPE_GRAPHICS_OFFLOAD:=gtk_graphics_offload_get_type;
  end;


end.
