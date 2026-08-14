unit codestream_header;

interface

uses
  fp_jxl, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PJxlOrientation = ^TJxlOrientation;
  TJxlOrientation = longint;
const
  JXL_ORIENT_IDENTITY = 1;
  JXL_ORIENT_FLIP_HORIZONTAL = 2;
  JXL_ORIENT_ROTATE_180 = 3;
  JXL_ORIENT_FLIP_VERTICAL = 4;
  JXL_ORIENT_TRANSPOSE = 5;
  JXL_ORIENT_ROTATE_90_CW = 6;
  JXL_ORIENT_ANTI_TRANSPOSE = 7;
  JXL_ORIENT_ROTATE_90_CCW = 8;

type
  PJxlExtraChannelType = ^TJxlExtraChannelType;
  TJxlExtraChannelType = longint;
const
  JXL_CHANNEL_ALPHA = 0;
  JXL_CHANNEL_DEPTH = 1;
  JXL_CHANNEL_SPOT_COLOR = 2;
  JXL_CHANNEL_SELECTION_MASK = 3;
  JXL_CHANNEL_BLACK = 4;
  JXL_CHANNEL_CFA = 5;
  JXL_CHANNEL_THERMAL = 6;
  JXL_CHANNEL_RESERVED0 = 7;
  JXL_CHANNEL_RESERVED1 = 8;
  JXL_CHANNEL_RESERVED2 = 9;
  JXL_CHANNEL_RESERVED3 = 10;
  JXL_CHANNEL_RESERVED4 = 11;
  JXL_CHANNEL_RESERVED5 = 12;
  JXL_CHANNEL_RESERVED6 = 13;
  JXL_CHANNEL_RESERVED7 = 14;
  JXL_CHANNEL_UNKNOWN = 15;
  JXL_CHANNEL_OPTIONAL = 16;

type
  PJxlPreviewHeader = ^TJxlPreviewHeader;
  TJxlPreviewHeader = record
    xsize: Tuint32_t;
    ysize: Tuint32_t;
  end;

  PJxlIntrinsicSizeHeader = ^TJxlIntrinsicSizeHeader;
  TJxlIntrinsicSizeHeader = record
    xsize: Tuint32_t;
    ysize: Tuint32_t;
  end;

  PJxlAnimationHeader = ^TJxlAnimationHeader;
  TJxlAnimationHeader = record
    tps_numerator: Tuint32_t;
    tps_denominator: Tuint32_t;
    num_loops: Tuint32_t;
    have_timecodes: TJXL_BOOL;
  end;

  PJxlBasicInfo = ^TJxlBasicInfo;
  TJxlBasicInfo = record
    have_container: TJXL_BOOL;
    xsize: Tuint32_t;
    ysize: Tuint32_t;
    bits_per_sample: Tuint32_t;
    exponent_bits_per_sample: Tuint32_t;
    intensity_target: single;
    min_nits: single;
    relative_to_max_display: TJXL_BOOL;
    linear_below: single;
    uses_original_profile: TJXL_BOOL;
    have_preview: TJXL_BOOL;
    have_animation: TJXL_BOOL;
    orientation: TJxlOrientation;
    num_color_channels: Tuint32_t;
    num_extra_channels: Tuint32_t;
    alpha_bits: Tuint32_t;
    alpha_exponent_bits: Tuint32_t;
    alpha_premultiplied: TJXL_BOOL;
    preview: TJxlPreviewHeader;
    animation: TJxlAnimationHeader;
    intrinsic_xsize: Tuint32_t;
    intrinsic_ysize: Tuint32_t;
    padding: array[0..99] of Tuint8_t;
  end;

  PJxlExtraChannelInfo = ^TJxlExtraChannelInfo;
  TJxlExtraChannelInfo = record
    _type: TJxlExtraChannelType;
    bits_per_sample: Tuint32_t;
    exponent_bits_per_sample: Tuint32_t;
    dim_shift: Tuint32_t;
    name_length: Tuint32_t;
    alpha_premultiplied: TJXL_BOOL;
    spot_color: array[0..3] of single;
    cfa_channel: Tuint32_t;
  end;

  PJxlHeaderExtensions = ^TJxlHeaderExtensions;
  TJxlHeaderExtensions = record
    extensions: Tuint64_t;
  end;

type
  PJxlBlendMode = ^TJxlBlendMode;
  TJxlBlendMode = longint;
const
  JXL_BLEND_REPLACE = 0;
  JXL_BLEND_ADD = 1;
  JXL_BLEND_BLEND = 2;
  JXL_BLEND_MULADD = 3;
  JXL_BLEND_MUL = 4;

type
  PJxlBlendInfo = ^TJxlBlendInfo;
  TJxlBlendInfo = record
    blendmode: TJxlBlendMode;
    source: Tuint32_t;
    alpha: Tuint32_t;
    clamp: TJXL_BOOL;
  end;

  PJxlLayerInfo = ^TJxlLayerInfo;
  TJxlLayerInfo = record
    have_crop: TJXL_BOOL;
    crop_x0: Tint32_t;
    crop_y0: Tint32_t;
    xsize: Tuint32_t;
    ysize: Tuint32_t;
    blend_info: TJxlBlendInfo;
    save_as_reference: Tuint32_t;
  end;

  PJxlFrameHeader = ^TJxlFrameHeader;
  TJxlFrameHeader = record
    duration: Tuint32_t;
    timecode: Tuint32_t;
    name_length: Tuint32_t;
    is_last: TJXL_BOOL;
    layer_info: TJxlLayerInfo;
  end;

  // === Konventiert am: 14-8-26 19:29:12 ===


implementation



end.
