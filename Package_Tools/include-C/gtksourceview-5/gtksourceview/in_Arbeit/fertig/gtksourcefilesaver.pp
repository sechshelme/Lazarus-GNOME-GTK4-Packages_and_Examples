
unit gtksourcefilesaver;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcefilesaver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcefilesaver.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGFile  = ^GFile;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourceEncoding  = ^GtkSourceEncoding;
PGtkSourceFile  = ^GtkSourceFile;
PGtkSourceFileSaver  = ^GtkSourceFileSaver;
PGtkSourceFileSaverError  = ^GtkSourceFileSaverError;
PGtkSourceFileSaverFlags  = ^GtkSourceFileSaverFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2005, 2007 Paolo Maggi
 * Copyright 2007 Steve Frécinaux
 * Copyright 2008 Jesse van den Kieboom
 * Copyright 2014 Sébastien Wilmet
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
{$include "gtksourcefile.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_FILE_SAVER : longint; { return type might be wrong }

{ was #define dname def_expr }
function GTK_SOURCE_FILE_SAVER_ERROR : longint; { return type might be wrong }

{*
 * GtkSourceFileSaverError:
 * @GTK_SOURCE_FILE_SAVER_ERROR_INVALID_CHARS: The buffer contains invalid
 *   characters.
 * @GTK_SOURCE_FILE_SAVER_ERROR_EXTERNALLY_MODIFIED: The file is externally
 *   modified.
 *
 * An error code used with the %GTK_SOURCE_FILE_SAVER_ERROR domain.
  }
type
  PGtkSourceFileSaverError = ^TGtkSourceFileSaverError;
  TGtkSourceFileSaverError =  Longint;
  Const
    GTK_SOURCE_FILE_SAVER_ERROR_INVALID_CHARS = 0;
    GTK_SOURCE_FILE_SAVER_ERROR_EXTERNALLY_MODIFIED = 1;
;
{*
 * GtkSourceFileSaverFlags:
 * @GTK_SOURCE_FILE_SAVER_FLAGS_NONE: No flags.
 * @GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_INVALID_CHARS: Ignore invalid characters.
 * @GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_MODIFICATION_TIME: Save file despite external modifications.
 * @GTK_SOURCE_FILE_SAVER_FLAGS_CREATE_BACKUP: Create a backup before saving the file.
 *
 * Flags to define the behavior of a [flags@FileSaverFlags].
  }
type
  PGtkSourceFileSaverFlags = ^TGtkSourceFileSaverFlags;
  TGtkSourceFileSaverFlags =  Longint;
  Const
    GTK_SOURCE_FILE_SAVER_FLAGS_NONE = 0;
    GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_INVALID_CHARS = 1 shl 0;
    GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_MODIFICATION_TIME = 1 shl 1;
    GTK_SOURCE_FILE_SAVER_FLAGS_CREATE_BACKUP = 1 shl 2;
;
{G_DECLARE_FINAL_TYPE (GtkSourceFileSaver, gtk_source_file_saver, GTK_SOURCE, FILE_SAVER, GObject) }

function gtk_source_file_saver_error_quark:TGQuark;cdecl;external;
function gtk_source_file_saver_new(buffer:PGtkSourceBuffer; file:PGtkSourceFile):PGtkSourceFileSaver;cdecl;external;
function gtk_source_file_saver_new_with_target(buffer:PGtkSourceBuffer; file:PGtkSourceFile; target_location:PGFile):PGtkSourceFileSaver;cdecl;external;
function gtk_source_file_saver_get_buffer(saver:PGtkSourceFileSaver):PGtkSourceBuffer;cdecl;external;
function gtk_source_file_saver_get_file(saver:PGtkSourceFileSaver):PGtkSourceFile;cdecl;external;
function gtk_source_file_saver_get_location(saver:PGtkSourceFileSaver):PGFile;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_file_saver_set_encoding(saver:PGtkSourceFileSaver; encoding:PGtkSourceEncoding);cdecl;external;
(* Const before type ignored *)
function gtk_source_file_saver_get_encoding(saver:PGtkSourceFileSaver):PGtkSourceEncoding;cdecl;external;
procedure gtk_source_file_saver_set_newline_type(saver:PGtkSourceFileSaver; newline_type:TGtkSourceNewlineType);cdecl;external;
function gtk_source_file_saver_get_newline_type(saver:PGtkSourceFileSaver):TGtkSourceNewlineType;cdecl;external;
procedure gtk_source_file_saver_set_compression_type(saver:PGtkSourceFileSaver; compression_type:TGtkSourceCompressionType);cdecl;external;
function gtk_source_file_saver_get_compression_type(saver:PGtkSourceFileSaver):TGtkSourceCompressionType;cdecl;external;
procedure gtk_source_file_saver_set_flags(saver:PGtkSourceFileSaver; flags:TGtkSourceFileSaverFlags);cdecl;external;
function gtk_source_file_saver_get_flags(saver:PGtkSourceFileSaver):TGtkSourceFileSaverFlags;cdecl;external;
procedure gtk_source_file_saver_save_async(saver:PGtkSourceFileSaver; io_priority:Tgint; cancellable:PGCancellable; progress_callback:TGFileProgressCallback; progress_callback_data:Tgpointer; 
            progress_callback_notify:TGDestroyNotify; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_source_file_saver_save_finish(saver:PGtkSourceFileSaver; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_FILE_SAVER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_FILE_SAVER:=gtk_source_file_saver_get_type;
  end;

{ was #define dname def_expr }
function GTK_SOURCE_FILE_SAVER_ERROR : longint; { return type might be wrong }
  begin
    GTK_SOURCE_FILE_SAVER_ERROR:=gtk_source_file_saver_error_quark;
  end;


end.
