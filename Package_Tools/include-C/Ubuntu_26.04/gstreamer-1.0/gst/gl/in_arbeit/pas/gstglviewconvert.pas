unit gstglviewconvert;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
 * Copyright (C) 2014 Jan Schmidt <jan@centricular.com>
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
{$ifndef _GST_GL_VIEW_CONVERT_H_}
{$define _GST_GL_VIEW_CONVERT_H_}
{$include <gst/gstmemory.h>}
{$include <gst/video/video.h>}
{$include <gst/gl/gstgl_fwd.h>}

{ was #define dname def_expr }
function GST_TYPE_GL_VIEW_CONVERT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_VIEW_CONVERT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_VIEW_CONVERT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_VIEW_CONVERT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_VIEW_CONVERT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_VIEW_CONVERT_GET_CLASS(obj : longint) : longint;

{*
 * GstGLStereoDownmix:
 * @GST_GL_STEREO_DOWNMIX_ANAGLYPH_GREEN_MAGENTA_DUBOIS: Dubois optimised Green-Magenta anaglyph
 * @GST_GL_STEREO_DOWNMIX_ANAGLYPH_RED_CYAN_DUBOIS: Dubois optimised Red-Cyan anaglyph
 * @GST_GL_STEREO_DOWNMIX_ANAGLYPH_AMBER_BLUE_DUBOIS: Dubois optimised Amber-Blue anaglyph
 *
 * Output anaglyph type to generate when downmixing to mono
  }
type
  PGstGLStereoDownmix = ^TGstGLStereoDownmix;
  TGstGLStereoDownmix =  Longint;
  Const
    GST_GL_STEREO_DOWNMIX_ANAGLYPH_GREEN_MAGENTA_DUBOIS = 0;
    GST_GL_STEREO_DOWNMIX_ANAGLYPH_RED_CYAN_DUBOIS = 1;
    GST_GL_STEREO_DOWNMIX_ANAGLYPH_AMBER_BLUE_DUBOIS = 2;
;
{$ifndef GST_DISABLE_DEPRECATED}

const
  GST_TYPE_GL_STEREO_DOWNMIX_MODE_TYPE = GST_TYPE_GL_STEREO_DOWNMIX;  

function gst_gl_stereo_downmix_mode_get_type:TGType;cdecl;external libgstgl;
{$endif}
{*
 * GstGLViewConvert:
 *
 * #GstGLViewConvert is an opaque struct and should only be accessed through the
 * provided api.
  }
{< private > }
type
  PGstGLViewConvert = ^TGstGLViewConvert;
  TGstGLViewConvert = record
      object : TGstObject;
      context : PGstGLContext;
      shader : PGstGLShader;
      input_mode_override : TGstVideoMultiviewMode;
      input_flags_override : TGstVideoMultiviewFlags;
      output_mode_override : TGstVideoMultiviewMode;
      output_flags_override : TGstVideoMultiviewFlags;
      downmix_mode : TGstGLStereoDownmix;
      in_info : TGstVideoInfo;
      out_info : TGstVideoInfo;
      from_texture_target : TGstGLTextureTarget;
      to_texture_target : TGstGLTextureTarget;
      caps_passthrough : Tgboolean;
      initted : Tgboolean;
      reconfigure : Tgboolean;
      fbo : PGstGLFramebuffer;
      priv : PGstGLViewConvertPrivate;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

{*
 * GstGLViewConvertClass:
 *
 * Opaque #GstGLViewConvertClass struct
  }
{< private > }
  PGstGLViewConvertClass = ^TGstGLViewConvertClass;
  TGstGLViewConvertClass = record
      object_class : TGstObjectClass;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_view_convert_get_type:TGType;cdecl;external libgstgl;
function gst_gl_view_convert_new:PGstGLViewConvert;cdecl;external libgstgl;
function gst_gl_view_convert_set_caps(viewconvert:PGstGLViewConvert; in_caps:PGstCaps; out_caps:PGstCaps):Tgboolean;cdecl;external libgstgl;
function gst_gl_view_convert_transform_caps(viewconvert:PGstGLViewConvert; direction:TGstPadDirection; caps:PGstCaps; filter:PGstCaps):PGstCaps;cdecl;external libgstgl;
function gst_gl_view_convert_fixate_caps(viewconvert:PGstGLViewConvert; direction:TGstPadDirection; caps:PGstCaps; othercaps:PGstCaps):PGstCaps;cdecl;external libgstgl;
function gst_gl_view_convert_submit_input_buffer(viewconvert:PGstGLViewConvert; is_discont:Tgboolean; input:PGstBuffer):TGstFlowReturn;cdecl;external libgstgl;
function gst_gl_view_convert_get_output(viewconvert:PGstGLViewConvert; outbuf_ptr:PPGstBuffer):TGstFlowReturn;cdecl;external libgstgl;
function gst_gl_view_convert_perform(viewconvert:PGstGLViewConvert; inbuf:PGstBuffer):PGstBuffer;cdecl;external libgstgl;
procedure gst_gl_view_convert_reset(viewconvert:PGstGLViewConvert);cdecl;external libgstgl;
procedure gst_gl_view_convert_set_context(viewconvert:PGstGLViewConvert; context:PGstGLContext);cdecl;external libgstgl;
{$endif}
{ _GST_GL_VIEW_CONVERT_H_  }

// === Konventiert am: 14-7-26 13:09:23 ===


implementation


{ was #define dname def_expr }
function GST_TYPE_GL_VIEW_CONVERT : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_VIEW_CONVERT:=gst_gl_view_convert_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_VIEW_CONVERT(obj : longint) : longint;
begin
  GST_GL_VIEW_CONVERT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_GL_VIEW_CONVERT,GstGLViewConvert);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_VIEW_CONVERT(obj : longint) : longint;
begin
  GST_IS_GL_VIEW_CONVERT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_GL_VIEW_CONVERT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_VIEW_CONVERT_CLASS(klass : longint) : longint;
begin
  GST_GL_VIEW_CONVERT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GST_TYPE_GL_VIEW_CONVERT,GstGLViewConvertClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_GL_VIEW_CONVERT_CLASS(klass : longint) : longint;
begin
  GST_IS_GL_VIEW_CONVERT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GST_TYPE_GL_VIEW_CONVERT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_GL_VIEW_CONVERT_GET_CLASS(obj : longint) : longint;
begin
  GST_GL_VIEW_CONVERT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GST_TYPE_GL_VIEW_CONVERT,GstGLViewConvertClass);
end;


end.
