
unit gdktexturedownloader;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdktexturedownloader.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdktexturedownloader.h
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
PGBytes  = ^GBytes;
PGdkColorState  = ^GdkColorState;
PGdkTexture  = ^GdkTexture;
PGdkTextureDownloader  = ^GdkTextureDownloader;
Pgsize  = ^gsize;
Pguchar  = ^guchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 2023 Benjamin Otte
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
function GDK_TYPE_TEXTURE_DOWNLOADER : longint; { return type might be wrong }

function gdk_texture_downloader_get_type:TGType;cdecl;external;
function gdk_texture_downloader_new(texture:PGdkTexture):PGdkTextureDownloader;cdecl;external;
(* Const before type ignored *)
function gdk_texture_downloader_copy(self:PGdkTextureDownloader):PGdkTextureDownloader;cdecl;external;
procedure gdk_texture_downloader_free(self:PGdkTextureDownloader);cdecl;external;
procedure gdk_texture_downloader_set_texture(self:PGdkTextureDownloader; texture:PGdkTexture);cdecl;external;
(* Const before type ignored *)
function gdk_texture_downloader_get_texture(self:PGdkTextureDownloader):PGdkTexture;cdecl;external;
procedure gdk_texture_downloader_set_format(self:PGdkTextureDownloader; format:TGdkMemoryFormat);cdecl;external;
(* Const before type ignored *)
function gdk_texture_downloader_get_format(self:PGdkTextureDownloader):TGdkMemoryFormat;cdecl;external;
procedure gdk_texture_downloader_set_color_state(self:PGdkTextureDownloader; color_state:PGdkColorState);cdecl;external;
(* Const before type ignored *)
function gdk_texture_downloader_get_color_state(self:PGdkTextureDownloader):PGdkColorState;cdecl;external;
(* Const before type ignored *)
procedure gdk_texture_downloader_download_into(self:PGdkTextureDownloader; data:Pguchar; stride:Tgsize);cdecl;external;
(* Const before type ignored *)
function gdk_texture_downloader_download_bytes(self:PGdkTextureDownloader; out_stride:Pgsize):PGBytes;cdecl;external;
(* Const before type ignored *)
function gdk_texture_downloader_download_bytes_with_planes(self:PGdkTextureDownloader; out_offsets:array[0..3] of Tgsize; out_strides:array[0..3] of Tgsize):PGBytes;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkTextureDownloader, gdk_texture_downloader_free) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_TEXTURE_DOWNLOADER : longint; { return type might be wrong }
  begin
    GDK_TYPE_TEXTURE_DOWNLOADER:=gdk_texture_downloader_get_type;
  end;


end.
