unit audio_channels;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, audio_format;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstAudioChannelPosition = ^TGstAudioChannelPosition;
  TGstAudioChannelPosition = longint;
const
  GST_AUDIO_CHANNEL_POSITION_NONE = -(3);
  GST_AUDIO_CHANNEL_POSITION_MONO = -(2);
  GST_AUDIO_CHANNEL_POSITION_INVALID = -(1);
  GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT = 0;
  GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT = 1;
  GST_AUDIO_CHANNEL_POSITION_FRONT_CENTER = 2;
  GST_AUDIO_CHANNEL_POSITION_LFE1 = 3;
  GST_AUDIO_CHANNEL_POSITION_REAR_LEFT = 4;
  GST_AUDIO_CHANNEL_POSITION_REAR_RIGHT = 5;
  GST_AUDIO_CHANNEL_POSITION_FRONT_LEFT_OF_CENTER = 6;
  GST_AUDIO_CHANNEL_POSITION_FRONT_RIGHT_OF_CENTER = 7;
  GST_AUDIO_CHANNEL_POSITION_REAR_CENTER = 8;
  GST_AUDIO_CHANNEL_POSITION_LFE2 = 9;
  GST_AUDIO_CHANNEL_POSITION_SIDE_LEFT = 10;
  GST_AUDIO_CHANNEL_POSITION_SIDE_RIGHT = 11;
  GST_AUDIO_CHANNEL_POSITION_TOP_FRONT_LEFT = 12;
  GST_AUDIO_CHANNEL_POSITION_TOP_FRONT_RIGHT = 13;
  GST_AUDIO_CHANNEL_POSITION_TOP_FRONT_CENTER = 14;
  GST_AUDIO_CHANNEL_POSITION_TOP_CENTER = 15;
  GST_AUDIO_CHANNEL_POSITION_TOP_REAR_LEFT = 16;
  GST_AUDIO_CHANNEL_POSITION_TOP_REAR_RIGHT = 17;
  GST_AUDIO_CHANNEL_POSITION_TOP_SIDE_LEFT = 18;
  GST_AUDIO_CHANNEL_POSITION_TOP_SIDE_RIGHT = 19;
  GST_AUDIO_CHANNEL_POSITION_TOP_REAR_CENTER = 20;
  GST_AUDIO_CHANNEL_POSITION_BOTTOM_FRONT_CENTER = 21;
  GST_AUDIO_CHANNEL_POSITION_BOTTOM_FRONT_LEFT = 22;
  GST_AUDIO_CHANNEL_POSITION_BOTTOM_FRONT_RIGHT = 23;
  GST_AUDIO_CHANNEL_POSITION_WIDE_LEFT = 24;
  GST_AUDIO_CHANNEL_POSITION_WIDE_RIGHT = 25;
  GST_AUDIO_CHANNEL_POSITION_SURROUND_LEFT = 26;
  GST_AUDIO_CHANNEL_POSITION_SURROUND_RIGHT = 27;
  GST_AUDIO_CHANNEL_POSITION_TOP_SURROUND_LEFT = 28;
  GST_AUDIO_CHANNEL_POSITION_TOP_SURROUND_RIGHT = 29;
  {$ENDIF read_enum}

{$IFDEF read_function}
function gst_audio_buffer_reorder_channels(buffer: PGstBuffer; format: TGstAudioFormat; channels: Tgint; from: PGstAudioChannelPosition; to_: PGstAudioChannelPosition): Tgboolean; cdecl; external libgstaudio;
function gst_audio_reorder_channels(data: Tgpointer; size: Tgsize; format: TGstAudioFormat; channels: Tgint; from: PGstAudioChannelPosition;
  to_: PGstAudioChannelPosition): Tgboolean; cdecl; external libgstaudio;
procedure gst_audio_reorder_channels_with_reorder_map(data: Tgpointer; size: Tgsize; bps: Tgint; channels: Tgint; reorder_map: Pgint); cdecl; external libgstaudio;
function gst_audio_channel_positions_to_valid_order(position: PGstAudioChannelPosition; channels: Tgint): Tgboolean; cdecl; external libgstaudio;
function gst_audio_check_valid_channel_positions(position: PGstAudioChannelPosition; channels: Tgint; force_order: Tgboolean): Tgboolean; cdecl; external libgstaudio;
function gst_audio_channel_positions_to_mask(position: PGstAudioChannelPosition; channels: Tgint; force_order: Tgboolean; channel_mask: Pguint64): Tgboolean; cdecl; external libgstaudio;
function gst_audio_channel_positions_from_mask(channels: Tgint; channel_mask: Tguint64; position: PGstAudioChannelPosition): Tgboolean; cdecl; external libgstaudio;
function gst_audio_get_channel_reorder_map(channels: Tgint; from: PGstAudioChannelPosition; to_: PGstAudioChannelPosition; reorder_map: Pgint): Tgboolean; cdecl; external libgstaudio;
function gst_audio_channel_get_fallback_mask(channels: Tgint): Tguint64; cdecl; external libgstaudio;
function gst_audio_channel_positions_to_string(position: PGstAudioChannelPosition; channels: Tgint): Pgchar; cdecl; external libgstaudio;
{$ENDIF read_function}

// === Konventiert am: 16-7-26 15:10:45 ===


implementation



end.
