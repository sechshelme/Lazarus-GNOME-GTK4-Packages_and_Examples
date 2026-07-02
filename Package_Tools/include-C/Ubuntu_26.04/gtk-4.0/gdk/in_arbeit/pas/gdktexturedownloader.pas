unit gdktexturedownloader;

interface

uses
  fp_glib2, fp_gtk4;

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

function gdk_texture_downloader_get_type:TGType;cdecl;external libgtk4;
function gdk_texture_downloader_new(texture:PGdkTexture):PGdkTextureDownloader;cdecl;external libgtk4;
function gdk_texture_downloader_copy(self:PGdkTextureDownloader):PGdkTextureDownloader;cdecl;external libgtk4;
procedure gdk_texture_downloader_free(self:PGdkTextureDownloader);cdecl;external libgtk4;
procedure gdk_texture_downloader_set_texture(self:PGdkTextureDownloader; texture:PGdkTexture);cdecl;external libgtk4;
function gdk_texture_downloader_get_texture(self:PGdkTextureDownloader):PGdkTexture;cdecl;external libgtk4;
procedure gdk_texture_downloader_set_format(self:PGdkTextureDownloader; format:TGdkMemoryFormat);cdecl;external libgtk4;
function gdk_texture_downloader_get_format(self:PGdkTextureDownloader):TGdkMemoryFormat;cdecl;external libgtk4;
procedure gdk_texture_downloader_set_color_state(self:PGdkTextureDownloader; color_state:PGdkColorState);cdecl;external libgtk4;
function gdk_texture_downloader_get_color_state(self:PGdkTextureDownloader):PGdkColorState;cdecl;external libgtk4;
procedure gdk_texture_downloader_download_into(self:PGdkTextureDownloader; data:Pguchar; stride:Tgsize);cdecl;external libgtk4;
function gdk_texture_downloader_download_bytes(self:PGdkTextureDownloader; out_stride:Pgsize):PGBytes;cdecl;external libgtk4;
function gdk_texture_downloader_download_bytes_with_planes(self:PGdkTextureDownloader; out_offsets:array[0..3] of Tgsize; out_strides:array[0..3] of Tgsize):PGBytes;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkTextureDownloader, gdk_texture_downloader_free) }

// === Konventiert am: 2-7-26 19:29:41 ===

function GDK_TYPE_TEXTURE_DOWNLOADER : TGType;

implementation

function GDK_TYPE_TEXTURE_DOWNLOADER : TGType;
  begin
    GDK_TYPE_TEXTURE_DOWNLOADER:=gdk_texture_downloader_get_type;
  end;



end.
