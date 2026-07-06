
unit gtkimage;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkimage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkimage.h
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
Pchar  = ^char;
PGdkPaintable  = ^GdkPaintable;
PGdkPixbuf  = ^GdkPixbuf;
PGIcon  = ^GIcon;
PGtkImage  = ^GtkImage;
PGtkImageType  = ^GtkImageType;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
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
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_IMAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IMAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IMAGE(obj : longint) : longint;

type
{*
 * GtkImageType:
 * @GTK_IMAGE_EMPTY: there is no image displayed by the widget
 * @GTK_IMAGE_ICON_NAME: the widget contains a named icon
 * @GTK_IMAGE_GICON: the widget contains a `GIcon`
 * @GTK_IMAGE_PAINTABLE: the widget contains a `GdkPaintable`
 *
 * Describes the image data representation used by a [class@Gtk.Image].
 *
 * If you want to get the image from the widget, you can only get the
 * currently-stored representation; for instance, if the gtk_image_get_storage_type()
 * returns %GTK_IMAGE_PAINTABLE, then you can call gtk_image_get_paintable().
 *
 * For empty images, you can request any storage type (call any of the "get"
 * functions), but they will all return %NULL values.
  }

  PGtkImageType = ^TGtkImageType;
  TGtkImageType =  Longint;
  Const
    GTK_IMAGE_EMPTY = 0;
    GTK_IMAGE_ICON_NAME = 1;
    GTK_IMAGE_GICON = 2;
    GTK_IMAGE_PAINTABLE = 3;
;

function gtk_image_get_type:TGType;cdecl;external;
function gtk_image_new:PGtkWidget;cdecl;external;
(* Const before type ignored *)
function gtk_image_new_from_file(filename:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function gtk_image_new_from_resource(resource_path:Pchar):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_image_new_from_paintable) }
function gtk_image_new_from_pixbuf(pixbuf:PGdkPixbuf):PGtkWidget;cdecl;external;
function gtk_image_new_from_paintable(paintable:PGdkPaintable):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function gtk_image_new_from_icon_name(icon_name:Pchar):PGtkWidget;cdecl;external;
function gtk_image_new_from_gicon(icon:PGIcon):PGtkWidget;cdecl;external;
procedure gtk_image_clear(image:PGtkImage);cdecl;external;
(* Const before type ignored *)
procedure gtk_image_set_from_file(image:PGtkImage; filename:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_image_set_from_resource(image:PGtkImage; resource_path:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_image_set_from_paintable) }
procedure gtk_image_set_from_pixbuf(image:PGtkImage; pixbuf:PGdkPixbuf);cdecl;external;
procedure gtk_image_set_from_paintable(image:PGtkImage; paintable:PGdkPaintable);cdecl;external;
(* Const before type ignored *)
procedure gtk_image_set_from_icon_name(image:PGtkImage; icon_name:Pchar);cdecl;external;
procedure gtk_image_set_from_gicon(image:PGtkImage; icon:PGIcon);cdecl;external;
procedure gtk_image_set_pixel_size(image:PGtkImage; pixel_size:longint);cdecl;external;
procedure gtk_image_set_icon_size(image:PGtkImage; icon_size:TGtkIconSize);cdecl;external;
function gtk_image_get_storage_type(image:PGtkImage):TGtkImageType;cdecl;external;
function gtk_image_get_paintable(image:PGtkImage):PGdkPaintable;cdecl;external;
(* Const before type ignored *)
function gtk_image_get_icon_name(image:PGtkImage):Pchar;cdecl;external;
function gtk_image_get_gicon(image:PGtkImage):PGIcon;cdecl;external;
function gtk_image_get_pixel_size(image:PGtkImage):longint;cdecl;external;
function gtk_image_get_icon_size(image:PGtkImage):TGtkIconSize;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkImage, g_object_unref) }

implementation

{ was #define dname def_expr }
function GTK_TYPE_IMAGE : longint; { return type might be wrong }
  begin
    GTK_TYPE_IMAGE:=gtk_image_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IMAGE(obj : longint) : longint;
begin
  GTK_IMAGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GTK_TYPE_IMAGE,GtkImage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GTK_IS_IMAGE(obj : longint) : longint;
begin
  GTK_IS_IMAGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GTK_TYPE_IMAGE);
end;


end.
