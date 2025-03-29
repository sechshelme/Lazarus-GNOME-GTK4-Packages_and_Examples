
unit gtksourcefileloader;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcefileloader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcefileloader.h
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
PGInputStream  = ^GInputStream;
PGSList  = ^GSList;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourceEncoding  = ^GtkSourceEncoding;
PGtkSourceFile  = ^GtkSourceFile;
PGtkSourceFileLoader  = ^GtkSourceFileLoader;
PGtkSourceFileLoaderError  = ^GtkSourceFileLoaderError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2005 - Paolo Maggi
 * Copyright 2007 - Paolo Maggi, Steve Frécinaux
 * Copyright 2008 - Jesse van den Kieboom
 * Copyright 2014 - Sébastien Wilmet
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
function GTK_SOURCE_TYPE_FILE_LOADER : longint; { return type might be wrong }

{ was #define dname def_expr }
function GTK_SOURCE_FILE_LOADER_ERROR : longint; { return type might be wrong }

{*
 * GtkSourceFileLoaderError:
 * @GTK_SOURCE_FILE_LOADER_ERROR_TOO_BIG: The file is too big.
 * @GTK_SOURCE_FILE_LOADER_ERROR_ENCODING_AUTO_DETECTION_FAILED: It is not
 * possible to detect the encoding automatically.
 * @GTK_SOURCE_FILE_LOADER_ERROR_CONVERSION_FALLBACK: There was an encoding
 * conversion error and it was needed to use a fallback character.
 *
 * An error code used with the %GTK_SOURCE_FILE_LOADER_ERROR domain.
  }
type
  PGtkSourceFileLoaderError = ^TGtkSourceFileLoaderError;
  TGtkSourceFileLoaderError =  Longint;
  Const
    GTK_SOURCE_FILE_LOADER_ERROR_TOO_BIG = 0;
    GTK_SOURCE_FILE_LOADER_ERROR_ENCODING_AUTO_DETECTION_FAILED = 1;
    GTK_SOURCE_FILE_LOADER_ERROR_CONVERSION_FALLBACK = 2;
;
{G_DECLARE_FINAL_TYPE (GtkSourceFileLoader, gtk_source_file_loader, GTK_SOURCE, FILE_LOADER, GObject) }

function gtk_source_file_loader_error_quark:TGQuark;cdecl;external;
function gtk_source_file_loader_new(buffer:PGtkSourceBuffer; file:PGtkSourceFile):PGtkSourceFileLoader;cdecl;external;
function gtk_source_file_loader_new_from_stream(buffer:PGtkSourceBuffer; file:PGtkSourceFile; stream:PGInputStream):PGtkSourceFileLoader;cdecl;external;
procedure gtk_source_file_loader_set_candidate_encodings(loader:PGtkSourceFileLoader; candidate_encodings:PGSList);cdecl;external;
function gtk_source_file_loader_get_buffer(loader:PGtkSourceFileLoader):PGtkSourceBuffer;cdecl;external;
function gtk_source_file_loader_get_file(loader:PGtkSourceFileLoader):PGtkSourceFile;cdecl;external;
function gtk_source_file_loader_get_location(loader:PGtkSourceFileLoader):PGFile;cdecl;external;
function gtk_source_file_loader_get_input_stream(loader:PGtkSourceFileLoader):PGInputStream;cdecl;external;
procedure gtk_source_file_loader_load_async(loader:PGtkSourceFileLoader; io_priority:Tgint; cancellable:PGCancellable; progress_callback:TGFileProgressCallback; progress_callback_data:Tgpointer; 
            progress_callback_notify:TGDestroyNotify; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gtk_source_file_loader_load_finish(loader:PGtkSourceFileLoader; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_file_loader_get_encoding(loader:PGtkSourceFileLoader):PGtkSourceEncoding;cdecl;external;
function gtk_source_file_loader_get_newline_type(loader:PGtkSourceFileLoader):TGtkSourceNewlineType;cdecl;external;
function gtk_source_file_loader_get_compression_type(loader:PGtkSourceFileLoader):TGtkSourceCompressionType;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_FILE_LOADER : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_FILE_LOADER:=gtk_source_file_loader_get_type;
  end;

{ was #define dname def_expr }
function GTK_SOURCE_FILE_LOADER_ERROR : longint; { return type might be wrong }
  begin
    GTK_SOURCE_FILE_LOADER_ERROR:=gtk_source_file_loader_error_quark;
  end;


end.
