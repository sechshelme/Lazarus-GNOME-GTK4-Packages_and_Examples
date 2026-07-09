unit gtkcolorchooser;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 *
 * Copyright (C) 2012 Red Hat, Inc.
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
{$include <gtk/gtkwidget.h>}

type
{ Methods  }
{ Signals  }
{< private > }
{ Padding; remove in GTK-next  }
  PGtkColorChooserInterface = ^TGtkColorChooserInterface;
  TGtkColorChooserInterface = record
      base_interface : TGTypeInterface;
      get_rgba : procedure (chooser:PGtkColorChooser; color:PGdkRGBA);cdecl;
      set_rgba : procedure (chooser:PGtkColorChooser; color:PGdkRGBA);cdecl;
      add_palette : procedure (chooser:PGtkColorChooser; orientation:TGtkOrientation; colors_per_line:longint; n_colors:longint; colors:PGdkRGBA);cdecl;
      color_activated : procedure (chooser:PGtkColorChooser; color:PGdkRGBA);cdecl;
      padding : array[0..11] of Tgpointer;
    end;


function gtk_color_chooser_get_type:TGType;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_chooser_get_rgba(chooser:PGtkColorChooser; color:PGdkRGBA);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_chooser_set_rgba(chooser:PGtkColorChooser; color:PGdkRGBA);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_color_chooser_get_use_alpha(chooser:PGtkColorChooser):Tgboolean;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_chooser_set_use_alpha(chooser:PGtkColorChooser; use_alpha:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_chooser_add_palette(chooser:PGtkColorChooser; orientation:TGtkOrientation; colors_per_line:longint; n_colors:longint; colors:PGdkRGBA);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkColorChooser, g_object_unref) }

// === Konventiert am: 9-7-26 19:42:46 ===

function GTK_TYPE_COLOR_CHOOSER : TGType;
function GTK_COLOR_CHOOSER(obj : Pointer) : PGtkColorChooser;
function GTK_IS_COLOR_CHOOSER(obj : Pointer) : Tgboolean;
function GTK_COLOR_CHOOSER_GET_IFACE(obj : Pointer) : PGtkColorChooserInterface;

implementation

function GTK_TYPE_COLOR_CHOOSER : TGType;
  begin
    GTK_TYPE_COLOR_CHOOSER:=gtk_color_chooser_get_type;
  end;

function GTK_COLOR_CHOOSER(obj : Pointer) : PGtkColorChooser;
begin
  Result := PGtkColorChooser(g_type_check_instance_cast(obj, GTK_TYPE_COLOR_CHOOSER));
end;

function GTK_IS_COLOR_CHOOSER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_COLOR_CHOOSER);
end;

function GTK_COLOR_CHOOSER_GET_IFACE(obj : Pointer) : PGtkColorChooserInterface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_COLOR_CHOOSER);
end;



end.
