
unit gdkmemorytexture;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkmemorytexture.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkmemorytexture
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
PGdkTexture  = ^GdkTexture;
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
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}
{$include <gdk/gdktexture.h>}
{*
 * GDK_MEMORY_DEFAULT:
 *
 * The default memory format used by GTK.
 *
 * This is the format provided by [method@Gdk.Texture.download].
 * It is equal to %CAIRO_FORMAT_ARGB32.
 *
 * Be aware that unlike the `GdkMemoryFormat` values, this format
 * is different for different endianness.
  }
{$if G_BYTE_ORDER == G_LITTLE_ENDIAN}

const
  GDK_MEMORY_DEFAULT = GDK_MEMORY_B8G8R8A8_PREMULTIPLIED;  
(*** was #elif ****){$else G_BYTE_ORDER == G_BIG_ENDIAN}

const
  GDK_MEMORY_DEFAULT = GDK_MEMORY_A8R8G8B8_PREMULTIPLIED;  
{$else}
{$error "Unknown byte order for GDK_MEMORY_DEFAULT"}
{$endif}

{ was #define dname def_expr }
function GDK_TYPE_MEMORY_TEXTURE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_MEMORY_TEXTURE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_MEMORY_TEXTURE(obj : longint) : longint;

type
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkMemoryTexture, g_object_unref) }

function gdk_memory_texture_get_type:TGType;cdecl;external;
function gdk_memory_texture_new(width:longint; height:longint; format:TGdkMemoryFormat; bytes:PGBytes; stride:Tgsize):PGdkTexture;cdecl;external;

implementation

{ was #define dname def_expr }
function GDK_TYPE_MEMORY_TEXTURE : longint; { return type might be wrong }
  begin
    GDK_TYPE_MEMORY_TEXTURE:=gdk_memory_texture_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_MEMORY_TEXTURE(obj : longint) : longint;
begin
  GDK_MEMORY_TEXTURE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GDK_TYPE_MEMORY_TEXTURE,GdkMemoryTexture);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_MEMORY_TEXTURE(obj : longint) : longint;
begin
  GDK_IS_MEMORY_TEXTURE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GDK_TYPE_MEMORY_TEXTURE);
end;


end.
