
unit gstgl_enums;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstgl_enums.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstgl_enums.h
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
PGstGLTextureTarget  = ^GstGLTextureTarget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Matthew Waters <matthew@centricular.com>
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef _GST_GL_ENUMS_H_}
{$define _GST_GL_ENUMS_H_}
{*
 * GstGLTextureTarget:
 * @GST_GL_TEXTURE_TARGET_NONE: no texture target
 * @GST_GL_TEXTURE_TARGET_2D: 2D texture target (`GL_TEXTURE_2D`)
 * @GST_GL_TEXTURE_TARGET_RECTANGLE: rectangle texture target
 *     (`GL_TEXTURE_RECTANGLE`)
 * @GST_GL_TEXTURE_TARGET_EXTERNAL_OES: external oes texture target
 *     (`GL_TEXTURE_EXTERNAL_OES`)
 *
 * The OpenGL texture target that an OpenGL texture can be bound to.  The
 * gst_gl_value_set_texture_target_from_mask(),
 * gst_gl_value_get_texture_target_mask(), and
 * gst_gl_value_set_texture_target() functions can be used for handling texture
 * targets with #GValue's when e.g. dealing with #GstCaps.
 *
 * Since: 1.8
  }
type
  PGstGLTextureTarget = ^TGstGLTextureTarget;
  TGstGLTextureTarget =  Longint;
  Const
    GST_GL_TEXTURE_TARGET_NONE = 0;
    GST_GL_TEXTURE_TARGET_2D = 1;
    GST_GL_TEXTURE_TARGET_RECTANGLE = 2;
    GST_GL_TEXTURE_TARGET_EXTERNAL_OES = 3;
;
{$endif}
{ _GST_GL_ENUMS_H_  }

implementation


end.
