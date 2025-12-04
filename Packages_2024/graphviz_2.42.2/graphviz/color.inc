{$IFDEF read_interface}


type
  Phsvrgbacolor_t = type Pointer;

type
  Pcolor_type_t = ^Tcolor_type_t;
  Tcolor_type_t = longint;

const
  HSVA_DOUBLE = 0;
  RGBA_BYTE = 1;
  RGBA_WORD = 2;
  CMYK_BYTE = 3;
  RGBA_DOUBLE = 4;
  COLOR_STRING = 5;
  COLOR_INDEX = 6;

type
  Pgvcolor_t = type Pointer;

const
  COLOR_MALLOC_FAIL = -(1);
  COLOR_UNKNOWN = 1;
  COLOR_OK = 0;

  // === Konventiert am: 3-12-25 15:08:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
