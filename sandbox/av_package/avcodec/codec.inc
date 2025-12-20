{$IFDEF read_interface}


const
  AV_CODEC_CAP_DRAW_HORIZ_BAND = 1 shl 0;
  AV_CODEC_CAP_DR1 = 1 shl 1;
  AV_CODEC_CAP_DELAY = 1 shl 5;
  AV_CODEC_CAP_SMALL_LAST_FRAME = 1 shl 6;

const
  AV_CODEC_CAP_SUBFRAMES = 1 shl 8;

const
  AV_CODEC_CAP_EXPERIMENTAL = 1 shl 9;
  AV_CODEC_CAP_CHANNEL_CONF = 1 shl 10;
  AV_CODEC_CAP_FRAME_THREADS = 1 shl 12;
  AV_CODEC_CAP_SLICE_THREADS = 1 shl 13;
  AV_CODEC_CAP_PARAM_CHANGE = 1 shl 14;
  AV_CODEC_CAP_OTHER_THREADS = 1 shl 15;
  AV_CODEC_CAP_VARIABLE_FRAME_SIZE = 1 shl 16;
  AV_CODEC_CAP_AVOID_PROBING = 1 shl 17;
  AV_CODEC_CAP_HARDWARE = 1 shl 18;
  AV_CODEC_CAP_HYBRID = 1 shl 19;
  AV_CODEC_CAP_ENCODER_REORDERED_OPAQUE = 1 shl 20;
  AV_CODEC_CAP_ENCODER_FLUSH = 1 shl 21;
  AV_CODEC_CAP_ENCODER_RECON_FRAME = 1 shl 22;

type
  TAVProfile = record
    profile: longint;
    name: pchar;
  end;
  PAVProfile = ^TAVProfile;

type
  TAVCodec = record
    name: pchar;
    long_name: pchar;
    _type: TAVMediaType;
    id: TAVCodecID;
    capabilities: longint;
    max_lowres: Tuint8_t;
    supported_framerates: PAVRational;
    pix_fmts: PAVPixelFormat;
    supported_samplerates: Plongint;
    sample_fmts: PAVSampleFormat;
    channel_layouts: Puint64_t;
    priv_class: PAVClass;
    profiles: PAVProfile;
    wrapper_name: pchar;
    ch_layouts: PAVChannelLayout;
  end;
  PAVCodec = ^TAVCodec;

function av_codec_iterate(opaque: Ppointer): PAVCodec; cdecl; external libavcodec;
function avcodec_find_decoder(id: TAVCodecID): PAVCodec; cdecl; external libavcodec;
function avcodec_find_decoder_by_name(name: pchar): PAVCodec; cdecl; external libavcodec;
function avcodec_find_encoder(id: TAVCodecID): PAVCodec; cdecl; external libavcodec;
function avcodec_find_encoder_by_name(name: pchar): PAVCodec; cdecl; external libavcodec;
function av_codec_is_encoder(codec: PAVCodec): longint; cdecl; external libavcodec;
function av_codec_is_decoder(codec: PAVCodec): longint; cdecl; external libavcodec;
function av_get_profile_name(codec: PAVCodec; profile: longint): pchar; cdecl; external libavcodec;

const
  AV_CODEC_HW_CONFIG_METHOD_HW_DEVICE_CTX = $01;
  AV_CODEC_HW_CONFIG_METHOD_HW_FRAMES_CTX = $02;
  AV_CODEC_HW_CONFIG_METHOD_INTERNAL = $04;
  AV_CODEC_HW_CONFIG_METHOD_AD_HOC = $08;

type
  TAVCodecHWConfig = record
    pix_fmt: TAVPixelFormat;
    methods: longint;
    device_type: TAVHWDeviceType;
  end;
  PAVCodecHWConfig = ^TAVCodecHWConfig;

function avcodec_get_hw_config(codec: PAVCodec; index: longint): PAVCodecHWConfig; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:10:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
