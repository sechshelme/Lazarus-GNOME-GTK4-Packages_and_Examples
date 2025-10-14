
unit xcb_renderutil;
interface

{
  Automatically converted by H2Pas 1.0.0 from xcb_renderutil.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xcb_renderutil.h
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
Puint16_t  = ^uint16_t;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
Pxcb_connection_t  = ^xcb_connection_t;
Pxcb_pict_format_t  = ^xcb_pict_format_t;
Pxcb_pict_standard_t  = ^xcb_pict_standard_t;
Pxcb_render_pictforminfo_t  = ^xcb_render_pictforminfo_t;
Pxcb_render_pictvisual_t  = ^xcb_render_pictvisual_t;
Pxcb_render_query_pict_formats_reply_t  = ^xcb_render_query_pict_formats_reply_t;
Pxcb_render_query_version_reply_t  = ^xcb_render_query_version_reply_t;
Pxcb_render_util_composite_text_stream_t  = ^xcb_render_util_composite_text_stream_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright © 2006 Jamey Sharp.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 * Except as contained in this notice, the names of the authors or their
 * institutions shall not be used in advertising or otherwise to promote the
 * sale, use or other dealings in this Software without prior written
 * authorization from the authors.
  }
{$ifndef XCB_RENDERUTIL}
{$define XCB_RENDERUTIL}
{$include <xcb/render.h>}
{ C++ extern C conditionnal removed }
type
  Pxcb_pict_format_t = ^Txcb_pict_format_t;
  Txcb_pict_format_t =  Longint;
  Const
    XCB_PICT_FORMAT_ID = 1 shl 0;
    XCB_PICT_FORMAT_TYPE = 1 shl 1;
    XCB_PICT_FORMAT_DEPTH = 1 shl 2;
    XCB_PICT_FORMAT_RED = 1 shl 3;
    XCB_PICT_FORMAT_RED_MASK = 1 shl 4;
    XCB_PICT_FORMAT_GREEN = 1 shl 5;
    XCB_PICT_FORMAT_GREEN_MASK = 1 shl 6;
    XCB_PICT_FORMAT_BLUE = 1 shl 7;
    XCB_PICT_FORMAT_BLUE_MASK = 1 shl 8;
    XCB_PICT_FORMAT_ALPHA = 1 shl 9;
    XCB_PICT_FORMAT_ALPHA_MASK = 1 shl 10;
    XCB_PICT_FORMAT_COLORMAP = 1 shl 11;
;
type
  Pxcb_pict_standard_t = ^Txcb_pict_standard_t;
  Txcb_pict_standard_t =  Longint;
  Const
    XCB_PICT_STANDARD_ARGB_32 = 0;
    XCB_PICT_STANDARD_RGB_24 = 1;
    XCB_PICT_STANDARD_A_8 = 2;
    XCB_PICT_STANDARD_A_4 = 3;
    XCB_PICT_STANDARD_A_1 = 4;
;
(* Const before type ignored *)
(* Const before type ignored *)

function xcb_render_util_find_visual_format(formats:Pxcb_render_query_pict_formats_reply_t; visual:Txcb_visualid_t):Pxcb_render_pictvisual_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xcb_render_util_find_format(formats:Pxcb_render_query_pict_formats_reply_t; mask:dword; ptemplate:Pxcb_render_pictforminfo_t; count:longint):Pxcb_render_pictforminfo_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_util_find_standard_format(formats:Pxcb_render_query_pict_formats_reply_t; format:Txcb_pict_standard_t):Pxcb_render_pictforminfo_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_util_query_version(c:Pxcb_connection_t):Pxcb_render_query_version_reply_t;cdecl;external;
(* Const before type ignored *)
function xcb_render_util_query_formats(c:Pxcb_connection_t):Pxcb_render_query_pict_formats_reply_t;cdecl;external;
function xcb_render_util_disconnect(c:Pxcb_connection_t):longint;cdecl;external;
{ wrappers for xcb_render_composite_glyphs_8/16/32  }
type

function xcb_render_util_composite_text_stream(initial_glyphset:Txcb_render_glyphset_t; total_glyphs:Tuint32_t; total_glyphset_changes:Tuint32_t):Pxcb_render_util_composite_text_stream_t;cdecl;external;
(* Const before type ignored *)
procedure xcb_render_util_glyphs_8(stream:Pxcb_render_util_composite_text_stream_t; dx:Tint16_t; dy:Tint16_t; count:Tuint32_t; glyphs:Puint8_t);cdecl;external;
(* Const before type ignored *)
procedure xcb_render_util_glyphs_16(stream:Pxcb_render_util_composite_text_stream_t; dx:Tint16_t; dy:Tint16_t; count:Tuint32_t; glyphs:Puint16_t);cdecl;external;
(* Const before type ignored *)
procedure xcb_render_util_glyphs_32(stream:Pxcb_render_util_composite_text_stream_t; dx:Tint16_t; dy:Tint16_t; count:Tuint32_t; glyphs:Puint32_t);cdecl;external;
procedure xcb_render_util_change_glyphset(stream:Pxcb_render_util_composite_text_stream_t; glyphset:Txcb_render_glyphset_t);cdecl;external;
function xcb_render_util_composite_text(xc:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; stream:Pxcb_render_util_composite_text_stream_t):Txcb_void_cookie_t;cdecl;external;
function xcb_render_util_composite_text_checked(xc:Pxcb_connection_t; op:Tuint8_t; src:Txcb_render_picture_t; dst:Txcb_render_picture_t; mask_format:Txcb_render_pictformat_t; 
           src_x:Tint16_t; src_y:Tint16_t; stream:Pxcb_render_util_composite_text_stream_t):Txcb_void_cookie_t;cdecl;external;
procedure xcb_render_util_composite_text_free(stream:Pxcb_render_util_composite_text_stream_t);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ XCB_RENDERUTIL  }

implementation


end.
