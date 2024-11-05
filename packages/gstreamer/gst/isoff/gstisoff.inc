/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 13-10-2024   13:44                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  PGstIsoffParserResult = ^TGstIsoffParserResult;
  TGstIsoffParserResult = longint;

const
  GST_ISOFF_PARSER_OK = 0;
  GST_ISOFF_PARSER_DONE = 1;
  GST_ISOFF_PARSER_UNEXPECTED = 2;
  GST_ISOFF_PARSER_ERROR = 3;

function gst_isoff_parse_box_header(reader: PGstByteReader; _type: Pguint32; extended_type: Tguint8arr16; header_size: Pguint; size: Pguint64): Tgboolean; cdecl; external libgstisoff;

const
  GST_ISOFF_FOURCC_UUID = (Ord('u') or (Ord('u') shl 8) or (Ord('i') shl 16) or (Ord('d') shl 24));
  GST_ISOFF_FOURCC_MOOF = (Ord('m') or (Ord('o') shl 8) or (Ord('o') shl 16) or (Ord('f') shl 24));
  GST_ISOFF_FOURCC_MFHD = (Ord('m') or (Ord('f') shl 8) or (Ord('h') shl 16) or (Ord('d') shl 24));
  GST_ISOFF_FOURCC_TFHD = (Ord('t') or (Ord('f') shl 8) or (Ord('h') shl 16) or (Ord('d') shl 24));
  GST_ISOFF_FOURCC_TRUN = (Ord('t') or (Ord('r') shl 8) or (Ord('u') shl 16) or (Ord('n') shl 24));
  GST_ISOFF_FOURCC_TRAF = (Ord('t') or (Ord('r') shl 8) or (Ord('a') shl 16) or (Ord('f') shl 24));
  GST_ISOFF_FOURCC_TFDT = (Ord('t') or (Ord('f') shl 8) or (Ord('d') shl 16) or (Ord('t') shl 24));
  GST_ISOFF_FOURCC_MDAT = (Ord('m') or (Ord('d') shl 8) or (Ord('a') shl 16) or (Ord('t') shl 24));
  GST_ISOFF_FOURCC_MOOV = (Ord('m') or (Ord('o') shl 8) or (Ord('o') shl 16) or (Ord('v') shl 24));
  GST_ISOFF_FOURCC_TRAK = (Ord('t') or (Ord('r') shl 8) or (Ord('a') shl 16) or (Ord('k') shl 24));
  GST_ISOFF_FOURCC_TKHD = (Ord('t') or (Ord('k') shl 8) or (Ord('h') shl 16) or (Ord('d') shl 24));
  GST_ISOFF_FOURCC_MDIA = (Ord('m') or (Ord('d') shl 8) or (Ord('i') shl 16) or (Ord('a') shl 24));
  GST_ISOFF_FOURCC_MDHD = (Ord('m') or (Ord('d') shl 8) or (Ord('h') shl 16) or (Ord('d') shl 24));
  GST_ISOFF_FOURCC_HDLR = (Ord('h') or (Ord('d') shl 8) or (Ord('l') shl 16) or (Ord('r') shl 24));
  GST_ISOFF_FOURCC_SIDX = (Ord('s') or (Ord('i') shl 8) or (Ord('d') shl 16) or (Ord('x') shl 24));
  GST_ISOFF_FOURCC_SOUN = (Ord('s') or (Ord('o') shl 8) or (Ord('u') shl 16) or (Ord('n') shl 24));
  GST_ISOFF_FOURCC_VIDE = (Ord('v') or (Ord('i') shl 8) or (Ord('d') shl 16) or (Ord('e') shl 24));

type
  TGstTfxdBox = record
    version: Tguint8;
    flags: Tguint32;
    time: Tguint64;
    duration: Tguint64;
  end;
  PGstTfxdBox = ^TGstTfxdBox;

  TGstTfrfBoxEntry = record
    time: Tguint64;
    duration: Tguint64;
  end;
  PGstTfrfBoxEntry = ^TGstTfrfBoxEntry;

  PGstTfrfBox = ^TGstTfrfBox;

  TGstTfrfBox = record
    version: Tguint8;
    flags: Tguint32;
    entries_count: Tgint;
    entries: PGArray;
  end;

  TGstMfhdBox = record
    sequence_number: Tguint32;
  end;
  PGstMfhdBox = ^TGstMfhdBox;

  PGstTfhdFlags = ^TGstTfhdFlags;
  TGstTfhdFlags = longint;

const
  GST_TFHD_FLAGS_BASE_DATA_OFFSET_PRESENT = $000001;
  GST_TFHD_FLAGS_SAMPLE_DESCRIPTION_INDEX_PRESENT = $000002;
  GST_TFHD_FLAGS_DEFAULT_SAMPLE_DURATION_PRESENT = $000008;
  GST_TFHD_FLAGS_DEFAULT_SAMPLE_SIZE_PRESENT = $000010;
  GST_TFHD_FLAGS_DEFAULT_SAMPLE_FLAGS_PRESENT = $000020;
  GST_TFHD_FLAGS_DURATION_IS_EMPTY = $010000;
  GST_TFHD_FLAGS_DEFAULT_BASE_IS_MOOF = $020000;

type
  TGstTfhdBox = record
    version: Tguint8;
    flags: TGstTfhdFlags;
    track_id: Tguint32;
    base_data_offset: Tguint64;
    sample_description_index: Tguint32;
    default_sample_duration: Tguint32;
    default_sample_size: Tguint32;
    default_sample_flags: Tguint32;
  end;
  PGstTfhdBox = ^TGstTfhdBox;

  PGstTrunFlags = ^TGstTrunFlags;
  TGstTrunFlags = longint;

const
  GST_TRUN_FLAGS_DATA_OFFSET_PRESENT = $000001;
  GST_TRUN_FLAGS_FIRST_SAMPLE_FLAGS_PRESENT = $000004;
  GST_TRUN_FLAGS_SAMPLE_DURATION_PRESENT = $000100;
  GST_TRUN_FLAGS_SAMPLE_SIZE_PRESENT = $000200;
  GST_TRUN_FLAGS_SAMPLE_FLAGS_PRESENT = $000400;
  GST_TRUN_FLAGS_SAMPLE_COMPOSITION_TIME_OFFSETS_PRESENT = $000800;

type
  TGstTrunBox = record
    version: Tguint8;
    flags: TGstTrunFlags;
    sample_count: Tguint32;
    data_offset: Tgint32;
    first_sample_flags: Tguint32;
    samples: PGArray;
  end;
  PGstTrunBox = ^TGstTrunBox;

  TGstTrunSample = record
    sample_duration: Tguint32;
    sample_size: Tguint32;
    sample_flags: Tguint32;
    sample_composition_time_offset: record
      case longint of
        0: (u: Tguint32);
        1: (s: Tgint32);
      end;
  end;
  PGstTrunSample = ^TGstTrunSample;

  TGstTdftBox = record
    decode_time: Tguint64;
  end;
  PGstTdftBox = ^TGstTdftBox;

  TGstTfdtBox = TGstTdftBox;
  PGstTfdtBox = ^TGstTfdtBox;

  TGstTrafBox = record
    tfhd: TGstTfhdBox;
    tfdt: TGstTfdtBox;
    trun: PGArray;
    tfrf: PGstTfrfBox;
    tfxd: PGstTfxdBox;
  end;
  PGstTrafBox = ^TGstTrafBox;

  TGstMoofBox = record
    mfhd: TGstMfhdBox;
    traf: PGArray;
  end;
  PGstMoofBox = ^TGstMoofBox;

function gst_isoff_moof_box_parse(reader: PGstByteReader): PGstMoofBox; cdecl; external libgstisoff;
procedure gst_isoff_moof_box_free(moof: PGstMoofBox); cdecl; external libgstisoff;

type
  TGstTkhdBox = record
    track_id: Tguint32;
  end;
  PGstTkhdBox = ^TGstTkhdBox;

  TGstMdhdBox = record
    timescale: Tguint32;
  end;
  PGstMdhdBox = ^TGstMdhdBox;

  TGstHdlrBox = record
    handler_type: Tguint32;
  end;
  PGstHdlrBox = ^TGstHdlrBox;

  TGstMdiaBox = record
    mdhd: TGstMdhdBox;
    hdlr: TGstHdlrBox;
  end;
  PGstMdiaBox = ^TGstMdiaBox;

  TGstTrakBox = record
    tkhd: TGstTkhdBox;
    mdia: TGstMdiaBox;
  end;
  PGstTrakBox = ^TGstTrakBox;

  TGstMoovBox = record
    trak: PGArray;
  end;
  PGstMoovBox = ^TGstMoovBox;

function gst_isoff_moov_box_parse(reader: PGstByteReader): PGstMoovBox; cdecl; external libgstisoff;
procedure gst_isoff_moov_box_free(moov: PGstMoovBox); cdecl; external libgstisoff;

type
  TGstSidxBoxEntry = record
    ref_type: Tgboolean;
    size: Tguint32;
    duration: TGstClockTime;
    starts_with_sap: Tgboolean;
    sap_type: Tguint8;
    sap_delta_time: Tguint32;
    offset: Tguint64;
    pts: TGstClockTime;
  end;
  PGstSidxBoxEntry = ^TGstSidxBoxEntry;

  TGstSidxBox = record
    version: Tguint8;
    flags: Tguint32;
    ref_id: Tguint32;
    timescale: Tguint32;
    earliest_pts: Tguint64;
    first_offset: Tguint64;
    entry_index: Tgint;
    entries_count: Tgint;
    entries: PGstSidxBoxEntry;
  end;
  PGstSidxBox = ^TGstSidxBox;

  PGstSidxParserStatus = ^TGstSidxParserStatus;
  TGstSidxParserStatus = longint;

const
  GST_ISOFF_SIDX_PARSER_INIT_ = 0;
  GST_ISOFF_SIDX_PARSER_HEADER = 1;
  GST_ISOFF_SIDX_PARSER_DATA = 2;
  GST_ISOFF_SIDX_PARSER_FINISHED = 3;

type
  PGstSidxParser = ^TGstSidxParser;

  TGstSidxParser = record
    status: TGstSidxParserStatus;
    size: Tguint64;
    cumulative_entry_size: Tguint64;
    cumulative_pts: Tguint64;
    sidx: TGstSidxBox;
  end;

procedure gst_isoff_sidx_parser_init(parser: PGstSidxParser); cdecl; external libgstisoff;
procedure gst_isoff_sidx_parser_clear(parser: PGstSidxParser); cdecl; external libgstisoff;
function gst_isoff_sidx_parser_parse(parser: PGstSidxParser; reader: PGstByteReader; consumed: Pguint): TGstIsoffParserResult; cdecl; external libgstisoff;
function gst_isoff_sidx_parser_add_buffer(parser: PGstSidxParser; buf: PGstBuffer; consumed: Pguint): TGstIsoffParserResult; cdecl; external libgstisoff;

function GST_ISOFF_SAMPLE_FLAGS_IS_LEADING(flags: Tguint32): Tgboolean;
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEPENDS_ON(flags: Tguint32): Tgboolean;
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_DEPENDED_ON(flags: Tguint32): Tgboolean;
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_HAS_REDUNDANCY(flags: Tguint32): Tgboolean;
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_PADDING_VALUE(flags: Tguint32): Tgboolean;
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_NON_SYNC_SAMPLE(flags: Tguint32): Tgboolean;
function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEGRADATION_PRIORITY(flags: Tguint32): Tgboolean;

// === Konventiert am: 13-10-24 13:28:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_ISOFF_SAMPLE_FLAGS_IS_LEADING(flags: Tguint32): Tgboolean;
begin
  GST_ISOFF_SAMPLE_FLAGS_IS_LEADING := (flags shr 26) and $03 <> 0;
end;

function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEPENDS_ON(flags: Tguint32): Tgboolean;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEPENDS_ON := (flags shr 24) and $03 <> 0;
end;

function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_DEPENDED_ON(flags: Tguint32
  ): Tgboolean;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_DEPENDED_ON := (flags shr 22) and $03 <> 0;
end;

function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_HAS_REDUNDANCY(flags: Tguint32
  ): Tgboolean;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_HAS_REDUNDANCY := (flags shr 20) and $03 <> 0;
end;

function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_PADDING_VALUE(flags: Tguint32
  ): Tgboolean;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_PADDING_VALUE := (flags shr 17) and $07 <> 0;
end;

function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_NON_SYNC_SAMPLE(flags: Tguint32
  ): Tgboolean;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_IS_NON_SYNC_SAMPLE := (flags shr 16) and $01 <> 0;
end;

function GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEGRADATION_PRIORITY(flags: Tguint32
  ): Tgboolean;
begin
  GST_ISOFF_SAMPLE_FLAGS_SAMPLE_DEGRADATION_PRIORITY := (flags shr 0) and $0f <> 0;
end;


{$ENDIF read_implementation}
