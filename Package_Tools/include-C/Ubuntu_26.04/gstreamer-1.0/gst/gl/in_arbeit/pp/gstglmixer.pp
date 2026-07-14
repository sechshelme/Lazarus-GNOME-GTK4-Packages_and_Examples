
unit gstglmixer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstglmixer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstglmixer.h
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
PGstBuffer  = ^GstBuffer;
PGstCaps  = ^GstCaps;
PGstGLFramebuffer  = ^GstGLFramebuffer;
PGstGLMemory  = ^GstGLMemory;
PGstGLMixer  = ^GstGLMixer;
PGstGLMixerClass  = ^GstGLMixerClass;
PGstGLMixerPad  = ^GstGLMixerPad;
PGstGLMixerPadClass  = ^GstGLMixerPadClass;
PGstGLMixerPrivate  = ^GstGLMixerPrivate;
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
{$ifndef __GST_GL_MIXER_H__}
{$define __GST_GL_MIXER_H__}
{$include <gst/gst.h>}
{$include <gst/video/video.h>}
{$include <gst/gl/gstglbasemixer.h>}
type

{ was #define dname def_expr }
function GST_TYPE_GL_MIXER_PAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MIXER_PAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MIXER_PAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_PAD_GET_CLASS(obj : longint) : longint;

type
{*
 * GstGLMixerPad:
 *
 * Since: 1.24
  }
{*
   * GstGLMixerPad.parent:
   *
   * parent #GstGLBaseMixerPad
   *
   * Since: 1.24
    }
{*
   * GstGLMixerPad.current_texture:
   *
   * the current input texture for this pad
   *
   * Since: 1.24
    }
{< private > }
  PGstGLMixerPad = ^TGstGLMixerPad;
  TGstGLMixerPad = record
      parent : TGstGLBaseMixerPad;
      current_texture : Tguint;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLMixerPadClass:
 *
 * Since: 1.24
  }
{*
   * GstGLMixerPadClass.parent_class:
   *
   * parent #GstGLBaseMixerPadClass
   *
   * Since: 1.24
    }
{< private > }
  PGstGLMixerPadClass = ^TGstGLMixerPadClass;
  TGstGLMixerPadClass = record
      parent_class : TGstGLBaseMixerPadClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLMixerPad, gst_object_unref); }

function gst_gl_mixer_pad_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GST_TYPE_GL_MIXER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MIXER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MIXER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_GET_CLASS(obj : longint) : longint;

{*
 * GstGLMixer:
 *
 * Since: 1.24
  }
{*
   * GstGLMixer.parent:
   *
   * Since: 1.24
    }
{*
   * GstGLMixer.out_caps:
   *
   * the configured output #GstCaps
   *
   * Since: 1.24
    }
{< private > }
{< private > }
type
  PGstGLMixer = ^TGstGLMixer;
  TGstGLMixer = record
      parent : TGstGLBaseMixer;
      out_caps : PGstCaps;
      priv : PGstGLMixerPrivate;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLMixerClass:
 *
 * Since: 1.24
  }
{*
   * GstGLMixerClass.parent_class:
   *
   * Since: 1.24
    }
{*
   * GstGLMixerClass::process_buffers:
   *
   * Perform operations on the input buffers to produce an
   * output buffer.
   *
   * Since: 1.24
    }
{*
   * GstGLMixerClass::process_textures:
   *
   * perform operations with the input and output buffers mapped
   * as textures.  Will not be called if @process_buffers is overriden.
   *
   * Since: 1.24
    }
{< private > }
  PGstGLMixerClass = ^TGstGLMixerClass;
  TGstGLMixerClass = record
      parent_class : TGstGLBaseMixerClass;
      process_buffers : function (mix:PGstGLMixer; outbuf:PGstBuffer):Tgboolean;cdecl;
      process_textures : function (mix:PGstGLMixer; out_tex:PGstGLMemory):Tgboolean;cdecl;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{//////////G_DEFINE_AUTOPTR_CLEANUP_FUNC      (GstGLMixer, gst_object_unref); }

function gst_gl_mixer_get_type:TGType;cdecl;external;
procedure gst_gl_mixer_class_add_rgba_pad_templates(klass:PGstGLMixerClass);cdecl;external;
function gst_gl_mixer_process_textures(mix:PGstGLMixer; outbuf:PGstBuffer):Tgboolean;cdecl;external;
function gst_gl_mixer_get_framebuffer(mix:PGstGLMixer):PGstGLFramebuffer;cdecl;external;
{$endif}
{ __GST_GL_MIXER_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_GL_MIXER_PAD : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_MIXER_PAD:=gst_gl_mixer_pad_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_PAD(obj : longint) : longint;
begin
  GST_GL_MIXER_PAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_MIXER_PAD,GstGLMixerPad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_PAD_CLASS(klass : longint) : longint;
begin
  GST_GL_MIXER_PAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_MIXER_PAD,GstGLMixerPadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MIXER_PAD(obj : longint) : longint;
begin
  GST_IS_GL_MIXER_PAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_MIXER_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MIXER_PAD_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_MIXER_PAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_MIXER_PAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_PAD_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_MIXER_PAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_MIXER_PAD,GstGLMixerPadClass);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_MIXER : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_MIXER:=gst_gl_mixer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER(obj : longint) : longint;
begin
  GST_GL_MIXER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_MIXER,GstGLMixer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_CLASS(klass : longint) : longint;
begin
  GST_GL_MIXER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_MIXER,GstGLMixerClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MIXER(obj : longint) : longint;
begin
  GST_IS_GL_MIXER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_MIXER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_MIXER_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_MIXER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_MIXER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_MIXER_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_MIXER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_MIXER,GstGLMixerClass);
end;


end.
