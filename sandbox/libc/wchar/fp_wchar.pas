unit fp_wchar;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

// /usr/include/wchar.h


{ Copyright (C) 1995-2024 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.   }
{
 *      ISO C99 Standard: 7.24
 *	Extended multibyte and wide character utilities	<wchar.h>
  }
{$ifndef _WCHAR_H}

const
  _WCHAR_H = 1;  
{$define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION}
{$include <bits/libc-header-start.h>}
{ Gather machine dependent type support.   }
{$include <bits/floatn.h>}
{$define __need_size_t}
{$define __need_wchar_t}
{$define __need_NULL}
{$include <stddef.h>}
{$define __need___va_list}
{$include <stdarg.h>}
{$if defined __USE_XOPEN2K || defined __USE_XOPEN2K8}
{$ifdef __GNUC__}
{$ifndef _VA_LIST_DEFINED}
type
  Pva_list = ^Tva_list;
  Tva_list = Tgnuc_va_list;
{$define _VA_LIST_DEFINED}
{$endif}
{$else}
{$include <stdarg.h>}
{$endif}
{$endif}
{$include <bits/wchar.h>}
{$include <bits/types/wint_t.h>}
{$include <bits/types/mbstate_t.h>}
{$include <bits/types/__FILE.h>}
{$if defined __USE_UNIX98 || defined __USE_XOPEN2K}
{$include <bits/types/FILE.h>}
{$endif}
{$ifdef __USE_XOPEN2K8}
{$include <bits/types/locale_t.h>}
{$endif}
{ Tell the caller that we provide correct C++ prototypes.   }
{$if defined __cplusplus && __GNUC_PREREQ (4, 4)}
{$define __CORRECT_ISO_CPP_WCHAR_H_PROTO}
{$endif}
{$ifndef WCHAR_MIN}
{ These constants might also be defined in <inttypes.h>.   }

const
  WCHAR_MIN = __WCHAR_MIN;  
  WCHAR_MAX = __WCHAR_MAX;  
{$endif}
{$ifndef WEOF}

const
  WEOF = $ffffffff;  
{$endif}
{ All versions of XPG prior to the publication of ISO C99 required
   the bulk of <wctype.h>'s declarations to appear in this header
   (because <wctype.h> did not exist prior to C99).  In POSIX.1-2001
   those declarations were marked as XSI extensions; in -2008 they
   were additionally marked as obsolescent.  _GNU_SOURCE mode
   anticipates the removal of these declarations in the next revision
   of POSIX.   }
{$endif}
{ This incomplete type is defined in <time.h> but needed here because
   of `wcsftime'.   }
type
  Ptm = ^Ttm;
  Ttm = record
      {undefined structure}
    end;

{ Copy SRC to DEST.   }

function wcscpy(__dest:Pwchar_t; __src:Pwchar_t):Pwchar_t;cdecl;external libc;
{ Copy no more than N wide-characters of SRC to DEST.   }
function wcsncpy(__dest:Pwchar_t; __src:Pwchar_t; __n:Tsize_t):Pwchar_t;cdecl;external libc;
{$ifdef __USE_MISC}
{ Copy at most N - 1 characters from SRC to DEST.   }
function wcslcpy(__dest:Pwchar_t; __src:Pwchar_t; __n:Tsize_t):Tsize_t;cdecl;external libc;
{ Append SRC to DEST, possibly with truncation to keep the total size
   below N.   }
function wcslcat(__dest:Pwchar_t; __src:Pwchar_t; __n:Tsize_t):Tsize_t;cdecl;external libc;
{$endif}
{ Append SRC onto DEST.   }

function wcscat(__dest:Pwchar_t; __src:Pwchar_t):Pwchar_t;cdecl;external libc;
{ Append no more than N wide-characters of SRC onto DEST.   }
function wcsncat(__dest:Pwchar_t; __src:Pwchar_t; __n:Tsize_t):Pwchar_t;cdecl;external libc;
{ Compare S1 and S2.   }
function wcscmp(__s1:Pwchar_t; __s2:Pwchar_t):longint;cdecl;external libc;
{ Compare N wide-characters of S1 and S2.   }
function wcsncmp(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t):longint;cdecl;external libc;
{$ifdef __USE_XOPEN2K8}
{ Compare S1 and S2, ignoring case.   }
function wcscasecmp(__s1:Pwchar_t; __s2:Pwchar_t):longint;cdecl;external libc;
{ Compare no more than N chars of S1 and S2, ignoring case.   }
function wcsncasecmp(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t):longint;cdecl;external libc;
{ Similar to the two functions above but take the information from
   the provided locale and not the global locale.   }
function wcscasecmp_l(__s1:Pwchar_t; __s2:Pwchar_t; __loc:Tlocale_t):longint;cdecl;external libc;
function wcsncasecmp_l(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t; __loc:Tlocale_t):longint;cdecl;external libc;
{$endif}
{ Compare S1 and S2, both interpreted as appropriate to the
   LC_COLLATE category of the current locale.   }

function wcscoll(__s1:Pwchar_t; __s2:Pwchar_t):longint;cdecl;external libc;
{ Transform S2 into array pointed to by S1 such that if wcscmp is
   applied to two transformed strings the result is the as applying
   `wcscoll' to the original strings.   }
function wcsxfrm(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t):Tsize_t;cdecl;external libc;
{$ifdef __USE_XOPEN2K8}
{ Similar to the two functions above but take the information from
   the provided locale and not the global locale.   }
{ Compare S1 and S2, both interpreted as appropriate to the
   LC_COLLATE category of the given locale.   }
function wcscoll_l(__s1:Pwchar_t; __s2:Pwchar_t; __loc:Tlocale_t):longint;cdecl;external libc;
{ Transform S2 into array pointed to by S1 such that if wcscmp is
   applied to two transformed strings the result is the as applying
   `wcscoll' to the original strings.   }
function wcsxfrm_l(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t; __loc:Tlocale_t):Tsize_t;cdecl;external libc;
{ Duplicate S, returning an identical malloc'd string.   }
function wcsdup(__s:Pwchar_t):Pwchar_t;cdecl;external libc;
{$endif}
{ Find the first occurrence of WC in WCS.   }
{$ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO}
{$else}

function wcschr(__wcs:Pwchar_t; __wc:Twchar_t):Pwchar_t;cdecl;external libc;
{$endif}
{ Find the last occurrence of WC in WCS.   }
{$ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO}
{$else}

function wcsrchr(__wcs:Pwchar_t; __wc:Twchar_t):Pwchar_t;cdecl;external libc;
{$endif}
{$ifdef __USE_GNU}
{ This function is similar to `wcschr'.  But it returns a pointer to
   the closing NUL wide character in case C is not found in S.   }

function wcschrnul(__s:Pwchar_t; __wc:Twchar_t):Pwchar_t;cdecl;external libc;
{$endif}
{ Return the length of the initial segmet of WCS which
   consists entirely of wide characters not in REJECT.   }

function wcscspn(__wcs:Pwchar_t; __reject:Pwchar_t):Tsize_t;cdecl;external libc;
{ Return the length of the initial segmet of WCS which
   consists entirely of wide characters in  ACCEPT.   }
function wcsspn(__wcs:Pwchar_t; __accept:Pwchar_t):Tsize_t;cdecl;external libc;
{ Find the first occurrence in WCS of any character in ACCEPT.   }
{$ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO}
{$else}

function wcspbrk(__wcs:Pwchar_t; __accept:Pwchar_t):Pwchar_t;cdecl;external libc;
{$endif}
{ Find the first occurrence of NEEDLE in HAYSTACK.   }
{$ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO}
{$else}

function wcsstr(__haystack:Pwchar_t; __needle:Pwchar_t):Pwchar_t;cdecl;external libc;
{$endif}
{ Divide WCS into tokens separated by characters in DELIM.   }

function wcstok(__s:Pwchar_t; __delim:Pwchar_t; __ptr:PPwchar_t):Pwchar_t;cdecl;external libc;
{ Return the number of wide characters in S.   }
function wcslen(__s:Pwchar_t):Tsize_t;cdecl;external libc;
{$ifdef __USE_XOPEN}
{ Another name for `wcsstr' from XPG4.   }
{$ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO}
{$else}

function wcswcs(__haystack:Pwchar_t; __needle:Pwchar_t):Pwchar_t;cdecl;external libc;
{$endif}
{$endif}
{$ifdef __USE_XOPEN2K8}
{ Return the number of wide characters in S, but at most MAXLEN.   }

function wcsnlen(__s:Pwchar_t; __maxlen:Tsize_t):Tsize_t;cdecl;external libc;
{$endif}
{ Search N wide characters of S for C.   }
{$ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO}
{$else}

function wmemchr(__s:Pwchar_t; __c:Twchar_t; __n:Tsize_t):Pwchar_t;cdecl;external libc;
{$endif}
{ Compare N wide characters of S1 and S2.   }

function wmemcmp(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t):longint;cdecl;external libc;
{ Copy N wide characters of SRC to DEST.   }
function wmemcpy(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t):Pwchar_t;cdecl;external libc;
{ Copy N wide characters of SRC to DEST, guaranteeing
   correct behavior for overlapping strings.   }
function wmemmove(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t):Pwchar_t;cdecl;external libc;
{ Set N wide characters of S to C.   }
function wmemset(__s:Pwchar_t; __c:Twchar_t; __n:Tsize_t):Pwchar_t;cdecl;external libc;
{$ifdef __USE_GNU}
{ Copy N wide characters of SRC to DEST and return pointer to following
   wide character.   }
function wmempcpy(__s1:Pwchar_t; __s2:Pwchar_t; __n:Tsize_t):Pwchar_t;cdecl;external libc;
{$endif}
{ Determine whether C constitutes a valid (one-byte) multibyte
   character.   }

function btowc(__c:longint):Twint_t;cdecl;external libc;
{ Determine whether C corresponds to a member of the extended
   character set whose multibyte representation is a single byte.   }
function wctob(__c:Twint_t):longint;cdecl;external libc;
{ Determine whether PS points to an object representing the initial
   state.   }
function mbsinit(__ps:Pmbstate_t):longint;cdecl;external libc;
{ Write wide character representation of multibyte character pointed
   to by S to PWC.   }
function mbrtowc(__pwc:Pwchar_t; __s:Pchar; __n:Tsize_t; __p:Pmbstate_t):Tsize_t;cdecl;external libc;
{ Write multibyte representation of wide character WC to S.   }
function wcrtomb(__s:Pchar; __wc:Twchar_t; __ps:Pmbstate_t):Tsize_t;cdecl;external libc;
{ Return number of bytes in multibyte character pointed to by S.   }
function __mbrlen(__s:Pchar; __n:Tsize_t; __ps:Pmbstate_t):Tsize_t;cdecl;external libc;
function mbrlen(__s:Pchar; __n:Tsize_t; __ps:Pmbstate_t):Tsize_t;cdecl;external libc;
{ Write wide character representation of multibyte character string
   SRC to DST.   }
function mbsrtowcs(__dst:Pwchar_t; __src:PPchar; __len:Tsize_t; __ps:Pmbstate_t):Tsize_t;cdecl;external libc;
{ Write multibyte character representation of wide character string
   SRC to DST.   }
function wcsrtombs(__dst:Pchar; __src:PPwchar_t; __len:Tsize_t; __ps:Pmbstate_t):Tsize_t;cdecl;external libc;
{$ifdef __USE_XOPEN2K8}
{ Write wide character representation of at most NMC bytes of the
   multibyte character string SRC to DST.   }
function mbsnrtowcs(__dst:Pwchar_t; __src:PPchar; __nmc:Tsize_t; __len:Tsize_t; __ps:Pmbstate_t):Tsize_t;cdecl;external libc;
{ Write multibyte character representation of at most NWC characters
   from the wide character string SRC to DST.   }
function wcsnrtombs(__dst:Pchar; __src:PPwchar_t; __nwc:Tsize_t; __len:Tsize_t; __ps:Pmbstate_t):Tsize_t;cdecl;external libc;
{$endif}
{ use POSIX 2008  }
{ The following functions are extensions found in X/Open CAE.   }
{$ifdef __USE_XOPEN}
{ Determine number of column positions required for C.   }

function wcwidth(__c:Twchar_t):longint;cdecl;external libc;
{ Determine number of column positions required for first N wide
   characters (or fewer if S ends before this) in S.   }
function wcswidth(__s:Pwchar_t; __n:Tsize_t):longint;cdecl;external libc;
{$endif}
{ Use X/Open.   }
{ Convert initial portion of the wide string NPTR to `double'
   representation.   }

function wcstod(__nptr:Pwchar_t; __endptr:PPwchar_t):Tdouble;cdecl;external libc;
{$ifdef __USE_ISOC99}
{ Likewise for `float' and `long_double' sizes of floating-point numbers.   }
function wcstof(__nptr:Pwchar_t; __endptr:PPwchar_t):single;cdecl;external libc;
function wcstold(__nptr:Pwchar_t; __endptr:PPwchar_t):Tlong_double;cdecl;external libc;
{$endif}
{ C99  }
{$if __GLIBC_USE (IEC_60559_TYPES_EXT) && __GLIBC_USE (ISOC2X)}
{ Likewise for `_FloatN' and `_FloatNx' when support is enabled.   }
{$if __HAVE_FLOAT16}

function wcstof16(__nptr:Pwchar_t; __endptr:PPwchar_t):TFloat16;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT32}

function wcstof32(__nptr:Pwchar_t; __endptr:PPwchar_t):TFloat32;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT64}

function wcstof64(__nptr:Pwchar_t; __endptr:PPwchar_t):TFloat64;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT128}

function wcstof128(__nptr:Pwchar_t; __endptr:PPwchar_t):TFloat128;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT32X}

function wcstof32x(__nptr:Pwchar_t; __endptr:PPwchar_t):TFloat32x;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT64X}

function wcstof64x(__nptr:Pwchar_t; __endptr:PPwchar_t):TFloat64x;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT128X}

function wcstof128x(__nptr:Pwchar_t; __endptr:PPwchar_t):TFloat128x;cdecl;external libc;
{$endif}
{$endif}
{ __GLIBC_USE (IEC_60559_TYPES_EXT) && __GLIBC_USE (ISOC2X)  }
{ Convert initial portion of wide string NPTR to `long int'
   representation.   }

function wcstol(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):longint;cdecl;external libc;
{ Convert initial portion of wide string NPTR to `unsigned long int'
   representation.   }
function wcstoul(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):dword;cdecl;external libc;
{$ifdef __USE_ISOC99}
{ Convert initial portion of wide string NPTR to `long long int'
   representation.   }
function wcstoll(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):int64;cdecl;external libc;
{ Convert initial portion of wide string NPTR to `unsigned long long int'
   representation.   }
function wcstoull(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):qword;cdecl;external libc;
{$endif}
{ ISO C99.   }
{$ifdef __USE_GNU}
{ Convert initial portion of wide string NPTR to `long long int'
   representation.   }

function wcstoq(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):int64;cdecl;external libc;
{ Convert initial portion of wide string NPTR to `unsigned long long int'
   representation.   }
function wcstouq(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):qword;cdecl;external libc;
{$endif}
{ Use GNU.   }
{ Versions of the above functions that handle '0b' and '0B' prefixes
   in base 0 or 2.   }
{$if __GLIBC_USE (C2X_STRTOL)}
{$ifdef __REDIRECT}
{$else}

function __isoc23_wcstol(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):longint;cdecl;external libc;
function __isoc23_wcstoul(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):dword;cdecl;external libc;
function __isoc23_wcstoll(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):int64;cdecl;external libc;
function __isoc23_wcstoull(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint):qword;cdecl;external libc;
{$ifdef __USE_GNU}
{ Parallel versions of the functions above which take the locale to
   use as an additional parameter.  These are GNU extensions inspired
   by the POSIX.1-2008 extended locale API.   }
function wcstol_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint; __loc:Tlocale_t):longint;cdecl;external libc;
function wcstoul_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint; __loc:Tlocale_t):dword;cdecl;external libc;
function wcstoll_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint; __loc:Tlocale_t):int64;cdecl;external libc;
function wcstoull_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint; __loc:Tlocale_t):qword;cdecl;external libc;
{ Versions of the above functions that handle '0b' and '0B' prefixes
   in base 0 or 2.   }
{$if __GLIBC_USE (C2X_STRTOL)}
{$ifdef __REDIRECT}
{$else}

function __isoc23_wcstol_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint; __loc:Tlocale_t):longint;cdecl;external libc;
function __isoc23_wcstoul_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint; __loc:Tlocale_t):dword;cdecl;external libc;
function __isoc23_wcstoll_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint; __loc:Tlocale_t):int64;cdecl;external libc;
function __isoc23_wcstoull_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __base:longint; __loc:Tlocale_t):qword;cdecl;external libc;
function wcstod_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):Tdouble;cdecl;external libc;
function wcstof_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):single;cdecl;external libc;
function wcstold_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):Tlong_double;cdecl;external libc;
{$if __HAVE_FLOAT16}

function wcstof16_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):TFloat16;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT32}

function wcstof32_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):TFloat32;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT64}

function wcstof64_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):TFloat64;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT128}

function wcstof128_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):TFloat128;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT32X}

function wcstof32x_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):TFloat32x;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT64X}

function wcstof64x_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):TFloat64x;cdecl;external libc;
{$endif}
{$if __HAVE_FLOAT128X}

function wcstof128x_l(__nptr:Pwchar_t; __endptr:PPwchar_t; __loc:Tlocale_t):TFloat128x;cdecl;external libc;
{$endif}
{$endif}
{ use GNU  }
{$ifdef __USE_XOPEN2K8}
{ Copy SRC to DEST, returning the address of the terminating L'\0' in
   DEST.   }

function wcpcpy(__dest:Pwchar_t; __src:Pwchar_t):Pwchar_t;cdecl;external libc;
{ Copy no more than N characters of SRC to DEST, returning the address of
   the last character written into DEST.   }
function wcpncpy(__dest:Pwchar_t; __src:Pwchar_t; __n:Tsize_t):Pwchar_t;cdecl;external libc;
{$endif}
{ Wide character I/O functions.   }
{ Like OPEN_MEMSTREAM, but the stream is wide oriented and produces
   a wide character string.   }

function open_wmemstream(__bufloc:PPwchar_t; __sizeloc:Psize_t):PFILE;cdecl;external libc;
{$endif}
{$if defined __USE_ISOC95 || defined __USE_UNIX98}
{ Select orientation for stream.   }

function fwide(__fp:PFILE; __mode:longint):longint;cdecl;external libc;
{ Write formatted output to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
{ __attribute__ ((__format__ (__wprintf__, 2, 3)))  }function fwprintf(__stream:PFILE; __format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function fwprintf(__stream:PFILE; __format:Pwchar_t):longint;cdecl;external libc;
{ Write formatted output to stdout.

   This function is a possible cancellation point and therefore not
   marked with .   }
{ __attribute__ ((__format__ (__wprintf__, 1, 2)))  }function wprintf(__format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function wprintf(__format:Pwchar_t):longint;cdecl;external libc;
{ Write formatted output of at most N characters to S.   }
{ __attribute__ ((__format__ (__wprintf__, 3, 4)))  }function swprintf(__s:Pwchar_t; __n:Tsize_t; __format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function swprintf(__s:Pwchar_t; __n:Tsize_t; __format:Pwchar_t):longint;cdecl;external libc;
{ Write formatted output to S from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
{ __attribute__ ((__format__ (__wprintf__, 2, 0)))  }function vfwprintf(__s:PFILE; __format:Pwchar_t; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Write formatted output to stdout from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
{ __attribute__ ((__format__ (__wprintf__, 1, 0)))  }function vwprintf(__format:Pwchar_t; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Write formatted output of at most N character to S from argument
   list ARG.   }
{ __attribute__ ((__format__ (__wprintf__, 3, 0)))  }function vswprintf(__s:Pwchar_t; __n:Tsize_t; __format:Pwchar_t; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Read formatted input from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
{ __attribute__ ((__format__ (__wscanf__, 2, 3)))  }function fwscanf(__stream:PFILE; __format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function fwscanf(__stream:PFILE; __format:Pwchar_t):longint;cdecl;external libc;
{ Read formatted input from stdin.

   This function is a possible cancellation point and therefore not
   marked with .   }
{ __attribute__ ((__format__ (__wscanf__, 1, 2)))  }function wscanf(__format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function wscanf(__format:Pwchar_t):longint;cdecl;external libc;
{ Read formatted input from S.   }
{ __attribute__ ((__format__ (__wscanf__, 2, 3)))  }function swscanf(__s:Pwchar_t; __format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function swscanf(__s:Pwchar_t; __format:Pwchar_t):longint;cdecl;external libc;
{ For historical reasons, the C99-compliant versions of the scanf
   functions are at alternative names.  When __LDBL_COMPAT or
   __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI are in effect, this is handled in
   bits/wchar-ldbl.h.   }
function __isoc23_fwscanf(__stream:PFILE; __format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function __isoc23_fwscanf(__stream:PFILE; __format:Pwchar_t):longint;cdecl;external libc;
function __isoc23_wscanf(__format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function __isoc23_wscanf(__format:Pwchar_t):longint;cdecl;external libc;
function __isoc23_swscanf(__s:Pwchar_t; __format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function __isoc23_swscanf(__s:Pwchar_t; __format:Pwchar_t):longint;cdecl;external libc;
function __isoc99_fwscanf(__stream:PFILE; __format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function __isoc99_fwscanf(__stream:PFILE; __format:Pwchar_t):longint;cdecl;external libc;
function __isoc99_wscanf(__format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function __isoc99_wscanf(__format:Pwchar_t):longint;cdecl;external libc;
function __isoc99_swscanf(__s:Pwchar_t; __format:Pwchar_t; args:array of const):longint;cdecl;external libc;
function __isoc99_swscanf(__s:Pwchar_t; __format:Pwchar_t):longint;cdecl;external libc;
{$endif}
{ Use ISO C95, C99 and Unix98.  }
{$ifdef __USE_ISOC99}
{ Read formatted input from S into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
{ __attribute__ ((__format__ (__wscanf__, 2, 0)))  }
function vfwscanf(__s:PFILE; __format:Pwchar_t; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Read formatted input from stdin into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .   }
{ __attribute__ ((__format__ (__wscanf__, 1, 0)))  }function vwscanf(__format:Pwchar_t; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{ Read formatted input from S into argument list ARG.   }
{ __attribute__ ((__format__ (__wscanf__, 2, 0)))  }function vswscanf(__s:Pwchar_t; __format:Pwchar_t; __arg:Tgnuc_va_list):longint;cdecl;external libc;
{$endif}
{ Use ISO C99.  }
{ Read a character from STREAM.

   These functions are possible cancellation points and therefore not
   marked with .   }

function fgetwc(__stream:PFILE):Twint_t;cdecl;external libc;
function getwc(__stream:PFILE):Twint_t;cdecl;external libc;
{ Read a character from stdin.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getwchar:Twint_t;cdecl;external libc;
{ Write a character to STREAM.

   These functions are possible cancellation points and therefore not
   marked with .   }
function fputwc(__wc:Twchar_t; __stream:PFILE):Twint_t;cdecl;external libc;
function putwc(__wc:Twchar_t; __stream:PFILE):Twint_t;cdecl;external libc;
{ Write a character to stdout.

   This function is a possible cancellation point and therefore not
   marked with .   }
function putwchar(__wc:Twchar_t):Twint_t;cdecl;external libc;
{ Get a newline-terminated wide character string of finite length
   from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function fgetws(__ws:Pwchar_t; __n:longint; __stream:PFILE):Pwchar_t;cdecl;external libc;
{ Write a string to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function fputws(__ws:Pwchar_t; __stream:PFILE):longint;cdecl;external libc;
{ Push a character back onto the input buffer of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .   }
function ungetwc(__wc:Twint_t; __stream:PFILE):Twint_t;cdecl;external libc;
{$ifdef __USE_GNU}
{ These are defined to be equivalent to the `char' functions defined
   in POSIX.1:1996.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }
function getwc_unlocked(__stream:PFILE):Twint_t;cdecl;external libc;
function getwchar_unlocked:Twint_t;cdecl;external libc;
{ This is the wide character version of a GNU extension.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fgetwc_unlocked(__stream:PFILE):Twint_t;cdecl;external libc;
{ Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fputwc_unlocked(__wc:Twchar_t; __stream:PFILE):Twint_t;cdecl;external libc;
{ These are defined to be equivalent to the `char' functions defined
   in POSIX.1:1996.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }
function putwc_unlocked(__wc:Twchar_t; __stream:PFILE):Twint_t;cdecl;external libc;
function putwchar_unlocked(__wc:Twchar_t):Twint_t;cdecl;external libc;
{ This function does the same as `fgetws' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fgetws_unlocked(__ws:Pwchar_t; __n:longint; __stream:PFILE):Pwchar_t;cdecl;external libc;
{ This function does the same as `fputws' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function fputws_unlocked(__ws:Pwchar_t; __stream:PFILE):longint;cdecl;external libc;
{$endif}
{ Format TP into S according to FORMAT.
   Write no more than MAXSIZE wide characters and return the number
   of wide characters written, or 0 if it would exceed MAXSIZE.   }

function wcsftime(__s:Pwchar_t; __maxsize:Tsize_t; __format:Pwchar_t; __tp:Ptm):Tsize_t;cdecl;external libc;
{$ifdef __USE_GNU}
{ Similar to `wcsftime' but takes the information from
   the provided locale and not the global locale.   }

function wcsftime_l(__s:Pwchar_t; __maxsize:Tsize_t; __format:Pwchar_t; __tp:Ptm; __loc:Tlocale_t):Tsize_t;cdecl;external libc;
{$endif}
{ Define some macros helping to catch buffer overflows.   }
{$if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function}
{ Declare all functions from bits/wchar2-decl.h first.   }
{$include <bits/wchar2-decl.h>}
{$endif}
{ The following headers provide asm redirections.  These redirections must
   appear before the first usage of these functions, e.g. in bits/wchar.h.   }
{$if defined __LDBL_COMPAT || __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI == 1}
{$include <bits/wchar-ldbl.h>}
{$endif}
{$if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function}
{ Now include the function definitions and redirects too.   }
{$include <bits/wchar2.h>}
{$endif}
{$endif}
{ wchar.h   }

// === Konventiert am: 23-8-25 13:57:50 ===


implementation



end.
