
unit gstgloverlaycompositor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstgloverlaycompositor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstgloverlaycompositor.h
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
PGQueue  = ^GQueue;
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstGLContext  = ^GstGLContext;
PGstGLOverlayCompositor  = ^GstGLOverlayCompositor;
PGstGLOverlayCompositorClass  = ^GstGLOverlayCompositorClass;
PGstGLShader  = ^GstGLShader;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2015 Lubosz Sarnecki <lubosz.sarnecki@collabora.co.uk>
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
{$ifndef __GST_GL_OVERLAY_COMPOSITOR_H__}
{$define __GST_GL_OVERLAY_COMPOSITOR_H__}
{$include <gst/video/video.h>}
{$include <gst/gl/gstgl_fwd.h>}

{ was #define dname def_expr }
function GST_TYPE_GL_OVERLAY_COMPOSITOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_OVERLAY_COMPOSITOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_OVERLAY_COMPOSITOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_OVERLAY_COMPOSITOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_OVERLAY_COMPOSITOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_OVERLAY_COMPOSITOR_CAST(obj : longint) : PGstGLOverlayCompositor;

function gst_gl_overlay_compositor_get_type:TGType;cdecl;external;
{*
 * GstGLOverlayCompositor:
 *
 * Opaque #GstGLOverlayCompositor object
  }
{< private > }
type
  PGstGLOverlayCompositor = ^TGstGLOverlayCompositor;
  TGstGLOverlayCompositor = record
      parent : TGstObject;
      context : PGstGLContext;
      last_window_width : Tguint;
      last_window_height : Tguint;
      overlays : PGQueue;
      shader : PGstGLShader;
      position_attrib : Tgint;
      texcoord_attrib : Tgint;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLOverlayCompositorClass:
 *
  }
{< private > }
  PGstGLOverlayCompositorClass = ^TGstGLOverlayCompositorClass;
  TGstGLOverlayCompositorClass = record
      object_class : TGstObjectClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_overlay_compositor_new(context:PGstGLContext):PGstGLOverlayCompositor;cdecl;external;
procedure gst_gl_overlay_compositor_free_overlays(compositor:PGstGLOverlayCompositor);cdecl;external;
procedure gst_gl_overlay_compositor_upload_overlays(compositor:PGstGLOverlayCompositor; buf:PGstBuffer);cdecl;external;
procedure gst_gl_overlay_compositor_draw_overlays(compositor:PGstGLOverlayCompositor);cdecl;external;
function gst_gl_overlay_compositor_add_caps(caps:PGstCaps):PGstCaps;cdecl;external;
{$endif}
{ __GST_GL_OVERLAY_COMPOSITOR_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_OVERLAY_COMPOSITOR : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_OVERLAY_COMPOSITOR:=gst_gl_overlay_compositor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_OVERLAY_COMPOSITOR(obj : longint) : longint;
begin
  GST_GL_OVERLAY_COMPOSITOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_OVERLAY_COMPOSITOR,GstGLOverlayCompositor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_OVERLAY_COMPOSITOR_CLASS(klass : longint) : longint;
begin
  GST_GL_OVERLAY_COMPOSITOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_OVERLAY_COMPOSITOR,GstGLOverlayCompositorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_OVERLAY_COMPOSITOR(obj : longint) : longint;
begin
  GST_IS_GL_OVERLAY_COMPOSITOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_OVERLAY_COMPOSITOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_OVERLAY_COMPOSITOR_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_OVERLAY_COMPOSITOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_OVERLAY_COMPOSITOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_OVERLAY_COMPOSITOR_CAST(obj : longint) : PGstGLOverlayCompositor;
begin
  GST_GL_OVERLAY_COMPOSITOR_CAST:=PGstGLOverlayCompositor(obj);
end;


end.
