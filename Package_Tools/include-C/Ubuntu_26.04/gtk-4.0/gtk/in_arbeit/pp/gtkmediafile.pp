
unit gtkmediafile;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkmediafile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkmediafile.h
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
PGFile  = ^GFile;
PGInputStream  = ^GInputStream;
PGtkMediaFile  = ^GtkMediaFile;
PGtkMediaFileClass  = ^GtkMediaFileClass;
PGtkMediaStream  = ^GtkMediaStream;
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

{ was #define dname def_expr }
function GTK_TYPE_MEDIA_FILE : longint; { return type might be wrong }

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


function gtk_media_file_new:PGtkMediaStream;cdecl;external;
(* Const before type ignored *)
function gtk_media_file_new_for_filename(filename:Pchar):PGtkMediaStream;cdecl;external;
(* Const before type ignored *)
function gtk_media_file_new_for_resource(resource_path:Pchar):PGtkMediaStream;cdecl;external;
function gtk_media_file_new_for_file(file:PGFile):PGtkMediaStream;cdecl;external;
function gtk_media_file_new_for_input_stream(stream:PGInputStream):PGtkMediaStream;cdecl;external;
procedure gtk_media_file_clear(self:PGtkMediaFile);cdecl;external;
(* Const before type ignored *)
procedure gtk_media_file_set_filename(self:PGtkMediaFile; filename:Pchar);cdecl;external;
(* Const before type ignored *)
procedure gtk_media_file_set_resource(self:PGtkMediaFile; resource_path:Pchar);cdecl;external;
procedure gtk_media_file_set_file(self:PGtkMediaFile; file:PGFile);cdecl;external;
function gtk_media_file_get_file(self:PGtkMediaFile):PGFile;cdecl;external;
procedure gtk_media_file_set_input_stream(self:PGtkMediaFile; stream:PGInputStream);cdecl;external;
function gtk_media_file_get_input_stream(self:PGtkMediaFile):PGInputStream;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_MEDIA_FILE : longint; { return type might be wrong }
  begin
    GTK_TYPE_MEDIA_FILE:=gtk_media_file_get_type;
  end;


end.
