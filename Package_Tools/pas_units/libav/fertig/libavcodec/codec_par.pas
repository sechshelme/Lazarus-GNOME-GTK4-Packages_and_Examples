unit codec_par;

interface

uses
  fp_ffmpeg, codec_id, defs, packet;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVCodecParameters = record
    codec_type: TAVMediaType;
    codec_id: TAVCodecID;
    codec_tag: Tuint32_t;
    extradata: Puint8_t;
    extradata_size: longint;
    format: longint;
    bit_rate: Tint64_t;
    bits_per_coded_sample: longint;
    bits_per_raw_sample: longint;
    profile: longint;
    level: longint;
    width: longint;
    height: longint;
    sample_aspect_ratio: TAVRational;
    field_order: TAVFieldOrder;
    color_range: TAVColorRange;
    color_primaries: TAVColorPrimaries;
    color_trc: TAVColorTransferCharacteristic;
    color_space: TAVColorSpace;
    chroma_location: TAVChromaLocation;
    video_delay: longint;
    channel_layout: Tuint64_t;
    channels: longint;
    sample_rate: longint;
    block_align: longint;
    frame_size: longint;
    initial_padding: longint;
    trailing_padding: longint;
    seek_preroll: longint;
    ch_layout: TAVChannelLayout;
    framerate: TAVRational;
    coded_side_data: PAVPacketSideData;
    nb_coded_side_data: longint;
  end;
  PAVCodecParameters = ^TAVCodecParameters;
  PPAVCodecParameters = ^PAVCodecParameters;

function avcodec_parameters_alloc: PAVCodecParameters; cdecl; external libavcodec;
procedure avcodec_parameters_free(par: PPAVCodecParameters); cdecl; external libavcodec;
function avcodec_parameters_copy(dst: PAVCodecParameters; src: PAVCodecParameters): longint; cdecl; external libavcodec;
function av_get_audio_frame_duration2(par: PAVCodecParameters; frame_bytes: longint): longint; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:10:15 ===


implementation



end.
