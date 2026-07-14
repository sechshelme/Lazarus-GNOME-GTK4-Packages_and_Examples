
unit gstglbasemixer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglbasemixer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglbasemixer.h
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
PGstGLBaseMixer  = ^GstGLBaseMixer;
PGstGLBaseMixerClass  = ^GstGLBaseMixerClass;
PGstGLBaseMixerPad  = ^GstGLBaseMixerPad;
PGstGLBaseMixerPadClass  = ^GstGLBaseMixerPadClass;
PGstGLBaseMixerPrivate  = ^GstGLBaseMixerPrivate;
PGstGLContext  = ^GstGLContext;
PGstGLDisplay  = ^GstGLDisplay;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2009 Julien Isorce <julien.isorce@gmail.com>
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
{$ifndef __GST_GL_BASE_MIXER_H__}
{$define __GST_GL_BASE_MIXER_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/video/gstvideoaggregator.h>}
{$include <gst/gl/gstglcontext.h>}

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MIXER_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MIXER_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MIXER_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_PAD_GET_CLASS(obj : longint) : longint;

type
{*
 * GstGLBaseMixerPad:
 *
 * Since: 1.24
  }
{*
   * GstGLBaseMixerPad.parent:
   *
   * parent #GstVideoAggregatorPad
   *
   * Since: 1.24
    }
{< private > }
  PGstGLBaseMixerPad = ^TGstGLBaseMixerPad;
  TGstGLBaseMixerPad = record
      parent : TGstVideoAggregatorPad;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLBaseMixerPadClass:
 *
 * Since: 1.24
  }
{*
   * GstGLBaseMixerPadClass.parent_class:
   *
   * parent #GstVideoAggregatorPadClass
   *
   * Since: 1.24
    }
{< private > }
  PGstGLBaseMixerPadClass = ^TGstGLBaseMixerPadClass;
  TGstGLBaseMixerPadClass = record
      parent_class : TGstVideoAggregatorPadClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLBaseMixerPad, gst_object_unref); }

function gst_gl_base_mixer_pad_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MIXER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MIXER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MIXER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_GET_CLASS(obj : longint) : longint;

type
{*
 * GstGLBaseMixer:
 *
 * Since: 1.24
  }
{*
   * GstGLBaseMixer.parent:
   *
   * parent #GstVideoAggregator
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixer.display:
   *
   * the currently configured #GstGLDisplay
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixer.context:
   *
   * the currently configured #GstGLContext
   *
   * Since: 1.24
    }
{< private > }
  PGstGLBaseMixer = ^TGstGLBaseMixer;
  TGstGLBaseMixer = record
      parent : TGstVideoAggregator;
      display : PGstGLDisplay;
      context : PGstGLContext;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
      priv : PGstGLBaseMixerPrivate;
    end;

{*
 * GstGLBaseMixerClass:
 *
 * Since: 1.24
  }
{*
   * GstGLBaseMixerClass.parent_class:
   *
   * the parent #GstVideoAggregatorClass
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixerClass.supported_gl_api:
   *
   * the logical-OR of #GstGLAPI's supported by this element
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixerClass::gl_start:
   *
   * called in the GL thread to setup the element GL state.
   *
   * Returns: whether the start was successful
   *
   * Since: 1.24
    }
{*
   * GstGLBaseMixerClass::gl_stop:
   *
   * called in the GL thread to setup the element GL state.
   *
   * Since: 1.24
    }
{< private > }
  PGstGLBaseMixerClass = ^TGstGLBaseMixerClass;
  TGstGLBaseMixerClass = record
      parent_class : TGstVideoAggregatorClass;
      supported_gl_api : TGstGLAPI;
      gl_start : function (mix:PGstGLBaseMixer):Tgboolean;cdecl;
      gl_stop : procedure (mix:PGstGLBaseMixer);cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLBaseMixer, gst_object_unref); }

function gst_gl_base_mixer_get_type:TGType;cdecl;external;
function gst_gl_base_mixer_get_gl_context(mix:PGstGLBaseMixer):PGstGLContext;cdecl;external;
{$endif}
{ __GST_GL_BASE_MIXER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MIXER_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BASE_MIXER_PAD:=gst_gl_base_mixer_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_PAD(obj : longint) : longint;
begin
  GST_GL_BASE_MIXER_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_BASE_MIXER_PAD,GstGLBaseMixerPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_PAD_CLASS(klass : longint) : longint;
begin
  GST_GL_BASE_MIXER_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_BASE_MIXER_PAD,GstGLBaseMixerPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MIXER_PAD(obj : longint) : longint;
begin
  GST_IS_GL_BASE_MIXER_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_BASE_MIXER_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MIXER_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_BASE_MIXER_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_BASE_MIXER_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_PAD_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_BASE_MIXER_PAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_BASE_MIXER_PAD,GstGLBaseMixerPadClass);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MIXER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_BASE_MIXER:=gst_gl_base_mixer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER(obj : longint) : longint;
begin
  GST_GL_BASE_MIXER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_BASE_MIXER,GstGLBaseMixer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_CLASS(klass : longint) : longint;
begin
  GST_GL_BASE_MIXER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_BASE_MIXER,GstGLBaseMixerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MIXER(obj : longint) : longint;
begin
  GST_IS_GL_BASE_MIXER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_BASE_MIXER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_BASE_MIXER_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_BASE_MIXER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_BASE_MIXER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_BASE_MIXER_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_BASE_MIXER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_BASE_MIXER,GstGLBaseMixerClass);
end;


end.
