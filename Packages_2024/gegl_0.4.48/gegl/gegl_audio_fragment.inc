

  {$IFDEF read_enum}
const
  GEGL_MAX_AUDIO_CHANNELS = 8;

  GEGL_CH_FRONT_LEFT = $00000001;
  GEGL_CH_FRONT_RIGHT = $00000002;
  GEGL_CH_FRONT_CENTER = $00000004;
  GEGL_CH_LOW_FREQUENCY = $00000008;
  GEGL_CH_BACK_LEFT = $00000010;
  GEGL_CH_BACK_RIGHT = $00000020;
  GEGL_CH_FRONT_LEFT_OF_CENTER = $00000040;
  GEGL_CH_FRONT_RIGHT_OF_CENTER = $00000080;
  GEGL_CH_BACK_CENTER = $00000100;
  GEGL_CH_SIDE_LEFT = $00000200;
  GEGL_CH_SIDE_RIGHT = $00000400;
  GEGL_CH_TOP_CENTER = $00000800;
  GEGL_CH_TOP_FRONT_LEFT = $00001000;
  GEGL_CH_TOP_FRONT_CENTER = $00002000;
  GEGL_CH_TOP_FRONT_RIGHT = $00004000;
  GEGL_CH_TOP_BACK_LEFT = $00008000;
  GEGL_CH_TOP_BACK_CENTER = $00010000;
  GEGL_CH_TOP_BACK_RIGHT = $00020000;
  GEGL_CH_STEREO_LEFT = $20000000;
  GEGL_CH_STEREO_RIGHT = $40000000;
  GEGL_CH_WIDE_LEFT = $0000000080000000;
  GEGL_CH_WIDE_RIGHT = $0000000100000000;
  GEGL_CH_SURROUND_DIRECT_LEFT = $0000000200000000;
  GEGL_CH_SURROUND_DIRECT_RIGHT = $0000000400000000;
  GEGL_CH_LOW_FREQUENCY_2 = $0000000800000000;
  GEGL_CH_LAYOUT_NATIVE = $8000000000000000;

  GEGL_CH_LAYOUT_MONO = GEGL_CH_FRONT_CENTER;
  GEGL_CH_LAYOUT_STEREO = GEGL_CH_FRONT_LEFT or GEGL_CH_FRONT_RIGHT;
  GEGL_CH_LAYOUT_2POINT1 = GEGL_CH_LAYOUT_STEREO or GEGL_CH_LOW_FREQUENCY;
  GEGL_CH_LAYOUT_2_1 = GEGL_CH_LAYOUT_STEREO or GEGL_CH_BACK_CENTER;
  GEGL_CH_LAYOUT_SURROUND = GEGL_CH_LAYOUT_STEREO or GEGL_CH_FRONT_CENTER;
  GEGL_CH_LAYOUT_3POINT1 = GEGL_CH_LAYOUT_SURROUND or GEGL_CH_LOW_FREQUENCY;
  GEGL_CH_LAYOUT_4POINT0 = GEGL_CH_LAYOUT_SURROUND or GEGL_CH_BACK_CENTER;
  GEGL_CH_LAYOUT_4POINT1 = GEGL_CH_LAYOUT_4POINT0 or GEGL_CH_LOW_FREQUENCY;
  GEGL_CH_LAYOUT_2_2 = (GEGL_CH_LAYOUT_STEREO or GEGL_CH_SIDE_LEFT) or GEGL_CH_SIDE_RIGHT;
  GEGL_CH_LAYOUT_QUAD = (GEGL_CH_LAYOUT_STEREO or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_RIGHT;
  GEGL_CH_LAYOUT_5POINT0 = (GEGL_CH_LAYOUT_SURROUND or GEGL_CH_SIDE_LEFT) or GEGL_CH_SIDE_RIGHT;
  GEGL_CH_LAYOUT_5POINT1 = GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_LOW_FREQUENCY;
  GEGL_CH_LAYOUT_5POINT0_BACK = (GEGL_CH_LAYOUT_SURROUND or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_RIGHT;
  GEGL_CH_LAYOUT_5POINT1_BACK = GEGL_CH_LAYOUT_5POINT0_BACK or GEGL_CH_LOW_FREQUENCY;
  GEGL_CH_LAYOUT_6POINT0 = GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_BACK_CENTER;
  GEGL_CH_LAYOUT_6POINT0_FRONT = (GEGL_CH_LAYOUT_2_2 or GEGL_CH_FRONT_LEFT_OF_CENTER) or GEGL_CH_FRONT_RIGHT_OF_CENTER;
  GEGL_CH_LAYOUT_HEXAGONAL = GEGL_CH_LAYOUT_5POINT0_BACK or GEGL_CH_BACK_CENTER;
  GEGL_CH_LAYOUT_6POINT1 = GEGL_CH_LAYOUT_5POINT1 or GEGL_CH_BACK_CENTER;
  GEGL_CH_LAYOUT_6POINT1_BACK = GEGL_CH_LAYOUT_5POINT1_BACK or GEGL_CH_BACK_CENTER;
  GEGL_CH_LAYOUT_6POINT1_FRONT = GEGL_CH_LAYOUT_6POINT0_FRONT or GEGL_CH_LOW_FREQUENCY;
  GEGL_CH_LAYOUT_7POINT0 = (GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_RIGHT;
  GEGL_CH_LAYOUT_7POINT0_FRONT = (GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_FRONT_LEFT_OF_CENTER) or GEGL_CH_FRONT_RIGHT_OF_CENTER;
  GEGL_CH_LAYOUT_7POINT1 = (GEGL_CH_LAYOUT_5POINT1 or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_RIGHT;
  GEGL_CH_LAYOUT_7POINT1_WIDE = (GEGL_CH_LAYOUT_5POINT1 or GEGL_CH_FRONT_LEFT_OF_CENTER) or GEGL_CH_FRONT_RIGHT_OF_CENTER;
  GEGL_CH_LAYOUT_7POINT1_WIDE_BACK = (GEGL_CH_LAYOUT_5POINT1_BACK or GEGL_CH_FRONT_LEFT_OF_CENTER) or GEGL_CH_FRONT_RIGHT_OF_CENTER;
  GEGL_CH_LAYOUT_OCTAGONAL = ((GEGL_CH_LAYOUT_5POINT0 or GEGL_CH_BACK_LEFT) or GEGL_CH_BACK_CENTER) or GEGL_CH_BACK_RIGHT;
  GEGL_CH_LAYOUT_HEXADECAGONAL = (((((((GEGL_CH_LAYOUT_OCTAGONAL or GEGL_CH_WIDE_LEFT) or GEGL_CH_WIDE_RIGHT) or GEGL_CH_TOP_BACK_LEFT) or GEGL_CH_TOP_BACK_RIGHT) or GEGL_CH_TOP_BACK_CENTER) or GEGL_CH_TOP_FRONT_CENTER) or GEGL_CH_TOP_FRONT_LEFT) or GEGL_CH_TOP_FRONT_RIGHT;
  GEGL_CH_LAYOUT_STEREO_DOWNMIX = GEGL_CH_STEREO_LEFT or GEGL_CH_STEREO_RIGHT;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGeglAudioFragmentPrivate = type Pointer;

  PGeglAudioFragment = ^TGeglAudioFragment;
  TGeglAudioFragment = record
    parent_instance: TGObject;
    data: array[0..(GEGL_MAX_AUDIO_CHANNELS) - 1] of Psingle;
    priv: PGeglAudioFragmentPrivate;
  end;

  PGeglAudioFragmentClass = ^TGeglAudioFragmentClass;
  TGeglAudioFragmentClass = record
    parent_class: TGObjectClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_audio_fragment_get_type: TGType; cdecl; external libgegl;
function gegl_audio_fragment_new(sample_rate: longint; channels: longint; channel_layout: longint; max_samples: longint): PGeglAudioFragment; cdecl; external libgegl;
procedure gegl_audio_fragment_set_max_samples(audio: PGeglAudioFragment; max_samples: longint); cdecl; external libgegl;
procedure gegl_audio_fragment_set_sample_rate(audio: PGeglAudioFragment; sample_rate: longint); cdecl; external libgegl;
procedure gegl_audio_fragment_set_channels(audio: PGeglAudioFragment; channels: longint); cdecl; external libgegl;
procedure gegl_audio_fragment_set_channel_layout(audio: PGeglAudioFragment; channel_layout: longint); cdecl; external libgegl;
procedure gegl_audio_fragment_set_sample_count(audio: PGeglAudioFragment; sample_count: longint); cdecl; external libgegl;
procedure gegl_audio_fragment_set_pos(audio: PGeglAudioFragment; pos: longint); cdecl; external libgegl;
function gegl_audio_fragment_get_max_samples(audio: PGeglAudioFragment): longint; cdecl; external libgegl;
function gegl_audio_fragment_get_sample_rate(audio: PGeglAudioFragment): longint; cdecl; external libgegl;
function gegl_audio_fragment_get_channels(audio: PGeglAudioFragment): longint; cdecl; external libgegl;
function gegl_audio_fragment_get_sample_count(audio: PGeglAudioFragment): longint; cdecl; external libgegl;
function gegl_audio_fragment_get_pos(audio: PGeglAudioFragment): longint; cdecl; external libgegl;
function gegl_audio_fragment_get_channel_layout(audio: PGeglAudioFragment): longint; cdecl; external libgegl;

function gegl_param_audio_fragment_get_type: TGType; cdecl; external libgegl;
function gegl_param_spec_audio_fragment(name: Pgchar; nick: Pgchar; blurb: Pgchar; flags: TGParamFlags): PGParamSpec; cdecl; external libgegl;

// === Konventiert am: 12-8-26 14:30:42 ===

function GEGL_TYPE_AUDIO_FRAGMENT: TGType;
function GEGL_AUDIO_FRAGMENT(obj: Pointer): PGeglAudioFragment;
function GEGL_AUDIO_FRAGMENT_CLASS(klass: Pointer): PGeglAudioFragmentClass;
function GEGL_IS_AUDIO(obj: Pointer): Tgboolean;
function GEGL_IS_AUDIO_CLASS(klass: Pointer): Tgboolean;
function GEGL_AUDIO_FRAGMENT_GET_CLASS(obj: Pointer): PGeglAudioFragmentClass;

function GEGL_TYPE_PARAM_AUDIO_FRAGMENT: TGType;
function GEGL_IS_PARAM_SPEC_AUDIO_FRAGMENT(pspec: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GEGL_TYPE_AUDIO_FRAGMENT: TGType;
begin
  GEGL_TYPE_AUDIO_FRAGMENT := gegl_audio_fragment_get_type;
end;

function GEGL_AUDIO_FRAGMENT(obj: Pointer): PGeglAudioFragment;
begin
  Result := PGeglAudioFragment(g_type_check_instance_cast(obj, GEGL_TYPE_AUDIO_FRAGMENT));
end;

function GEGL_AUDIO_FRAGMENT_CLASS(klass: Pointer): PGeglAudioFragmentClass;
begin
  Result := PGeglAudioFragmentClass(g_type_check_class_cast(klass, GEGL_TYPE_AUDIO_FRAGMENT));
end;

function GEGL_IS_AUDIO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_AUDIO_FRAGMENT);
end;

function GEGL_IS_AUDIO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEGL_TYPE_AUDIO_FRAGMENT);
end;

function GEGL_AUDIO_FRAGMENT_GET_CLASS(obj: Pointer): PGeglAudioFragmentClass;
begin
  Result := PGeglAudioFragmentClass(PGTypeInstance(obj)^.g_class);
end;


function GEGL_TYPE_PARAM_AUDIO_FRAGMENT: TGType;
begin
  GEGL_TYPE_PARAM_AUDIO_FRAGMENT := gegl_param_audio_fragment_get_type;
end;

function GEGL_IS_PARAM_SPEC_AUDIO_FRAGMENT(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GEGL_TYPE_PARAM_AUDIO_FRAGMENT);
end;

{$ENDIF read_implementation}
