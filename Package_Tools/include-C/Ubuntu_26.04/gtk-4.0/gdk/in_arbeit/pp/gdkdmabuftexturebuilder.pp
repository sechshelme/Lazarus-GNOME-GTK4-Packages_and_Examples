
unit gdkdmabuftexturebuilder;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkdmabuftexturebuilder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkdmabuftexturebuilder.h
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
    PGdkColorState  = ^GdkColorState;
    PGdkDisplay  = ^GdkDisplay;
    PGdkDmabufTextureBuilder  = ^GdkDmabufTextureBuilder;
    PGdkTexture  = ^GdkTexture;
    PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2023 Red Hat, Inc.
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
 * Authors: Matthias Clasen <mclasen@redhat.com>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{ was #define dname def_expr }
function GDK_TYPE_DMABUF_TEXTURE_BUILDER : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (GdkDmabufTextureBuilder, gdk_dmabuf_texture_builder, GDK, DMABUF_TEXTURE_BUILDER, GObject) }
(* error 
extern
in declaration at line 35 *)
function gdk_dmabuf_texture_builder_get_display(self:PGdkDmabufTextureBuilder):PGdkDisplay;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_display(self:PGdkDmabufTextureBuilder; display:PGdkDisplay);cdecl;external;
function gdk_dmabuf_texture_builder_get_width(self:PGdkDmabufTextureBuilder):dword;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_width(self:PGdkDmabufTextureBuilder; width:dword);cdecl;external;
function gdk_dmabuf_texture_builder_get_height(self:PGdkDmabufTextureBuilder):dword;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_height(self:PGdkDmabufTextureBuilder; height:dword);cdecl;external;
function gdk_dmabuf_texture_builder_get_fourcc(self:PGdkDmabufTextureBuilder):Tguint32;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_fourcc(self:PGdkDmabufTextureBuilder; fourcc:Tguint32);cdecl;external;
function gdk_dmabuf_texture_builder_get_modifier(self:PGdkDmabufTextureBuilder):Tguint64;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_modifier(self:PGdkDmabufTextureBuilder; modifier:Tguint64);cdecl;external;
function gdk_dmabuf_texture_builder_get_premultiplied(self:PGdkDmabufTextureBuilder):Tgboolean;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_premultiplied(self:PGdkDmabufTextureBuilder; premultiplied:Tgboolean);cdecl;external;
function gdk_dmabuf_texture_builder_get_n_planes(self:PGdkDmabufTextureBuilder):dword;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_n_planes(self:PGdkDmabufTextureBuilder; n_planes:dword);cdecl;external;
function gdk_dmabuf_texture_builder_get_fd(self:PGdkDmabufTextureBuilder; plane:dword):longint;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_fd(self:PGdkDmabufTextureBuilder; plane:dword; fd:longint);cdecl;external;
function gdk_dmabuf_texture_builder_get_stride(self:PGdkDmabufTextureBuilder; plane:dword):dword;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_stride(self:PGdkDmabufTextureBuilder; plane:dword; stride:dword);cdecl;external;
function gdk_dmabuf_texture_builder_get_offset(self:PGdkDmabufTextureBuilder; plane:dword):dword;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_offset(self:PGdkDmabufTextureBuilder; plane:dword; offset:dword);cdecl;external;
function gdk_dmabuf_texture_builder_get_color_state(self:PGdkDmabufTextureBuilder):PGdkColorState;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_color_state(self:PGdkDmabufTextureBuilder; color_state:PGdkColorState);cdecl;external;
function gdk_dmabuf_texture_builder_get_update_texture(self:PGdkDmabufTextureBuilder):PGdkTexture;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_update_texture(self:PGdkDmabufTextureBuilder; texture:PGdkTexture);cdecl;external;
function gdk_dmabuf_texture_builder_get_update_region(self:PGdkDmabufTextureBuilder):Pcairo_region_t;cdecl;external;
procedure gdk_dmabuf_texture_builder_set_update_region(self:PGdkDmabufTextureBuilder; region:Pcairo_region_t);cdecl;external;
function gdk_dmabuf_texture_builder_build(self:PGdkDmabufTextureBuilder; destroy:TGDestroyNotify; data:Tgpointer; error:PPGError):PGdkTexture;cdecl;external;

implementation

{ was #define dname def_expr }
function GDK_TYPE_DMABUF_TEXTURE_BUILDER : longint; { return type might be wrong }
  begin
    GDK_TYPE_DMABUF_TEXTURE_BUILDER:=gdk_dmabuf_texture_builder_get_type;
  end;


end.
