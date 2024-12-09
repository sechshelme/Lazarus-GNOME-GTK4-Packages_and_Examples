
{$IFDEF read_interface}

type
  TGstEncodingProfile = record
  end;
  PGstEncodingProfile = ^TGstEncodingProfile;

  TGstEncodingContainerProfile = record
  end;
  PGstEncodingContainerProfile = ^TGstEncodingContainerProfile;

  TGstEncodingVideoProfile = record
  end;
  PGstEncodingVideoProfile = ^TGstEncodingVideoProfile;

  TGstEncodingAudioProfile = record
  end;
  PGstEncodingAudioProfile = ^TGstEncodingAudioProfile;

function gst_encoding_profile_get_type: TGType; cdecl; external libgstpbutils;
function gst_encoding_container_profile_get_type: TGType; cdecl; external libgstpbutils;
function gst_encoding_video_profile_get_type: TGType; cdecl; external libgstpbutils;
function gst_encoding_audio_profile_get_type: TGType; cdecl; external libgstpbutils;
function gst_encoding_profile_get_name(profile: PGstEncodingProfile): Pgchar; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_name(profile: PGstEncodingProfile; Name: Pgchar); cdecl; external libgstpbutils;
function gst_encoding_profile_get_description(profile: PGstEncodingProfile): Pgchar; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_description(profile: PGstEncodingProfile; description: Pgchar); cdecl; external libgstpbutils;
function gst_encoding_profile_get_format(profile: PGstEncodingProfile): PGstCaps; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_format(profile: PGstEncodingProfile; format: PGstCaps); cdecl; external libgstpbutils;
function gst_encoding_profile_get_allow_dynamic_output(profile: PGstEncodingProfile): Tgboolean; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_allow_dynamic_output(profile: PGstEncodingProfile; allow_dynamic_output: Tgboolean); cdecl; external libgstpbutils;
function gst_encoding_profile_get_single_segment(profile: PGstEncodingProfile): Tgboolean; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_single_segment(profile: PGstEncodingProfile; single_segment: Tgboolean); cdecl; external libgstpbutils;
function gst_encoding_profile_get_preset(profile: PGstEncodingProfile): Pgchar; cdecl; external libgstpbutils;
function gst_encoding_profile_get_preset_name(profile: PGstEncodingProfile): Pgchar; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_preset(profile: PGstEncodingProfile; preset: Pgchar); cdecl; external libgstpbutils;
function gst_encoding_profile_get_presence(profile: PGstEncodingProfile): Tguint; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_presence(profile: PGstEncodingProfile; presence: Tguint); cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_preset_name(profile: PGstEncodingProfile; preset_name: Pgchar); cdecl; external libgstpbutils;
function gst_encoding_profile_get_restriction(profile: PGstEncodingProfile): PGstCaps; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_restriction(profile: PGstEncodingProfile; restriction: PGstCaps); cdecl; external libgstpbutils;
function gst_encoding_profile_is_equal(a: PGstEncodingProfile; b: PGstEncodingProfile): Tgboolean; cdecl; external libgstpbutils;
function gst_encoding_profile_get_input_caps(profile: PGstEncodingProfile): PGstCaps; cdecl; external libgstpbutils;
function gst_encoding_profile_get_type_nick(profile: PGstEncodingProfile): Pgchar; cdecl; external libgstpbutils;
function gst_encoding_profile_get_file_extension(profile: PGstEncodingProfile): Pgchar; cdecl; external libgstpbutils;
function gst_encoding_profile_find(targetname: Pgchar; profilename: Pgchar; category: Pgchar): PGstEncodingProfile; cdecl; external libgstpbutils;
function gst_encoding_profile_is_enabled(profile: PGstEncodingProfile): Tgboolean; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_enabled(profile: PGstEncodingProfile; Enabled: Tgboolean); cdecl; external libgstpbutils;
function gst_encoding_container_profile_add_profile(container: PGstEncodingContainerProfile; profile: PGstEncodingProfile): Tgboolean; cdecl; external libgstpbutils;
function gst_encoding_container_profile_contains_profile(container: PGstEncodingContainerProfile; profile: PGstEncodingProfile): Tgboolean; cdecl; external libgstpbutils;
function gst_encoding_container_profile_get_profiles(profile: PGstEncodingContainerProfile): PGList; cdecl; external libgstpbutils;
function gst_encoding_container_profile_new(Name: Pgchar; description: Pgchar; format: PGstCaps; preset: Pgchar): PGstEncodingContainerProfile; cdecl; external libgstpbutils;
function gst_encoding_video_profile_new(format: PGstCaps; preset: Pgchar; restriction: PGstCaps; presence: Tguint): PGstEncodingVideoProfile; cdecl; external libgstpbutils;
function gst_encoding_audio_profile_new(format: PGstCaps; preset: Pgchar; restriction: PGstCaps; presence: Tguint): PGstEncodingAudioProfile; cdecl; external libgstpbutils;
function gst_encoding_video_profile_get_pass(prof: PGstEncodingVideoProfile): Tguint; cdecl; external libgstpbutils;
function gst_encoding_video_profile_get_variableframerate(prof: PGstEncodingVideoProfile): Tgboolean; cdecl; external libgstpbutils;
procedure gst_encoding_video_profile_set_pass(prof: PGstEncodingVideoProfile; pass: Tguint); cdecl; external libgstpbutils;
procedure gst_encoding_video_profile_set_variableframerate(prof: PGstEncodingVideoProfile; variableframerate: Tgboolean); cdecl; external libgstpbutils;
function gst_encoding_profile_from_discoverer(info: PGstDiscovererInfo): PGstEncodingProfile; cdecl; external libgstpbutils;
function gst_encoding_profile_copy(self: PGstEncodingProfile): PGstEncodingProfile; cdecl; external libgstpbutils;
procedure gst_encoding_profile_set_element_properties(self: PGstEncodingProfile; element_properties: PGstStructure); cdecl; external libgstpbutils;
function gst_encoding_profile_get_element_properties(self: PGstEncodingProfile): PGstStructure; cdecl; external libgstpbutils;

procedure gst_encoding_profile_unref(profile: Pointer);
function gst_encoding_profile_ref(profile: Pointer): Pointer;

// === Konventiert am: 27-9-24 15:57:10 ===

function GST_TYPE_ENCODING_PROFILE: TGType;
function GST_ENCODING_PROFILE(obj: Pointer): PGstEncodingProfile;
function GST_IS_ENCODING_PROFILE(obj: Pointer): Tgboolean;

function GST_TYPE_ENCODING_CONTAINER_PROFILE: TGType;
function GST_ENCODING_CONTAINER_PROFILE(obj: Pointer): PGstEncodingContainerProfile;
function GST_IS_ENCODING_CONTAINER_PROFILE(obj: Pointer): Tgboolean;

function GST_TYPE_ENCODING_VIDEO_PROFILE: TGType;
function GST_ENCODING_VIDEO_PROFILE(obj: Pointer): PGstEncodingVideoProfile;
function GST_IS_ENCODING_VIDEO_PROFILE(obj: Pointer): Tgboolean;

function GST_TYPE_ENCODING_AUDIO_PROFILE: TGType;
function GST_ENCODING_AUDIO_PROFILE(obj: Pointer): PGstEncodingAudioProfile;
function GST_IS_ENCODING_AUDIO_PROFILE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_ENCODING_PROFILE: TGType;
begin
  GST_TYPE_ENCODING_PROFILE := gst_encoding_profile_get_type;
end;

function GST_ENCODING_PROFILE(obj: Pointer): PGstEncodingProfile;
begin
  Result := PGstEncodingProfile(g_type_check_instance_cast(obj, GST_TYPE_ENCODING_PROFILE));
end;

function GST_IS_ENCODING_PROFILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ENCODING_PROFILE);
end;

// ====

function GST_TYPE_ENCODING_CONTAINER_PROFILE: TGType;
begin
  GST_TYPE_ENCODING_CONTAINER_PROFILE := gst_encoding_container_profile_get_type;
end;

function GST_ENCODING_CONTAINER_PROFILE(obj: Pointer): PGstEncodingContainerProfile;
begin
  Result := PGstEncodingContainerProfile(g_type_check_instance_cast(obj, GST_TYPE_ENCODING_CONTAINER_PROFILE));
end;

function GST_IS_ENCODING_CONTAINER_PROFILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ENCODING_CONTAINER_PROFILE);
end;

// ====

function GST_TYPE_ENCODING_VIDEO_PROFILE: TGType;
begin
  GST_TYPE_ENCODING_VIDEO_PROFILE := gst_encoding_video_profile_get_type;
end;

function GST_ENCODING_VIDEO_PROFILE(obj: Pointer): PGstEncodingVideoProfile;
begin
  Result := PGstEncodingVideoProfile(g_type_check_instance_cast(obj, GST_TYPE_ENCODING_VIDEO_PROFILE));
end;

function GST_IS_ENCODING_VIDEO_PROFILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ENCODING_VIDEO_PROFILE);
end;

// ====

function GST_TYPE_ENCODING_AUDIO_PROFILE: TGType;
begin
  GST_TYPE_ENCODING_AUDIO_PROFILE := gst_encoding_audio_profile_get_type;
end;

function GST_ENCODING_AUDIO_PROFILE(obj: Pointer): PGstEncodingAudioProfile;
begin
  Result := PGstEncodingAudioProfile(g_type_check_instance_cast(obj, GST_TYPE_ENCODING_AUDIO_PROFILE));
end;

function GST_IS_ENCODING_AUDIO_PROFILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ENCODING_AUDIO_PROFILE);
end;

// ====

procedure gst_encoding_profile_unref(profile: Pointer);
begin
  g_object_unref(PGObject(profile));
end;

function gst_encoding_profile_ref(profile: Pointer): Pointer;
begin
  gst_encoding_profile_ref := g_object_ref(PGObject(profile));
end;


{$ENDIF read_implementation}
