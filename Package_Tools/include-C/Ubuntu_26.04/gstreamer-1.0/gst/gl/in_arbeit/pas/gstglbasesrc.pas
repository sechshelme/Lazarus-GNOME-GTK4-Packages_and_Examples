unit gstglbasesrc;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) <1999> Erik Walthinsen <omega@cse.ogi.edu>
 * Copyright (C) 2002,2007 David A. Schleef <ds@schleef.org>
 * Copyright (C) 2008 Julien Isorce <julien.isorce@gmail.com>
 * Copyright (C) 2019 Philippe Normand <philn@igalia.com>
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
{$ifndef __GST_GL_BASE_SRC_H__}
{$define __GST_GL_BASE_SRC_H__}
{$include <gst/base/gstpushsrc.h>}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_base_src_get_type:TGType;cdecl;external libgstgl;
{*
 * GstGLBaseSrc:
 * @display: the currently configured #GstGLDisplay
 * @context: the currently configured #GstGLContext
 * @out_caps: the currently configured output #GstCaps
 * @out_info: the currently configured output #GstVideoInfo
 * @running_time: the total running time
 *
 * The parent instance type of a base GStreamer GL Video source.
 *
 * Since: 1.18
  }
{< public > }
{ video state  }
{ total running time  }
{< private > }
type
  PGstGLBaseSrc = ^TGstGLBaseSrc;
  TGstGLBaseSrc = record
      parent : TGstPushSrc;
      display : PGstGLDisplay;
      context : PGstGLContext;
      out_info : TGstVideoInfo;
      out_caps : PGstCaps;
      running_time : TGstClockTime;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
      priv : PGstGLBaseSrcPrivate;
    end;

{*
 * GstGLBaseSrcClass:
 * @supported_gl_api: the logical-OR of #GstGLAPI's supported by this element
 * @gl_start: called in the GL thread to setup the element GL state.
 * @gl_stop: called in the GL thread to setup the element GL state.
 * @fill_gl_memory: called in the GL thread to fill the current video texture.
 *
 * The base class for GStreamer GL Video sources.
 *
 * Since: 1.18
  }
{< public > }
{< private > }
  PGstGLBaseSrcClass = ^TGstGLBaseSrcClass;
  TGstGLBaseSrcClass = record
      parent_class : TGstPushSrcClass;
      supported_gl_api : TGstGLAPI;
      gl_start : function (src:PGstGLBaseSrc):Tgboolean;cdecl;
      gl_stop : procedure (src:PGstGLBaseSrc);cdecl;
      fill_gl_memory : function (src:PGstGLBaseSrc; mem:PGstGLMemory):Tgboolean;cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_base_src_get_gl_context(base_src:PGstGLBaseSrc):PGstGLContext;cdecl;external libgstgl;
{$endif}
{ __GST_GL_BASE_SRC_H__  }

// === Konventiert am: 14-7-26 12:54:57 ===

function GST_TYPE_GL_BASE_SRC : TGType;
function GST_GL_BASE_SRC(obj : Pointer) : PGstGLBaseSrc;
function GST_GL_BASE_SRC_CLASS(klass : Pointer) : PGstGLBaseSrcClass;
function GST_IS_GL_BASE_SRC(obj : Pointer) : Tgboolean;
function GST_IS_GL_BASE_SRC_CLASS(klass : Pointer) : Tgboolean;
function GST_GL_BASE_SRC_GET_CLASS(obj : Pointer) : PGstGLBaseSrcClass;

implementation

function GST_TYPE_GL_BASE_SRC : TGType;
  begin
    GST_TYPE_GL_BASE_SRC:=gst_gl_base_src_get_type;
  end;

function GST_GL_BASE_SRC(obj : Pointer) : PGstGLBaseSrc;
begin
  Result := PGstGLBaseSrc(g_type_check_instance_cast(obj, GST_TYPE_GL_BASE_SRC));
end;

function GST_GL_BASE_SRC_CLASS(klass : Pointer) : PGstGLBaseSrcClass;
begin
  Result := PGstGLBaseSrcClass(g_type_check_class_cast(klass, GST_TYPE_GL_BASE_SRC));
end;

function GST_IS_GL_BASE_SRC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_BASE_SRC);
end;

function GST_IS_GL_BASE_SRC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_BASE_SRC);
end;

function GST_GL_BASE_SRC_GET_CLASS(obj : Pointer) : PGstGLBaseSrcClass;
begin
  Result := PGstGLBaseSrcClass(PGTypeInstance(obj)^.g_class);
end;



end.
