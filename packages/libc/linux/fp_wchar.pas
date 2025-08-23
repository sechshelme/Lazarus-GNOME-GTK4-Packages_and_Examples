unit fp_wchar;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Twchar_t = uint32;
  {$ENDIF}

  {$IFDEF Windows}
  Twchar_t = uint16;
  {$ENDIF}
  Pwchar_t = ^Twchar_t;


  // /usr/include/x86_64-linux-gnu/bits/wchar.h

const
  {$IFDEF linux}
  WCHAR_MAX = $7FFFFFFF;
  WCHAR_MIN = -2147483648;
  {$ENDIF}

  {$IFDEF windows}
  WCHAR_MAX = $FFFF;
  WCHAR_MIN = 0;
  {$ENDIF}


  // /usr/include/x86_64-linux-gnu/bits/types/wint_t.h

type
  Pwint_t = ^Twint_t;
  Twint_t = DWord;


  // /usr/include/x86_64-linux-gnu/bits/wctype-wchar.h
type
  Pwctype_t = ^Twctype_t;
  Twctype_t = dword;


  // /usr/include/wctype.h

const
  WEOF = $ffffffff;

type
  Pwctrans_t = ^Twctrans_t;
  Twctrans_t = Pint32_t;

function wctrans(__property: pchar): Twctrans_t; cdecl; external libc;
function towctrans(__wc: Twint_t; __desc: Twctrans_t): Twint_t; cdecl; external libc;
function iswalnum_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswalpha_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswcntrl_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswdigit_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswgraph_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswlower_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswprint_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswpunct_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswspace_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswupper_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswxdigit_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function iswblank_l(__wc: Twint_t; __locale: Tlocale_t): longint; cdecl; external libc;
function wctype_l(__property: pchar; __locale: Tlocale_t): Twctype_t; cdecl; external libc;
function iswctype_l(__wc: Twint_t; __desc: Twctype_t; __locale: Tlocale_t): longint; cdecl; external libc;
function towlower_l(__wc: Twint_t; __locale: Tlocale_t): Twint_t; cdecl; external libc;
function towupper_l(__wc: Twint_t; __locale: Tlocale_t): Twint_t; cdecl; external libc;
function wctrans_l(__property: pchar; __locale: Tlocale_t): Twctrans_t; cdecl; external libc;
function towctrans_l(__wc: Twint_t; __desc: Twctrans_t; __locale: Tlocale_t): Twint_t; cdecl; external libc;


// /usr/include/x86_64-linux-gnu/bits/wctype-wchar.h

function iswalnum(__wc: Twint_t): longint; cdecl; external libc;
function iswalpha(__wc: Twint_t): longint; cdecl; external libc;
function iswcntrl(__wc: Twint_t): longint; cdecl; external libc;
function iswdigit(__wc: Twint_t): longint; cdecl; external libc;
function iswgraph(__wc: Twint_t): longint; cdecl; external libc;
function iswlower(__wc: Twint_t): longint; cdecl; external libc;
function iswprint(__wc: Twint_t): longint; cdecl; external libc;
function iswpunct(__wc: Twint_t): longint; cdecl; external libc;
function iswspace(__wc: Twint_t): longint; cdecl; external libc;
function iswupper(__wc: Twint_t): longint; cdecl; external libc;
function iswxdigit(__wc: Twint_t): longint; cdecl; external libc;
function iswblank(__wc: Twint_t): longint; cdecl; external libc;
function wctype(__property: pchar): Twctype_t; cdecl; external libc;
function iswctype(__wc: Twint_t; __desc: Twctype_t): longint; cdecl; external libc;
function towlower(__wc: Twint_t): Twint_t; cdecl; external libc;
function towupper(__wc: Twint_t): Twint_t; cdecl; external libc;


// /usr/include/wchar.h

type
  Pva_list = ^Tva_list;
  Tva_list = Tgnuc_va_list;

function wcscpy(__dest: Pwchar_t; __src: Pwchar_t): Pwchar_t; cdecl; external libc;
function wcsncpy(__dest: Pwchar_t; __src: Pwchar_t; __n: Tsize_t): Pwchar_t; cdecl; external libc;
function wcslcpy(__dest: Pwchar_t; __src: Pwchar_t; __n: Tsize_t): Tsize_t; cdecl; external libc;
function wcslcat(__dest: Pwchar_t; __src: Pwchar_t; __n: Tsize_t): Tsize_t; cdecl; external libc;
function wcscat(__dest: Pwchar_t; __src: Pwchar_t): Pwchar_t; cdecl; external libc;
function wcsncat(__dest: Pwchar_t; __src: Pwchar_t; __n: Tsize_t): Pwchar_t; cdecl; external libc;
function wcscmp(__s1: Pwchar_t; __s2: Pwchar_t): longint; cdecl; external libc;
function wcsncmp(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t): longint; cdecl; external libc;
function wcscasecmp(__s1: Pwchar_t; __s2: Pwchar_t): longint; cdecl; external libc;
function wcsncasecmp(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t): longint; cdecl; external libc;
function wcscasecmp_l(__s1: Pwchar_t; __s2: Pwchar_t; __loc: Tlocale_t): longint; cdecl; external libc;
function wcsncasecmp_l(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t; __loc: Tlocale_t): longint; cdecl; external libc;
function wcscoll(__s1: Pwchar_t; __s2: Pwchar_t): longint; cdecl; external libc;
function wcsxfrm(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t): Tsize_t; cdecl; external libc;
function wcscoll_l(__s1: Pwchar_t; __s2: Pwchar_t; __loc: Tlocale_t): longint; cdecl; external libc;
function wcsxfrm_l(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t; __loc: Tlocale_t): Tsize_t; cdecl; external libc;
function wcsdup(__s: Pwchar_t): Pwchar_t; cdecl; external libc;
function wcschr(__wcs: Pwchar_t; __wc: Twchar_t): Pwchar_t; cdecl; external libc;
function wcsrchr(__wcs: Pwchar_t; __wc: Twchar_t): Pwchar_t; cdecl; external libc;
function wcschrnul(__s: Pwchar_t; __wc: Twchar_t): Pwchar_t; cdecl; external libc;
function wcscspn(__wcs: Pwchar_t; __reject: Pwchar_t): Tsize_t; cdecl; external libc;
function wcsspn(__wcs: Pwchar_t; __accept: Pwchar_t): Tsize_t; cdecl; external libc;
function wcspbrk(__wcs: Pwchar_t; __accept: Pwchar_t): Pwchar_t; cdecl; external libc;
function wcsstr(__haystack: Pwchar_t; __needle: Pwchar_t): Pwchar_t; cdecl; external libc;
function wcstok(__s: Pwchar_t; __delim: Pwchar_t; __ptr: PPwchar_t): Pwchar_t; cdecl; external libc;
function wcslen(__s: Pwchar_t): Tsize_t; cdecl; external libc;
function wcswcs(__haystack: Pwchar_t; __needle: Pwchar_t): Pwchar_t; cdecl; external libc;
function wcsnlen(__s: Pwchar_t; __maxlen: Tsize_t): Tsize_t; cdecl; external libc;
function wmemchr(__s: Pwchar_t; __c: Twchar_t; __n: Tsize_t): Pwchar_t; cdecl; external libc;
function wmemcmp(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t): longint; cdecl; external libc;
function wmemcpy(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t): Pwchar_t; cdecl; external libc;
function wmemmove(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t): Pwchar_t; cdecl; external libc;
function wmemset(__s: Pwchar_t; __c: Twchar_t; __n: Tsize_t): Pwchar_t; cdecl; external libc;
function wmempcpy(__s1: Pwchar_t; __s2: Pwchar_t; __n: Tsize_t): Pwchar_t; cdecl; external libc;
function btowc(__c: longint): Twint_t; cdecl; external libc;
function wctob(__c: Twint_t): longint; cdecl; external libc;
function mbsinit(__ps: Pmbstate_t): longint; cdecl; external libc;
function mbrtowc(__pwc: Pwchar_t; __s: pchar; __n: Tsize_t; __p: Pmbstate_t): Tsize_t; cdecl; external libc;
function wcrtomb(__s: pchar; __wc: Twchar_t; __ps: Pmbstate_t): Tsize_t; cdecl; external libc;
function __mbrlen(__s: pchar; __n: Tsize_t; __ps: Pmbstate_t): Tsize_t; cdecl; external libc;
function mbrlen(__s: pchar; __n: Tsize_t; __ps: Pmbstate_t): Tsize_t; cdecl; external libc;
function mbsrtowcs(__dst: Pwchar_t; __src: PPchar; __len: Tsize_t; __ps: Pmbstate_t): Tsize_t; cdecl; external libc;
function wcsrtombs(__dst: pchar; __src: PPwchar_t; __len: Tsize_t; __ps: Pmbstate_t): Tsize_t; cdecl; external libc;
function mbsnrtowcs(__dst: Pwchar_t; __src: PPchar; __nmc: Tsize_t; __len: Tsize_t; __ps: Pmbstate_t): Tsize_t; cdecl; external libc;
function wcsnrtombs(__dst: pchar; __src: PPwchar_t; __nwc: Tsize_t; __len: Tsize_t; __ps: Pmbstate_t): Tsize_t; cdecl; external libc;
function wcwidth(__c: Twchar_t): longint; cdecl; external libc;
function wcswidth(__s: Pwchar_t; __n: Tsize_t): longint; cdecl; external libc;
function wcstod(__nptr: Pwchar_t; __endptr: PPwchar_t): double; cdecl; external libc;
function wcstof(__nptr: Pwchar_t; __endptr: PPwchar_t): single; cdecl; external libc;
function wcstold(__nptr: Pwchar_t; __endptr: PPwchar_t): Tlong_double; cdecl; external libc;
function wcstof16(__nptr: Pwchar_t; __endptr: PPwchar_t): TFloat16; cdecl; external libc;
function wcstof32(__nptr: Pwchar_t; __endptr: PPwchar_t): TFloat32; cdecl; external libc;
function wcstof64(__nptr: Pwchar_t; __endptr: PPwchar_t): TFloat64; cdecl; external libc;
function wcstof128(__nptr: Pwchar_t; __endptr: PPwchar_t): TFloat128; cdecl; external libc;
function wcstof32x(__nptr: Pwchar_t; __endptr: PPwchar_t): TFloat32x; cdecl; external libc;
function wcstof64x(__nptr: Pwchar_t; __endptr: PPwchar_t): TFloat64x; cdecl; external libc;
function wcstof128x(__nptr: Pwchar_t; __endptr: PPwchar_t): TFloat128x; cdecl; external libc;
function wcstol(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): longint; cdecl; external libc;
function wcstoul(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): dword; cdecl; external libc;
function wcstoll(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): int64; cdecl; external libc;
function wcstoull(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): qword; cdecl; external libc;
function wcstoq(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): int64; cdecl; external libc;
function wcstouq(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): qword; cdecl; external libc;

function __isoc23_wcstol(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): longint; cdecl; external libc;
function __isoc23_wcstoul(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): dword; cdecl; external libc;
function __isoc23_wcstoll(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): int64; cdecl; external libc;
function __isoc23_wcstoull(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint): qword; cdecl; external libc;

function wcstol_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint; __loc: Tlocale_t): longint; cdecl; external libc;
function wcstoul_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint; __loc: Tlocale_t): dword; cdecl; external libc;
function wcstoll_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint; __loc: Tlocale_t): int64; cdecl; external libc;
function wcstoull_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint; __loc: Tlocale_t): qword; cdecl; external libc;

function __isoc23_wcstol_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint; __loc: Tlocale_t): longint; cdecl; external libc;
function __isoc23_wcstoul_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint; __loc: Tlocale_t): dword; cdecl; external libc;
function __isoc23_wcstoll_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint; __loc: Tlocale_t): int64; cdecl; external libc;
function __isoc23_wcstoull_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __base: longint; __loc: Tlocale_t): qword; cdecl; external libc;

function wcstod_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): double; cdecl; external libc;
function wcstof_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): single; cdecl; external libc;
function wcstold_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): Tlong_double; cdecl; external libc;
function wcstof16_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): TFloat16; cdecl; external libc;
function wcstof32_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): TFloat32; cdecl; external libc;
function wcstof64_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): TFloat64; cdecl; external libc;
function wcstof128_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): TFloat128; cdecl; external libc;
function wcstof32x_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): TFloat32x; cdecl; external libc;
function wcstof64x_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): TFloat64x; cdecl; external libc;
function wcstof128x_l(__nptr: Pwchar_t; __endptr: PPwchar_t; __loc: Tlocale_t): TFloat128x; cdecl; external libc;
function wcpcpy(__dest: Pwchar_t; __src: Pwchar_t): Pwchar_t; cdecl; external libc;
function wcpncpy(__dest: Pwchar_t; __src: Pwchar_t; __n: Tsize_t): Pwchar_t; cdecl; external libc;
function open_wmemstream(__bufloc: PPwchar_t; __sizeloc: Psize_t): PFILE; cdecl; external libc;
function fwide(__fp: PFILE; __mode: longint): longint; cdecl; external libc;
function fwprintf(__stream: PFILE; __format: Pwchar_t): longint; cdecl; varargs; external libc;
function wprintf(__format: Pwchar_t): longint; cdecl; varargs; external libc;
function swprintf(__s: Pwchar_t; __n: Tsize_t; __format: Pwchar_t): longint; cdecl; varargs; external libc;
function vfwprintf(__s: PFILE; __format: Pwchar_t; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vwprintf(__format: Pwchar_t; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vswprintf(__s: Pwchar_t; __n: Tsize_t; __format: Pwchar_t; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function fwscanf(__stream: PFILE; __format: Pwchar_t): longint; cdecl; varargs; external libc;
function wscanf(__format: Pwchar_t): longint; cdecl; varargs; external libc;
function swscanf(__s: Pwchar_t; __format: Pwchar_t): longint; cdecl; varargs; external libc;

function __isoc23_fwscanf(__stream: PFILE; __format: Pwchar_t): longint; cdecl; varargs; external libc;
function __isoc23_wscanf(__format: Pwchar_t): longint; cdecl; varargs; external libc;
function __isoc23_swscanf(__s: Pwchar_t; __format: Pwchar_t): longint; cdecl; varargs; external libc;
function __isoc99_fwscanf(__stream: PFILE; __format: Pwchar_t): longint; cdecl; varargs; external libc;
function __isoc99_wscanf(__format: Pwchar_t): longint; cdecl; varargs; external libc;
function __isoc99_swscanf(__s: Pwchar_t; __format: Pwchar_t): longint; cdecl; varargs; external libc;

function vfwscanf(__s: PFILE; __format: Pwchar_t; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vwscanf(__format: Pwchar_t; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function vswscanf(__s: Pwchar_t; __format: Pwchar_t; __arg: Tgnuc_va_list): longint; cdecl; external libc;
function fgetwc(__stream: PFILE): Twint_t; cdecl; external libc;
function getwc(__stream: PFILE): Twint_t; cdecl; external libc;
function getwchar: Twint_t; cdecl; external libc;
function fputwc(__wc: Twchar_t; __stream: PFILE): Twint_t; cdecl; external libc;
function putwc(__wc: Twchar_t; __stream: PFILE): Twint_t; cdecl; external libc;
function putwchar(__wc: Twchar_t): Twint_t; cdecl; external libc;
function fgetws(__ws: Pwchar_t; __n: longint; __stream: PFILE): Pwchar_t; cdecl; external libc;
function fputws(__ws: Pwchar_t; __stream: PFILE): longint; cdecl; external libc;
function ungetwc(__wc: Twint_t; __stream: PFILE): Twint_t; cdecl; external libc;
function getwc_unlocked(__stream: PFILE): Twint_t; cdecl; external libc;
function getwchar_unlocked: Twint_t; cdecl; external libc;
function fgetwc_unlocked(__stream: PFILE): Twint_t; cdecl; external libc;
function fputwc_unlocked(__wc: Twchar_t; __stream: PFILE): Twint_t; cdecl; external libc;
function putwc_unlocked(__wc: Twchar_t; __stream: PFILE): Twint_t; cdecl; external libc;
function putwchar_unlocked(__wc: Twchar_t): Twint_t; cdecl; external libc;
function fgetws_unlocked(__ws: Pwchar_t; __n: longint; __stream: PFILE): Pwchar_t; cdecl; external libc;
function fputws_unlocked(__ws: Pwchar_t; __stream: PFILE): longint; cdecl; external libc;
function wcsftime(__s: Pwchar_t; __maxsize: Tsize_t; __format: Pwchar_t; __tp: Ptm): Tsize_t; cdecl; external libc;
function wcsftime_l(__s: Pwchar_t; __maxsize: Tsize_t; __format: Pwchar_t; __tp: Ptm; __loc: Tlocale_t): Tsize_t; cdecl; external libc;

// === Konventiert am: 23-8-25 13:57:50 ===


implementation



end.
