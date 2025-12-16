unit channel_layout;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVChannel = longint;

const
  AV_CHAN_NONE = -(1);
  AV_CHAN_FRONT_LEFT = (-(1)) + 1;
  AV_CHAN_FRONT_RIGHT = (-(1)) + 2;
  AV_CHAN_FRONT_CENTER = (-(1)) + 3;
  AV_CHAN_LOW_FREQUENCY = (-(1)) + 4;
  AV_CHAN_BACK_LEFT = (-(1)) + 5;
  AV_CHAN_BACK_RIGHT = (-(1)) + 6;
  AV_CHAN_FRONT_LEFT_OF_CENTER = (-(1)) + 7;
  AV_CHAN_FRONT_RIGHT_OF_CENTER = (-(1)) + 8;
  AV_CHAN_BACK_CENTER = (-(1)) + 9;
  AV_CHAN_SIDE_LEFT = (-(1)) + 10;
  AV_CHAN_SIDE_RIGHT = (-(1)) + 11;
  AV_CHAN_TOP_CENTER = (-(1)) + 12;
  AV_CHAN_TOP_FRONT_LEFT = (-(1)) + 13;
  AV_CHAN_TOP_FRONT_CENTER = (-(1)) + 14;
  AV_CHAN_TOP_FRONT_RIGHT = (-(1)) + 15;
  AV_CHAN_TOP_BACK_LEFT = (-(1)) + 16;
  AV_CHAN_TOP_BACK_CENTER = (-(1)) + 17;
  AV_CHAN_TOP_BACK_RIGHT = (-(1)) + 18;
  AV_CHAN_STEREO_LEFT = 29;
  AV_CHAN_STEREO_RIGHT = 30;
  AV_CHAN_WIDE_LEFT = 31;
  AV_CHAN_WIDE_RIGHT = 32;
  AV_CHAN_SURROUND_DIRECT_LEFT = 33;
  AV_CHAN_SURROUND_DIRECT_RIGHT = 34;
  AV_CHAN_LOW_FREQUENCY_2 = 35;
  AV_CHAN_TOP_SIDE_LEFT = 36;
  AV_CHAN_TOP_SIDE_RIGHT = 37;
  AV_CHAN_BOTTOM_FRONT_CENTER = 38;
  AV_CHAN_BOTTOM_FRONT_LEFT = 39;
  AV_CHAN_BOTTOM_FRONT_RIGHT = 40;
  AV_CHAN_UNUSED = $200;
  AV_CHAN_UNKNOWN = $300;
  AV_CHAN_AMBISONIC_BASE = $400;
  AV_CHAN_AMBISONIC_END = $7ff;

type
  TAVChannelOrder = longint;

const
  AV_CHANNEL_ORDER_UNSPEC = 0;
  AV_CHANNEL_ORDER_NATIVE = 1;
  AV_CHANNEL_ORDER_CUSTOM = 2;
  AV_CHANNEL_ORDER_AMBISONIC = 3;

const
  AV_CH_FRONT_LEFT = 1 shl AV_CHAN_FRONT_LEFT;
  AV_CH_FRONT_RIGHT = 1 shl AV_CHAN_FRONT_RIGHT;
  AV_CH_FRONT_CENTER = 1 shl AV_CHAN_FRONT_CENTER;
  AV_CH_LOW_FREQUENCY = 1 shl AV_CHAN_LOW_FREQUENCY;
  AV_CH_BACK_LEFT = 1 shl AV_CHAN_BACK_LEFT;
  AV_CH_BACK_RIGHT = 1 shl AV_CHAN_BACK_RIGHT;
  AV_CH_FRONT_LEFT_OF_CENTER = 1 shl AV_CHAN_FRONT_LEFT_OF_CENTER;
  AV_CH_FRONT_RIGHT_OF_CENTER = 1 shl AV_CHAN_FRONT_RIGHT_OF_CENTER;
  AV_CH_BACK_CENTER = 1 shl AV_CHAN_BACK_CENTER;
  AV_CH_SIDE_LEFT = 1 shl AV_CHAN_SIDE_LEFT;
  AV_CH_SIDE_RIGHT = 1 shl AV_CHAN_SIDE_RIGHT;
  AV_CH_TOP_CENTER = 1 shl AV_CHAN_TOP_CENTER;
  AV_CH_TOP_FRONT_LEFT = 1 shl AV_CHAN_TOP_FRONT_LEFT;
  AV_CH_TOP_FRONT_CENTER = 1 shl AV_CHAN_TOP_FRONT_CENTER;
  AV_CH_TOP_FRONT_RIGHT = 1 shl AV_CHAN_TOP_FRONT_RIGHT;
  AV_CH_TOP_BACK_LEFT = 1 shl AV_CHAN_TOP_BACK_LEFT;
  AV_CH_TOP_BACK_CENTER = 1 shl AV_CHAN_TOP_BACK_CENTER;
  AV_CH_TOP_BACK_RIGHT = 1 shl AV_CHAN_TOP_BACK_RIGHT;
  AV_CH_STEREO_LEFT = 1 shl AV_CHAN_STEREO_LEFT;
  AV_CH_STEREO_RIGHT = 1 shl AV_CHAN_STEREO_RIGHT;
  AV_CH_WIDE_LEFT = 1 shl AV_CHAN_WIDE_LEFT;
  AV_CH_WIDE_RIGHT = 1 shl AV_CHAN_WIDE_RIGHT;
  AV_CH_SURROUND_DIRECT_LEFT = 1 shl AV_CHAN_SURROUND_DIRECT_LEFT;
  AV_CH_SURROUND_DIRECT_RIGHT = 1 shl AV_CHAN_SURROUND_DIRECT_RIGHT;
  AV_CH_LOW_FREQUENCY_2 = 1 shl AV_CHAN_LOW_FREQUENCY_2;
  AV_CH_TOP_SIDE_LEFT = 1 shl AV_CHAN_TOP_SIDE_LEFT;
  AV_CH_TOP_SIDE_RIGHT = 1 shl AV_CHAN_TOP_SIDE_RIGHT;
  AV_CH_BOTTOM_FRONT_CENTER = 1 shl AV_CHAN_BOTTOM_FRONT_CENTER;
  AV_CH_BOTTOM_FRONT_LEFT = 1 shl AV_CHAN_BOTTOM_FRONT_LEFT;
  AV_CH_BOTTOM_FRONT_RIGHT = 1 shl AV_CHAN_BOTTOM_FRONT_RIGHT;

const
  AV_CH_LAYOUT_NATIVE = $8000000000000000;

const
  AV_CH_LAYOUT_MONO = AV_CH_FRONT_CENTER;
  AV_CH_LAYOUT_STEREO = AV_CH_FRONT_LEFT or AV_CH_FRONT_RIGHT;
  AV_CH_LAYOUT_2POINT1 = AV_CH_LAYOUT_STEREO or AV_CH_LOW_FREQUENCY;
  AV_CH_LAYOUT_2_1 = AV_CH_LAYOUT_STEREO or AV_CH_BACK_CENTER;
  AV_CH_LAYOUT_SURROUND = AV_CH_LAYOUT_STEREO or AV_CH_FRONT_CENTER;
  AV_CH_LAYOUT_3POINT1 = AV_CH_LAYOUT_SURROUND or AV_CH_LOW_FREQUENCY;
  AV_CH_LAYOUT_4POINT0 = AV_CH_LAYOUT_SURROUND or AV_CH_BACK_CENTER;
  AV_CH_LAYOUT_4POINT1 = AV_CH_LAYOUT_4POINT0 or AV_CH_LOW_FREQUENCY;
  AV_CH_LAYOUT_2_2 = (AV_CH_LAYOUT_STEREO or AV_CH_SIDE_LEFT) or AV_CH_SIDE_RIGHT;
  AV_CH_LAYOUT_QUAD = (AV_CH_LAYOUT_STEREO or AV_CH_BACK_LEFT) or AV_CH_BACK_RIGHT;
  AV_CH_LAYOUT_5POINT0 = (AV_CH_LAYOUT_SURROUND or AV_CH_SIDE_LEFT) or AV_CH_SIDE_RIGHT;
  AV_CH_LAYOUT_5POINT1 = AV_CH_LAYOUT_5POINT0 or AV_CH_LOW_FREQUENCY;
  AV_CH_LAYOUT_5POINT0_BACK = (AV_CH_LAYOUT_SURROUND or AV_CH_BACK_LEFT) or AV_CH_BACK_RIGHT;
  AV_CH_LAYOUT_5POINT1_BACK = AV_CH_LAYOUT_5POINT0_BACK or AV_CH_LOW_FREQUENCY;
  AV_CH_LAYOUT_6POINT0 = AV_CH_LAYOUT_5POINT0 or AV_CH_BACK_CENTER;
  AV_CH_LAYOUT_6POINT0_FRONT = (AV_CH_LAYOUT_2_2 or AV_CH_FRONT_LEFT_OF_CENTER) or AV_CH_FRONT_RIGHT_OF_CENTER;
  AV_CH_LAYOUT_HEXAGONAL = AV_CH_LAYOUT_5POINT0_BACK or AV_CH_BACK_CENTER;
  AV_CH_LAYOUT_3POINT1POINT2 = (AV_CH_LAYOUT_3POINT1 or AV_CH_TOP_FRONT_LEFT) or AV_CH_TOP_FRONT_RIGHT;
  AV_CH_LAYOUT_6POINT1 = AV_CH_LAYOUT_5POINT1 or AV_CH_BACK_CENTER;
  AV_CH_LAYOUT_6POINT1_BACK = AV_CH_LAYOUT_5POINT1_BACK or AV_CH_BACK_CENTER;
  AV_CH_LAYOUT_6POINT1_FRONT = AV_CH_LAYOUT_6POINT0_FRONT or AV_CH_LOW_FREQUENCY;
  AV_CH_LAYOUT_7POINT0 = (AV_CH_LAYOUT_5POINT0 or AV_CH_BACK_LEFT) or AV_CH_BACK_RIGHT;
  AV_CH_LAYOUT_7POINT0_FRONT = (AV_CH_LAYOUT_5POINT0 or AV_CH_FRONT_LEFT_OF_CENTER) or AV_CH_FRONT_RIGHT_OF_CENTER;
  AV_CH_LAYOUT_7POINT1 = (AV_CH_LAYOUT_5POINT1 or AV_CH_BACK_LEFT) or AV_CH_BACK_RIGHT;
  AV_CH_LAYOUT_7POINT1_WIDE = (AV_CH_LAYOUT_5POINT1 or AV_CH_FRONT_LEFT_OF_CENTER) or AV_CH_FRONT_RIGHT_OF_CENTER;
  AV_CH_LAYOUT_7POINT1_WIDE_BACK = (AV_CH_LAYOUT_5POINT1_BACK or AV_CH_FRONT_LEFT_OF_CENTER) or AV_CH_FRONT_RIGHT_OF_CENTER;
  AV_CH_LAYOUT_5POINT1POINT2_BACK = (AV_CH_LAYOUT_5POINT1_BACK or AV_CH_TOP_FRONT_LEFT) or AV_CH_TOP_FRONT_RIGHT;
  AV_CH_LAYOUT_OCTAGONAL = ((AV_CH_LAYOUT_5POINT0 or AV_CH_BACK_LEFT) or AV_CH_BACK_CENTER) or AV_CH_BACK_RIGHT;
  AV_CH_LAYOUT_CUBE = (((AV_CH_LAYOUT_QUAD or AV_CH_TOP_FRONT_LEFT) or AV_CH_TOP_FRONT_RIGHT) or AV_CH_TOP_BACK_LEFT) or AV_CH_TOP_BACK_RIGHT;
  AV_CH_LAYOUT_5POINT1POINT4_BACK = (AV_CH_LAYOUT_5POINT1POINT2_BACK or AV_CH_TOP_BACK_LEFT) or AV_CH_TOP_BACK_RIGHT;
  AV_CH_LAYOUT_7POINT1POINT2 = (AV_CH_LAYOUT_7POINT1 or AV_CH_TOP_FRONT_LEFT) or AV_CH_TOP_FRONT_RIGHT;
  AV_CH_LAYOUT_7POINT1POINT4_BACK = (AV_CH_LAYOUT_7POINT1POINT2 or AV_CH_TOP_BACK_LEFT) or AV_CH_TOP_BACK_RIGHT;
  AV_CH_LAYOUT_HEXADECAGONAL = (((((((AV_CH_LAYOUT_OCTAGONAL or AV_CH_WIDE_LEFT) or AV_CH_WIDE_RIGHT) or AV_CH_TOP_BACK_LEFT) or AV_CH_TOP_BACK_RIGHT) or AV_CH_TOP_BACK_CENTER) or AV_CH_TOP_FRONT_CENTER) or AV_CH_TOP_FRONT_LEFT) or AV_CH_TOP_FRONT_RIGHT;
  AV_CH_LAYOUT_STEREO_DOWNMIX = AV_CH_STEREO_LEFT or AV_CH_STEREO_RIGHT;
  AV_CH_LAYOUT_22POINT2 = (((((((((((AV_CH_LAYOUT_7POINT1POINT4_BACK or AV_CH_FRONT_LEFT_OF_CENTER) or AV_CH_FRONT_RIGHT_OF_CENTER) or AV_CH_BACK_CENTER) or AV_CH_LOW_FREQUENCY_2) or AV_CH_TOP_FRONT_CENTER) or AV_CH_TOP_CENTER) or AV_CH_TOP_SIDE_LEFT) or AV_CH_TOP_SIDE_RIGHT) or AV_CH_TOP_BACK_CENTER) or
    AV_CH_BOTTOM_FRONT_CENTER) or AV_CH_BOTTOM_FRONT_LEFT) or AV_CH_BOTTOM_FRONT_RIGHT;
  AV_CH_LAYOUT_7POINT1_TOP_BACK = AV_CH_LAYOUT_5POINT1POINT2_BACK;

type
  TAVMatrixEncoding = longint;

const
  AV_MATRIX_ENCODING_NONE = 0;
  AV_MATRIX_ENCODING_DOLBY = 1;
  AV_MATRIX_ENCODING_DPLII = 2;
  AV_MATRIX_ENCODING_DPLIIX = 3;
  AV_MATRIX_ENCODING_DPLIIZ = 4;
  AV_MATRIX_ENCODING_DOLBYEX = 5;
  AV_MATRIX_ENCODING_DOLBYHEADPHONE = 6;
  AV_MATRIX_ENCODING_NB = 7;

type
  TAVChannelCustom = record
    id: TAVChannel;
    name: array[0..15] of char;
    opaque: pointer;
  end;
  PAVChannelCustom = ^TAVChannelCustom;

  TAVChannelLayout = record
    order: TAVChannelOrder;
    nb_channels: longint;
    u: record
      case longint of
        0: (mask: Tuint64_t);
        1: (map: PAVChannelCustom);
      end;
    opaque: pointer;
  end;
  PAVChannelLayout = ^TAVChannelLayout;

const
  AV_CHANNEL_LAYOUT_MONO: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 1; u: (Mask: AV_CH_LAYOUT_MONO); Opaque: nil);
  AV_CHANNEL_LAYOUT_STEREO: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 2; u: (Mask: AV_CH_LAYOUT_STEREO); Opaque: nil);
  AV_CHANNEL_LAYOUT_2POINT1: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 3; u: (Mask: AV_CH_LAYOUT_2POINT1); Opaque: nil);
  AV_CHANNEL_LAYOUT_2_1: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 3; u: (Mask: AV_CH_LAYOUT_2_1); Opaque: nil);
  AV_CHANNEL_LAYOUT_SURROUND: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 3; u: (Mask: AV_CH_LAYOUT_SURROUND); Opaque: nil);
  AV_CHANNEL_LAYOUT_3POINT1: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 4; u: (Mask: AV_CH_LAYOUT_3POINT1); Opaque: nil);
  AV_CHANNEL_LAYOUT_4POINT0: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 4; u: (Mask: AV_CH_LAYOUT_4POINT0); Opaque: nil);
  AV_CHANNEL_LAYOUT_4POINT1: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 5; u: (Mask: AV_CH_LAYOUT_4POINT1); Opaque: nil);
  AV_CHANNEL_LAYOUT_2_2: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 4; u: (Mask: AV_CH_LAYOUT_2_2); Opaque: nil);
  AV_CHANNEL_LAYOUT_QUAD: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 4; u: (Mask: AV_CH_LAYOUT_QUAD); Opaque: nil);
  AV_CHANNEL_LAYOUT_5POINT0: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 5; u: (Mask: AV_CH_LAYOUT_5POINT0); Opaque: nil);
  AV_CHANNEL_LAYOUT_5POINT1: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 6; u: (Mask: AV_CH_LAYOUT_5POINT1); Opaque: nil);
  AV_CHANNEL_LAYOUT_5POINT0_BACK: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 5; u: (Mask: AV_CH_LAYOUT_5POINT0_BACK); Opaque: nil);
  AV_CHANNEL_LAYOUT_5POINT1_BACK: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 6; u: (Mask: AV_CH_LAYOUT_5POINT1_BACK); Opaque: nil);
  AV_CHANNEL_LAYOUT_6POINT0: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 6; u: (Mask: AV_CH_LAYOUT_6POINT0); Opaque: nil);
  AV_CHANNEL_LAYOUT_6POINT0_FRONT: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 6; u: (Mask: AV_CH_LAYOUT_6POINT0_FRONT); Opaque: nil);
  AV_CHANNEL_LAYOUT_3POINT1POINT2: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 6; u: (Mask: AV_CH_LAYOUT_3POINT1POINT2); Opaque: nil);
  AV_CHANNEL_LAYOUT_HEXAGONAL: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 6; u: (Mask: AV_CH_LAYOUT_HEXAGONAL); Opaque: nil);
  AV_CHANNEL_LAYOUT_6POINT1: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 7; u: (Mask: AV_CH_LAYOUT_6POINT1); Opaque: nil);
  AV_CHANNEL_LAYOUT_6POINT1_BACK: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 7; u: (Mask: AV_CH_LAYOUT_6POINT1_BACK); Opaque: nil);
  AV_CHANNEL_LAYOUT_6POINT1_FRONT: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 7; u: (Mask: AV_CH_LAYOUT_6POINT1_FRONT); Opaque: nil);
  AV_CHANNEL_LAYOUT_7POINT0: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 7; u: (Mask: AV_CH_LAYOUT_7POINT0); Opaque: nil);
  AV_CHANNEL_LAYOUT_7POINT0_FRONT: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 7; u: (Mask: AV_CH_LAYOUT_7POINT0_FRONT); Opaque: nil);
  AV_CHANNEL_LAYOUT_7POINT1: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 8; u: (Mask: AV_CH_LAYOUT_7POINT1); Opaque: nil);
  AV_CHANNEL_LAYOUT_7POINT1_WIDE: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 8; u: (Mask: AV_CH_LAYOUT_7POINT1_WIDE); Opaque: nil);
  AV_CHANNEL_LAYOUT_7POINT1_WIDE_BACK: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 8; u: (Mask: AV_CH_LAYOUT_7POINT1_WIDE_BACK); Opaque: nil);
  AV_CHANNEL_LAYOUT_5POINT1POINT2_BACK: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 8; u: (Mask: AV_CH_LAYOUT_5POINT1POINT2_BACK); Opaque: nil);
  AV_CHANNEL_LAYOUT_OCTAGONAL: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 8; u: (Mask: AV_CH_LAYOUT_OCTAGONAL); Opaque: nil);
  AV_CHANNEL_LAYOUT_CUBE: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 8; u: (Mask: AV_CH_LAYOUT_CUBE); Opaque: nil);
  AV_CHANNEL_LAYOUT_5POINT1POINT4_BACK: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 10; u: (Mask: AV_CH_LAYOUT_5POINT1POINT4_BACK); Opaque: nil);
  AV_CHANNEL_LAYOUT_7POINT1POINT2: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 10; u: (Mask: AV_CH_LAYOUT_7POINT1POINT2); Opaque: nil);
  AV_CHANNEL_LAYOUT_7POINT1POINT4_BACK: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 12; u: (Mask: AV_CH_LAYOUT_7POINT1POINT4_BACK); Opaque: nil);
  AV_CHANNEL_LAYOUT_HEXADECAGONAL: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 16; u: (Mask: AV_CH_LAYOUT_HEXADECAGONAL); Opaque: nil);
  AV_CHANNEL_LAYOUT_STEREO_DOWNMIX: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 2; u: (Mask: AV_CH_LAYOUT_STEREO_DOWNMIX); Opaque: nil);
  AV_CHANNEL_LAYOUT_22POINT2: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 24; u: (Mask: AV_CH_LAYOUT_22POINT2); Opaque: nil);
  AV_CHANNEL_LAYOUT_7POINT1_TOP_BACK: TAVChannelLayout = (order: AV_CHANNEL_ORDER_NATIVE; nb_channels: 8; u: (Mask: AV_CH_LAYOUT_5POINT1POINT2_BACK); Opaque: nil);


type
  PAVBPrint = type Pointer;

function av_get_channel_layout(name: pchar): Tuint64_t; cdecl; external libavutil; deprecated;
function av_get_extended_channel_layout(name: pchar; channel_layout: Puint64_t; nb_channels: Plongint): longint; cdecl; external libavutil; deprecated;
procedure av_get_channel_layout_string(buf: pchar; buf_size: longint; nb_channels: longint; channel_layout: Tuint64_t); cdecl; external libavutil; deprecated;
procedure av_bprint_channel_layout(bp: PAVBPrint; nb_channels: longint; channel_layout: Tuint64_t); cdecl; external libavutil; deprecated;
function av_get_channel_layout_nb_channels(channel_layout: Tuint64_t): longint; cdecl; external libavutil; deprecated;
function av_get_default_channel_layout(nb_channels: longint): Tint64_t; cdecl; external libavutil; deprecated;
function av_get_channel_layout_channel_index(channel_layout: Tuint64_t; channel: Tuint64_t): longint; cdecl; external libavutil; deprecated;
function av_channel_layout_extract_channel(channel_layout: Tuint64_t; index: longint): Tuint64_t; cdecl; external libavutil; deprecated;
function av_get_channel_name(channel: Tuint64_t): pchar; cdecl; external libavutil; deprecated;
function av_get_channel_description(channel: Tuint64_t): pchar; cdecl; external libavutil; deprecated;
function av_get_standard_channel_layout(index: dword; layout: Puint64_t; name: PPchar): longint; cdecl; external libavutil; deprecated;

function av_channel_name(buf: pchar; buf_size: Tsize_t; channel: TAVChannel): longint; cdecl; external libavutil;
procedure av_channel_name_bprint(bp: PAVBPrint; channel_id: TAVChannel); cdecl; external libavutil;
function av_channel_description(buf: pchar; buf_size: Tsize_t; channel: TAVChannel): longint; cdecl; external libavutil;
procedure av_channel_description_bprint(bp: PAVBPrint; channel_id: TAVChannel); cdecl; external libavutil;
function av_channel_from_string(name: pchar): TAVChannel; cdecl; external libavutil;
function av_channel_layout_from_mask(channel_layout: PAVChannelLayout; mask: Tuint64_t): longint; cdecl; external libavutil;
function av_channel_layout_from_string(channel_layout: PAVChannelLayout; str: pchar): longint; cdecl; external libavutil;
procedure av_channel_layout_default(ch_layout: PAVChannelLayout; nb_channels: longint); cdecl; external libavutil;
function av_channel_layout_standard(opaque: Ppointer): PAVChannelLayout; cdecl; external libavutil;
procedure av_channel_layout_uninit(channel_layout: PAVChannelLayout); cdecl; external libavutil;
function av_channel_layout_copy(dst: PAVChannelLayout; src: PAVChannelLayout): longint; cdecl; external libavutil;
function av_channel_layout_describe(channel_layout: PAVChannelLayout; buf: pchar; buf_size: Tsize_t): longint; cdecl; external libavutil;
function av_channel_layout_describe_bprint(channel_layout: PAVChannelLayout; bp: PAVBPrint): longint; cdecl; external libavutil;
function av_channel_layout_channel_from_index(channel_layout: PAVChannelLayout; idx: dword): TAVChannel; cdecl; external libavutil;
function av_channel_layout_index_from_channel(channel_layout: PAVChannelLayout; channel: TAVChannel): longint; cdecl; external libavutil;
function av_channel_layout_index_from_string(channel_layout: PAVChannelLayout; name: pchar): longint; cdecl; external libavutil;
function av_channel_layout_channel_from_string(channel_layout: PAVChannelLayout; name: pchar): TAVChannel; cdecl; external libavutil;
function av_channel_layout_subset(channel_layout: PAVChannelLayout; mask: Tuint64_t): Tuint64_t; cdecl; external libavutil;
function av_channel_layout_check(channel_layout: PAVChannelLayout): longint; cdecl; external libavutil;
function av_channel_layout_compare(chl: PAVChannelLayout; chl1: PAVChannelLayout): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:14 ===


implementation



end.
