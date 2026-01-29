unit fp_zint;

interface

const
  {$IFDEF Linux}
  libzint = 'zint';
  {$ENDIF}

  {$IFDEF Windows}
  libzint = 'libzint.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pzint_vector_rect = ^Tzint_vector_rect;

  Tzint_vector_rect = record
    x: single;
    y: single;
    height: single;
    width: single;
    colour: longint;
    next: Pzint_vector_rect;
  end;

  Pzint_vector_hexagon = ^Tzint_vector_hexagon;

  Tzint_vector_hexagon = record
    x: single;
    y: single;
    diameter: single;
    rotation: longint;
    next: Pzint_vector_hexagon;
  end;

  Pzint_vector_string = ^Tzint_vector_string;

  Tzint_vector_string = record
    x: single;
    y: single;
    fsize: single;
    width: single;
    length: longint;
    rotation: longint;
    halign: longint;
    text: pbyte;
    next: Pzint_vector_string;
  end;

  Pzint_vector_circle = ^Tzint_vector_circle;

  Tzint_vector_circle = record
    x: single;
    y: single;
    diameter: single;
    width: single;
    colour: longint;
    next: Pzint_vector_circle;
  end;

  Tzint_vector = record
    width: single;
    height: single;
    rectangles: Pzint_vector_rect;
    hexagons: Pzint_vector_hexagon;
    strings: Pzint_vector_string;
    circles: Pzint_vector_circle;
  end;
  Pzint_vector = ^Tzint_vector;

  Tzint_structapp = record
    index: longint;
    count: longint;
    id: array[0..31] of char;
  end;
  Pzint_structapp = ^Tzint_structapp;

  Tzint_symbol = record
    symbology: longint;
    height: single;
    scale: single;
    whitespace_width: longint;
    whitespace_height: longint;
    border_width: longint;
    output_options: longint;
    fgcolour: array[0..15] of char;
    bgcolour: array[0..15] of char;
    fgcolor: pchar;
    bgcolor: pchar;
    outfile: array[0..255] of char;
    primary: array[0..127] of char;
    option_1: longint;
    option_2: longint;
    option_3: longint;
    show_hrt: longint;
    input_mode: longint;
    eci: longint;
    dpmm: single;
    dot_size: single;
    text_gap: single;
    guard_descent: single;
    structapp: Tzint_structapp;
    warn_level: longint;
    debug: longint;
    text: array[0..199] of byte;
    rows: longint;
    width: longint;
    encoded_data: array[0..199] of array[0..143] of byte;
    row_height: array[0..199] of single;
    errtxt: array[0..99] of char;
    bitmap: pbyte;
    bitmap_width: longint;
    bitmap_height: longint;
    alphamap: pbyte;
    vector: Pzint_vector;
  end;
  Pzint_symbol = ^Tzint_symbol;

  Tzint_seg = record
    source: pbyte;
    length: longint;
    eci: longint;
  end;
  Pzint_seg = ^Tzint_seg;

const
  BARCODE_CODE11 = 1;
  BARCODE_C25STANDARD = 2;
  BARCODE_C25MATRIX = 2;
  BARCODE_C25INTER = 3;
  BARCODE_C25IATA = 4;
  BARCODE_C25LOGIC = 6;
  BARCODE_C25IND = 7;
  BARCODE_CODE39 = 8;
  BARCODE_EXCODE39 = 9;
  BARCODE_EANX = 13;
  BARCODE_EANX_CHK = 14;
  BARCODE_GS1_128 = 16;
  BARCODE_EAN128 = 16;
  BARCODE_CODABAR = 18;
  BARCODE_CODE128 = 20;
  BARCODE_DPLEIT = 21;
  BARCODE_DPIDENT = 22;
  BARCODE_CODE16K = 23;
  BARCODE_CODE49 = 24;
  BARCODE_CODE93 = 25;
  BARCODE_FLAT = 28;
  BARCODE_DBAR_OMN = 29;
  BARCODE_RSS14 = 29;
  BARCODE_DBAR_LTD = 30;
  BARCODE_RSS_LTD = 30;
  BARCODE_DBAR_EXP = 31;
  BARCODE_RSS_EXP = 31;
  BARCODE_TELEPEN = 32;
  BARCODE_UPCA = 34;
  BARCODE_UPCA_CHK = 35;
  BARCODE_UPCE = 37;
  BARCODE_UPCE_CHK = 38;
  BARCODE_POSTNET = 40;
  BARCODE_MSI_PLESSEY = 47;
  BARCODE_FIM = 49;
  BARCODE_LOGMARS = 50;
  BARCODE_PHARMA = 51;
  BARCODE_PZN = 52;
  BARCODE_PHARMA_TWO = 53;
  BARCODE_CEPNET = 54;
  BARCODE_PDF417 = 55;
  BARCODE_PDF417COMP = 56;
  BARCODE_PDF417TRUNC = 56;
  BARCODE_MAXICODE = 57;
  BARCODE_QRCODE = 58;
  BARCODE_CODE128AB = 60;
  BARCODE_CODE128B = 60;
  BARCODE_AUSPOST = 63;
  BARCODE_AUSREPLY = 66;
  BARCODE_AUSROUTE = 67;
  BARCODE_AUSREDIRECT = 68;
  BARCODE_ISBNX = 69;
  BARCODE_RM4SCC = 70;
  BARCODE_DATAMATRIX = 71;
  BARCODE_EAN14 = 72;
  BARCODE_VIN = 73;
  BARCODE_CODABLOCKF = 74;
  BARCODE_NVE18 = 75;
  BARCODE_JAPANPOST = 76;
  BARCODE_KOREAPOST = 77;
  BARCODE_DBAR_STK = 79;
  BARCODE_RSS14STACK = 79;
  BARCODE_DBAR_OMNSTK = 80;
  BARCODE_RSS14STACK_OMNI = 80;
  BARCODE_DBAR_EXPSTK = 81;
  BARCODE_RSS_EXPSTACK = 81;
  BARCODE_PLANET = 82;
  BARCODE_MICROPDF417 = 84;
  BARCODE_USPS_IMAIL = 85;
  BARCODE_ONECODE = 85;
  BARCODE_PLESSEY = 86;
  BARCODE_TELEPEN_NUM = 87;
  BARCODE_ITF14 = 89;
  BARCODE_KIX = 90;
  BARCODE_AZTEC = 92;
  BARCODE_DAFT = 93;
  BARCODE_DPD = 96;
  BARCODE_MICROQR = 97;
  BARCODE_HIBC_128 = 98;
  BARCODE_HIBC_39 = 99;
  BARCODE_HIBC_DM = 102;
  BARCODE_HIBC_QR = 104;
  BARCODE_HIBC_PDF = 106;
  BARCODE_HIBC_MICPDF = 108;
  BARCODE_HIBC_BLOCKF = 110;
  BARCODE_HIBC_AZTEC = 112;
  BARCODE_DOTCODE = 115;
  BARCODE_HANXIN = 116;
  BARCODE_MAILMARK_2D = 119;
  BARCODE_UPU_S10 = 120;
  BARCODE_MAILMARK_4S = 121;
  BARCODE_MAILMARK = 121;
  BARCODE_AZRUNE = 128;
  BARCODE_CODE32 = 129;
  BARCODE_EANX_CC = 130;
  BARCODE_GS1_128_CC = 131;
  BARCODE_EAN128_CC = 131;
  BARCODE_DBAR_OMN_CC = 132;
  BARCODE_RSS14_CC = 132;
  BARCODE_DBAR_LTD_CC = 133;
  BARCODE_RSS_LTD_CC = 133;
  BARCODE_DBAR_EXP_CC = 134;
  BARCODE_RSS_EXP_CC = 134;
  BARCODE_UPCA_CC = 135;
  BARCODE_UPCE_CC = 136;
  BARCODE_DBAR_STK_CC = 137;
  BARCODE_RSS14STACK_CC = 137;
  BARCODE_DBAR_OMNSTK_CC = 138;
  BARCODE_RSS14_OMNI_CC = 138;
  BARCODE_DBAR_EXPSTK_CC = 139;
  BARCODE_RSS_EXPSTACK_CC = 139;
  BARCODE_CHANNEL = 140;
  BARCODE_CODEONE = 141;
  BARCODE_GRIDMATRIX = 142;
  BARCODE_UPNQR = 143;
  BARCODE_ULTRA = 144;
  BARCODE_RMQR = 145;
  BARCODE_BC412 = 146;
  BARCODE_LAST = 146;

  BARCODE_BIND_TOP = $0001;
  BARCODE_BIND = $0002;
  BARCODE_BOX = $0004;
  BARCODE_STDOUT = $0008;
  READER_INIT = $0010;
  SMALL_TEXT = $0020;
  BOLD_TEXT = $0040;
  CMYK_COLOUR = $0080;
  BARCODE_DOTTY_MODE = $0100;
  GS1_GS_SEPARATOR = $0200;
  OUT_BUFFER_INTERMEDIATE = $0400;
  BARCODE_QUIET_ZONES = $0800;
  BARCODE_NO_QUIET_ZONES = $1000;
  COMPLIANT_HEIGHT = $2000;
  EANUPC_GUARD_WHITESPACE = $4000;
  EMBED_VECTOR_FONT = $8000;

  DATA_MODE = 0;
  UNICODE_MODE = 1;
  GS1_MODE = 2;

  ESCAPE_MODE = $0008;
  GS1PARENS_MODE = $0010;
  GS1NOCHECK_MODE = $0020;
  HEIGHTPERROW_MODE = $0040;
  FAST_MODE = $0080;
  EXTRA_ESCAPE_MODE = $0100;

  DM_SQUARE = 100;
  DM_DMRE = 101;
  DM_ISO_144 = 128;
  ZINT_FULL_MULTIBYTE = 200;
  ULTRA_COMPRESSION = 128;

  ZINT_WARN_HRT_TRUNCATED = 1;
  ZINT_WARN_INVALID_OPTION = 2;
  ZINT_WARN_USES_ECI = 3;
  ZINT_WARN_NONCOMPLIANT = 4;
  ZINT_ERROR = 5;
  ZINT_ERROR_TOO_LONG = 5;
  ZINT_ERROR_INVALID_DATA = 6;
  ZINT_ERROR_INVALID_CHECK = 7;
  ZINT_ERROR_INVALID_OPTION = 8;
  ZINT_ERROR_ENCODING_PROBLEM = 9;
  ZINT_ERROR_FILE_ACCESS = 10;
  ZINT_ERROR_MEMORY = 11;
  ZINT_ERROR_FILE_WRITE = 12;
  ZINT_ERROR_USES_ECI = 13;
  ZINT_ERROR_NONCOMPLIANT = 14;
  ZINT_ERROR_HRT_TRUNCATED = 15;

  WARN_DEFAULT = 0;
  WARN_FAIL_ALL = 2;

  ZINT_CAP_HRT = $0001;
  ZINT_CAP_STACKABLE = $0002;
  ZINT_CAP_EANUPC = $0004;
  ZINT_CAP_EXTENDABLE = $0004;
  ZINT_CAP_COMPOSITE = $0008;
  ZINT_CAP_ECI = $0010;
  ZINT_CAP_GS1 = $0020;
  ZINT_CAP_DOTTY = $0040;
  ZINT_CAP_QUIET_ZONES = $0080;
  ZINT_CAP_FIXED_RATIO = $0100;
  ZINT_CAP_READER_INIT = $0200;
  ZINT_CAP_FULL_MULTIBYTE = $0400;
  ZINT_CAP_MASK = $0800;
  ZINT_CAP_STRUCTAPP = $1000;
  ZINT_CAP_COMPLIANT_HEIGHT = $2000;

  ZINT_MAX_DATA_LEN = 17400;
  ZINT_MAX_SEG_COUNT = 256;

  ZINT_DEBUG_PRINT = $0001;
  ZINT_DEBUG_TEST = $0002;

function ZBarcode_Create: Pzint_symbol; cdecl; external libzint;
procedure ZBarcode_Clear(symbol: Pzint_symbol); cdecl; external libzint;
procedure ZBarcode_Reset(symbol: Pzint_symbol); cdecl; external libzint;
procedure ZBarcode_Delete(symbol: Pzint_symbol); cdecl; external libzint;
function ZBarcode_Encode(symbol: Pzint_symbol; source: PChar; length: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_Segs(symbol: Pzint_symbol; segs: Pzint_seg; seg_count: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_File(symbol: Pzint_symbol; filename: pchar): longint; cdecl; external libzint;
function ZBarcode_Print(symbol: Pzint_symbol; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_and_Print(symbol: Pzint_symbol; source: pbyte; length: longint; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_Segs_and_Print(symbol: Pzint_symbol; segs: Pzint_seg; seg_count: longint; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_File_and_Print(symbol: Pzint_symbol; filename: pchar; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Buffer(symbol: Pzint_symbol; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_and_Buffer(symbol: Pzint_symbol; source: pbyte; length: longint; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_Segs_and_Buffer(symbol: Pzint_symbol; segs: Pzint_seg; seg_count: longint; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_File_and_Buffer(symbol: Pzint_symbol; filename: pchar; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Buffer_Vector(symbol: Pzint_symbol; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_and_Buffer_Vector(symbol: Pzint_symbol; source: pbyte; length: longint; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_Segs_and_Buffer_Vector(symbol: Pzint_symbol; segs: Pzint_seg; seg_count: longint; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_Encode_File_and_Buffer_Vector(symbol: Pzint_symbol; filename: pchar; rotate_angle: longint): longint; cdecl; external libzint;
function ZBarcode_ValidID(symbol_id: longint): longint; cdecl; external libzint;
function ZBarcode_BarcodeName(symbol_id: longint; name: pchar): longint; cdecl; external libzint;
function ZBarcode_Cap(symbol_id: longint; cap_flag: dword): dword; cdecl; external libzint;
function ZBarcode_Default_Xdim(symbol_id: longint): single; cdecl; external libzint;
function ZBarcode_Scale_From_XdimDp(symbol_id: longint; x_dim_mm: single; dpmm: single; filetype: pchar): single; cdecl; external libzint;
function ZBarcode_XdimDp_From_Scale(symbol_id: longint; scale: single; x_dim_mm_or_dpmm: single; filetype: pchar): single; cdecl; external libzint;
function ZBarcode_NoPng: longint; cdecl; external libzint;
function ZBarcode_Version: longint; cdecl; external libzint;

// === Konventiert am: 29-1-26 16:51:28 ===


implementation



end.
