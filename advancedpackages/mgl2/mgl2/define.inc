{$IFDEF read_interface}


type
  gzFile = PFILE;

function gzopen(filename, mode: pansichar): gzFile; cdecl; external libclib name 'fopen';
function gzread(fp: gzFile; buf: Pointer; size: nativeuint): nativeuint; cdecl; external libclib name 'fread';
function gzclose(fp: gzFile): integer; cdecl; external libclib name 'fclose';
function gzprintf(fp: gzFile; fmt: pansichar): integer; cdecl; varargs; external libclib name 'fprintf';
function gzgets(fp: gzFile; str: pansichar; size: integer): pansichar; cdecl; external libclib name 'fgets';
function gzgetc(fp: gzFile): integer; cdecl; external libclib name 'fgetc';
function fread(ptr: Pointer; size, count: nativeuint; stream: gzFile): nativeuint; cdecl; external libclib name 'fread';

type
  Pmsize = ^Tmsize;
  Tmsize = Tsize_t;

const
  M_PI = 3.14159265358979323846;

type
  Tmreal = double;
  Pmreal = ^Tmreal;

const
  MGL_EPSILON = 1.0 + 1e-10;
  MGL_MIN_VAL = 1e-307;
  MGL_FEPSILON = 1.0 + 1e-5;

const
  MGL_CMAP_COLOR = 32;

const
  MGL_DEF_VIEWER = 'evince';

const
  mglCartesian = 0;
  mglPolar = 1;
  mglSpherical = 2;
  mglParabolic = 3;
  mglParaboloidal = 4;
  mglOblate = 5;
  mglProlate = 6;
  mglElliptic = 7;
  mglToroidal = 8;
  mglBispherical = 9;
  mglBipolar = 10;
  mglLogLog = 11;
  mglLogX = 12;
  mglLogY = 13;

const
  MGL_DRAW_WIRE = 0;
  MGL_DRAW_FAST = 1;
  MGL_DRAW_NORM = 2;
  MGL_DRAW_LMEM = 4;
  MGL_DRAW_DOTS = 8;
  MGL_DRAW_NONE = 9;

const
  mglWarnNone = 0;
  mglWarnDim = 1;
  mglWarnLow = 2;
  mglWarnNeg = 3;
  mglWarnFile = 4;
  mglWarnMem = 5;
  mglWarnZero = 6;
  mglWarnLeg = 7;
  mglWarnSlc = 8;
  mglWarnCnt = 9;
  mglWarnOpen = 10;
  mglWarnLId = 11;
  mglWarnSize = 12;
  mglWarnFmt = 13;
  mglWarnTern = 14;
  mglWarnNull = 15;
  mglWarnSpc = 16;
  mglScrArg = 17;
  mglScrCmd = 18;
  mglScrLong = 19;
  mglScrStr = 20;
  mglScrTemp = 21;
  mglWarnEnd = 22;

var
  mgl_mask_val: array[0..15] of uint64; cvar;external libmgl;

const
  MGL_MASK_ID = '-+=;oOsS~<>jdD*^';
  MGL_SOLID_MASK = $ffffffffffffffff;

  MGL_TRANSP_NORM = $00000000;
  MGL_TRANSP_GLASS = $00000001;
  MGL_TRANSP_LAMP = $00000002;
  MGL_ENABLE_CUT = $00000004;
  MGL_ENABLE_RTEXT = $00000008;
  MGL_AUTO_FACTOR = $00000010;
  MGL_ENABLE_ALPHA = $00000020;
  MGL_ENABLE_LIGHT = $00000040;
  MGL_TICKS_ROTATE = $00000080;
  MGL_TICKS_SKIP = $00000100;

  MGL_DISABLE_SCALE = $00000200;
  MGL_FINISHED = $00000400;
  MGL_USE_GMTIME = $00000800;
  MGL_SHOW_POS = $00001000;
  MGL_CLF_ON_UPD = $00002000;
  MGL_NOSUBTICKS = $00004000;
  MGL_LOCAL_LIGHT = $00008000;
  MGL_VECT_FRAME = $00010000;
  MGL_REDUCEACC = $00020000;
  MGL_PREFERVC = $00040000;
  MGL_ONESIDED = $00080000;
  MGL_NO_ORIGIN = $00100000;
  MGL_GRAY_MODE = $00200000;
  MGL_FULL_CURV = $00400000;
  MGL_NO_SCALE_REL = $00800000;
  MGL_FAST_PRIM = $01000000;
type
  Tcmdual = record
    re: Tmreal;
    im: Tmreal;
  end;

  Pcmdual = ^Tcmdual;

  Pmdual = ^Tmdual;
  Tmdual = Tcmdual;
var
  mgl_cos: array[0..359] of single; cvar;external libmgl;

procedure mgl_init; cdecl; external libmgl;
procedure mgl_fini; cdecl; external libmgl;

type
  Trgb = array[0..2] of single;

function mgl_hypot(x: double; y: double): double; cdecl; external libmgl;
function mgl_wcslen(str: Pwchar_t): Tsize_t; cdecl; external libmgl;
procedure mgl_chrrgb(id: char; rgb: Trgb); cdecl; external libmgl;
function mgl_get_num_color(s: pchar; smooth: longint): Tsize_t; cdecl; external libmgl;
function mgl_have_color(stl: pchar): longint; cdecl; external libmgl;
function mglchr(str: pchar; ch: char): pchar; cdecl; external libmgl;
function mglchrs(str: pchar; chr: pchar): pchar; cdecl; external libmgl;
procedure mgl_set_num_thr(n: longint); cdecl; external libmgl;
procedure mgl_test_txt(str: pchar; args: array of const); cdecl; external libmgl;
procedure mgl_test_txt(str: pchar); cdecl; external libmgl;
procedure mgl_set_test_mode(enable: longint); cdecl; external libmgl;
procedure mgl_strtrim(str: pchar); cdecl; external libmgl;
procedure mgl_wcstrim(str: Pwchar_t); cdecl; external libmgl;
procedure mgl_strlwr(str: pchar); cdecl; external libmgl;
procedure mgl_wcslwr(str: Pwchar_t); cdecl; external libmgl;
procedure mgl_wcstombs(dst: pchar; src: Pwchar_t; size: longint); cdecl; external libmgl;
procedure mgl_set_global_warn(text: pchar); cdecl; external libmgl;
function mgl_get_global_warn: pchar; cdecl; external libmgl;
procedure mgl_clear_global_warn; cdecl; external libmgl;
procedure mgl_clear_global_warn_; cdecl; external libmgl;
procedure mgl_textdomain(argv0: pchar; locale: pchar); cdecl; external libmgl;

const
  MGL_VS = Ord('z') - Ord('a') + 1;

  {----------------------------------------------------------------------------- }

  // === Konventiert am: 26-6-25 17:35:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
