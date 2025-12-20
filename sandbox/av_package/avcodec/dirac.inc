{$IFDEF read_interface}


const
  MAX_DWT_LEVELS = 5;

type
  TDiracParseCodes = longint;

const
  DIRAC_PCODE_SEQ_HEADER = $00;
  DIRAC_PCODE_END_SEQ = $10;
  DIRAC_PCODE_AUX = $20;
  DIRAC_PCODE_PAD = $30;
  DIRAC_PCODE_PICTURE_CODED = $08;
  DIRAC_PCODE_PICTURE_RAW = $48;
  DIRAC_PCODE_PICTURE_LOW_DEL = $C8;
  DIRAC_PCODE_PICTURE_HQ = $E8;
  DIRAC_PCODE_INTER_NOREF_CO1 = $0A;
  DIRAC_PCODE_INTER_NOREF_CO2 = $09;
  DIRAC_PCODE_INTER_REF_CO1 = $0D;
  DIRAC_PCODE_INTER_REF_CO2 = $0E;
  DIRAC_PCODE_INTRA_REF_CO = $0C;
  DIRAC_PCODE_INTRA_REF_RAW = $4C;
  DIRAC_PCODE_INTRA_REF_PICT = $CC;
  DIRAC_PCODE_MAGIC = $42424344;

type
  TDiracVersionInfo = record
    major: longint;
    minor: longint;
  end;
  PDiracVersionInfo = ^TDiracVersionInfo;

  TAVDiracSeqHeader = record
    width: dword;
    height: dword;
    chroma_format: Tuint8_t;
    interlaced: Tuint8_t;
    top_field_first: Tuint8_t;
    frame_rate_index: Tuint8_t;
    aspect_ratio_index: Tuint8_t;
    clean_width: Tuint16_t;
    clean_height: Tuint16_t;
    clean_left_offset: Tuint16_t;
    clean_right_offset: Tuint16_t;
    pixel_range_index: Tuint8_t;
    color_spec_index: Tuint8_t;
    profile: longint;
    level: longint;
    framerate: TAVRational;
    sample_aspect_ratio: TAVRational;
    pix_fmt: TAVPixelFormat;
    color_range: TAVColorRange;
    color_primaries: TAVColorPrimaries;
    color_trc: TAVColorTransferCharacteristic;
    colorspace: TAVColorSpace;
    version: TDiracVersionInfo;
    bit_depth: longint;
  end;
  PAVDiracSeqHeader = ^TAVDiracSeqHeader;
  PPAVDiracSeqHeader = ^PAVDiracSeqHeader;

function av_dirac_parse_sequence_header(dsh: PPAVDiracSeqHeader; buf: Puint8_t; buf_size: Tsize_t; log_ctx: pointer): longint; cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
