

  {$IFDEF read_enum}
type
  PGstAudioChannelMixerFlags = ^TGstAudioChannelMixerFlags;
  TGstAudioChannelMixerFlags = longint;
const
  GST_AUDIO_CHANNEL_MIXER_FLAGS_NONE = 0;
  GST_AUDIO_CHANNEL_MIXER_FLAGS_NON_INTERLEAVED_IN = 1 shl 0;
  GST_AUDIO_CHANNEL_MIXER_FLAGS_NON_INTERLEAVED_OUT = 1 shl 1;
  GST_AUDIO_CHANNEL_MIXER_FLAGS_UNPOSITIONED_IN = 1 shl 2;
  GST_AUDIO_CHANNEL_MIXER_FLAGS_UNPOSITIONED_OUT = 1 shl 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstAudioChannelMixer = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_audio_channel_mixer_new(flags: TGstAudioChannelMixerFlags; format: TGstAudioFormat; in_channels: Tgint; in_position: PGstAudioChannelPosition; out_channels: Tgint;
  out_position: PGstAudioChannelPosition): PGstAudioChannelMixer; cdecl; external libgstaudio;
function gst_audio_channel_mixer_new_with_matrix(flags: TGstAudioChannelMixerFlags; format: TGstAudioFormat; in_channels: Tgint; out_channels: Tgint; matrix: PPgfloat): PGstAudioChannelMixer; cdecl; external libgstaudio;
procedure gst_audio_channel_mixer_free(mix: PGstAudioChannelMixer); cdecl; external libgstaudio;
function gst_audio_channel_mixer_is_passthrough(mix: PGstAudioChannelMixer): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_channel_mixer_samples(mix: PGstAudioChannelMixer; in_: Pgpointer; out_: Pgpointer; samples: Tgint); cdecl; external libgstaudio;
{$ENDIF read_function}

// === Konventiert am: 16-7-26 15:10:50 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
