{$IFDEF read_interface}


type
  Pintptr_t = ^Tintptr_t;
  Tintptr_t = int64;

  Puintptr_t = ^Tuintptr_t;
  Tuintptr_t = uint64;

type
  Pl_intptr_t = ^Tl_intptr_t;
  Tl_intptr_t = Tintptr_t;

  Pl_uintptr_t = ^Tl_uintptr_t;
  Tl_uintptr_t = Tuintptr_t;

const
  HAVE_LIBJPEG = 1;
  HAVE_LIBTIFF = 1;
  HAVE_LIBPNG = 1;
  HAVE_LIBZ = 1;
  HAVE_LIBGIF = 0;
  HAVE_LIBUNGIF = 0;
  HAVE_LIBWEBP = 0;
  HAVE_LIBWEBP_ANIM = 0;
  HAVE_LIBJP2K = 0;

const
  USE_BMPIO = 1;
  USE_PNMIO = 1;
  USE_JP2KHEADER = 1;
  USE_PDFIO = 1;
  USE_PSIO = 1;

const
  HAVE_FSTATAT = 0;

type
  Pl_ok = ^Tl_ok;
  Tl_ok = longint;

  Pl_int8 = ^Tl_int8;
  Tl_int8 = int8;

  PPl_uint8 = ^Pl_uint8;
  Pl_uint8 = ^Tl_uint8;
  Tl_uint8 = uint8;

  Pl_int16 = ^Tl_int16;
  Tl_int16 = int16;

  Pl_uint16 = ^Tl_uint16;
  Tl_uint16 = uint16;

  PPl_int32 = ^Pl_int32;
  Pl_int32 = ^Tl_int32;
  Tl_int32 = int32;

  PPl_uint32 = ^Pl_uint32;
  Pl_uint32 = ^Tl_uint32;
  Tl_uint32 = uint32;

  PPl_float32 = ^Pl_float32;
  Pl_float32 = ^Tl_float32;
  Tl_float32 = single;

  Pl_float64 = ^Tl_float64;
  Tl_float64 = double;

  Pl_int64 = ^Tl_int64;
  Tl_int64 = int64;

  Pl_uint64 = ^Tl_uint64;
  Tl_uint64 = uint64;

var
  LeptDebugOK: Tl_int32; cvar;external libleptb;

const
  UNDEF = -(1);
  //  NULL = 0;
  //  TRUE = 1;
  //  FALSE = 0;
const
  L_NOT_FOUND = 0;
  L_FOUND = 1;

const
  UNIX_PATH_SEPCHAR = 0;
  WIN_PATH_SEPCHAR = 1;

type
  PL_TIMER = ^TL_TIMER;
  TL_TIMER = pointer;

  TL_WallTimer = record
    start_sec: Tl_int32;
    start_usec: Tl_int32;
    stop_sec: Tl_int32;
    stop_usec: Tl_int32;
  end;
  PL_WallTimer = ^TL_WallTimer;
  PPL_WallTimer = ^PL_WallTimer;

(*
Per Standard nicht verfügbar

function leptonica_malloc(blocksize: Tsize_t): pointer; cdecl; external libleptb;
function leptonica_calloc(numelem: Tsize_t; elemsize: Tsize_t): pointer; cdecl; external libleptb;
function leptonica_realloc(ptr: pointer; blocksize: Tsize_t): pointer; cdecl; external libleptb;
procedure leptonica_free(ptr: pointer); cdecl; external libleptb;
*)

const
  L_SEVERITY_EXTERNAL = 0;
  L_SEVERITY_ALL = 1;
  L_SEVERITY_DEBUG = 2;
  L_SEVERITY_INFO = 3;
  L_SEVERITY_WARNING = 4;
  L_SEVERITY_ERROR = 5;
  L_SEVERITY_NONE = 6;

var
  LeptMsgSeverity: Tl_int32; cvar;external libleptb;

  // === Konventiert am: 16-8-25 19:16:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
