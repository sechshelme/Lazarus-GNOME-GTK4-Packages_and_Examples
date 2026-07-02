
unit gdkcontentformats;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkcontentformats.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkcontentformats.h
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
PGdkContentFormats  = ^GdkContentFormats;
PGdkContentFormatsBuilder  = ^GdkContentFormatsBuilder;
PGdkFileList  = ^GdkFileList;
PGFile  = ^GFile;
Pgsize  = ^gsize;
PGSList  = ^GSList;
PGString  = ^GString;
PGType  = ^GType;
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

(* Const before type ignored *)
(* Const before type ignored *)
function gdk_intern_mime_type(_string:Pchar):Pchar;cdecl;external;
function gdk_content_formats_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function gdk_content_formats_new(mime_types:PPchar; n_mime_types:Tguint):PGdkContentFormats;cdecl;external;
function gdk_content_formats_new_for_gtype(_type:TGType):PGdkContentFormats;cdecl;external;
(* Const before type ignored *)
function gdk_content_formats_parse(_string:Pchar):PGdkContentFormats;cdecl;external;
function gdk_content_formats_ref(formats:PGdkContentFormats):PGdkContentFormats;cdecl;external;
procedure gdk_content_formats_unref(formats:PGdkContentFormats);cdecl;external;
procedure gdk_content_formats_print(formats:PGdkContentFormats; _string:PGString);cdecl;external;
function gdk_content_formats_to_string(formats:PGdkContentFormats):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gdk_content_formats_get_gtypes(formats:PGdkContentFormats; n_gtypes:Pgsize):PGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function gdk_content_formats_get_mime_types(formats:PGdkContentFormats; n_mime_types:Pgsize):^Pchar;cdecl;external;
(* Const before type ignored *)
function gdk_content_formats_union(first:PGdkContentFormats; second:PGdkContentFormats):PGdkContentFormats;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gdk_content_formats_match(first:PGdkContentFormats; second:PGdkContentFormats):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gdk_content_formats_match_gtype(first:PGdkContentFormats; second:PGdkContentFormats):TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gdk_content_formats_match_mime_type(first:PGdkContentFormats; second:PGdkContentFormats):Pchar;cdecl;external;
(* Const before type ignored *)
function gdk_content_formats_contain_gtype(formats:PGdkContentFormats; _type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gdk_content_formats_contain_mime_type(formats:PGdkContentFormats; mime_type:Pchar):Tgboolean;cdecl;external;
function gdk_content_formats_is_empty(formats:PGdkContentFormats):Tgboolean;cdecl;external;
{ was #define dname def_expr }
function GDK_TYPE_CONTENT_FORMATS_BUILDER : longint; { return type might be wrong }

type

function gdk_content_formats_builder_get_type:TGType;cdecl;external;
function gdk_content_formats_builder_new:PGdkContentFormatsBuilder;cdecl;external;
function gdk_content_formats_builder_ref(builder:PGdkContentFormatsBuilder):PGdkContentFormatsBuilder;cdecl;external;
procedure gdk_content_formats_builder_unref(builder:PGdkContentFormatsBuilder);cdecl;external;
function gdk_content_formats_builder_free_to_formats(builder:PGdkContentFormatsBuilder):PGdkContentFormats;cdecl;external;
function gdk_content_formats_builder_to_formats(builder:PGdkContentFormatsBuilder):PGdkContentFormats;cdecl;external;
(* Const before type ignored *)
procedure gdk_content_formats_builder_add_formats(builder:PGdkContentFormatsBuilder; formats:PGdkContentFormats);cdecl;external;
(* Const before type ignored *)
procedure gdk_content_formats_builder_add_mime_type(builder:PGdkContentFormatsBuilder; mime_type:Pchar);cdecl;external;
procedure gdk_content_formats_builder_add_gtype(builder:PGdkContentFormatsBuilder; _type:TGType);cdecl;external;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GdkContentFormats, gdk_content_formats_unref) }
{ dunno where else to put this  }
{ was #define dname def_expr }
function GDK_TYPE_FILE_LIST : longint; { return type might be wrong }

function gdk_file_list_get_type:TGType;cdecl;external;
{*
 * GdkFileList:
 *
 * An opaque type representing a list of files.
 *
 * Since: 4.6
  }
type

function gdk_file_list_get_files(file_list:PGdkFileList):PGSList;cdecl;external;
function gdk_file_list_new_from_list(files:PGSList):PGdkFileList;cdecl;external;
function gdk_file_list_new_from_array(files:PPGFile; n_files:Tgsize):PGdkFileList;cdecl;external;

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
