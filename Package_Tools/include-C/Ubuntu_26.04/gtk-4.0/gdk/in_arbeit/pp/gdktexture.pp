
unit gdktexture;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdktexture.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdktexture.h
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
PGBytes  = ^GBytes;
PGdkColorState  = ^GdkColorState;
PGdkPixbuf  = ^GdkPixbuf;
PGdkTexture  = ^GdkTexture;
PGdkTextureError  = ^GdkTextureError;
PGError  = ^GError;
PGFile  = ^GFile;
Pguchar  = ^guchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gdktexture.h
 *
 * Copyright 2016  Benjamin Otte
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
{$include <gdk-pixbuf/gdk-pixbuf.h>}

{ was #define dname def_expr }
function GDK_TYPE_TEXTURE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_TEXTURE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_TEXTURE(obj : longint) : longint;

type

{ was #define dname def_expr }
function GDK_TEXTURE_ERROR : longint; { return type might be wrong }

function gdk_texture_error_quark:TGQuark;cdecl;external;
{*
 * GdkTextureError:
 * @GDK_TEXTURE_ERROR_TOO_LARGE: Not enough memory to handle this image
 * @GDK_TEXTURE_ERROR_CORRUPT_IMAGE: The image data appears corrupted
 * @GDK_TEXTURE_ERROR_UNSUPPORTED_CONTENT: The image contains features
 *   that cannot be loaded
 * @GDK_TEXTURE_ERROR_UNSUPPORTED_FORMAT: The image format is not supported
 *
 * Possible errors that can be returned by `GdkTexture` constructors.
 *
 * Since: 4.6
  }
type
  PGdkTextureError = ^TGdkTextureError;
  TGdkTextureError =  Longint;
  Const
    GDK_TEXTURE_ERROR_TOO_LARGE = 0;
    GDK_TEXTURE_ERROR_CORRUPT_IMAGE = 1;
    GDK_TEXTURE_ERROR_UNSUPPORTED_CONTENT = 2;
    GDK_TEXTURE_ERROR_UNSUPPORTED_FORMAT = 3;
;

function gdk_texture_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_4_20 }
function gdk_texture_new_for_pixbuf(pixbuf:PGdkPixbuf):PGdkTexture;cdecl;external;
(* Const before type ignored *)
function gdk_texture_new_from_resource(resource_path:Pchar):PGdkTexture;cdecl;external;
function gdk_texture_new_from_file(file:PGFile; error:PPGError):PGdkTexture;cdecl;external;
(* Const before type ignored *)
function gdk_texture_new_from_filename(path:Pchar; error:PPGError):PGdkTexture;cdecl;external;
function gdk_texture_new_from_bytes(bytes:PGBytes; error:PPGError):PGdkTexture;cdecl;external;
function gdk_texture_get_width(texture:PGdkTexture):longint;cdecl;external;
function gdk_texture_get_height(texture:PGdkTexture):longint;cdecl;external;
function gdk_texture_get_format(self:PGdkTexture):TGdkMemoryFormat;cdecl;external;
function gdk_texture_get_color_state(self:PGdkTexture):PGdkColorState;cdecl;external;
procedure gdk_texture_download(texture:PGdkTexture; data:Pguchar; stride:Tgsize);cdecl;external;
(* Const before type ignored *)
function gdk_texture_save_to_png(texture:PGdkTexture; filename:Pchar):Tgboolean;cdecl;external;
function gdk_texture_save_to_png_bytes(texture:PGdkTexture):PGBytes;cdecl;external;
(* Const before type ignored *)
function gdk_texture_save_to_tiff(texture:PGdkTexture; filename:Pchar):Tgboolean;cdecl;external;
function gdk_texture_save_to_tiff_bytes(texture:PGdkTexture):PGBytes;cdecl;external;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkTexture, g_object_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_TEXTURE : longint; { return type might be wrong }
  begin
    GDK_TYPE_TEXTURE:=gdk_texture_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_TEXTURE(obj : longint) : longint;
begin
  GDK_TEXTURE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GDK_TYPE_TEXTURE,GdkTexture);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_TEXTURE(obj : longint) : longint;
begin
  GDK_IS_TEXTURE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GDK_TYPE_TEXTURE);
end;

{ was #define dname def_expr }
function GDK_TEXTURE_ERROR : longint; { return type might be wrong }
  begin
    GDK_TEXTURE_ERROR:=gdk_texture_error_quark;
  end;


end.
