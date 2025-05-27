
unit gdk_pixbuf_xlib;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdk_pixbuf_xlib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixbuf_xlib.h
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
PDisplay  = ^Display;
PGdkPixbuf  = ^GdkPixbuf;
PPixmap  = ^Pixmap;
PVisual  = ^Visual;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GdkPixbuf library - Xlib header file
 *
 * Authors: John Harper <john@dcs.warwick.ac.uk>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GDK_PIXBUF_XLIB_H}
{$define GDK_PIXBUF_XLIB_H}
{$include <gdk-pixbuf/gdk-pixbuf.h>}
{$include <gdk-pixbuf-xlib/gdk-pixbuf-xlibrgb.h>}
{$include <X11/Xlib.h>}
{ init  }

procedure gdk_pixbuf_xlib_init(display:PDisplay; screen_num:longint);cdecl;external;
procedure gdk_pixbuf_xlib_init_with_depth(display:PDisplay; screen_num:longint; prefDepth:longint);cdecl;external;
{ render  }
procedure gdk_pixbuf_xlib_render_threshold_alpha(pixbuf:PGdkPixbuf; bitmap:TPixmap; src_x:longint; src_y:longint; dest_x:longint; 
            dest_y:longint; width:longint; height:longint; alpha_threshold:longint);cdecl;external;
procedure gdk_pixbuf_xlib_render_to_drawable(pixbuf:PGdkPixbuf; drawable:TDrawable; gc:TGC; src_x:longint; src_y:longint; 
            dest_x:longint; dest_y:longint; width:longint; height:longint; dither:TXlibRgbDither; 
            x_dither:longint; y_dither:longint);cdecl;external;
procedure gdk_pixbuf_xlib_render_to_drawable_alpha(pixbuf:PGdkPixbuf; drawable:TDrawable; src_x:longint; src_y:longint; dest_x:longint; 
            dest_y:longint; width:longint; height:longint; alpha_mode:TGdkPixbufAlphaMode; alpha_threshold:longint; 
            dither:TXlibRgbDither; x_dither:longint; y_dither:longint);cdecl;external;
procedure gdk_pixbuf_xlib_render_pixmap_and_mask(pixbuf:PGdkPixbuf; pixmap_return:PPixmap; mask_return:PPixmap; alpha_threshold:longint);cdecl;external;
{ drawable  }
function gdk_pixbuf_xlib_get_from_drawable(dest:PGdkPixbuf; src:TDrawable; cmap:TColormap; visual:PVisual; src_x:longint; 
           src_y:longint; dest_x:longint; dest_y:longint; width:longint; height:longint):PGdkPixbuf;cdecl;external;
{$endif}
{ GDK_PIXBUF_XLIB_H  }

implementation


end.
