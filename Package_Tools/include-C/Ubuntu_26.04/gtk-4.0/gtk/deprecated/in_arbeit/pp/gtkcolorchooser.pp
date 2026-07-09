
unit gtkcolorchooser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkcolorchooser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkcolorchooser
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
PGtkColorChooser  = ^GtkColorChooser;
PGtkColorChooserInterface  = ^GtkColorChooserInterface;
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

{ was #define dname def_expr }
function GTK_TYPE_COLOR_CHOOSER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLOR_CHOOSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COLOR_CHOOSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLOR_CHOOSER_GET_IFACE(inst : longint) : longint;

type
{ Methods  }
(* Const before type ignored *)
{ Signals  }
(* Const before type ignored *)
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


function gtk_color_chooser_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_chooser_get_rgba(chooser:PGtkColorChooser; color:PGdkRGBA);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
(* Const before type ignored *)
procedure gtk_color_chooser_set_rgba(chooser:PGtkColorChooser; color:PGdkRGBA);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
function gtk_color_chooser_get_use_alpha(chooser:PGtkColorChooser):Tgboolean;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_chooser_set_use_alpha(chooser:PGtkColorChooser; use_alpha:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_10 }
procedure gtk_color_chooser_add_palette(chooser:PGtkColorChooser; orientation:TGtkOrientation; colors_per_line:longint; n_colors:longint; colors:PGdkRGBA);cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkColorChooser, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_COLOR_CHOOSER : longint; { return type might be wrong }
  begin
    GTK_TYPE_COLOR_CHOOSER:=gtk_color_chooser_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLOR_CHOOSER(obj : longint) : longint;
begin
  GTK_COLOR_CHOOSER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_COLOR_CHOOSER,GtkColorChooser);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_COLOR_CHOOSER(obj : longint) : longint;
begin
  GTK_IS_COLOR_CHOOSER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_COLOR_CHOOSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_COLOR_CHOOSER_GET_IFACE(inst : longint) : longint;
begin
  GTK_COLOR_CHOOSER_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GTK_TYPE_COLOR_CHOOSER,GtkColorChooserInterface);
end;


end.
