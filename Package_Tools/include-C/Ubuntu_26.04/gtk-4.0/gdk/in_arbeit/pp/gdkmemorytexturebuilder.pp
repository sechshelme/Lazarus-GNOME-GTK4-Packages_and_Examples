
unit gdkmemorytexturebuilder;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkmemorytexturebuilder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkmemorytexturebuilder.h
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
Pcairo_region_t  = ^cairo_region_t;
PGBytes  = ^GBytes;
PGdkColorState  = ^GdkColorState;
PGdkMemoryTextureBuilder  = ^GdkMemoryTextureBuilder;
PGdkTexture  = ^GdkTexture;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2024 Benjamin Otte
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
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{ was #define dname def_expr }
function GDK_TYPE_MEMORY_TEXTURE_BUILDER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GdkMemoryTextureBuilder, gdk_memory_texture_builder, GDK, MEMORY_TEXTURE_BUILDER, GObject) }
function gdk_memory_texture_builder_new:PGdkMemoryTextureBuilder;cdecl;external;
function gdk_memory_texture_builder_get_bytes(self:PGdkMemoryTextureBuilder):PGBytes;cdecl;external;
procedure gdk_memory_texture_builder_set_bytes(self:PGdkMemoryTextureBuilder; bytes:PGBytes);cdecl;external;
function gdk_memory_texture_builder_get_stride(self:PGdkMemoryTextureBuilder):Tgsize;cdecl;external;
procedure gdk_memory_texture_builder_set_stride(self:PGdkMemoryTextureBuilder; stride:Tgsize);cdecl;external;
function gdk_memory_texture_builder_get_stride_for_plane(self:PGdkMemoryTextureBuilder; plane:dword):Tgsize;cdecl;external;
procedure gdk_memory_texture_builder_set_stride_for_plane(self:PGdkMemoryTextureBuilder; plane:dword; stride:Tgsize);cdecl;external;
function gdk_memory_texture_builder_get_offset(self:PGdkMemoryTextureBuilder; plane:dword):Tgsize;cdecl;external;
procedure gdk_memory_texture_builder_set_offset(self:PGdkMemoryTextureBuilder; plane:dword; offset:Tgsize);cdecl;external;
function gdk_memory_texture_builder_get_width(self:PGdkMemoryTextureBuilder):longint;cdecl;external;
procedure gdk_memory_texture_builder_set_width(self:PGdkMemoryTextureBuilder; width:longint);cdecl;external;
function gdk_memory_texture_builder_get_height(self:PGdkMemoryTextureBuilder):longint;cdecl;external;
procedure gdk_memory_texture_builder_set_height(self:PGdkMemoryTextureBuilder; height:longint);cdecl;external;
function gdk_memory_texture_builder_get_format(self:PGdkMemoryTextureBuilder):TGdkMemoryFormat;cdecl;external;
procedure gdk_memory_texture_builder_set_format(self:PGdkMemoryTextureBuilder; format:TGdkMemoryFormat);cdecl;external;
function gdk_memory_texture_builder_get_color_state(self:PGdkMemoryTextureBuilder):PGdkColorState;cdecl;external;
procedure gdk_memory_texture_builder_set_color_state(self:PGdkMemoryTextureBuilder; color_state:PGdkColorState);cdecl;external;
function gdk_memory_texture_builder_get_update_texture(self:PGdkMemoryTextureBuilder):PGdkTexture;cdecl;external;
procedure gdk_memory_texture_builder_set_update_texture(self:PGdkMemoryTextureBuilder; texture:PGdkTexture);cdecl;external;
function gdk_memory_texture_builder_get_update_region(self:PGdkMemoryTextureBuilder):Pcairo_region_t;cdecl;external;
procedure gdk_memory_texture_builder_set_update_region(self:PGdkMemoryTextureBuilder; region:Pcairo_region_t);cdecl;external;
function gdk_memory_texture_builder_build(self:PGdkMemoryTextureBuilder):PGdkTexture;cdecl;external;

implementation

{ was #define dname def_expr }
function GDK_TYPE_MEMORY_TEXTURE_BUILDER : longint; { return type might be wrong }
  begin
    GDK_TYPE_MEMORY_TEXTURE_BUILDER:=gdk_memory_texture_builder_get_type;
  end;


end.
