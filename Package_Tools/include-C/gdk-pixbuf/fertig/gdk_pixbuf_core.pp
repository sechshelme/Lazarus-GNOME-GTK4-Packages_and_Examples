
unit gdk_pixbuf_core;
interface

{
  Automatically converted by H2Pas 0.99.16 from gdk_pixbuf_core.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixbuf_core.h
}

Type
PGAsyncResult = ^TGAsyncResult;
PGBytes = ^TGBytes;
PGCancellable = ^TGCancellable;
Pgchar = ^Tgchar;
PGdkPixbuf = ^TGdkPixbuf;
PGError = ^TGError;
PGHashTable = ^TGHashTable;
PGInputStream = ^TGInputStream;
PGOutputStream = ^TGOutputStream;
Pgsize = ^Tgsize;
Pguchar = ^Tguchar;
Pguint = ^Tguint;
Pguint8 = ^Tguint8;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GdkPixbuf library - GdkPixbuf data structure
 *
 * Copyright (C) 2003 The Free Software Foundation
 *
 * Authors: Mark Crichton <crichton@gimp.org>
 *          Miguel de Icaza <miguel@gnu.org>
 *          Federico Mena-Quintero <federico@gimp.org>
 *          Havoc Pennington <hp@redhat.com>
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GDK_PIXBUF_CORE_H}
{$define GDK_PIXBUF_CORE_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <gdk-pixbuf/gdk-pixbuf-macros.h>}
{*
 * GdkPixbufAlphaMode:
 * @GDK_PIXBUF_ALPHA_BILEVEL: A bilevel clipping mask (black and white)
 *  will be created and used to draw the image.  Pixels below 0.5 opacity
 *  will be considered fully transparent, and all others will be
 *  considered fully opaque.
 * @GDK_PIXBUF_ALPHA_FULL: For now falls back to #GDK_PIXBUF_ALPHA_BILEVEL.
 *  In the future it will do full alpha compositing.
 *
 * Control the alpha channel for drawables.
 *
 * These values can be passed to gdk_pixbuf_xlib_render_to_drawable_alpha()
 * in gdk-pixbuf-xlib to control how the alpha channel of an image should
 * be handled.
 *
 * This function can create a bilevel clipping mask (black and white) and use
 * it while painting the image.
 *
 * In the future, when the X Window System gets an alpha channel extension,
 * it will be possible to do full alpha compositing onto arbitrary drawables.
 * For now both cases fall back to a bilevel clipping mask.
 *
 * Deprecated: 2.42: There is no user of GdkPixbufAlphaMode in GdkPixbuf,
 *   and the Xlib utility functions have been split out to their own
 *   library, gdk-pixbuf-xlib
  }
type
  PGdkPixbufAlphaMode = ^TGdkPixbufAlphaMode;
  TGdkPixbufAlphaMode =  Longint;
  Const
    GDK_PIXBUF_ALPHA_BILEVEL = 0;
    GDK_PIXBUF_ALPHA_FULL = 1;
;
{*
 * GdkColorspace:
 * @GDK_COLORSPACE_RGB: Indicates a red/green/blue additive color space.
 * 
 * This enumeration defines the color spaces that are supported by
 * the gdk-pixbuf library.
 *
 * Currently only RGB is supported.
  }
{ Note that these values are encoded in inline pixbufs
 * as ints, so don't reorder them
  }
type
  PGdkColorspace = ^TGdkColorspace;
  TGdkColorspace =  Longint;
  Const
    GDK_COLORSPACE_RGB = 0;
;
{ All of these are opaque structures  }
type

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF(_object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF(_object : longint) : longint;

{*
 * GdkPixbufDestroyNotify:
 * @pixels: (array) (element-type guint8): The pixel array of the pixbuf
 *   that is being finalized.
 * @data: (closure): User closure data.
 * 
 * A function of this type is responsible for freeing the pixel array
 * of a pixbuf.
 *
 * The gdk_pixbuf_new_from_data() function lets you pass in a pre-allocated
 * pixel array so that a pixbuf can be created from it; in this case you
 * will need to pass in a function of type `GdkPixbufDestroyNotify` so that
 * the pixel data can be freed when the pixbuf is finalized.
  }
type

  TGdkPixbufDestroyNotify = procedure (pixels:Pguchar; data:Tgpointer);cdecl;
{*
 * GDK_PIXBUF_ERROR:
 * 
 * Error domain used for pixbuf operations.
 *
 * Indicates that the error code will be in the `GdkPixbufError` enumeration.
 *
 * See the `GError` for information on error domains and error codes.
  }

{ was #define dname def_expr }
function GDK_PIXBUF_ERROR : longint; { return type might be wrong }

{*
 * GdkPixbufError:
 * @GDK_PIXBUF_ERROR_CORRUPT_IMAGE: An image file was broken somehow.
 * @GDK_PIXBUF_ERROR_INSUFFICIENT_MEMORY: Not enough memory.
 * @GDK_PIXBUF_ERROR_BAD_OPTION: A bad option was passed to a pixbuf save module.
 * @GDK_PIXBUF_ERROR_UNKNOWN_TYPE: Unknown image type.
 * @GDK_PIXBUF_ERROR_UNSUPPORTED_OPERATION: Don't know how to perform the
 *  given operation on the type of image at hand.
 * @GDK_PIXBUF_ERROR_FAILED: Generic failure code, something went wrong.
 * @GDK_PIXBUF_ERROR_INCOMPLETE_ANIMATION: Only part of the animation was loaded.
 * 
 * An error code in the `GDK_PIXBUF_ERROR` domain.
 *
 * Many gdk-pixbuf operations can cause errors in this domain, or in
 * the `G_FILE_ERROR` domain.
  }
{ image data hosed  }
{ no mem to load image  }
{ bad option passed to save routine  }
{ unsupported image type (sort of an ENOSYS)  }
{ unsupported operation (load, save) for image type  }
type
  PGdkPixbufError = ^TGdkPixbufError;
  TGdkPixbufError =  Longint;
  Const
    GDK_PIXBUF_ERROR_CORRUPT_IMAGE = 0;
    GDK_PIXBUF_ERROR_INSUFFICIENT_MEMORY = 1;
    GDK_PIXBUF_ERROR_BAD_OPTION = 2;
    GDK_PIXBUF_ERROR_UNKNOWN_TYPE = 3;
    GDK_PIXBUF_ERROR_UNSUPPORTED_OPERATION = 4;
    GDK_PIXBUF_ERROR_FAILED = 5;
    GDK_PIXBUF_ERROR_INCOMPLETE_ANIMATION = 6;
;

function gdk_pixbuf_error_quark:TGQuark;cdecl;external;
function gdk_pixbuf_get_type:TGType;cdecl;external;
{ Reference counting  }
{$ifndef GDK_PIXBUF_DISABLE_DEPRECATED}
function gdk_pixbuf_ref(pixbuf:PGdkPixbuf):PGdkPixbuf;cdecl;external;
procedure gdk_pixbuf_unref(pixbuf:PGdkPixbuf);cdecl;external;
{$endif}
{ GdkPixbuf accessors  }
(* Const before declarator ignored *)
function gdk_pixbuf_get_colorspace(pixbuf:PGdkPixbuf):TGdkColorspace;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_n_channels(pixbuf:PGdkPixbuf):longint;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_has_alpha(pixbuf:PGdkPixbuf):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_bits_per_sample(pixbuf:PGdkPixbuf):longint;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_pixels(pixbuf:PGdkPixbuf):Pguchar;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_width(pixbuf:PGdkPixbuf):longint;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_height(pixbuf:PGdkPixbuf):longint;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_rowstride(pixbuf:PGdkPixbuf):longint;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_byte_length(pixbuf:PGdkPixbuf):Tgsize;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_get_pixels_with_length(pixbuf:PGdkPixbuf; length:Pguint):Pguchar;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gdk_pixbuf_read_pixels(pixbuf:PGdkPixbuf):Pguint8;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_read_pixel_bytes(pixbuf:PGdkPixbuf):PGBytes;cdecl;external;
{ Create a blank pixbuf with an optimal rowstride and a new buffer  }
function gdk_pixbuf_new(colorspace:TGdkColorspace; has_alpha:Tgboolean; bits_per_sample:longint; width:longint; height:longint):PGdkPixbuf;cdecl;external;
function gdk_pixbuf_calculate_rowstride(colorspace:TGdkColorspace; has_alpha:Tgboolean; bits_per_sample:longint; width:longint; height:longint):Tgint;cdecl;external;
{ Copy a pixbuf  }
(* Const before declarator ignored *)
function gdk_pixbuf_copy(pixbuf:PGdkPixbuf):PGdkPixbuf;cdecl;external;
{ Create a pixbuf which points to the pixels of another pixbuf  }
function gdk_pixbuf_new_subpixbuf(src_pixbuf:PGdkPixbuf; src_x:longint; src_y:longint; width:longint; height:longint):PGdkPixbuf;cdecl;external;
{ Simple loading  }
{$ifdef G_OS_WIN32}
{ In previous versions these _utf8 variants where exported and linked to
 * by default. Export them here for ABI (and gi API) compat.
  }
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_file_utf8(filename:Pansichar; error:PPGError):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_file_at_size_utf8(filename:Pansichar; width:longint; height:longint; error:PPGError):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_file_at_scale_utf8(filename:Pansichar; width:longint; height:longint; preserve_aspect_ratio:Tgboolean; error:PPGError):PGdkPixbuf;cdecl;external;
{$endif}
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_file(filename:Pansichar; error:PPGError):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_file_at_size(filename:Pansichar; width:longint; height:longint; error:PPGError):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_file_at_scale(filename:Pansichar; width:longint; height:longint; preserve_aspect_ratio:Tgboolean; error:PPGError):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_resource(resource_path:Pansichar; error:PPGError):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_resource_at_scale(resource_path:Pansichar; width:longint; height:longint; preserve_aspect_ratio:Tgboolean; error:PPGError):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_data(data:Pguchar; colorspace:TGdkColorspace; has_alpha:Tgboolean; bits_per_sample:longint; width:longint; 
           height:longint; rowstride:longint; destroy_fn:TGdkPixbufDestroyNotify; destroy_fn_data:Tgpointer):PGdkPixbuf;cdecl;external;
function gdk_pixbuf_new_from_bytes(data:PGBytes; colorspace:TGdkColorspace; has_alpha:Tgboolean; bits_per_sample:longint; width:longint; 
           height:longint; rowstride:longint):PGdkPixbuf;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_xpm_data(data:PPansichar):PGdkPixbuf;cdecl;external;
{$ifndef GDK_PIXBUF_DISABLE_DEPRECATED}
(* Const before declarator ignored *)
function gdk_pixbuf_new_from_inline(data_length:Tgint; data:Pguint8; copy_pixels:Tgboolean; error:PPGError):PGdkPixbuf;cdecl;external;
{$endif}
{ Mutations  }
procedure gdk_pixbuf_fill(pixbuf:PGdkPixbuf; pixel:Tguint32);cdecl;external;
{ Saving  }
{$ifndef __GTK_DOC_IGNORE__}
{$ifdef G_OS_WIN32}
{ DLL ABI stability hack.  }
const
  gdk_pixbuf_save = gdk_pixbuf_save_utf8;  
{$endif}
{$endif}
(* Const before declarator ignored *)
(* Const before declarator ignored *)

function gdk_pixbuf_save(pixbuf:PGdkPixbuf; filename:Pansichar; _type:Pansichar; error:PPGError; args:array of const):Tgboolean;cdecl;external;
function gdk_pixbuf_save(pixbuf:PGdkPixbuf; filename:Pansichar; _type:Pansichar; error:PPGError):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gdk_pixbuf_savev(pixbuf:PGdkPixbuf; filename:Pansichar; _type:Pansichar; option_keys:PPansichar; option_values:PPansichar; 
           error:PPGError):Tgboolean;cdecl;external;
{$ifdef G_OS_WIN32}
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gdk_pixbuf_savev_utf8(pixbuf:PGdkPixbuf; filename:Pansichar; _type:Pansichar; option_keys:PPansichar; option_values:PPansichar; 
           error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ Saving to a callback function  }
{*
 * GdkPixbufSaveFunc:
 * @buf: (array length=count) (element-type guint8): bytes to be written.
 * @count: number of bytes in @buf. 
 * @error: (out): A location to return an error.
 * @data: (closure): user data passed to gdk_pixbuf_save_to_callback(). 
 * 
 * Save functions used by [method@GdkPixbuf.Pixbuf.save_to_callback].
 *
 * This function is called once for each block of bytes that is "written"
 * by `gdk_pixbuf_save_to_callback()`.
 *
 * If successful it should return `TRUE`; if an error occurs it should set
 * `error` and return `FALSE`, in which case `gdk_pixbuf_save_to_callback()`
 * will fail with the same error.
 *
 * Returns: `TRUE` if successful, `FALSE` otherwise
 * 
 * Since: 2.4
  }
(* Const before declarator ignored *)
type

  TGdkPixbufSaveFunc = function (buf:Pgchar; count:Tgsize; error:PPGError; data:Tgpointer):Tgboolean;cdecl;
(* Const before declarator ignored *)

function gdk_pixbuf_save_to_callback(pixbuf:PGdkPixbuf; save_func:TGdkPixbufSaveFunc; user_data:Tgpointer; _type:Pansichar; error:PPGError; 
           args:array of const):Tgboolean;cdecl;external;
function gdk_pixbuf_save_to_callback(pixbuf:PGdkPixbuf; save_func:TGdkPixbufSaveFunc; user_data:Tgpointer; _type:Pansichar; error:PPGError):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_save_to_callbackv(pixbuf:PGdkPixbuf; save_func:TGdkPixbufSaveFunc; user_data:Tgpointer; _type:Pansichar; option_keys:PPansichar; 
           option_values:PPansichar; error:PPGError):Tgboolean;cdecl;external;
{ Saving into a newly allocated char array  }
(* Const before declarator ignored *)
function gdk_pixbuf_save_to_buffer(pixbuf:PGdkPixbuf; buffer:PPgchar; buffer_size:Pgsize; _type:Pansichar; error:PPGError; 
           args:array of const):Tgboolean;cdecl;external;
function gdk_pixbuf_save_to_buffer(pixbuf:PGdkPixbuf; buffer:PPgchar; buffer_size:Pgsize; _type:Pansichar; error:PPGError):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_save_to_bufferv(pixbuf:PGdkPixbuf; buffer:PPgchar; buffer_size:Pgsize; _type:Pansichar; option_keys:PPansichar; 
           option_values:PPansichar; error:PPGError):Tgboolean;cdecl;external;
function gdk_pixbuf_new_from_stream(stream:PGInputStream; cancellable:PGCancellable; error:PPGError):PGdkPixbuf;cdecl;external;
procedure gdk_pixbuf_new_from_stream_async(stream:PGInputStream; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function gdk_pixbuf_new_from_stream_finish(async_result:PGAsyncResult; error:PPGError):PGdkPixbuf;cdecl;external;
function gdk_pixbuf_new_from_stream_at_scale(stream:PGInputStream; width:Tgint; height:Tgint; preserve_aspect_ratio:Tgboolean; cancellable:PGCancellable; 
           error:PPGError):PGdkPixbuf;cdecl;external;
procedure gdk_pixbuf_new_from_stream_at_scale_async(stream:PGInputStream; width:Tgint; height:Tgint; preserve_aspect_ratio:Tgboolean; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_save_to_stream(pixbuf:PGdkPixbuf; stream:PGOutputStream; _type:Pansichar; cancellable:PGCancellable; error:PPGError; 
           args:array of const):Tgboolean;cdecl;external;
function gdk_pixbuf_save_to_stream(pixbuf:PGdkPixbuf; stream:PGOutputStream; _type:Pansichar; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
procedure gdk_pixbuf_save_to_stream_async(pixbuf:PGdkPixbuf; stream:PGOutputStream; _type:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer; args:array of const);cdecl;external;
procedure gdk_pixbuf_save_to_stream_async(pixbuf:PGdkPixbuf; stream:PGOutputStream; _type:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function gdk_pixbuf_save_to_stream_finish(async_result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
procedure gdk_pixbuf_save_to_streamv_async(pixbuf:PGdkPixbuf; stream:PGOutputStream; _type:Pgchar; option_keys:PPgchar; option_values:PPgchar; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_save_to_streamv(pixbuf:PGdkPixbuf; stream:PGOutputStream; _type:Pansichar; option_keys:PPansichar; option_values:PPansichar; 
           cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{ Adding an alpha channel  }
(* Const before declarator ignored *)
function gdk_pixbuf_add_alpha(pixbuf:PGdkPixbuf; substitute_color:Tgboolean; r:Tguchar; g:Tguchar; b:Tguchar):PGdkPixbuf;cdecl;external;
{ Copy an area of a pixbuf onto another one  }
(* Const before declarator ignored *)
procedure gdk_pixbuf_copy_area(src_pixbuf:PGdkPixbuf; src_x:longint; src_y:longint; width:longint; height:longint; 
            dest_pixbuf:PGdkPixbuf; dest_x:longint; dest_y:longint);cdecl;external;
{ Brighten/darken and optionally make it pixelated-looking  }
(* Const before declarator ignored *)
procedure gdk_pixbuf_saturate_and_pixelate(src:PGdkPixbuf; dest:PGdkPixbuf; saturation:Tgfloat; pixelate:Tgboolean);cdecl;external;
{ Transform an image to agree with its embedded orientation option / tag  }
function gdk_pixbuf_apply_embedded_orientation(src:PGdkPixbuf):PGdkPixbuf;cdecl;external;
{  key/value pairs that can be attached by the pixbuf loader   }
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gdk_pixbuf_set_option(pixbuf:PGdkPixbuf; key:Pgchar; value:Pgchar):Tgboolean;cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
function gdk_pixbuf_get_option(pixbuf:PGdkPixbuf; key:Pgchar):Pgchar;cdecl;external;
(* Const before declarator ignored *)
function gdk_pixbuf_remove_option(pixbuf:PGdkPixbuf; key:Pgchar):Tgboolean;cdecl;external;
function gdk_pixbuf_get_options(pixbuf:PGdkPixbuf):PGHashTable;cdecl;external;
function gdk_pixbuf_copy_options(src_pixbuf:PGdkPixbuf; dest_pixbuf:PGdkPixbuf):Tgboolean;cdecl;external;
{$endif}
{ GDK_PIXBUF_CORE_H  }

implementation

{ was #define dname def_expr }
function GDK_TYPE_PIXBUF : longint; { return type might be wrong }
  begin
    GDK_TYPE_PIXBUF:=gdk_pixbuf_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_PIXBUF(_object : longint) : longint;
begin
  GDK_PIXBUF:=G_TYPE_CHECK_INSTANCE_CAST(_object,GDK_TYPE_PIXBUF,GdkPixbuf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GDK_IS_PIXBUF(_object : longint) : longint;
begin
  GDK_IS_PIXBUF:=G_TYPE_CHECK_INSTANCE_TYPE(_object,GDK_TYPE_PIXBUF);
end;

{ was #define dname def_expr }
function GDK_PIXBUF_ERROR : longint; { return type might be wrong }
  begin
    GDK_PIXBUF_ERROR:=gdk_pixbuf_error_quark;
  end;


end.
