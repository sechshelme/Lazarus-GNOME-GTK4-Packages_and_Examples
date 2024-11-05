/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   16:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstAudioChannelMixerFlags = ^TGstAudioChannelMixerFlags;
  TGstAudioChannelMixerFlags = longint;

const
  GST_AUDIO_CHANNEL_MIXER_FLAGS_NONE = 0;
  GST_AUDIO_CHANNEL_MIXER_FLAGS_NON_INTERLEAVED_IN = 1 shl 0;
  GST_AUDIO_CHANNEL_MIXER_FLAGS_NON_INTERLEAVED_OUT = 1 shl 1;
  GST_AUDIO_CHANNEL_MIXER_FLAGS_UNPOSITIONED_IN = 1 shl 2;
  GST_AUDIO_CHANNEL_MIXER_FLAGS_UNPOSITIONED_OUT = 1 shl 3;

type
  TGstAudioChannelMixer = record
  end;
  PGstAudioChannelMixer = ^TGstAudioChannelMixer;

function gst_audio_channel_mixer_new(flags: TGstAudioChannelMixerFlags; format: TGstAudioFormat; in_channels: Tgint; in_position: PGstAudioChannelPosition; out_channels: Tgint;
  out_position: PGstAudioChannelPosition): PGstAudioChannelMixer; cdecl; external libgstaudio;
function gst_audio_channel_mixer_new_with_matrix(flags: TGstAudioChannelMixerFlags; format: TGstAudioFormat; in_channels: Tgint; out_channels: Tgint; matrix: PPgfloat): PGstAudioChannelMixer; cdecl; external libgstaudio;
procedure gst_audio_channel_mixer_free(mix: PGstAudioChannelMixer); cdecl; external libgstaudio;
function gst_audio_channel_mixer_is_passthrough(mix: PGstAudioChannelMixer): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_channel_mixer_samples(mix: PGstAudioChannelMixer; in_: Pgpointer; out_: Pgpointer; samples: Tgint); cdecl; external libgstaudio;

// === Konventiert am: 28-9-24 19:32:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
