unit gdk_pixbuf_xlib;

interface

uses
  glib280;

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

procedure gdk_pixbuf_xlib_init(display:PDisplay; screen_num:longint);cdecl;external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_init_with_depth(display:PDisplay; screen_num:longint; prefDepth:longint);cdecl;external libgdk_pixbuf_xlib2;
{ render  }
procedure gdk_pixbuf_xlib_render_threshold_alpha(pixbuf:PGdkPixbuf; bitmap:TPixmap; src_x:longint; src_y:longint; dest_x:longint; 
            dest_y:longint; width:longint; height:longint; alpha_threshold:longint);cdecl;external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_render_to_drawable(pixbuf:PGdkPixbuf; drawable:TDrawable; gc:TGC; src_x:longint; src_y:longint; 
            dest_x:longint; dest_y:longint; width:longint; height:longint; dither:TXlibRgbDither; 
            x_dither:longint; y_dither:longint);cdecl;external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_render_to_drawable_alpha(pixbuf:PGdkPixbuf; drawable:TDrawable; src_x:longint; src_y:longint; dest_x:longint; 
            dest_y:longint; width:longint; height:longint; alpha_mode:TGdkPixbufAlphaMode; alpha_threshold:longint; 
            dither:TXlibRgbDither; x_dither:longint; y_dither:longint);cdecl;external libgdk_pixbuf_xlib2;
procedure gdk_pixbuf_xlib_render_pixmap_and_mask(pixbuf:PGdkPixbuf; pixmap_return:PPixmap; mask_return:PPixmap; alpha_threshold:longint);cdecl;external libgdk_pixbuf_xlib2;
{ drawable  }
function gdk_pixbuf_xlib_get_from_drawable(dest:PGdkPixbuf; src:TDrawable; cmap:TColormap; visual:PVisual; src_x:longint; 
           src_y:longint; dest_x:longint; dest_y:longint; width:longint; height:longint):PGdkPixbuf;cdecl;external libgdk_pixbuf_xlib2;
{$endif}
{ GDK_PIXBUF_XLIB_H  }

// === Konventiert am: 27-5-25 15:00:33 ===


implementation



end.
