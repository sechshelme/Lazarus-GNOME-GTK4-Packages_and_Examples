unit gtkpicture;

interface

uses
  fp_glib2, fp_gtk4;

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

{G_DECLARE_FINAL_TYPE (GtkPicture, gtk_picture, GTK, PICTURE, GtkWidget) }
function gtk_picture_new:PGtkWidget;cdecl;external libgtk4;
function gtk_picture_new_for_paintable(paintable:PGdkPaintable):PGtkWidget;cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_pixbuf_new_for_paintable) }
function gtk_picture_new_for_pixbuf(pixbuf:PGdkPixbuf):PGtkWidget;cdecl;external libgtk4;
function gtk_picture_new_for_file(file:PGFile):PGtkWidget;cdecl;external libgtk4;
function gtk_picture_new_for_filename(filename:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_picture_new_for_resource(resource_path:Pchar):PGtkWidget;cdecl;external libgtk4;
procedure gtk_picture_set_paintable(self:PGtkPicture; paintable:PGdkPaintable);cdecl;external libgtk4;
function gtk_picture_get_paintable(self:PGtkPicture):PGdkPaintable;cdecl;external libgtk4;
procedure gtk_picture_set_file(self:PGtkPicture; file:PGFile);cdecl;external libgtk4;
function gtk_picture_get_file(self:PGtkPicture):PGFile;cdecl;external libgtk4;
procedure gtk_picture_set_filename(self:PGtkPicture; filename:Pchar);cdecl;external libgtk4;
procedure gtk_picture_set_resource(self:PGtkPicture; resource_path:Pchar);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_12_FOR(gtk_picture_set_paintable) }
procedure gtk_picture_set_pixbuf(self:PGtkPicture; pixbuf:PGdkPixbuf);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_8_FOR(gtk_picture_set_content_fit) }
procedure gtk_picture_set_keep_aspect_ratio(self:PGtkPicture; keep_aspect_ratio:Tgboolean);cdecl;external libgtk4;
{xxxxxGLIB_DEPRECATED_IN_4_8_FOR(gtk_picture_get_content_fit) }
function gtk_picture_get_keep_aspect_ratio(self:PGtkPicture):Tgboolean;cdecl;external libgtk4;
procedure gtk_picture_set_can_shrink(self:PGtkPicture; can_shrink:Tgboolean);cdecl;external libgtk4;
function gtk_picture_get_can_shrink(self:PGtkPicture):Tgboolean;cdecl;external libgtk4;
procedure gtk_picture_set_content_fit(self:PGtkPicture; content_fit:TGtkContentFit);cdecl;external libgtk4;
function gtk_picture_get_content_fit(self:PGtkPicture):TGtkContentFit;cdecl;external libgtk4;
procedure gtk_picture_set_isolate_contents(self:PGtkPicture; isolate_contents:Tgboolean);cdecl;external libgtk4;
function gtk_picture_get_isolate_contents(self:PGtkPicture):Tgboolean;cdecl;external libgtk4;
procedure gtk_picture_set_alternative_text(self:PGtkPicture; alternative_text:Pchar);cdecl;external libgtk4;
function gtk_picture_get_alternative_text(self:PGtkPicture):Pchar;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:25:01 ===

function GTK_TYPE_PICTURE: TGType;
function GTK_PICTURE(obj: Pointer): PGtkPicture;
function GTK_IS_PICTURE(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_PICTURE: TGType;
begin
  Result := gtk_picture_get_type;
end;

function GTK_PICTURE(obj: Pointer): PGtkPicture;
begin
  Result := PGtkPicture(g_type_check_instance_cast(obj, GTK_TYPE_PICTURE));
end;

function GTK_IS_PICTURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PICTURE);
end;

type 
  PGtkPicture = type Pointer;

  TGtkPictureClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkPictureClass = ^TGtkPictureClass;

function gtk_picture_get_type: TGType; cdecl; external libgxxxxxxx;



end.
