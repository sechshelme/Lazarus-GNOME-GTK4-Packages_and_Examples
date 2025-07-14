unit fp_stdlib;

interface

uses
  clib;

type
  TLongDouble = extended;

  Tlocale_t = Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tdiv_t = record
    quot: longint;
    rem: longint;
  end;
  Pdiv_t = ^Tdiv_t;

  Tldiv_t = record
    quot: longint;
    rem: longint;
  end;
  Pldiv_t = ^Tldiv_t;

type
  Tlldiv_t = record
    quot: int64;
    rem: int64;
  end;
  Plldiv_t = ^Tlldiv_t;

const
  RAND_MAX = 2147483647;
  EXIT_FAILURE = 1;
  EXIT_SUCCESS = 0;

function atof(__nptr: pchar): double; cdecl; external libc;
function atoi(__nptr: pchar): longint; cdecl; external libc;
function atol(__nptr: pchar): longint; cdecl; external libc;
function atoll(__nptr: pchar): int64; cdecl; external libc;

function strtod(__nptr: pchar; __endptr: PPchar): double; cdecl; external libc;
function strtof(__nptr: pchar; __endptr: PPchar): single; cdecl; external libc;
function strtold(__nptr: pchar; __endptr: PPchar): TLongDouble; cdecl; external libc;
//function strtof16(__nptr: pchar; __endptr: PPchar): TFloat16; cdecl; external libc;
//function strtof32(__nptr: pchar; __endptr: PPchar): TFloat32; cdecl; external libc;
//function strtof64(__nptr: pchar; __endptr: PPchar): TFloat64; cdecl; external libc;
//function strtof128(__nptr: pchar; __endptr: PPchar): TFloat128; cdecl; external libc;
//function strtof32x(__nptr: pchar; __endptr: PPchar): TFloat32x; cdecl; external libc;
//function strtof64x(__nptr: pchar; __endptr: PPchar): TFloat64x; cdecl; external libc;
//function strtof128x(__nptr: pchar; __endptr: PPchar): TFloat128x; cdecl; external libc;
function strtol(__nptr: pchar; __endptr: PPchar; __base: longint): longint; cdecl; external libc;
function strtoul(__nptr: pchar; __endptr: PPchar; __base: longint): dword; cdecl; external libc;
function strtoq(__nptr: pchar; __endptr: PPchar; __base: longint): int64; cdecl; external libc;
function strtouq(__nptr: pchar; __endptr: PPchar; __base: longint): qword; cdecl; external libc;

function strtoll(__nptr: pchar; __endptr: PPchar; __base: longint): int64; cdecl; external libc;
function strtoull(__nptr: pchar; __endptr: PPchar; __base: longint): qword; cdecl; external libc;

function strfromd(__dest: pchar; __size: Tsize_t; __format: pchar; __f: double): longint; cdecl; external libc;
function strfromf(__dest: pchar; __size: Tsize_t; __format: pchar; __f: single): longint; cdecl; external libc;
function strfroml(__dest: pchar; __size: Tsize_t; __format: pchar; __f: TLongDouble): longint; cdecl; external libc;
//function strfromf16(__dest: pchar; __size: Tsize_t; __format: pchar; __f: TFloat16): longint; cdecl; external libc;
//function strfromf32(__dest: pchar; __size: Tsize_t; __format: pchar; __f: TFloat32): longint; cdecl; external libc;
//function strfromf64(__dest: pchar; __size: Tsize_t; __format: pchar; __f: TFloat64): longint; cdecl; external libc;
//function strfromf128(__dest: pchar; __size: Tsize_t; __format: pchar; __f: TFloat128): longint; cdecl; external libc;
//function strfromf32x(__dest: pchar; __size: Tsize_t; __format: pchar; __f: TFloat32x): longint; cdecl; external libc;
//function strfromf64x(__dest: pchar; __size: Tsize_t; __format: pchar; __f: TFloat64x): longint; cdecl; external libc;
//function strfromf128x(__dest: pchar; __size: Tsize_t; __format: pchar; __f: TFloat128x): longint; cdecl; external libc;

function strtol_l(__nptr: pchar; __endptr: PPchar; __base: longint; __loc: Tlocale_t): longint; cdecl; external libc;
function strtoul_l(__nptr: pchar; __endptr: PPchar; __base: longint; __loc: Tlocale_t): dword; cdecl; external libc;
function strtoll_l(__nptr: pchar; __endptr: PPchar; __base: longint; __loc: Tlocale_t): int64; cdecl; external libc;
function strtoull_l(__nptr: pchar; __endptr: PPchar; __base: longint; __loc: Tlocale_t): qword; cdecl; external libc;
function strtod_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): double; cdecl; external libc;
function strtof_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): single; cdecl; external libc;
function strtold_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): TLongDouble; cdecl; external libc;
//function strtof16_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): TFloat16; cdecl; external libc;
//function strtof32_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): TFloat32; cdecl; external libc;
//function strtof64_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): TFloat64; cdecl; external libc;
//function strtof128_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): TFloat128; cdecl; external libc;
//function strtof32x_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): TFloat32x; cdecl; external libc;
//function strtof64x_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): TFloat64x; cdecl; external libc;
//function strtof128x_l(__nptr: pchar; __endptr: PPchar; __loc: Tlocale_t): TFloat128x; cdecl; external libc;

function l64a(__n: longint): pchar; cdecl; external libc;
function a64l(__s: pchar): longint; cdecl; external libc;

function random: longint; cdecl; external libc;
procedure srandom(__seed: dword); cdecl; external libc;
function initstate(__seed: dword; __statebuf: pchar; __statelen: Tsize_t): pchar; cdecl; external libc;
function setstate(__statebuf: pchar): pchar; cdecl; external libc;

type
  Trandom_data = record
    fptr: Pint32;
    rptr: Pint32;
    state: Pint32;
    rand_type: longint;
    rand_deg: longint;
    rand_sep: longint;
    end_ptr: Pint32;
  end;
  Prandom_data = ^Trandom_data;

function random_r(__buf: Prandom_data; __result: Pint32): longint; cdecl; external libc;
function srandom_r(__seed: dword; __buf: Prandom_data): longint; cdecl; external libc;
function initstate_r(__seed: dword; __statebuf: pchar; __statelen: Tsize_t; __buf: Prandom_data): longint; cdecl; external libc;
function setstate_r(__statebuf: pchar; __buf: Prandom_data): longint; cdecl; external libc;
function rand: longint; cdecl; external libc;
procedure srand(__seed: dword); cdecl; external libc;
function rand_r(__seed: Pdword): longint; cdecl; external libc;
function drand48: double; cdecl; external libc;
function erand48(__xsubi: Pword): double; cdecl; external libc;
function lrand48: longint; cdecl; external libc;
function nrand48(__xsubi: Pword): longint; cdecl; external libc;
function mrand48: longint; cdecl; external libc;
function jrand48(__xsubi: Pword): longint; cdecl; external libc;
procedure srand48(__seedval: longint); cdecl; external libc;
function seed48(__seed16v: Pword): Pword; cdecl; external libc;
procedure lcong48(__param: Pword); cdecl; external libc;

type
  Tdrand48_data = record
    __x: array[0..2] of word;
    __old_x: array[0..2] of word;
    __c: word;
    __init: word;
    __a: qword;
  end;
  Pdrand48_data = ^Tdrand48_data;

function drand48_r(__buffer: Pdrand48_data; __result: Pdouble): longint; cdecl; external libc;
function erand48_r(__xsubi: Pword; __buffer: Pdrand48_data; __result: Pdouble): longint; cdecl; external libc;
function lrand48_r(__buffer: Pdrand48_data; __result: Plongint): longint; cdecl; external libc;
function nrand48_r(__xsubi: Pword; __buffer: Pdrand48_data; __result: Plongint): longint; cdecl; external libc;
function mrand48_r(__buffer: Pdrand48_data; __result: Plongint): longint; cdecl; external libc;
function jrand48_r(__xsubi: Pword; __buffer: Pdrand48_data; __result: Plongint): longint; cdecl; external libc;
function srand48_r(__seedval: longint; __buffer: Pdrand48_data): longint; cdecl; external libc;
function seed48_r(__seed16v: Pword; __buffer: Pdrand48_data): longint; cdecl; external libc;
function lcong48_r(__param: Pword; __buffer: Pdrand48_data): longint; cdecl; external libc;
function arc4random: uint32; cdecl; external libc;
procedure arc4random_buf(__buf: pointer; __size: Tsize_t); cdecl; external libc;
function arc4random_uniform(__upper_bound: uint32): uint32; cdecl; external libc;

function malloc(__size: Tsize_t): pointer; cdecl; external libc;
function calloc(__nmemb: Tsize_t; __size: Tsize_t): pointer; cdecl; external libc;
function realloc(__ptr: pointer; __size: Tsize_t): pointer; cdecl; external libc;
procedure free(__ptr: pointer); cdecl; external libc;
function reallocarray(__ptr: pointer; __nmemb: Tsize_t; __size: Tsize_t): pointer; cdecl; external libc;
function valloc(__size: Tsize_t): pointer; cdecl; external libc;
function posix_memalign(__memptr: Ppointer; __alignment: Tsize_t; __size: Tsize_t): longint; cdecl; external libc;
function aligned_alloc(__alignment: Tsize_t; __size: Tsize_t): pointer; cdecl; external libc;

type
  TFunc = procedure; cdecl;
  TFunc2 = procedure(__status: longint; __arg: pointer); cdecl;

procedure abort; cdecl; external libc;
function atexit(__func: TFunc): longint; cdecl; external libc;
function at_quick_exit(__func: TFunc): longint; cdecl; external libc;
function on_exit(__func: TFunc2; __arg: pointer): longint; cdecl; external libc;
//procedure exit(__status: longint); cdecl; external libc;
procedure c_exit(__status: longint); cdecl; external libc name 'exit';  // ????????????????

procedure quick_exit(__status: longint); cdecl; external libc;
procedure _Exit(__status: longint); cdecl; external libc;
function getenv(__name: pchar): pchar; cdecl; external libc;
function secure_getenv(__name: pchar): pchar; cdecl; external libc;
function putenv(__string: pchar): longint; cdecl; external libc;
function setenv(__name: pchar; __value: pchar; __replace: longint): longint; cdecl; external libc;
function unsetenv(__name: pchar): longint; cdecl; external libc;
function clearenv: longint; cdecl; external libc;

function mktemp(__template: pchar): pchar; cdecl; external libc;
function mkstemp(__template: pchar): longint; cdecl; external libc;
function mkstemp64(__template: pchar): longint; cdecl; external libc;
function mkstemps(__template: pchar; __suffixlen: longint): longint; cdecl; external libc;
function mkstemps64(__template: pchar; __suffixlen: longint): longint; cdecl; external libc;
function mkdtemp(__template: pchar): pchar; cdecl; external libc;
function mkostemp(__template: pchar; __flags: longint): longint; cdecl; external libc;
function mkostemp64(__template: pchar; __flags: longint): longint; cdecl; external libc;
function mkostemps(__template: pchar; __suffixlen: longint; __flags: longint): longint; cdecl; external libc;
function mkostemps64(__template: pchar; __suffixlen: longint; __flags: longint): longint; cdecl; external libc;
function system(__command: pchar): longint; cdecl; external libc;
function canonicalize_file_name(__name: pchar): pchar; cdecl; external libc;
function realpath(__name: pchar; __resolved: pchar): pchar; cdecl; external libc;

type
  Tcompar_fn_t = function(para1: pointer; para2: pointer): longint; cdecl;
  Tcompar_d_fn_t = function(para1: pointer; para2: pointer; para3: pointer): longint; cdecl;

function bsearch(__key: pointer; __base: pointer; __nmemb: Tsize_t; __size: Tsize_t; __compar: Tcompar_fn_t): pointer; cdecl; external libc;
procedure qsort(__base: pointer; __nmemb: Tsize_t; __size: Tsize_t; __compar: Tcompar_fn_t); cdecl; external libc;
procedure qsort_r(__base: pointer; __nmemb: Tsize_t; __size: Tsize_t; __compar: Tcompar_d_fn_t; __arg: pointer); cdecl; external libc;

function abs(__x: longint): longint; cdecl; external libc;
function labs(__x: longint): longint; cdecl; external libc;
function llabs(__x: int64): int64; cdecl; external libc;

//function div(__numer:longint; __denom:longint):Tdiv_t;cdecl;external libc;
function c_div(__numer: longint; __denom: longint): Tdiv_t; cdecl; external libc name 'div'; // ?????????????????????

function ldiv(__numer: longint; __denom: longint): Tldiv_t; cdecl; external libc;
function lldiv(__numer: int64; __denom: int64): Tlldiv_t; cdecl; external libc;

function ecvt(__value: double; __ndigit: longint; __decpt: Plongint; __sign: Plongint): pchar; cdecl; external libc;
function fcvt(__value: double; __ndigit: longint; __decpt: Plongint; __sign: Plongint): pchar; cdecl; external libc;
function gcvt(__value: double; __ndigit: longint; __buf: pchar): pchar; cdecl; external libc;
function qecvt(__value: TLongDouble; __ndigit: longint; __decpt: Plongint; __sign: Plongint): pchar; cdecl; external libc;
function qfcvt(__value: TLongDouble; __ndigit: longint; __decpt: Plongint; __sign: Plongint): pchar; cdecl; external libc;
function qgcvt(__value: TLongDouble; __ndigit: longint; __buf: pchar): pchar; cdecl; external libc;
function ecvt_r(__value: double; __ndigit: longint; __decpt: Plongint; __sign: Plongint; __buf: pchar; __len: Tsize_t): longint; cdecl; external libc;
function fcvt_r(__value: double; __ndigit: longint; __decpt: Plongint; __sign: Plongint; __buf: pchar; __len: Tsize_t): longint; cdecl; external libc;
function qecvt_r(__value: TLongDouble; __ndigit: longint; __decpt: Plongint; __sign: Plongint; __buf: pchar; __len: Tsize_t): longint; cdecl; external libc;
function qfcvt_r(__value: TLongDouble; __ndigit: longint; __decpt: Plongint; __sign: Plongint; __buf: pchar; __len: Tsize_t): longint; cdecl; external libc;

function mblen(__s: pchar; __n: Tsize_t): longint; cdecl; external libc;
function mbtowc(__pwc: Pwchar_t; __s: pchar; __n: Tsize_t): longint; cdecl; external libc;
function wctomb(__s: pchar; __wchar: Twchar_t): longint; cdecl; external libc;
function mbstowcs(__pwcs: Pwchar_t; __s: pchar; __n: Tsize_t): Tsize_t; cdecl; external libc;
function wcstombs(__s: pchar; __pwcs: Pwchar_t; __n: Tsize_t): Tsize_t; cdecl; external libc;
function rpmatch(__response: pchar): longint; cdecl; external libc;
function getsubopt(__optionp: PPchar; __tokens: PPchar; __valuep: PPchar): longint; cdecl; external libc;
function posix_openpt(__oflag: longint): longint; cdecl; external libc;
function grantpt(__fd: longint): longint; cdecl; external libc;
function unlockpt(__fd: longint): longint; cdecl; external libc;
function ptsname(__fd: longint): pchar; cdecl; external libc;
function ptsname_r(__fd: longint; __buf: pchar; __buflen: Tsize_t): longint; cdecl; external libc;
function getpt: longint; cdecl; external libc;
function getloadavg(__loadavg: Pdouble; __nelem: longint): longint; cdecl; external libc;
function ttyslot: longint; cdecl; external libc;

// === Konventiert am: 14-7-25 15:13:58 ===


implementation


end.
