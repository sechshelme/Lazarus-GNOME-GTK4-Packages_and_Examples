
unit gtksourcefile;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcefile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcefile.h
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
PGFile  = ^GFile;
PGMountOperation  = ^GMountOperation;
PGtkSourceCompressionType  = ^GtkSourceCompressionType;
PGtkSourceEncoding  = ^GtkSourceEncoding;
PGtkSourceFile  = ^GtkSourceFile;
PGtkSourceFileClass  = ^GtkSourceFileClass;
PGtkSourceMountOperationFactory  = ^GtkSourceMountOperationFactory;
PGtkSourceNewlineType  = ^GtkSourceNewlineType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2014, 2015 - Sébastien Wilmet <swilmet@gnome.org>
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_FILE : longint; { return type might be wrong }

{*
 * GtkSourceNewlineType:
 * @GTK_SOURCE_NEWLINE_TYPE_LF: line feed, used on UNIX.
 * @GTK_SOURCE_NEWLINE_TYPE_CR: carriage return, used on Mac.
 * @GTK_SOURCE_NEWLINE_TYPE_CR_LF: carriage return followed by a line feed, used
 *   on Windows.
  }
type
  PGtkSourceNewlineType = ^TGtkSourceNewlineType;
  TGtkSourceNewlineType =  Longint;
  Const
    GTK_SOURCE_NEWLINE_TYPE_LF = 0;
    GTK_SOURCE_NEWLINE_TYPE_CR = 1;
    GTK_SOURCE_NEWLINE_TYPE_CR_LF = 2;
;
{*
 * GTK_SOURCE_NEWLINE_TYPE_DEFAULT:
 *
 * The default newline type on the current OS.
  }
{$ifdef G_OS_WIN32}
  GTK_SOURCE_NEWLINE_TYPE_DEFAULT = GTK_SOURCE_NEWLINE_TYPE_CR_LF;  
{$else}

const
  GTK_SOURCE_NEWLINE_TYPE_DEFAULT = GTK_SOURCE_NEWLINE_TYPE_LF;  
{$endif}
{*
 * GtkSourceCompressionType:
 * @GTK_SOURCE_COMPRESSION_TYPE_NONE: plain text.
 * @GTK_SOURCE_COMPRESSION_TYPE_GZIP: gzip compression.
  }
type
  PGtkSourceCompressionType = ^TGtkSourceCompressionType;
  TGtkSourceCompressionType =  Longint;
  Const
    GTK_SOURCE_COMPRESSION_TYPE_NONE = 0;
    GTK_SOURCE_COMPRESSION_TYPE_GZIP = 1;
;
{*
 * GtkSourceMountOperationFactory:
 * @file: a #GtkSourceFile.
 * @userdata: user data
 *
 * Type definition for a function that will be called to create a
 * [class@Gio.MountOperation]. This is useful for creating a [class@Gtk.MountOperation].
  }
type
  PGtkSourceMountOperationFactory = ^TGtkSourceMountOperationFactory;
  TGtkSourceMountOperationFactory = function (file:PGtkSourceFile; userdata:Tgpointer):PGMountOperation;cdecl;
{G_DECLARE_DERIVABLE_TYPE (GtkSourceFile, gtk_source_file, GTK_SOURCE, FILE, GObject) }
{< private > }
  PGtkSourceFileClass = ^TGtkSourceFileClass;
  TGtkSourceFileClass = record
      parent_class : TGObjectClass;cdecl;
      _reserved : array[0..9] of Tgpointer;
    end;


function gtk_source_file_new:PGtkSourceFile;cdecl;external;
function gtk_source_file_get_location(file:PGtkSourceFile):PGFile;cdecl;external;
procedure gtk_source_file_set_location(file:PGtkSourceFile; location:PGFile);cdecl;external;
(* Const before type ignored *)
function gtk_source_file_get_encoding(file:PGtkSourceFile):PGtkSourceEncoding;cdecl;external;
function gtk_source_file_get_newline_type(file:PGtkSourceFile):TGtkSourceNewlineType;cdecl;external;
function gtk_source_file_get_compression_type(file:PGtkSourceFile):TGtkSourceCompressionType;cdecl;external;
procedure gtk_source_file_set_mount_operation_factory(file:PGtkSourceFile; callback:TGtkSourceMountOperationFactory; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;
procedure gtk_source_file_check_file_on_disk(file:PGtkSourceFile);cdecl;external;
function gtk_source_file_is_local(file:PGtkSourceFile):Tgboolean;cdecl;external;
function gtk_source_file_is_externally_modified(file:PGtkSourceFile):Tgboolean;cdecl;external;
function gtk_source_file_is_deleted(file:PGtkSourceFile):Tgboolean;cdecl;external;
function gtk_source_file_is_readonly(file:PGtkSourceFile):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_FILE : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_FILE:=gtk_source_file_get_type;
  end;


end.
