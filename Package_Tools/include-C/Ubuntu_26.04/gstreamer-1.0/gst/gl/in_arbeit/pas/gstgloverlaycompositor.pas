unit gstgloverlaycompositor;

interface

uses
  fp_glib2, fp_gst;

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

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_OVERLAY_COMPOSITOR_CAST(obj : longint) : PGstGLOverlayCompositor;

function gst_gl_overlay_compositor_get_type:TGType;cdecl;external libgstgl;
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


function gst_gl_overlay_compositor_new(context:PGstGLContext):PGstGLOverlayCompositor;cdecl;external libgstgl;
procedure gst_gl_overlay_compositor_free_overlays(compositor:PGstGLOverlayCompositor);cdecl;external libgstgl;
procedure gst_gl_overlay_compositor_upload_overlays(compositor:PGstGLOverlayCompositor; buf:PGstBuffer);cdecl;external libgstgl;
procedure gst_gl_overlay_compositor_draw_overlays(compositor:PGstGLOverlayCompositor);cdecl;external libgstgl;
function gst_gl_overlay_compositor_add_caps(caps:PGstCaps):PGstCaps;cdecl;external libgstgl;
{$endif}
{ __GST_GL_OVERLAY_COMPOSITOR_H__  }

// === Konventiert am: 14-7-26 13:07:01 ===

function GST_TYPE_GL_OVERLAY_COMPOSITOR : TGType;
function GST_GL_OVERLAY_COMPOSITOR(obj : Pointer) : PGstGLOverlayCompositor;
function GST_GL_OVERLAY_COMPOSITOR_CLASS(klass : Pointer) : PGstGLOverlayCompositorClass;
function GST_IS_GL_OVERLAY_COMPOSITOR(obj : Pointer) : Tgboolean;
function GST_IS_GL_OVERLAY_COMPOSITOR_CLASS(klass : Pointer) : Tgboolean;

implementation

function GST_TYPE_GL_OVERLAY_COMPOSITOR : TGType;
  begin
    GST_TYPE_GL_OVERLAY_COMPOSITOR:=gst_gl_overlay_compositor_get_type;
  end;

function GST_GL_OVERLAY_COMPOSITOR(obj : Pointer) : PGstGLOverlayCompositor;
begin
  Result := PGstGLOverlayCompositor(g_type_check_instance_cast(obj, GST_TYPE_GL_OVERLAY_COMPOSITOR));
end;

function GST_GL_OVERLAY_COMPOSITOR_CLASS(klass : Pointer) : PGstGLOverlayCompositorClass;
begin
  Result := PGstGLOverlayCompositorClass(g_type_check_class_cast(klass, GST_TYPE_GL_OVERLAY_COMPOSITOR));
end;

function GST_IS_GL_OVERLAY_COMPOSITOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_OVERLAY_COMPOSITOR);
end;

function GST_IS_GL_OVERLAY_COMPOSITOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_OVERLAY_COMPOSITOR);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_OVERLAY_COMPOSITOR_CAST(obj : longint) : PGstGLOverlayCompositor;
begin
  GST_GL_OVERLAY_COMPOSITOR_CAST:=PGstGLOverlayCompositor(obj);
end;


end.
