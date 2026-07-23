
unit encoding_profile;
interface

{
  Automatically converted by H2Pas 1.0.0 from encoding_profile.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    encoding_profile.h
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
Pgchar  = ^gchar;
PGList  = ^GList;
PGObject  = ^GObject;
PGstCaps  = ^GstCaps;
PGstDiscovererInfo  = ^GstDiscovererInfo;
PGstEncodingAudioProfile  = ^GstEncodingAudioProfile;
PGstEncodingContainerProfile  = ^GstEncodingContainerProfile;
PGstEncodingProfile  = ^GstEncodingProfile;
PGstEncodingVideoProfile  = ^GstEncodingVideoProfile;
PGstStructure  = ^GstStructure;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer encoding profiles library
 * Copyright (C) 2009-2010 Edward Hervey <edward.hervey@collabora.co.uk>
 *           (C) 2009-2010 Nokia Corporation
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
{$ifndef __GST_PROFILE_H__}
{$define __GST_PROFILE_H__}
{$include <gst/gst.h>}
{$include <gst/pbutils/pbutils-enumtypes.h>}
{$include <gst/pbutils/gstdiscoverer.h>}
{*
 * GstEncodingProfile:
 *
 * The opaque base class object for all encoding profiles. This contains generic
 * information like name, description, format and preset.
  }

{ was #define dname def_expr }
function GST_TYPE_ENCODING_PROFILE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_PROFILE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_PROFILE(obj : longint) : longint;

type

function gst_encoding_profile_get_type:TGType;cdecl;external;
{*
 * GstEncodingContainerProfile:
 *
 * Encoding profiles for containers. Keeps track of a list of #GstEncodingProfile
  }
{ was #define dname def_expr }
function GST_TYPE_ENCODING_CONTAINER_PROFILE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_CONTAINER_PROFILE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_CONTAINER_PROFILE(obj : longint) : longint;

type

function gst_encoding_container_profile_get_type:TGType;cdecl;external;
{*
 * GstEncodingVideoProfile:
 *
 * Variant of #GstEncodingProfile for video streams, allows specifying the @pass.
  }
{ was #define dname def_expr }
function GST_TYPE_ENCODING_VIDEO_PROFILE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_VIDEO_PROFILE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_VIDEO_PROFILE(obj : longint) : longint;

type

function gst_encoding_video_profile_get_type:TGType;cdecl;external;
{*
 * GstEncodingAudioProfile:
 *
 * Variant of #GstEncodingProfile for audio streams.
  }
{ was #define dname def_expr }
function GST_TYPE_ENCODING_AUDIO_PROFILE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_AUDIO_PROFILE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_AUDIO_PROFILE(obj : longint) : longint;

type

function gst_encoding_audio_profile_get_type:TGType;cdecl;external;
{ GstEncodingProfile API  }
{*
 * gst_encoding_profile_unref:
 * @profile: a #GstEncodingProfile
 *
 * Decreases the reference count of the @profile, possibly freeing the @profile.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_encoding_profile_unref(profile : longint) : longint;

{*
 * gst_encoding_profile_ref:
 * @profile: a #GstEncodingProfile
 *
 * Increases the reference count of the @profile.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_encoding_profile_ref(profile : longint) : longint;

(* Const before type ignored *)
function gst_encoding_profile_get_name(profile:PGstEncodingProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_encoding_profile_set_name(profile:PGstEncodingProfile; name:Pgchar);cdecl;external;
(* Const before type ignored *)
function gst_encoding_profile_get_description(profile:PGstEncodingProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_encoding_profile_set_description(profile:PGstEncodingProfile; description:Pgchar);cdecl;external;
function gst_encoding_profile_get_format(profile:PGstEncodingProfile):PGstCaps;cdecl;external;
procedure gst_encoding_profile_set_format(profile:PGstEncodingProfile; format:PGstCaps);cdecl;external;
function gst_encoding_profile_get_allow_dynamic_output(profile:PGstEncodingProfile):Tgboolean;cdecl;external;
procedure gst_encoding_profile_set_allow_dynamic_output(profile:PGstEncodingProfile; allow_dynamic_output:Tgboolean);cdecl;external;
function gst_encoding_profile_get_single_segment(profile:PGstEncodingProfile):Tgboolean;cdecl;external;
procedure gst_encoding_profile_set_single_segment(profile:PGstEncodingProfile; single_segment:Tgboolean);cdecl;external;
(* Const before type ignored *)
function gst_encoding_profile_get_preset(profile:PGstEncodingProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_encoding_profile_get_preset_name(profile:PGstEncodingProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gst_encoding_profile_set_preset(profile:PGstEncodingProfile; preset:Pgchar);cdecl;external;
function gst_encoding_profile_get_presence(profile:PGstEncodingProfile):Tguint;cdecl;external;
procedure gst_encoding_profile_set_presence(profile:PGstEncodingProfile; presence:Tguint);cdecl;external;
(* Const before type ignored *)
procedure gst_encoding_profile_set_preset_name(profile:PGstEncodingProfile; preset_name:Pgchar);cdecl;external;
function gst_encoding_profile_get_restriction(profile:PGstEncodingProfile):PGstCaps;cdecl;external;
procedure gst_encoding_profile_set_restriction(profile:PGstEncodingProfile; restriction:PGstCaps);cdecl;external;
function gst_encoding_profile_is_equal(a:PGstEncodingProfile; b:PGstEncodingProfile):Tgboolean;cdecl;external;
function gst_encoding_profile_get_input_caps(profile:PGstEncodingProfile):PGstCaps;cdecl;external;
(* Const before type ignored *)
function gst_encoding_profile_get_type_nick(profile:PGstEncodingProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
function gst_encoding_profile_get_file_extension(profile:PGstEncodingProfile):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_encoding_profile_find(targetname:Pgchar; profilename:Pgchar; category:Pgchar):PGstEncodingProfile;cdecl;external;
function gst_encoding_profile_is_enabled(profile:PGstEncodingProfile):Tgboolean;cdecl;external;
procedure gst_encoding_profile_set_enabled(profile:PGstEncodingProfile; enabled:Tgboolean);cdecl;external;
{ GstEncodingContainerProfile API  }
function gst_encoding_container_profile_add_profile(container:PGstEncodingContainerProfile; profile:PGstEncodingProfile):Tgboolean;cdecl;external;
function gst_encoding_container_profile_contains_profile(container:PGstEncodingContainerProfile; profile:PGstEncodingProfile):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_encoding_container_profile_get_profiles(profile:PGstEncodingContainerProfile):PGList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gst_encoding_container_profile_new(name:Pgchar; description:Pgchar; format:PGstCaps; preset:Pgchar):PGstEncodingContainerProfile;cdecl;external;
{ Individual stream encodingprofile API  }
(* Const before type ignored *)
function gst_encoding_video_profile_new(format:PGstCaps; preset:Pgchar; restriction:PGstCaps; presence:Tguint):PGstEncodingVideoProfile;cdecl;external;
(* Const before type ignored *)
function gst_encoding_audio_profile_new(format:PGstCaps; preset:Pgchar; restriction:PGstCaps; presence:Tguint):PGstEncodingAudioProfile;cdecl;external;
function gst_encoding_video_profile_get_pass(prof:PGstEncodingVideoProfile):Tguint;cdecl;external;
function gst_encoding_video_profile_get_variableframerate(prof:PGstEncodingVideoProfile):Tgboolean;cdecl;external;
procedure gst_encoding_video_profile_set_pass(prof:PGstEncodingVideoProfile; pass:Tguint);cdecl;external;
procedure gst_encoding_video_profile_set_variableframerate(prof:PGstEncodingVideoProfile; variableframerate:Tgboolean);cdecl;external;
function gst_encoding_profile_from_discoverer(info:PGstDiscovererInfo):PGstEncodingProfile;cdecl;external;
function gst_encoding_profile_copy(self:PGstEncodingProfile):PGstEncodingProfile;cdecl;external;
(* Const before type ignored *)
function gst_encoding_profile_from_string(_string:Pgchar):PGstEncodingProfile;cdecl;external;
function gst_encoding_profile_to_string(profile:PGstEncodingProfile):Pgchar;cdecl;external;
procedure gst_encoding_profile_set_element_properties(self:PGstEncodingProfile; element_properties:PGstStructure);cdecl;external;
function gst_encoding_profile_get_element_properties(self:PGstEncodingProfile):PGstStructure;cdecl;external;
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstEncodingAudioProfile, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstEncodingContainerProfile, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstEncodingProfile, gst_object_unref) }
{//////////////////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC                  (GstEncodingVideoProfile, gst_object_unref) }
{$endif}
{ __GST_PROFILE_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_ENCODING_PROFILE : longint; { return type might be wrong }
  begin
    GST_TYPE_ENCODING_PROFILE:=gst_encoding_profile_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_PROFILE(obj : longint) : longint;
begin
  GST_ENCODING_PROFILE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ENCODING_PROFILE,GstEncodingProfile);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_PROFILE(obj : longint) : longint;
begin
  GST_IS_ENCODING_PROFILE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ENCODING_PROFILE);
end;

{ was #define dname def_expr }
function GST_TYPE_ENCODING_CONTAINER_PROFILE : longint; { return type might be wrong }
  begin
    GST_TYPE_ENCODING_CONTAINER_PROFILE:=gst_encoding_container_profile_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_CONTAINER_PROFILE(obj : longint) : longint;
begin
  GST_ENCODING_CONTAINER_PROFILE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ENCODING_CONTAINER_PROFILE,GstEncodingContainerProfile);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_CONTAINER_PROFILE(obj : longint) : longint;
begin
  GST_IS_ENCODING_CONTAINER_PROFILE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ENCODING_CONTAINER_PROFILE);
end;

{ was #define dname def_expr }
function GST_TYPE_ENCODING_VIDEO_PROFILE : longint; { return type might be wrong }
  begin
    GST_TYPE_ENCODING_VIDEO_PROFILE:=gst_encoding_video_profile_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_VIDEO_PROFILE(obj : longint) : longint;
begin
  GST_ENCODING_VIDEO_PROFILE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ENCODING_VIDEO_PROFILE,GstEncodingVideoProfile);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_VIDEO_PROFILE(obj : longint) : longint;
begin
  GST_IS_ENCODING_VIDEO_PROFILE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ENCODING_VIDEO_PROFILE);
end;

{ was #define dname def_expr }
function GST_TYPE_ENCODING_AUDIO_PROFILE : longint; { return type might be wrong }
  begin
    GST_TYPE_ENCODING_AUDIO_PROFILE:=gst_encoding_audio_profile_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ENCODING_AUDIO_PROFILE(obj : longint) : longint;
begin
  GST_ENCODING_AUDIO_PROFILE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_ENCODING_AUDIO_PROFILE,GstEncodingAudioProfile);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_ENCODING_AUDIO_PROFILE(obj : longint) : longint;
begin
  GST_IS_ENCODING_AUDIO_PROFILE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_ENCODING_AUDIO_PROFILE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_encoding_profile_unref(profile : longint) : longint;
begin
  gst_encoding_profile_unref:=g_object_unref(PGObject(profile));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function gst_encoding_profile_ref(profile : longint) : longint;
begin
  gst_encoding_profile_ref:=g_object_ref(PGObject(profile));
end;


end.
