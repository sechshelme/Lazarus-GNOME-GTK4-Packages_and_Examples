unit gtkmediafile;

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
{$include <gtk/gtkmediastream.h>}
{*
 * GTK_MEDIA_FILE_EXTENSION_POINT_NAME:
 *
 * The default extension point name for media file.
  }

const
  GTK_MEDIA_FILE_EXTENSION_POINT_NAME = 'gtk-media-file';  

{G_DECLARE_DERIVABLE_TYPE (GtkMediaFile, gtk_media_file, GTK, MEDIA_FILE, GtkMediaStream) }
{ Padding for future expansion  }
type
  PGtkMediaFileClass = ^TGtkMediaFileClass;
  TGtkMediaFileClass = record
      parent_class : TGtkMediaStreamClass;
      open : procedure (self:PGtkMediaFile);cdecl;
      close : procedure (self:PGtkMediaFile);cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
    end;


function gtk_media_file_new:PGtkMediaStream;cdecl;external libgtk4;
function gtk_media_file_new_for_filename(filename:Pchar):PGtkMediaStream;cdecl;external libgtk4;
function gtk_media_file_new_for_resource(resource_path:Pchar):PGtkMediaStream;cdecl;external libgtk4;
function gtk_media_file_new_for_file(file:PGFile):PGtkMediaStream;cdecl;external libgtk4;
function gtk_media_file_new_for_input_stream(stream:PGInputStream):PGtkMediaStream;cdecl;external libgtk4;
procedure gtk_media_file_clear(self:PGtkMediaFile);cdecl;external libgtk4;
procedure gtk_media_file_set_filename(self:PGtkMediaFile; filename:Pchar);cdecl;external libgtk4;
procedure gtk_media_file_set_resource(self:PGtkMediaFile; resource_path:Pchar);cdecl;external libgtk4;
procedure gtk_media_file_set_file(self:PGtkMediaFile; file:PGFile);cdecl;external libgtk4;
function gtk_media_file_get_file(self:PGtkMediaFile):PGFile;cdecl;external libgtk4;
procedure gtk_media_file_set_input_stream(self:PGtkMediaFile; stream:PGInputStream);cdecl;external libgtk4;
function gtk_media_file_get_input_stream(self:PGtkMediaFile):PGInputStream;cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:37:03 ===

function GTK_TYPE_MEDIA_FILE: TGType;
function GTK_MEDIA_FILE(obj: Pointer): PGtkMediaFile;
function GTK_IS_MEDIA_FILE(obj: Pointer): Tgboolean;
function GTK_MEDIA_FILE_CLASS(klass: Pointer): PGtkMediaFileClass;
function GTK_IS_MEDIA_FILE_CLASS(klass: Pointer): Tgboolean;
function GTK_MEDIA_FILE_GET_CLASS(obj: Pointer): PGtkMediaFileClass;

implementation

function GTK_TYPE_MEDIA_FILE: TGType;
begin
  Result := gtk_media_file_get_type;
end;

function GTK_MEDIA_FILE(obj: Pointer): PGtkMediaFile;
begin
  Result := PGtkMediaFile(g_type_check_instance_cast(obj, GTK_TYPE_MEDIA_FILE));
end;

function GTK_IS_MEDIA_FILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_MEDIA_FILE);
end;

function GTK_MEDIA_FILE_CLASS(klass: Pointer): PGtkMediaFileClass;
begin
  Result := PGtkMediaFileClass(g_type_check_class_cast(klass, GTK_TYPE_MEDIA_FILE));
end;

function GTK_IS_MEDIA_FILE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_MEDIA_FILE);
end;

function GTK_MEDIA_FILE_GET_CLASS(obj: Pointer): PGtkMediaFileClass;
begin
  Result := PGtkMediaFileClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGtkMediaFile = record
    parent_instance: TGtkMediaStream;
  end;
  PGtkMediaFile = ^TGtkMediaFile;

  PGtkMediaFileClass = type Pointer;

function gtk_media_file_get_type: TGType; cdecl; external libgxxxxxxx;



end.
