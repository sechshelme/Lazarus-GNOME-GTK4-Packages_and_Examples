
unit gdk_pixbuf_xlibrgb;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdk_pixbuf_xlibrgb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixbuf_xlibrgb.h
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
Pbyte  = ^byte;
PDisplay  = ^Display;
Pguint32  = ^guint32;
PScreen  = ^Screen;
PVisual  = ^Visual;
PXlibRgbCmap  = ^XlibRgbCmap;
PXlibRgbDither  = ^XlibRgbDither;
PXVisualInfo  = ^XVisualInfo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*-
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "MPL"); you may not use this file except in
 * compliance with the MPL.  You may obtain a copy of the MPL at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the MPL is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the MPL
 * for the specific language governing rights and limitations under the
 * MPL.
 *
 * Alternatively, the contents of this file may be used under the
 * terms of the GNU Library General Public License (the "LGPL"), in
 * which case the provisions of the LGPL are applicable instead of
 * those above.  If you wish to allow use of your version of this file
 * only under the terms of the LGPL and not to allow others to use
 * your version of this file under the MPL, indicate your decision by
 * deleting the provisions above and replace them with the notice and
 * other provisions required by the LGPL.  If you do not delete the
 * provisions above, a recipient may use your version of this file
 * under either the MPL or the LGPL.
  }
{
 * This code is derived from GdkRgb.
 * For more information on GdkRgb, see http://www.levien.com/gdkrgb/
 * Raph Levien <raph@acm.org>
  }
{ Ported by Christopher Blizzard to Xlib.  With permission from the
 * original authors of this file, the contents of this file are also
 * redistributable under the terms of the Mozilla Public license.  For
 * information about the Mozilla Public License, please see the
 * license information at http://www.mozilla.org/MPL/
  }
{ This code is copyright the following authors:
 * Raph Levien          <raph@acm.org>
 * Manish Singh         <manish@gtk.org>
 * Tim Janik            <timj@gtk.org>
 * Peter Mattis         <petm@xcf.berkeley.edu>
 * Spencer Kimball      <spencer@xcf.berkeley.edu>
 * Josh MacDonald       <jmacd@xcf.berkeley.edu>
 * Christopher Blizzard <blizzard@redhat.com>
 * Owen Taylor          <otaylor@redhat.com>
 * Shawn T. Amundson    <amundson@gtk.org>
 }
{$ifndef __XLIB_RGB_H__}
{$define __XLIB_RGB_H__}
{$include <gdk-pixbuf/gdk-pixbuf.h>}
{$include <X11/Xlib.h>}
{$include <X11/Xutil.h>}
{*
 * XlibRgbCmap:
 * @colors: FIXME.
 * @lut: FIXME.
 * 
 *     FIXME: Describe this.
  }
type
{ for 8-bit modes  }
  PXlibRgbCmap = ^TXlibRgbCmap;
  TXlibRgbCmap = record
      colors : array[0..255] of dword;
      lut : array[0..255] of byte;
    end;


procedure xlib_rgb_init(display:PDisplay; screen:PScreen);cdecl;external;
procedure xlib_rgb_init_with_depth(display:PDisplay; screen:PScreen; prefDepth:longint);cdecl;external;
function xlib_rgb_xpixel_from_rgb(rgb:Tguint32):dword;cdecl;external;
procedure xlib_rgb_gc_set_foreground(gc:TGC; rgb:Tguint32);cdecl;external;
procedure xlib_rgb_gc_set_background(gc:TGC; rgb:Tguint32);cdecl;external;
{*
 * XlibRgbDither:
 * @XLIB_RGB_DITHER_NONE: Specifies no dithering.
 * @XLIB_RGB_DITHER_NORMAL: Specifies dithering only on pseudocolor
 *  displays.
 * @XLIB_RGB_DITHER_MAX: Specifies dithering on high color displays.
 * 
 * These values are used to specify which dithering method should be
 * used.  <symbol>XLIB_RGB_DITHER_NONE</symbol> will use no dithering
 * and simply map the colors in an RGB buffer to the closest colors
 * that the display can provide.
 * <symbol>XLIB_RGB_DITHER_NORMAL</symbol> will provide dithering
 * only on pseudocolor displays.
 * <symbol>XLIB_RGB_DITHER_MAX</symbol> will provide dithering on
 * pseudocolor and 16-bit truecolor or &ldquo;high color&rdquo;
 * displays.
  }
type
  PXlibRgbDither = ^TXlibRgbDither;
  TXlibRgbDither =  Longint;
  Const
    XLIB_RGB_DITHER_NONE = 0;
    XLIB_RGB_DITHER_NORMAL = 1;
    XLIB_RGB_DITHER_MAX = 2;
;

procedure xlib_draw_rgb_image(drawable:TDrawable; gc:TGC; x:longint; y:longint; width:longint; 
            height:longint; dith:TXlibRgbDither; rgb_buf:Pbyte; rowstride:longint);cdecl;external;
procedure xlib_draw_rgb_image_dithalign(drawable:TDrawable; gc:TGC; x:longint; y:longint; width:longint; 
            height:longint; dith:TXlibRgbDither; rgb_buf:Pbyte; rowstride:longint; xdith:longint; 
            ydith:longint);cdecl;external;
procedure xlib_draw_rgb_32_image(drawable:TDrawable; gc:TGC; x:longint; y:longint; width:longint; 
            height:longint; dith:TXlibRgbDither; buf:Pbyte; rowstride:longint);cdecl;external;
procedure xlib_draw_gray_image(drawable:TDrawable; gc:TGC; x:longint; y:longint; width:longint; 
            height:longint; dith:TXlibRgbDither; buf:Pbyte; rowstride:longint);cdecl;external;
function xlib_rgb_cmap_new(colors:Pguint32; n_colors:longint):PXlibRgbCmap;cdecl;external;
procedure xlib_rgb_cmap_free(cmap:PXlibRgbCmap);cdecl;external;
procedure xlib_draw_indexed_image(drawable:TDrawable; gc:TGC; x:longint; y:longint; width:longint; 
            height:longint; dith:TXlibRgbDither; buf:Pbyte; rowstride:longint; cmap:PXlibRgbCmap);cdecl;external;
{ Below are some functions which are primarily useful for debugging
   and experimentation.  }
function xlib_rgb_ditherable:TBool;cdecl;external;
procedure xlib_rgb_set_verbose(verbose:TBool);cdecl;external;
{ experimental colormap stuff  }
procedure xlib_rgb_set_install(install:TBool);cdecl;external;
procedure xlib_rgb_set_min_colors(min_colors:longint);cdecl;external;
function xlib_rgb_get_cmap:TColormap;cdecl;external;
function xlib_rgb_get_visual:PVisual;cdecl;external;
function xlib_rgb_get_visual_info:PXVisualInfo;cdecl;external;
function xlib_rgb_get_depth:longint;cdecl;external;
function xlib_rgb_get_display:PDisplay;cdecl;external;
function xlib_rgb_get_screen:PScreen;cdecl;external;
{$endif}
{ __XLIB_RGB_H__  }

implementation


end.
