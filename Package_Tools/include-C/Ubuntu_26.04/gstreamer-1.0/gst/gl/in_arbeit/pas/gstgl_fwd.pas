unit gstgl_fwd;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2013 Julien Isorce <julien.isorce@gmail.com>
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
{$ifndef __GST_GL_FWD_H__}
{$define __GST_GL_FWD_H__}
{$include <gst/gst.h>}
{$include <gst/gl/gstglapi.h>}
type
{$include <gst/gl/gstgl_enums.h>}
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLBaseFilter, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLBaseMemoryAllocator, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLBaseSrc, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLBufferAllocator, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLBufferPool, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLColorConvert, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLContext, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLDisplay, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLFilter, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLMemoryAllocator, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLMemoryPBOAllocator, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLOverlayCompositor, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLSLStage, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLShader, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLUpload, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLViewConvert, gst_object_unref) }
{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLWindow, gst_object_unref) }
{$endif}
{ __GST_GL_FWD_H__  }

// === Konventiert am: 14-7-26 13:00:50 ===


implementation



end.
