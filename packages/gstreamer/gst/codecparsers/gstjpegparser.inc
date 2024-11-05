/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   14:42                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

  {#  warning "The JPEG parsing library is unstable API and may change in future." }
  {#  warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
const
  GST_JPEG_MAX_FRAME_COMPONENTS = 256;
  GST_JPEG_MAX_SCAN_COMPONENTS = 4;
  GST_JPEG_MAX_QUANT_ELEMENTS = 64;

type
  PGstJpegMarker = ^TGstJpegMarker;
  TGstJpegMarker = longint;

const
  GST_JPEG_MARKER_SOF0 = $C0;
  GST_JPEG_MARKER_SOF1 = $C1;
  GST_JPEG_MARKER_SOF2 = $C2;
  GST_JPEG_MARKER_SOF3 = $C3;
  GST_JPEG_MARKER_SOF5 = $C5;
  GST_JPEG_MARKER_SOF6 = $C6;
  GST_JPEG_MARKER_SOF7 = $C7;
  GST_JPEG_MARKER_SOF9 = $C9;
  GST_JPEG_MARKER_SOF10 = $CA;
  GST_JPEG_MARKER_SOF11 = $CB;
  GST_JPEG_MARKER_SOF13 = $CD;
  GST_JPEG_MARKER_SOF14 = $CE;
  GST_JPEG_MARKER_SOF15 = $CF;
  GST_JPEG_MARKER_DHT = $C4;
  GST_JPEG_MARKER_DAC = $CC;
  GST_JPEG_MARKER_RST0 = $D0;
  GST_JPEG_MARKER_RST1 = $D1;
  GST_JPEG_MARKER_RST2 = $D2;
  GST_JPEG_MARKER_RST3 = $D3;
  GST_JPEG_MARKER_RST4 = $D4;
  GST_JPEG_MARKER_RST5 = $D5;
  GST_JPEG_MARKER_RST6 = $D6;
  GST_JPEG_MARKER_RST7 = $D7;
  GST_JPEG_MARKER_SOI = $D8;
  GST_JPEG_MARKER_EOI = $D9;
  GST_JPEG_MARKER_SOS = $DA;
  GST_JPEG_MARKER_DQT = $DB;
  GST_JPEG_MARKER_DNL = $DC;
  GST_JPEG_MARKER_DRI = $DD;
  GST_JPEG_MARKER_APP0 = $E0;
  GST_JPEG_MARKER_APP1 = $E1;
  GST_JPEG_MARKER_APP2 = $E2;
  GST_JPEG_MARKER_APP3 = $E3;
  GST_JPEG_MARKER_APP4 = $E4;
  GST_JPEG_MARKER_APP5 = $E5;
  GST_JPEG_MARKER_APP6 = $E6;
  GST_JPEG_MARKER_APP7 = $E7;
  GST_JPEG_MARKER_APP8 = $E8;
  GST_JPEG_MARKER_APP9 = $E9;
  GST_JPEG_MARKER_APP10 = $EA;
  GST_JPEG_MARKER_APP11 = $EB;
  GST_JPEG_MARKER_APP12 = $EC;
  GST_JPEG_MARKER_APP13 = $ED;
  GST_JPEG_MARKER_APP14 = $EE;
  GST_JPEG_MARKER_APP15 = $EF;
  GST_JPEG_MARKER_COM = $FE;

const
  GST_JPEG_MARKER_SOF_MIN = GST_JPEG_MARKER_SOF0;
  GST_JPEG_MARKER_SOF_MAX = GST_JPEG_MARKER_SOF15;
  GST_JPEG_MARKER_APP_MIN = GST_JPEG_MARKER_APP0;
  GST_JPEG_MARKER_APP_MAX = GST_JPEG_MARKER_APP15;
  GST_JPEG_MARKER_RST_MIN = GST_JPEG_MARKER_RST0;
  GST_JPEG_MARKER_RST_MAX = GST_JPEG_MARKER_RST7;

type
  PGstJpegProfile = ^TGstJpegProfile;
  TGstJpegProfile = longint;

const
  GST_JPEG_PROFILE_BASELINE = $00;
  GST_JPEG_PROFILE_EXTENDED = $01;
  GST_JPEG_PROFILE_PROGRESSIVE = $02;
  GST_JPEG_PROFILE_LOSSLESS = $03;

type
  PGstJpegEntropyCodingMode = ^TGstJpegEntropyCodingMode;
  TGstJpegEntropyCodingMode = longint;

const
  GST_JPEG_ENTROPY_CODING_HUFFMAN = $00;
  GST_JPEG_ENTROPY_CODING_ARITHMETIC = $08;

type
  TGstJpegQuantTable = record
    quant_precision: Tguint8;
    quant_table: array[0..(GST_JPEG_MAX_QUANT_ELEMENTS) - 1] of Tguint16;
    valid: Tgboolean;
  end;
  PGstJpegQuantTable = ^TGstJpegQuantTable;

  TGstJpegQuantTables = record
    quant_tables: array[0..(GST_JPEG_MAX_SCAN_COMPONENTS) - 1] of TGstJpegQuantTable;
  end;
  PGstJpegQuantTables = ^TGstJpegQuantTables;

  TGstJpegHuffmanTable = record
    huf_bits: array[0..15] of Tguint8;
    huf_values: array[0..255] of Tguint8;
    valid: Tgboolean;
  end;
  PGstJpegHuffmanTable = ^TGstJpegHuffmanTable;

  TGstJpegHuffmanTables = record
    dc_tables: array[0..(GST_JPEG_MAX_SCAN_COMPONENTS) - 1] of TGstJpegHuffmanTable;
    ac_tables: array[0..(GST_JPEG_MAX_SCAN_COMPONENTS) - 1] of TGstJpegHuffmanTable;
  end;
  PGstJpegHuffmanTables = ^TGstJpegHuffmanTables;

  TGstJpegScanComponent = record
    component_selector: Tguint8;
    dc_selector: Tguint8;
    ac_selector: Tguint8;
  end;
  PGstJpegScanComponent = ^TGstJpegScanComponent;

  TGstJpegScanHdr = record
    num_components: Tguint8;
    Components: array[0..(GST_JPEG_MAX_SCAN_COMPONENTS) - 1] of TGstJpegScanComponent;
    _reserved1: Tguint8;
    _reserved2: Tguint8;
    _reserved3: Tguint8;
    _reserved4: Tguint8;
  end;
  PGstJpegScanHdr = ^TGstJpegScanHdr;

  TGstJpegFrameComponent = record
    identifier: Tguint8;
    horizontal_factor: Tguint8;
    vertical_factor: Tguint8;
    quant_table_selector: Tguint8;
  end;
  PGstJpegFrameComponent = ^TGstJpegFrameComponent;

  TGstJpegFrameHdr = record
    sample_precision: Tguint8;
    Width: Tguint16;
    Height: Tguint16;
    num_components: Tguint8;
    Components: array[0..(GST_JPEG_MAX_FRAME_COMPONENTS) - 1] of TGstJpegFrameComponent;
  end;
  PGstJpegFrameHdr = ^TGstJpegFrameHdr;

  TGstJpegSegment = record
    marker: TGstJpegMarker;
    Data: Pguint8;
    offset: Tguint;
    size: Tgssize;
  end;
  PGstJpegSegment = ^TGstJpegSegment;


function gst_jpeg_parse(seg: PGstJpegSegment; Data: Pguint8; size: Tgsize; offset: Tguint): Tgboolean; cdecl; external libgstcodecparsers;
function gst_jpeg_segment_parse_frame_header(segment: PGstJpegSegment; frame_hdr: PGstJpegFrameHdr): Tgboolean; cdecl; external libgstcodecparsers;
function gst_jpeg_segment_parse_scan_header(segment: PGstJpegSegment; scan_hdr: PGstJpegScanHdr): Tgboolean; cdecl; external libgstcodecparsers;
function gst_jpeg_segment_parse_huffman_table(segment: PGstJpegSegment; huff_tables: PGstJpegHuffmanTables): Tgboolean; cdecl; external libgstcodecparsers;
function gst_jpeg_segment_parse_restart_interval(segment: PGstJpegSegment; interval: Pguint): Tgboolean; cdecl; external libgstcodecparsers;
function gst_jpeg_segment_parse_quantization_table(segment: PGstJpegSegment; quant_tables: PGstJpegQuantTables): Tgboolean; cdecl; external libgstcodecparsers;
procedure gst_jpeg_get_default_quantization_tables(quant_tables: PGstJpegQuantTables); cdecl; external libgstcodecparsers;
procedure gst_jpeg_get_default_huffman_tables(huff_tables: PGstJpegHuffmanTables); cdecl; external libgstcodecparsers;

// === Konventiert am: 7-10-24 11:30:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
