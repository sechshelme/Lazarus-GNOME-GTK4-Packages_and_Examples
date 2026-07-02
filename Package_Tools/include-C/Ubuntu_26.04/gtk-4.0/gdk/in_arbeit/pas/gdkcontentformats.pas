unit gdkcontentformats;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2017 Benjamin Otte
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
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{ was #define dname def_expr }
function GDK_TYPE_CONTENT_FORMATS : longint; { return type might be wrong }

function gdk_intern_mime_type(_string:Pchar):Pchar;cdecl;external libgtk4;
function gdk_content_formats_get_type:TGType;cdecl;external libgtk4;
function gdk_content_formats_new(mime_types:PPchar; n_mime_types:Tguint):PGdkContentFormats;cdecl;external libgtk4;
function gdk_content_formats_new_for_gtype(_type:TGType):PGdkContentFormats;cdecl;external libgtk4;
function gdk_content_formats_parse(_string:Pchar):PGdkContentFormats;cdecl;external libgtk4;
function gdk_content_formats_ref(formats:PGdkContentFormats):PGdkContentFormats;cdecl;external libgtk4;
procedure gdk_content_formats_unref(formats:PGdkContentFormats);cdecl;external libgtk4;
procedure gdk_content_formats_print(formats:PGdkContentFormats; _string:PGString);cdecl;external libgtk4;
function gdk_content_formats_to_string(formats:PGdkContentFormats):Pchar;cdecl;external libgtk4;
function gdk_content_formats_get_gtypes(formats:PGdkContentFormats; n_gtypes:Pgsize):PGType;cdecl;external libgtk4;
function gdk_content_formats_get_mime_types(formats:PGdkContentFormats; n_mime_types:Pgsize):^Pchar;cdecl;external libgtk4;
function gdk_content_formats_union(first:PGdkContentFormats; second:PGdkContentFormats):PGdkContentFormats;cdecl;external libgtk4;
function gdk_content_formats_match(first:PGdkContentFormats; second:PGdkContentFormats):Tgboolean;cdecl;external libgtk4;
function gdk_content_formats_match_gtype(first:PGdkContentFormats; second:PGdkContentFormats):TGType;cdecl;external libgtk4;
function gdk_content_formats_match_mime_type(first:PGdkContentFormats; second:PGdkContentFormats):Pchar;cdecl;external libgtk4;
function gdk_content_formats_contain_gtype(formats:PGdkContentFormats; _type:TGType):Tgboolean;cdecl;external libgtk4;
function gdk_content_formats_contain_mime_type(formats:PGdkContentFormats; mime_type:Pchar):Tgboolean;cdecl;external libgtk4;
function gdk_content_formats_is_empty(formats:PGdkContentFormats):Tgboolean;cdecl;external libgtk4;
{ was #define dname def_expr }
function GDK_TYPE_CONTENT_FORMATS_BUILDER : longint; { return type might be wrong }

type

function gdk_content_formats_builder_get_type:TGType;cdecl;external libgtk4;
function gdk_content_formats_builder_new:PGdkContentFormatsBuilder;cdecl;external libgtk4;
function gdk_content_formats_builder_ref(builder:PGdkContentFormatsBuilder):PGdkContentFormatsBuilder;cdecl;external libgtk4;
procedure gdk_content_formats_builder_unref(builder:PGdkContentFormatsBuilder);cdecl;external libgtk4;
function gdk_content_formats_builder_free_to_formats(builder:PGdkContentFormatsBuilder):PGdkContentFormats;cdecl;external libgtk4;
function gdk_content_formats_builder_to_formats(builder:PGdkContentFormatsBuilder):PGdkContentFormats;cdecl;external libgtk4;
procedure gdk_content_formats_builder_add_formats(builder:PGdkContentFormatsBuilder; formats:PGdkContentFormats);cdecl;external libgtk4;
procedure gdk_content_formats_builder_add_mime_type(builder:PGdkContentFormatsBuilder; mime_type:Pchar);cdecl;external libgtk4;
procedure gdk_content_formats_builder_add_gtype(builder:PGdkContentFormatsBuilder; _type:TGType);cdecl;external libgtk4;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkContentFormats, gdk_content_formats_unref) }
{ dunno where else to put this  }
{ was #define dname def_expr }
function GDK_TYPE_FILE_LIST : longint; { return type might be wrong }

function gdk_file_list_get_type:TGType;cdecl;external libgtk4;
{*
 * GdkFileList:
 *
 * An opaque type representing a list of files.
 *
 * Since: 4.6
  }
type

function gdk_file_list_get_files(file_list:PGdkFileList):PGSList;cdecl;external libgtk4;
function gdk_file_list_new_from_list(files:PGSList):PGdkFileList;cdecl;external libgtk4;
function gdk_file_list_new_from_array(files:PPGFile; n_files:Tgsize):PGdkFileList;cdecl;external libgtk4;

// === Konventiert am: 2-7-26 17:34:15 ===


implementation


{ was #define dname def_expr }
function GDK_TYPE_CONTENT_FORMATS : longint; { return type might be wrong }
  begin
    GDK_TYPE_CONTENT_FORMATS:=gdk_content_formats_get_type;
  end;

{ was #define dname def_expr }
function GDK_TYPE_CONTENT_FORMATS_BUILDER : longint; { return type might be wrong }
  begin
    GDK_TYPE_CONTENT_FORMATS_BUILDER:=gdk_content_formats_builder_get_type;
  end;

{ was #define dname def_expr }
function GDK_TYPE_FILE_LIST : longint; { return type might be wrong }
  begin
    GDK_TYPE_FILE_LIST:=gdk_file_list_get_type;
  end;


end.
