
unit gtkpicture;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkpicture.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkpicture.h
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
PGFile  = ^GFile;
PGtkPicture  = ^GtkPicture;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2018 Benjamin Otte
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
{$include <gio/gio.h>}
{$include <gtk/gtkwidget.h>}

{ was #define dname def_expr }
function GTK_TYPE_PICTURE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkPicture, gtk_picture, GTK, PICTURE, GtkWidget) }
function gtk_picture_new:PGtkWidget;cdecl;external;
function gtk_picture_new_for_paintable(paintable:PGdkPaintable):PGtkWidget;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_pixbuf_new_for_paintable) }
function gtk_picture_new_for_pixbuf(pixbuf:PGdkPixbuf):PGtkWidget;cdecl;external;
function gtk_picture_new_for_file(file:PGFile):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function gtk_picture_new_for_filename(filename:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function gtk_picture_new_for_resource(resource_path:Pchar):PGtkWidget;cdecl;external;
procedure gtk_picture_set_paintable(self:PGtkPicture; paintable:PGdkPaintable);cdecl;external;
function gtk_picture_get_paintable(self:PGtkPicture):PGdkPaintable;cdecl;external;
procedure gtk_picture_set_file(self:PGtkPicture; file:PGFile);cdecl;external;
function gtk_picture_get_file(self:PGtkPicture):PGFile;cdecl;external;
(* Const before type ignored *)
procedure gtk_picture_set_filename(self:PGtkPicture; filename:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_picture_set_resource(self:PGtkPicture; resource_path:Pchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_picture_set_paintable) }
procedure gtk_picture_set_pixbuf(self:PGtkPicture; pixbuf:PGdkPixbuf);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_8_FOR(gtk_picture_set_content_fit) }
procedure gtk_picture_set_keep_aspect_ratio(self:PGtkPicture; keep_aspect_ratio:Tgboolean);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_8_FOR(gtk_picture_get_content_fit) }
function gtk_picture_get_keep_aspect_ratio(self:PGtkPicture):Tgboolean;cdecl;external;
procedure gtk_picture_set_can_shrink(self:PGtkPicture; can_shrink:Tgboolean);cdecl;external;
function gtk_picture_get_can_shrink(self:PGtkPicture):Tgboolean;cdecl;external;
procedure gtk_picture_set_content_fit(self:PGtkPicture; content_fit:TGtkContentFit);cdecl;external;
function gtk_picture_get_content_fit(self:PGtkPicture):TGtkContentFit;cdecl;external;
procedure gtk_picture_set_isolate_contents(self:PGtkPicture; isolate_contents:Tgboolean);cdecl;external;
function gtk_picture_get_isolate_contents(self:PGtkPicture):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gtk_picture_set_alternative_text(self:PGtkPicture; alternative_text:Pchar);cdecl;external;
(* Const before type ignored *)
function gtk_picture_get_alternative_text(self:PGtkPicture):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_PICTURE : longint; { return type might be wrong }
  begin
    GTK_TYPE_PICTURE:=gtk_picture_get_type;
  end;


end.
