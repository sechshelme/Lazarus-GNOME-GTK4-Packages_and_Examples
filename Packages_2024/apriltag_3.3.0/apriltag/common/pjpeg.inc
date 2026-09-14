{$IFDEF read_interface}


type
  Ppjpeg_component_t = ^Tpjpeg_component_t;
  Tpjpeg_component_t = record
    width: Tuint32_t;
    height: Tuint32_t;
    stride: Tuint32_t;
    data: Puint8_t;
    id: Tuint8_t;
    hv: Tuint8_t;
    scalex: Tuint8_t;
    scaley: Tuint8_t;
    tq: Tuint8_t;
    tda: Tuint8_t;
  end;

  Ppjpeg_t = ^Tpjpeg_t;
  Tpjpeg_t = record
    error: longint;
    width: Tuint32_t;
    height: Tuint32_t;
    ncomponents: longint;
    components: Ppjpeg_component_t;
  end;

type
  TPJPEG_FLAGS = longint;
const
  PJPEG_STRICT = 1;
  PJPEG_MJPEG = 2;

type
  TPJPEG_ERROR = longint;
const
  PJPEG_OKAY = 0;
  PJPEG_ERR_FILE = 1;
  PJPEG_ERR_DQT = 2;
  PJPEG_ERR_SOF = 3;
  PJPEG_ERR_DHT = 4;
  PJPEG_ERR_SOS = 5;
  PJPEG_ERR_MISSING_DHT = 6;
  PJPEG_ERR_DRI = 7;
  PJPEG_ERR_RESET = 8;
  PJPEG_ERR_EOF = 9;
  PJEPG_ERR_UNSUPPORTED = 10;

function pjpeg_create_from_file(path: pchar; flags: Tuint32_t; error: Plongint): Ppjpeg_t; cdecl; external libapriltag_utils;
function pjpeg_create_from_buffer(buf: Puint8_t; buflen: longint; flags: Tuint32_t; error: Plongint): Ppjpeg_t; cdecl; external libapriltag_utils;
procedure pjpeg_destroy(pj: Ppjpeg_t); cdecl; external libapriltag_utils;
function pjpeg_to_u8_baseline(pj: Ppjpeg_t): Pimage_u8_t; cdecl; external libapriltag_utils;
function pjpeg_to_u8x3_baseline(pj: Ppjpeg_t): Pimage_u8x3_t; cdecl; external libapriltag_utils;

// === Konventiert am: 12-9-26 17:22:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
