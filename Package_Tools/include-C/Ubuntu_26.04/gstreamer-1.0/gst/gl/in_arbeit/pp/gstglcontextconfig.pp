
unit gstglcontextconfig;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglcontextconfig.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglcontextconfig.h
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
Pgchar  = ^gchar;
PGstGLConfigCaveat  = ^GstGLConfigCaveat;
PGstGLConfigSurfaceType  = ^GstGLConfigSurfaceType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2020 Matthew Waters <matthew@centricular.com>
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
{$ifndef __GST_GL_CONTEXT_CONFIG_H__}
{$define __GST_GL_CONTEXT_CONFIG_H__}
{$include <gst/gst.h>}
{$include <gst/gl/gstgl_fwd.h>}
{*
 * GST_GL_CONFIG_STRUCTURE_NAME:
 *
 * The canonical name of a #GstStructure that contains a configuration for a
 * #GstGLContext.
 *
 * Since: 1.20
  }

const
  GST_GL_CONFIG_STRUCTURE_NAME = 'gst-gl-context-config';  
{*
 * GST_GL_CONFIG_ATTRIB_NAME:
 *
 * Get a reference to the variable name of a particular configuration field.
 *
 * e.g. for `CONFIG_ID`: `GST_GL_CONFIG_ATTRIB_NAME (CONFIG_ID)`
 *
 * Since: 1.20
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GST_GL_CONFIG_ATTRIB_NAME(UPPER_NAME : longint) : longint;

{*
 * GST_GL_CONFIG_ATTRIB_GTYPE:
 *
 * Get a reference to the #GType of a particular configuration field.
 *
 * e.g. for `CONFIG_ID`: `GST_GL_CONFIG_ATTRIB_GTYPE (CONFIG_ID)`
 *
 * Since: 1.20
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONFIG_ATTRIB_GTYPE(UPPER_NAME : longint) : longint;

(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_CONFIG_ID_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_CONFIG_ID_GTYPE = G_TYPE_UINT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_PLATFORM_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_PLATFORM_GTYPE = GST_TYPE_GL_PLATFORM;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_CAVEAT_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_CAVEAT_GTYPE = GST_TYPE_GL_CONFIG_CAVEAT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_SURFACE_TYPE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_SURFACE_TYPE_GTYPE = GST_TYPE_GL_CONFIG_SURFACE_TYPE;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_CONFORMANT_API_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_CONFORMANT_API_GTYPE = GST_TYPE_GL_API;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_RENDERABLE_API_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_RENDERABLE_API_GTYPE = GST_TYPE_GL_API;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_RED_SIZE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_RED_SIZE_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_GREEN_SIZE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_GREEN_SIZE_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_BLUE_SIZE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_BLUE_SIZE_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_ALPHA_SIZE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_ALPHA_SIZE_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_LUMINANCE_SIZE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_LUMINANCE_SIZE_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_DEPTH_SIZE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_DEPTH_SIZE_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_STENCIL_SIZE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_STENCIL_SIZE_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_WIDTH_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_WIDTH_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_HEIGHT_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_HEIGHT_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_PIXELS_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_MAX_PBUFFER_PIXELS_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_SAMPLE_BUFFERS_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_SAMPLE_BUFFERS_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_SAMPLES_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_SAMPLES_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_NATIVE_RENDERABLE_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_NATIVE_RENDERABLE_GTYPE = G_TYPE_BOOLEAN;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_NATIVE_VISUAL_ID_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_NATIVE_VISUAL_ID_GTYPE = G_TYPE_UINT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_LEVEL_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_LEVEL_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_MIN_SWAP_INTERVAL_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_MIN_SWAP_INTERVAL_GTYPE = G_TYPE_INT;  
(* Const before type ignored *)
  var
    GST_GL_CONFIG_ATTRIB_MAX_SWAP_INTERVAL_NAME : Pchar;cvar;external;

const
  GST_GL_CONFIG_ATTRIB_MAX_SWAP_INTERVAL_GTYPE = G_TYPE_INT;  
{*
 * GST_GL_CONFIG_STRUCTURE_SET_ARGS:
 *
 * Since: 1.20
  }
{*
 * GstGLConfigCaveat:
 * @GST_GL_CONFIG_CAVEAT_NONE: none
 * @GST_GL_CONFIG_CAVEAT_SLOW: slow
 * @GST_GL_CONFIG_CAVEAT_NON_CONFORMANT: non-conformant
 *
 * Since: 1.20
  }
type
  PGstGLConfigCaveat = ^TGstGLConfigCaveat;
  TGstGLConfigCaveat =  Longint;
  Const
    GST_GL_CONFIG_CAVEAT_NONE = 0;
    GST_GL_CONFIG_CAVEAT_SLOW = 1;
    GST_GL_CONFIG_CAVEAT_NON_CONFORMANT = 2;
;
(* Const before type ignored *)

function gst_gl_config_caveat_to_string(caveat:TGstGLConfigCaveat):Pgchar;cdecl;external;
{*
 * GstGLConfigSurfaceType:
 * @GST_GL_CONFIG_SURFACE_TYPE_NONE: none
 * @GST_GL_CONFIG_SURFACE_TYPE_WINDOW: window
 * @GST_GL_CONFIG_SURFACE_TYPE_PBUFFER: pbuffer
 * @GST_GL_CONFIG_SURFACE_TYPE_PIXMAP: pixmap
 *
 * Since: 1.20
  }
type
  PGstGLConfigSurfaceType = ^TGstGLConfigSurfaceType;
  TGstGLConfigSurfaceType =  Longint;
  Const
    GST_GL_CONFIG_SURFACE_TYPE_NONE = 0;
    GST_GL_CONFIG_SURFACE_TYPE_WINDOW = 1 shl 0;
    GST_GL_CONFIG_SURFACE_TYPE_PBUFFER = 1 shl 1;
    GST_GL_CONFIG_SURFACE_TYPE_PIXMAP = 1 shl 2;
;
(* Const before type ignored *)

function gst_gl_config_surface_type_to_string(surface_type:TGstGLConfigSurfaceType):Pgchar;cdecl;external;
{$endif}
{ __GST_GL_CONTEXT_CONFIG_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONFIG_ATTRIB_NAME(UPPER_NAME : longint) : longint;
begin
  GST_GL_CONFIG_ATTRIB_NAME:=G_PASTE(G_PASTE(GST_GL_CONFIG_ATTRIB_,UPPER_NAME),_NAME);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_CONFIG_ATTRIB_GTYPE(UPPER_NAME : longint) : longint;
begin
  GST_GL_CONFIG_ATTRIB_GTYPE:=G_PASTE(G_PASTE(GST_GL_CONFIG_ATTRIB_,UPPER_NAME),_GTYPE);
end;


end.
