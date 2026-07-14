
unit gstglbasefilter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglbasefilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglbasefilter.h
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
PGstCaps  = ^GstCaps;
PGstGLBaseFilter  = ^GstGLBaseFilter;
PGstGLBaseFilterClass  = ^GstGLBaseFilterClass;
PGstGLBaseFilterPrivate  = ^GstGLBaseFilterPrivate;
PGstGLContext  = ^GstGLContext;
PGstGLDisplay  = ^GstGLDisplay;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2007 David Schleef <ds@schleef.org>
 * Copyright (C) 2008 Julien Isorce <julien.isorce@gmail.com>
 * Copyright (C) 2008 Filippo Argiolas <filippo.argiolas@gmail.com>
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
{$ifndef _GST_GL_BASE_FILTER_H_}
{$define _GST_GL_BASE_FILTER_H_}
{$include <gst/base/gstbasetransform.h>}
{$include <gst/gl/gstgl_fwd.h>}

function gst_gl_base_filter_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_BASE_FILTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_FILTER_GET_CLASS(obj : longint) : longint;

{*
 * GstGLBaseFilter:
 * @display: the currently configured #GstGLDisplay
 * @context: the currently configured #GstGLContext
 * @in_caps: the currently configured input #GstCaps
 * @out_caps: the currently configured output #GstCaps
 *
 * The parent instance type of a base GStreamer GL Filter.
  }
{< public > }
{< private > }
type
  PGstGLBaseFilter = ^TGstGLBaseFilter;
  TGstGLBaseFilter = record
      parent : TGstBaseTransform;
      display : PGstGLDisplay;
      context : PGstGLContext;
      in_caps : PGstCaps;
      out_caps : PGstCaps;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
      priv : PGstGLBaseFilterPrivate;
    end;

{*
 * GstGLBaseFilterClass:
 * @supported_gl_api: the logical-OR of #GstGLAPI's supported by this element
 * @gl_start: called in the GL thread to setup the element GL state.
 * @gl_stop: called in the GL thread to setup the element GL state.
 * @gl_set_caps: called in the GL thread when caps are set on @filter.
 *               Note: this will also be called when changing OpenGL contexts
 *               where #GstBaseTransform::set_caps may not.
 *
 * The base class for GStreamer GL Filter.
  }
{< public > }
{< private > }
  PGstGLBaseFilterClass = ^TGstGLBaseFilterClass;
  TGstGLBaseFilterClass = record
      parent_class : TGstBaseTransformClass;
      supported_gl_api : TGstGLAPI;
      gl_start : function (filter:PGstGLBaseFilter):Tgboolean;cdecl;
      gl_stop : procedure (filter:PGstGLBaseFilter);cdecl;
      gl_set_caps : function (filter:PGstGLBaseFilter; incaps:PGstCaps; outcaps:PGstCaps):Tgboolean;cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_base_filter_find_gl_context(filter:PGstGLBaseFilter):Tgboolean;cdecl;external;
function gst_gl_base_filter_get_gl_context(filter:PGstGLBaseFilter):PGstGLContext;cdecl;external;
{$endif}
{ _GST_GL_BASE_FILTER_H_  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_FILTER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BASE_FILTER:=gst_gl_base_filter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_FILTER(obj : longint) : longint;
begin
  GST_GL_BASE_FILTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_BASE_FILTER,GstGLBaseFilter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_FILTER(obj : longint) : longint;
begin
  GST_IS_GL_BASE_FILTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_BASE_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_FILTER_CLASS(klass : longint) : longint;
begin
  GST_GL_BASE_FILTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_BASE_FILTER,GstGLBaseFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_FILTER_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_BASE_FILTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_BASE_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_FILTER_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_BASE_FILTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_BASE_FILTER,GstGLBaseFilterClass);
end;


end.
