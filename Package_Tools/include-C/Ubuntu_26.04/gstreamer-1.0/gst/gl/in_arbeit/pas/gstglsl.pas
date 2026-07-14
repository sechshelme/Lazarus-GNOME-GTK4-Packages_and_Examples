unit gstglsl;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * GStreamer
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
{$ifndef __GST_GLSL_H__}
{$define __GST_GLSL_H__}
{$include <gst/gl/gstgl_fwd.h>}

function gst_glsl_error_quark:TGQuark;cdecl;external libgstgl;
{*
 * GST_GLSL_ERROR:
 *
 * Error domain for GStreamer's GLSL module. Errors in this domain will be
 * from the #GstGLSLError enumeration
  }
{ was #define dname def_expr }
function GST_GLSL_ERROR : longint; { return type might be wrong }

{*
 * GstGLSLError:
 * @GST_GLSL_ERROR_COMPILE: Compilation error occurred
 * @GST_GLSL_ERROR_LINK: Link error occurred
 * @GST_GLSL_ERROR_PROGRAM: General program error occurred
 *
 * Compilation stage that caused an error
 *
 * Since: 1.8
  }
type
  PGstGLSLError = ^TGstGLSLError;
  TGstGLSLError =  Longint;
  Const
    GST_GLSL_ERROR_COMPILE = 0;
    GST_GLSL_ERROR_LINK = 1;
    GST_GLSL_ERROR_PROGRAM = 2;
;
{*
 * GstGLSLVersion:
 * @GST_GLSL_VERSION_NONE: no version
 * @GST_GLSL_VERSION_100: version 100 (only valid for ES)
 * @GST_GLSL_VERSION_110: version 110 (only valid for compatibility desktop GL)
 * @GST_GLSL_VERSION_120: version 120 (only valid for compatibility desktop GL)
 * @GST_GLSL_VERSION_130: version 130 (only valid for compatibility desktop GL)
 * @GST_GLSL_VERSION_140: version 140 (only valid for compatibility desktop GL)
 * @GST_GLSL_VERSION_150: version 150 (valid for compatibility/core desktop GL)
 * @GST_GLSL_VERSION_300: version 300 (only valid for ES)
 * @GST_GLSL_VERSION_310: version 310 (only valid for ES)
 * @GST_GLSL_VERSION_320: version 320 (only valid for ES)
 * @GST_GLSL_VERSION_330: version 330 (valid for compatibility/core desktop GL)
 * @GST_GLSL_VERSION_400: version 400 (valid for compatibility/core desktop GL)
 * @GST_GLSL_VERSION_410: version 410 (valid for compatibility/core desktop GL)
 * @GST_GLSL_VERSION_420: version 420 (valid for compatibility/core desktop GL)
 * @GST_GLSL_VERSION_430: version 430 (valid for compatibility/core desktop GL)
 * @GST_GLSL_VERSION_440: version 440 (valid for compatibility/core desktop GL)
 * @GST_GLSL_VERSION_450: version 450 (valid for compatibility/core desktop GL)
 *
 * GLSL version list
 *
 * Since: 1.8
  }
{ ES  }
{ GL  }
{ GL  }
{ GL  }
{ GL  }
{ GL  }
{ ES  }
{ ES  }
{ ES  }
{ GL  }
{ GL  }
{ GL  }
{ GL  }
{ GL  }
{ GL  }
{ GL  }
type
  PGstGLSLVersion = ^TGstGLSLVersion;
  TGstGLSLVersion =  Longint;
  Const
    GST_GLSL_VERSION_NONE = 0;
    GST_GLSL_VERSION_100 = 100;
    GST_GLSL_VERSION_110 = 110;
    GST_GLSL_VERSION_120 = 120;
    GST_GLSL_VERSION_130 = 130;
    GST_GLSL_VERSION_140 = 140;
    GST_GLSL_VERSION_150 = 150;
    GST_GLSL_VERSION_300 = 300;
    GST_GLSL_VERSION_310 = 310;
    GST_GLSL_VERSION_320 = 320;
    GST_GLSL_VERSION_330 = 330;
    GST_GLSL_VERSION_400 = 400;
    GST_GLSL_VERSION_410 = 410;
    GST_GLSL_VERSION_420 = 420;
    GST_GLSL_VERSION_430 = 430;
    GST_GLSL_VERSION_440 = 440;
    GST_GLSL_VERSION_450 = 450;
;
{*
 * GstGLSLProfile:
 * @GST_GLSL_PROFILE_NONE: no profile supported/available
 * @GST_GLSL_PROFILE_ES: OpenGL|ES profile
 * @GST_GLSL_PROFILE_CORE: OpenGL core profile
 * @GST_GLSL_PROFILE_COMPATIBILITY: OpenGL compatibility profile
 * @GST_GLSL_PROFILE_ANY: any OpenGL/OpenGL|ES profile
 *
 * GLSL profiles
 *
 * Since: 1.8
  }
{ FIXME: For GST_GLSL_PROFILE_ANY ~0 -> 0xffffffff see
 * https://bugzilla.gnome.org/show_bug.cgi?id=732633
 }
{ XXX: maybe make GstGLAPI instead  }
type
  PGstGLSLProfile = ^TGstGLSLProfile;
  TGstGLSLProfile =  Longint;
  Const
    GST_GLSL_PROFILE_NONE = 0;
    GST_GLSL_PROFILE_ES = 1 shl 0;
    GST_GLSL_PROFILE_CORE = 1 shl 1;
    GST_GLSL_PROFILE_COMPATIBILITY = 1 shl 2;
    GST_GLSL_PROFILE_ANY = Tgint($ffffffff);
;

function gst_glsl_version_from_string(_string:Pgchar):TGstGLSLVersion;cdecl;external libgstgl;
function gst_glsl_version_to_string(version:TGstGLSLVersion):Pgchar;cdecl;external libgstgl;
function gst_glsl_profile_from_string(_string:Pgchar):TGstGLSLProfile;cdecl;external libgstgl;
function gst_glsl_profile_to_string(profile:TGstGLSLProfile):Pgchar;cdecl;external libgstgl;
function gst_glsl_version_profile_to_string(version:TGstGLSLVersion; profile:TGstGLSLProfile):Pgchar;cdecl;external libgstgl;
function gst_glsl_version_profile_from_string(_string:Pgchar; version_ret:PGstGLSLVersion; profile_ret:PGstGLSLProfile):Tgboolean;cdecl;external libgstgl;
function gst_glsl_string_get_version_profile(s:Pgchar; version:PGstGLSLVersion; profile:PGstGLSLProfile):Tgboolean;cdecl;external libgstgl;
function gst_gl_version_to_glsl_version(gl_api:TGstGLAPI; maj:Tgint; min:Tgint):TGstGLSLVersion;cdecl;external libgstgl;
function gst_gl_context_supports_glsl_profile_version(context:PGstGLContext; version:TGstGLSLVersion; profile:TGstGLSLProfile):Tgboolean;cdecl;external libgstgl;
function gst_gl_context_supports_precision(context:PGstGLContext; version:TGstGLSLVersion; profile:TGstGLSLProfile):Tgboolean;cdecl;external libgstgl;
function gst_gl_context_supports_precision_highp(context:PGstGLContext; version:TGstGLSLVersion; profile:TGstGLSLProfile):Tgboolean;cdecl;external libgstgl;
{$endif}
{ __GST_GLSL_H__  }

// === Konventiert am: 14-7-26 13:10:08 ===


implementation


{ was #define dname def_expr }
function GST_GLSL_ERROR : longint; { return type might be wrong }
  begin
    GST_GLSL_ERROR:=gst_glsl_error_quark;
  end;


end.
