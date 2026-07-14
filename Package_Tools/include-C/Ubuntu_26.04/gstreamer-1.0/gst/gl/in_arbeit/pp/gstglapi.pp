
unit gstglapi;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglapi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglapi.h
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
Pgchar  = ^gchar;
PGstGLAPI  = ^GstGLAPI;
PGstGLPlatform  = ^GstGLPlatform;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2012 Matthew Waters <ystreet00@gmail.com>
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
{$ifndef __extern_H__}
{$define __extern_H__}
{$include <gst/gl/gstglconfig.h>}
{$include <gst/gl/gl-prelude.h>}
{$include <gst/gst.h>}
{*
 * GstGLAPI:
 * @extern_NONE: no API
 * @extern_OPENGL: Desktop OpenGL up to and including 3.1.  The
 *                    compatibility profile when the OpenGL version is >= 3.2
 * @extern_OPENGL3: Desktop OpenGL >= 3.2 core profile
 * @extern_GLES1: OpenGL ES 1.x
 * @extern_GLES2: OpenGL ES 2.x and 3.x
 * @extern_ANY: Any OpenGL API
  }
{< underscore_name=gst_gl_api > }type
  PGstGLAPI = ^TGstGLAPI;
  TGstGLAPI =  Longint;
  Const
    extern_NONE = 0;
    extern_OPENGL = 1 shl 0;
    extern_OPENGL3 = 1 shl 1;
    extern_GLES1 = 1 shl 15;
    extern_GLES2 = 1 shl 16;
    extern_ANY = G_MAXUINT32;
;
{*
 * extern_OPENGL_NAME:
 *
 * The name for %extern_OPENGL used in various places
  }
  extern_OPENGL_NAME = 'opengl';  
{*
 * extern_OPENGL3_NAME:
 *
 * The name for %extern_OPENGL3 used in various places
  }
  extern_OPENGL3_NAME = 'opengl3';  
{*
 * extern_GLES1_NAME:
 *
 * The name for %extern_GLES1 used in various places
  }
  extern_GLES1_NAME = 'gles1';  
{*
 * extern_GLES2_NAME:
 *
 * The name for %extern_GLES2 used in various places
  }
  extern_GLES2_NAME = 'gles2';  
{*
 * GstGLPlatform:
 * @GST_GL_PLATFORM_NONE: no platform
 * @GST_GL_PLATFORM_EGL: the EGL platform used primarily with the X11, wayland
 *                      and android window systems as well as on embedded Linux
 * @GST_GL_PLATFORM_GLX: the GLX platform used primarily with the X11 window system
 * @GST_GL_PLATFORM_WGL: the WGL platform used primarily on Windows
 * @GST_GL_PLATFORM_CGL: the CGL platform used primarily on OS X
 * @GST_GL_PLATFORM_EAGL: the EAGL platform used primarily on iOS
 * @GST_GL_PLATFORM_ANY: any OpenGL platform
  }
type
  PGstGLPlatform = ^TGstGLPlatform;
  TGstGLPlatform =  Longint;
  Const
    GST_GL_PLATFORM_NONE = 0;
    GST_GL_PLATFORM_EGL = 1 shl 0;
    GST_GL_PLATFORM_GLX = 1 shl 1;
    GST_GL_PLATFORM_WGL = 1 shl 2;
    GST_GL_PLATFORM_CGL = 1 shl 3;
    GST_GL_PLATFORM_EAGL = 1 shl 4;
    GST_GL_PLATFORM_ANY = G_MAXUINT32;
;

function gst_gl_api_to_string(api:TGstGLAPI):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_gl_api_from_string(api_s:Pgchar):TGstGLAPI;cdecl;external;
function gst_gl_platform_to_string(platform:TGstGLPlatform):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_gl_platform_from_string(platform_s:Pgchar):TGstGLPlatform;cdecl;external;
{$endif}
{ __extern_H__  }

implementation


end.
