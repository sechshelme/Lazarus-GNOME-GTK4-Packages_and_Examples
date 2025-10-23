
{$IFDEF read_interface}

  {#warning "The VC1 parsing library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
const
  MAX_HRD_NUM_LEAKY_BUCKETS = 31;
  GST_VC1_BFRACTION_BASIS = 840;
  GST_VC1_BFRACTION_RESERVED = GST_VC1_BFRACTION_BASIS + 1;
  GST_VC1_BFRACTION_PTYPE_BI = GST_VC1_BFRACTION_BASIS + 2;

type
  PGstVC1StartCode = ^TGstVC1StartCode;
  TGstVC1StartCode = longint;

const
  GST_VC1_END_OF_SEQ = $0A;
  GST_VC1_SLICE = $0B;
  GST_VC1_FIELD = $0C;
  GST_VC1_FRAME = $0D;
  GST_VC1_ENTRYPOINT = $0E;
  GST_VC1_SEQUENCE = $0F;
  GST_VC1_SLICE_USER = $1B;
  GST_VC1_FIELD_USER = $1C;
  GST_VC1_FRAME_USER = $1D;
  GST_VC1_ENTRY_POINT_USER = $1E;
  GST_VC1_SEQUENCE_USER = $1F;

type
  PGstVC1Profile = ^TGstVC1Profile;
  TGstVC1Profile = longint;

const
  GST_VC1_PROFILE_SIMPLE = 0;
  GST_VC1_PROFILE_MAIN = 1;
  GST_VC1_PROFILE_RESERVED = 2;
  GST_VC1_PROFILE_ADVANCED = 3;

type
  PGstVC1ParserResult = ^TGstVC1ParserResult;
  TGstVC1ParserResult = longint;

const
  GST_VC1_PARSER_OK = 0;
  GST_VC1_PARSER_BROKEN_DATA = 1;
  GST_VC1_PARSER_NO_BDU = 2;
  GST_VC1_PARSER_NO_BDU_END = 3;
  GST_VC1_PARSER_ERROR = 4;

type
  PGstVC1PictureType = ^TGstVC1PictureType;
  TGstVC1PictureType = longint;

const
  GST_VC1_PICTURE_TYPE_P = 0;
  GST_VC1_PICTURE_TYPE_B = 1;
  GST_VC1_PICTURE_TYPE_I = 2;
  GST_VC1_PICTURE_TYPE_BI = 3;
  GST_VC1_PICTURE_TYPE_SKIPPED = 4;

type
  PGstVC1Level = ^TGstVC1Level;
  TGstVC1Level = longint;

const
  GST_VC1_LEVEL_LOW = 0;
  GST_VC1_LEVEL_MEDIUM = 2;
  GST_VC1_LEVEL_HIGH = 4;
  GST_VC1_LEVEL_L0 = 0;
  GST_VC1_LEVEL_L1 = 1;
  GST_VC1_LEVEL_L2 = 2;
  GST_VC1_LEVEL_L3 = 3;
  GST_VC1_LEVEL_L4 = 4;
  GST_VC1_LEVEL_UNKNOWN = 255;

type
  PGstVC1QuantizerSpec = ^TGstVC1QuantizerSpec;
  TGstVC1QuantizerSpec = longint;

const
  GST_VC1_QUANTIZER_IMPLICITLY = 0;
  GST_VC1_QUANTIZER_EXPLICITLY = 1;
  GST_VC1_QUANTIZER_NON_UNIFORM = 2;
  GST_VC1_QUANTIZER_UNIFORM = 3;

type
  PGstVC1DQProfile = ^TGstVC1DQProfile;
  TGstVC1DQProfile = longint;

const
  GST_VC1_DQPROFILE_FOUR_EDGES = 0;
  GST_VC1_DQPROFILE_DOUBLE_EDGES = 1;
  GST_VC1_DQPROFILE_SINGLE_EDGE = 2;
  GST_VC1_DQPROFILE_ALL_MBS = 3;

type
  PGstVC1Condover = ^TGstVC1Condover;
  TGstVC1Condover = longint;

const
  GST_VC1_CONDOVER_NONE = 0;
  GST_VC1_CONDOVER_ALL = 1;
  GST_VC1_CONDOVER_SELECT = 2;

type
  PGstVC1MvMode = ^TGstVC1MvMode;
  TGstVC1MvMode = longint;

const
  GST_VC1_MVMODE_1MV_HPEL_BILINEAR = 0;
  GST_VC1_MVMODE_1MV = 1;
  GST_VC1_MVMODE_1MV_HPEL = 2;
  GST_VC1_MVMODE_MIXED_MV = 3;
  GST_VC1_MVMODE_INTENSITY_COMP = 4;

type
  PGstVC1FrameCodingMode = ^TGstVC1FrameCodingMode;
  TGstVC1FrameCodingMode = longint;

const
  GST_VC1_FRAME_PROGRESSIVE = $0;
  GST_VC1_FRAME_INTERLACE = $10;
  GST_VC1_FIELD_INTERLACE = $11;

type
  TGstVC1HrdParam = record
    hrd_num_leaky_buckets: Tguint8;
    bit_rate_exponent: Tguint8;
    buffer_size_exponent: Tguint8;
    hrd_rate: array[0..(MAX_HRD_NUM_LEAKY_BUCKETS) - 1] of Tguint16;
    hrd_buffer: array[0..(MAX_HRD_NUM_LEAKY_BUCKETS) - 1] of Tguint16;
  end;

  PGstVC1HrdParam = ^TGstVC1HrdParam;

  TGstVC1EntryPointHdr = record
    broken_link: Tguint8;
    closed_entry: Tguint8;
    panscan_flag: Tguint8;
    refdist_flag: Tguint8;
    loopfilter: Tguint8;
    fastuvmc: Tguint8;
    extended_mv: Tguint8;
    dquant: Tguint8;
    vstransform: Tguint8;
    overlap: Tguint8;
    quantizer: Tguint8;
    coded_size_flag: Tguint8;
    coded_width: Tguint16;
    coded_height: Tguint16;
    extended_dmv: Tguint8;
    range_mapy_flag: Tguint8;
    range_mapy: Tguint8;
    range_mapuv_flag: Tguint8;
    range_mapuv: Tguint8;
    hrd_full: array[0..(MAX_HRD_NUM_LEAKY_BUCKETS) - 1] of Tguint8;
  end;
  PGstVC1EntryPointHdr = ^TGstVC1EntryPointHdr;

  TGstVC1AdvancedSeqHdr = record
    level: TGstVC1Level;
    frmrtq_postproc: Tguint8;
    bitrtq_postproc: Tguint8;
    postprocflag: Tguint8;
    max_coded_width: Tguint16;
    max_coded_height: Tguint16;
    pulldown: Tguint8;
    interlace: Tguint8;
    tfcntrflag: Tguint8;
    finterpflag: Tguint8;
    psf: Tguint8;
    display_ext: Tguint8;
    disp_horiz_size: Tguint16;
    disp_vert_size: Tguint16;
    aspect_ratio_flag: Tguint8;
    aspect_ratio: Tguint8;
    aspect_horiz_size: Tguint8;
    aspect_vert_size: Tguint8;
    framerate_flag: Tguint8;
    framerateind: Tguint8;
    frameratenr: Tguint8;
    frameratedr: Tguint8;
    framerateexp: Tguint16;
    color_format_flag: Tguint8;
    color_prim: Tguint8;
    transfer_char: Tguint8;
    matrix_coef: Tguint8;
    hrd_param_flag: Tguint8;
    colordiff_format: Tguint8;
    hrd_param: TGstVC1HrdParam;
    framerate: Tguint;
    bitrate: Tguint;
    par_n: Tguint;
    par_d: Tguint;
    fps_n: Tguint;
    fps_d: Tguint;
    entrypoint: TGstVC1EntryPointHdr;
  end;
  PGstVC1AdvancedSeqHdr = ^TGstVC1AdvancedSeqHdr;

  TGstVC1SeqStructA = record
    vert_size: Tguint32;
    horiz_size: Tguint32;
  end;
  PGstVC1SeqStructA = ^TGstVC1SeqStructA;

  TGstVC1SeqStructB = record
    level: TGstVC1Level;
    cbr: Tguint8;
    framerate: Tguint32;
    hrd_buffer: Tguint32;
    hrd_rate: Tguint32;
  end;
  PGstVC1SeqStructB = ^TGstVC1SeqStructB;

  TGstVC1SeqStructC = record
    profile: TGstVC1Profile;
    frmrtq_postproc: Tguint8;
    bitrtq_postproc: Tguint8;
    res_sprite: Tguint8;
    loop_filter: Tguint8;
    multires: Tguint8;
    fastuvmc: Tguint8;
    extended_mv: Tguint8;
    dquant: Tguint8;
    vstransform: Tguint8;
    overlap: Tguint8;
    syncmarker: Tguint8;
    rangered: Tguint8;
    maxbframes: Tguint8;
    quantizer: Tguint8;
    finterpflag: Tguint8;
    framerate: Tguint;
    bitrate: Tguint;
    coded_width: Tguint16;
    coded_height: Tguint16;
    wmvp: Tguint8;
    slice_code: Tguint8;
  end;
  PGstVC1SeqStructC = ^TGstVC1SeqStructC;

  TGstVC1SeqLayer = record
    numframes: Tguint32;
    struct_a: TGstVC1SeqStructA;
    struct_b: TGstVC1SeqStructB;
    struct_c: TGstVC1SeqStructC;
  end;
  PGstVC1SeqLayer = ^TGstVC1SeqLayer;

  TGstVC1SeqHdr = record
    profile: TGstVC1Profile;
    struct_c: TGstVC1SeqStructC;
    mb_height: Tguint;
    mb_width: Tguint;
    mb_stride: Tguint;
    advanced: TGstVC1AdvancedSeqHdr;
  end;
  PGstVC1SeqHdr = ^TGstVC1SeqHdr;

  TGstVC1PicSimpleMain = record
    frmcnt: Tguint8;
    mvrange: Tguint8;
    rangeredfrm: Tguint8;
    respic: Tguint8;
    transacfrm2: Tguint8;
    bf: Tguint8;
    mvmode: Tguint8;
    mvtab: Tguint8;
    ttmbf: Tguint8;
    mvmode2: Tguint8;
    lumscale: Tguint8;
    lumshift: Tguint8;
    cbptab: Tguint8;
    ttfrm: Tguint8;
    bfraction: Tguint16;
    mvtypemb: Tguint8;
    skipmb: Tguint8;
    directmb: Tguint8;
  end;
  PGstVC1PicSimpleMain = ^TGstVC1PicSimpleMain;

  TGstVC1PicAdvanced = record
    fcm: TGstVC1FrameCodingMode;
    tfcntr: Tguint8;
    rptfrm: Tguint8;
    tff: Tguint8;
    rff: Tguint8;
    ps_present: Tguint8;
    ps_hoffset: Tguint32;
    ps_voffset: Tguint32;
    ps_width: Tguint16;
    ps_height: Tguint16;
    rndctrl: Tguint8;
    uvsamp: Tguint8;
    postproc: Tguint8;
    mvrange: Tguint8;
    mvmode: Tguint8;
    mvtab: Tguint8;
    cbptab: Tguint8;
    ttmbf: Tguint8;
    ttfrm: Tguint8;
    bfraction: Tguint16;
    mvmode2: Tguint8;
    lumscale: Tguint8;
    lumshift: Tguint8;
    bf: Tguint8;
    condover: Tguint8;
    transacfrm2: Tguint8;
    acpred: Tguint8;
    overflags: Tguint8;
    mvtypemb: Tguint8;
    skipmb: Tguint8;
    directmb: Tguint8;
    forwardmb: Tguint8;
    fieldtx: Tguint8;
    intcomp: Tguint8;
    dmvrange: Tguint8;
    mbmodetab: Tguint8;
    imvtab: Tguint8;
    icbptab: Tguint8;
    mvbptab2: Tguint8;
    mvbptab4: Tguint8;
    mvswitch4: Tguint8;
    refdist: Tguint16;
    fptype: Tguint8;
    numref: Tguint8;
    reffield: Tguint8;
    lumscale2: Tguint8;
    lumshift2: Tguint8;
    intcompfield: Tguint8;
  end;
  PGstVC1PicAdvanced = ^TGstVC1PicAdvanced;

  TGstVC1BitPlanes = record
    acpred: Pguint8;
    fieldtx: Pguint8;
    overflags: Pguint8;
    mvtypemb: Pguint8;
    skipmb: Pguint8;
    directmb: Pguint8;
    forwardmb: Pguint8;
    size: Tguint;
  end;
  PGstVC1BitPlanes = ^TGstVC1BitPlanes;

  TGstVC1VopDquant = record
    pqdiff: Tguint8;
    abspq: Tguint8;
    altpquant: Tguint8;
    dquantfrm: Tguint8;
    dqprofile: Tguint8;
    dqbedge: Tguint8;
    unused: Tguint8;
    dqbilevel: Tguint8;
  end;
  PGstVC1VopDquant = ^TGstVC1VopDquant;

  TGstVC1FrameLayer = record
    key: Tguint8;
    framesize: Tguint32;
    timestamp: Tguint32;
    next_framelayer_offset: Tguint32;
    skiped_p_frame: Tguint8;
  end;
  PGstVC1FrameLayer = ^TGstVC1FrameLayer;

  TGstVC1FrameHdr = record
    ptype: TGstVC1PictureType;
    interpfrm: Tguint8;
    halfqp: Tguint8;
    transacfrm: Tguint8;
    transdctab: Tguint8;
    pqindex: Tguint8;
    pquantizer: Tguint8;
    pquant: Tguint8;
    profile: Tguint8;
    dquant: Tguint8;
    vopdquant: TGstVC1VopDquant;
    pic: record
      case longint of
        0: (simple: TGstVC1PicSimpleMain);
        1: (advanced: TGstVC1PicAdvanced);
      end;
    header_size: Tguint;
  end;
  PGstVC1FrameHdr = ^TGstVC1FrameHdr;

  TGstVC1SliceHdr = record
    slice_addr: Tguint16;
    header_size: Tguint;
  end;
  PGstVC1SliceHdr = ^TGstVC1SliceHdr;

  TGstVC1BDU = record
    _type: TGstVC1StartCode;
    size: Tguint;
    sc_offset: Tguint;
    offset: Tguint;
    Data: Pguint8;
  end;
  PGstVC1BDU = ^TGstVC1BDU;


function gst_vc1_identify_next_bdu(Data: Pguint8; size: Tgsize; bdu: PGstVC1BDU): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_sequence_header(Data: Pguint8; size: Tgsize; seqhdr: PGstVC1SeqHdr): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_entry_point_header(Data: Pguint8; size: Tgsize; entrypoint: PGstVC1EntryPointHdr; seqhdr: PGstVC1SeqHdr): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_sequence_layer(Data: Pguint8; size: Tgsize; seqlayer: PGstVC1SeqLayer): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_sequence_header_struct_a(Data: Pguint8; size: Tgsize; structa: PGstVC1SeqStructA): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_sequence_header_struct_b(Data: Pguint8; size: Tgsize; structb: PGstVC1SeqStructB): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_sequence_header_struct_c(Data: Pguint8; size: Tgsize; structc: PGstVC1SeqStructC): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_frame_layer(Data: Pguint8; size: Tgsize; framelayer: PGstVC1FrameLayer): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_frame_header(Data: Pguint8; size: Tgsize; framehdr: PGstVC1FrameHdr; seqhdr: PGstVC1SeqHdr; bitplanes: PGstVC1BitPlanes): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_field_header(Data: Pguint8; size: Tgsize; fieldhdr: PGstVC1FrameHdr; seqhdr: PGstVC1SeqHdr; bitplanes: PGstVC1BitPlanes): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_parse_slice_header(Data: Pguint8; size: Tgsize; slicehdr: PGstVC1SliceHdr; seqhdr: PGstVC1SeqHdr): TGstVC1ParserResult; cdecl; external libgstcodecparsers;
function gst_vc1_bitplanes_new: PGstVC1BitPlanes; cdecl; external libgstcodecparsers;
procedure gst_vc1_bitplanes_free(bitplanes: PGstVC1BitPlanes); cdecl; external libgstcodecparsers;
procedure gst_vc1_bitplanes_free_1(bitplanes: PGstVC1BitPlanes); cdecl; external libgstcodecparsers;
function gst_vc1_bitplanes_ensure_size(bitplanes: PGstVC1BitPlanes; seqhdr: PGstVC1SeqHdr): Tgboolean; cdecl; external libgstcodecparsers;

// === Konventiert am: 7-10-24 11:30:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
