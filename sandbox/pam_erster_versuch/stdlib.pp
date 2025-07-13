
unit stdlib;
interface

{
  Automatically converted by H2Pas 1.0.0 from stdlib.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    stdlib.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pcomparison_fn_t  = ^comparison_fn_t;
Pdiv_t  = ^div_t;
Pdouble  = ^double;
Pdrand48_data  = ^drand48_data;
Pdword  = ^dword;
Pint32_t  = ^int32_t;
Pldiv_t  = ^ldiv_t;
Plldiv_t  = ^lldiv_t;
Plongint  = ^longint;
Prandom_data  = ^random_data;
Pwchar_t  = ^wchar_t;
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1991-2024 Free Software Foundation, Inc.
   Copyright The GNU Toolchain Authors.
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
 *	ISO C99 Standard: 7.20 General utilities	<stdlib.h>
  }
{$ifndef	_STDLIB_H}
{$define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION}
{$include <bits/libc-header-start.h>}
{ Get size_t, wchar_t and NULL from <stddef.h>.   }
{$define __need_size_t}
{$define __need_wchar_t}
{$define __need_NULL}
{$include <stddef.h>}

const
  _STDLIB_H = 1;  
{$if (defined __USE_XOPEN || defined __USE_XOPEN2K8) && !defined _SYS_WAIT_H}
{ XPG requires a few symbols from <sys/wait.h> being defined.   }
{$include <bits/waitflags.h>}
{$include <bits/waitstatus.h>}
{ Define the macros <sys/wait.h> also would define this way.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function WEXITSTATUS(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WTERMSIG(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WSTOPSIG(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIFEXITED(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIFSIGNALED(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIFSTOPPED(status : longint) : longint;

{$ifdef __WIFCONTINUED}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function WIFCONTINUED(status : longint) : longint;

{$endif}
{$endif}
{ X/Open or XPG7 and <sys/wait.h> not included.   }
{ _FloatN API tests for enablement.   }
{$include <bits/floatn.h>}
{ Returned by `div'.   }
{ Quotient.   }
{ Remainder.   }
type
  Pdiv_t = ^Tdiv_t;
  Tdiv_t = record
      quot : longint;
      rem : longint;
    end;
{ Returned by `ldiv'.   }
{$ifndef __ldiv_t_defined}
{ Quotient.   }
{ Remainder.   }
type
  Pldiv_t = ^Tldiv_t;
  Tldiv_t = record
      quot : longint;
      rem : longint;
    end;

const
  __ldiv_t_defined = 1;  
{$endif}
{$if defined __USE_ISOC99 && !defined __lldiv_t_defined}
{ Returned by `lldiv'.   }
{ Quotient.   }
{ Remainder.   }
type
  Plldiv_t = ^Tlldiv_t;
  Tlldiv_t = record
      quot : int64;
      rem : int64;
    end;

const
  __lldiv_t_defined = 1;  
{$endif}
{ The largest number rand will return (same as INT_MAX).   }

const
  RAND_MAX = 2147483647;  
{ We define these the same for all machines.
   Changes from this to the outside world should be done in `_exit'.   }
{ Failing exit status.   }
  EXIT_FAILURE = 1;  
{ Successful exit status.   }
  EXIT_SUCCESS = 0;  
{ Maximum length of a multibyte character in the current locale.   }
{ Convert a string to a floating-point number.   }
(* Const before type ignored *)

function atof(__nptr:Pchar):Tdouble;cdecl;external;
{ Convert a string to an integer.   }
(* Const before type ignored *)
function atoi(__nptr:Pchar):longint;cdecl;external;
{ Convert a string to a long integer.   }
(* Const before type ignored *)
function atol(__nptr:Pchar):longint;cdecl;external;
{$ifdef __USE_ISOC99}
{ Convert a string to a long long integer.   }
(* Const before type ignored *)
function atoll(__nptr:Pchar):int64;cdecl;external;
{$endif}
{ Convert a string to a floating-point number.   }
(* Const before type ignored *)

function strtod(__nptr:Pchar; __endptr:PPchar):Tdouble;cdecl;external;
{$ifdef __USE_ISOC99}
{ Likewise for `float' and `long double' sizes of floating-point numbers.   }
(* Const before type ignored *)
function strtof(__nptr:Pchar; __endptr:PPchar):single;cdecl;external;
{ xxxxxxxxx long double }
(* Const before type ignored *)
function strtold(__nptr:Pchar; __endptr:PPchar):Tdouble;cdecl;external;
{$endif}
{ Likewise for '_FloatN' and '_FloatNx'.   }
{$if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strtof16(__nptr:Pchar; __endptr:PPchar):TFloat16;cdecl;external;
{$endif}
{$if __HAVE_FLOAT32 && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strtof32(__nptr:Pchar; __endptr:PPchar):TFloat32;cdecl;external;
{$endif}
{$if __HAVE_FLOAT64 && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strtof64(__nptr:Pchar; __endptr:PPchar):TFloat64;cdecl;external;
{$endif}
{$if __HAVE_FLOAT128 && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strtof128(__nptr:Pchar; __endptr:PPchar):TFloat128;cdecl;external;
{$endif}
{$if __HAVE_FLOAT32X && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strtof32x(__nptr:Pchar; __endptr:PPchar):TFloat32x;cdecl;external;
{$endif}
{$if __HAVE_FLOAT64X && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strtof64x(__nptr:Pchar; __endptr:PPchar):TFloat64x;cdecl;external;
{$endif}
{$if __HAVE_FLOAT128X && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strtof128x(__nptr:Pchar; __endptr:PPchar):TFloat128x;cdecl;external;
{$endif}
{ Convert a string to a long integer.   }
(* Const before type ignored *)

function strtol(__nptr:Pchar; __endptr:PPchar; __base:longint):longint;cdecl;external;
{ Convert a string to an unsigned long integer.   }
(* Const before type ignored *)
function strtoul(__nptr:Pchar; __endptr:PPchar; __base:longint):dword;cdecl;external;
{$ifdef __USE_MISC}
{ Convert a string to a quadword integer.   }
(* Const before type ignored *)
function strtoq(__nptr:Pchar; __endptr:PPchar; __base:longint):int64;cdecl;external;
{ Convert a string to an unsigned quadword integer.   }
(* Const before type ignored *)
function strtouq(__nptr:Pchar; __endptr:PPchar; __base:longint):qword;cdecl;external;
{$endif}
{ Use misc.   }
{$ifdef __USE_ISOC99}
{ Convert a string to a quadword integer.   }
(* Const before type ignored *)

function strtoll(__nptr:Pchar; __endptr:PPchar; __base:longint):int64;cdecl;external;
{ Convert a string to an unsigned quadword integer.   }
(* Const before type ignored *)
function strtoull(__nptr:Pchar; __endptr:PPchar; __base:longint):qword;cdecl;external;
{$endif}
{ ISO C99 or use MISC.   }
{ Versions of the above functions that handle '0b' and '0B' prefixes
   in base 0 or 2.   }
{$if __GLIBC_USE (C2X_STRTOL)}
{$ifdef __REDIRECT}
(* Const before type ignored *)

function strtol(__nptr:Pchar; __endptr:PPchar; __base:longint):longint;cdecl;external;
(* Const before type ignored *)
function strtoul(__nptr:Pchar; __endptr:PPchar; __base:longint):dword;cdecl;external;
{$ifdef __USE_MISC}
(* Const before type ignored *)

function strtoq(__nptr:Pchar; __endptr:PPchar; __base:longint):int64;cdecl;external;
(* Const before type ignored *)
function strtouq(__nptr:Pchar; __endptr:PPchar; __base:longint):qword;cdecl;external;
{$endif}
(* Const before type ignored *)

function strtoll(__nptr:Pchar; __endptr:PPchar; __base:longint):int64;cdecl;external;
(* Const before type ignored *)
function strtoull(__nptr:Pchar; __endptr:PPchar; __base:longint):qword;cdecl;external;
{ Convert a floating-point number to a string.   }
{$if __GLIBC_USE (IEC_60559_BFP_EXT_C2X)}
(* Const before type ignored *)

function strfromd(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function strfromf(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:single):longint;cdecl;external;
{ xxxxxxxx long double }
(* Const before type ignored *)
function strfroml(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:Tdouble):longint;cdecl;external;
{$endif}
{$if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strfromf16(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:TFloat16):longint;cdecl;external;
{$endif}
{$if __HAVE_FLOAT32 && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strfromf32(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:TFloat32):longint;cdecl;external;
{$endif}
{$if __HAVE_FLOAT64 && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strfromf64(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:TFloat64):longint;cdecl;external;
{$endif}
{$if __HAVE_FLOAT128 && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strfromf128(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:TFloat128):longint;cdecl;external;
{$endif}
{$if __HAVE_FLOAT32X && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strfromf32x(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:TFloat32x):longint;cdecl;external;
{$endif}
{$if __HAVE_FLOAT64X && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strfromf64x(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:TFloat64x):longint;cdecl;external;
{$endif}
{$if __HAVE_FLOAT128X && __GLIBC_USE (IEC_60559_TYPES_EXT)}
(* Const before type ignored *)

function strfromf128x(__dest:Pchar; __size:Tsize_t; __format:Pchar; __f:TFloat128x):longint;cdecl;external;
{$endif}
{$ifdef __USE_GNU}
{ Parallel versions of the functions above which take the locale to
   use as an additional parameter.  These are GNU extensions inspired
   by the POSIX.1-2008 extended locale API.   }
{$include <bits/types/locale_t.h>}
(* Const before type ignored *)

function strtol_l(__nptr:Pchar; __endptr:PPchar; __base:longint; __loc:Tlocale_t):longint;cdecl;external;
(* Const before type ignored *)
function strtoul_l(__nptr:Pchar; __endptr:PPchar; __base:longint; __loc:Tlocale_t):dword;cdecl;external;
(* Const before type ignored *)
function strtoll_l(__nptr:Pchar; __endptr:PPchar; __base:longint; __loc:Tlocale_t):int64;cdecl;external;
(* Const before type ignored *)
function strtoull_l(__nptr:Pchar; __endptr:PPchar; __base:longint; __loc:Tlocale_t):qword;cdecl;external;
{ Versions of the above functions that handle '0b' and '0B' prefixes
   in base 0 or 2.   }
{$if __GLIBC_USE (C2X_STRTOL)}
{$ifdef __REDIRECT}
(* Const before type ignored *)

function strtol_l(__nptr:Pchar; __endptr:PPchar; __base:longint; __loc:Tlocale_t):longint;cdecl;external;
(* Const before type ignored *)
function strtoul_l(__nptr:Pchar; __endptr:PPchar; __base:longint; __loc:Tlocale_t):dword;cdecl;external;
(* Const before type ignored *)
function strtoll_l(__nptr:Pchar; __endptr:PPchar; __base:longint; __loc:Tlocale_t):int64;cdecl;external;
(* Const before type ignored *)
function strtoull_l(__nptr:Pchar; __endptr:PPchar; __base:longint; __loc:Tlocale_t):qword;cdecl;external;
(* Const before type ignored *)
function strtod_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):Tdouble;cdecl;external;
(* Const before type ignored *)
function strtof_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):single;cdecl;external;
{ xxxxx long double }
(* Const before type ignored *)
function strtold_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):Tdouble;cdecl;external;
{$if __HAVE_FLOAT16}
(* Const before type ignored *)

function strtof16_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):TFloat16;cdecl;external;
{$endif}
{$if __HAVE_FLOAT32}
(* Const before type ignored *)

function strtof32_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):TFloat32;cdecl;external;
{$endif}
{$if __HAVE_FLOAT64}
(* Const before type ignored *)

function strtof64_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):TFloat64;cdecl;external;
{$endif}
{$if __HAVE_FLOAT128}
(* Const before type ignored *)

function strtof128_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):TFloat128;cdecl;external;
{$endif}
{$if __HAVE_FLOAT32X}
(* Const before type ignored *)

function strtof32x_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):TFloat32x;cdecl;external;
{$endif}
{$if __HAVE_FLOAT64X}
(* Const before type ignored *)

function strtof64x_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):TFloat64x;cdecl;external;
{$endif}
{$if __HAVE_FLOAT128X}
(* Const before type ignored *)

function strtof128x_l(__nptr:Pchar; __endptr:PPchar; __loc:Tlocale_t):TFloat128x;cdecl;external;
{$endif}
{$endif}
{ GNU  }
{$if defined __USE_MISC || defined __USE_XOPEN_EXTENDED}
{ Convert N to base 64 using the digits "./0-9A-Za-z", least-significant
   digit first.  Returns a pointer to static storage overwritten by the
   next call.   }

function l64a(__n:longint):Pchar;cdecl;external;
{ Read a number from a string S in base 64 as above.   }
(* Const before type ignored *)
function a64l(__s:Pchar):longint;cdecl;external;
{$endif}
{ Use misc || extended X/Open.   }
{$if defined __USE_MISC || defined __USE_XOPEN_EXTENDED}
{$include <sys/types.h>	/* we need int32_t... */}
{ These are the functions that actually do things.  The `random', `srandom',
   `initstate' and `setstate' functions are those from BSD Unices.
   The `rand' and `srand' functions are required by the ANSI standard.
   We provide both interfaces to the same random number generator.   }
{ Return a random long integer between 0 and 2^31-1 inclusive.   }

function random:longint;cdecl;external;
{ Seed the random number generator with the given number.   }
procedure srandom(__seed:dword);cdecl;external;
{ Initialize the random number generator to use state buffer STATEBUF,
   of length STATELEN, and seed it with SEED.  Optimal lengths are 8, 16,
   32, 64, 128 and 256, the bigger the better; values less than 8 will
   cause an error and values greater than 256 will be rounded down.   }
function initstate(__seed:dword; __statebuf:Pchar; __statelen:Tsize_t):Pchar;cdecl;external;
{ Switch the random number generator to state buffer STATEBUF,
   which should have been previously initialized by `initstate'.   }
function setstate(__statebuf:Pchar):Pchar;cdecl;external;
{$ifdef __USE_MISC}
{ Reentrant versions of the `random' family of functions.
   These functions all use the following data structure to contain
   state, rather than global state variables.   }
{ Front pointer.   }
{ Rear pointer.   }
{ Array of state values.   }
{ Type of random number generator.   }
{ Degree of random number generator.   }
{ Distance between front and rear.   }
{ Pointer behind state table.   }
type
  Prandom_data = ^Trandom_data;
  Trandom_data = record
      fptr : Pint32_t;
      rptr : Pint32_t;
      state : Pint32_t;
      rand_type : longint;
      rand_deg : longint;
      rand_sep : longint;
      end_ptr : Pint32_t;
    end;


function random_r(__buf:Prandom_data; __result:Pint32_t):longint;cdecl;external;
function srandom_r(__seed:dword; __buf:Prandom_data):longint;cdecl;external;
function initstate_r(__seed:dword; __statebuf:Pchar; __statelen:Tsize_t; __buf:Prandom_data):longint;cdecl;external;
function setstate_r(__statebuf:Pchar; __buf:Prandom_data):longint;cdecl;external;
{$endif}
{ Use misc.   }
{$endif}
{ Use extended X/Open || misc.  }
{ Return a random integer between 0 and RAND_MAX inclusive.   }

function rand:longint;cdecl;external;
{ Seed the random number generator with the given number.   }
procedure srand(__seed:dword);cdecl;external;
{$ifdef __USE_POSIX199506}
{ Reentrant interface according to POSIX.1.   }
function rand_r(__seed:Pdword):longint;cdecl;external;
{$endif}
{$if defined __USE_MISC || defined __USE_XOPEN}
{ System V style 48-bit random number generator functions.   }
{ Return non-negative, double-precision floating-point value in [0.0,1.0).   }

function drand48:Tdouble;cdecl;external;
function erand48(__xsubi:array[0..2] of word):Tdouble;cdecl;external;
{ Return non-negative, long integer in [0,2^31).   }
function lrand48:longint;cdecl;external;
function nrand48(__xsubi:array[0..2] of word):longint;cdecl;external;
{ Return signed, long integers in [-2^31,2^31).   }
function mrand48:longint;cdecl;external;
function jrand48(__xsubi:array[0..2] of word):longint;cdecl;external;
{ Seed random number generator.   }
procedure srand48(__seedval:longint);cdecl;external;
function seed48(__seed16v:array[0..2] of word):Pword;cdecl;external;
procedure lcong48(__param:array[0..6] of word);cdecl;external;
{$ifdef __USE_MISC}
{ Data structure for communication with thread safe versions.  This
   type is to be regarded as opaque.  It's only exported because users
   have to allocate objects of this type.   }
{ Current state.   }
{ Old state.   }
{ Additive const. in congruential formula.   }
{ Flag for initializing.   }
{ Factor in congruential
						   formula.   }
type
  Pdrand48_data = ^Tdrand48_data;
  Tdrand48_data = record
      __x : array[0..2] of word;
      __old_x : array[0..2] of word;
      __c : word;
      __init : word;
      __a : qword;
    end;

{ Return non-negative, double-precision floating-point value in [0.0,1.0).   }

function drand48_r(__buffer:Pdrand48_data; __result:Pdouble):longint;cdecl;external;
function erand48_r(__xsubi:array[0..2] of word; __buffer:Pdrand48_data; __result:Pdouble):longint;cdecl;external;
{ Return non-negative, long integer in [0,2^31).   }
function lrand48_r(__buffer:Pdrand48_data; __result:Plongint):longint;cdecl;external;
function nrand48_r(__xsubi:array[0..2] of word; __buffer:Pdrand48_data; __result:Plongint):longint;cdecl;external;
{ Return signed, long integers in [-2^31,2^31).   }
function mrand48_r(__buffer:Pdrand48_data; __result:Plongint):longint;cdecl;external;
function jrand48_r(__xsubi:array[0..2] of word; __buffer:Pdrand48_data; __result:Plongint):longint;cdecl;external;
{ Seed random number generator.   }
function srand48_r(__seedval:longint; __buffer:Pdrand48_data):longint;cdecl;external;
function seed48_r(__seed16v:array[0..2] of word; __buffer:Pdrand48_data):longint;cdecl;external;
function lcong48_r(__param:array[0..6] of word; __buffer:Pdrand48_data):longint;cdecl;external;
{ Return a random integer between zero and 2**32-1 (inclusive).   }
function arc4random:Tuint32_t;cdecl;external;
{ Fill the buffer with random data.   }
procedure arc4random_buf(__buf:pointer; __size:Tsize_t);cdecl;external;
{ Return a random number between zero (inclusive) and the specified
   limit (exclusive).   }
function arc4random_uniform(__upper_bound:Tuint32_t):Tuint32_t;cdecl;external;
{$endif}
{ Use misc.   }
{$endif}
{ Use misc or X/Open.   }
{ Allocate SIZE bytes of memory.   }

function malloc(__size:Tsize_t):pointer;cdecl;external;
{ Allocate NMEMB elements of SIZE bytes each, all initialized to 0.   }
function calloc(__nmemb:Tsize_t; __size:Tsize_t):pointer;cdecl;external;
{ Re-allocate the previously allocated block
   in PTR, making the new block SIZE bytes long.   }
{ __attribute_malloc__ is not used, because if realloc returns
   the same pointer that was passed to it, aliasing needs to be allowed
   between objects pointed by the old and new pointers.   }
function realloc(__ptr:pointer; __size:Tsize_t):pointer;cdecl;external;
{ Free a block allocated by `malloc', `realloc' or `calloc'.   }
procedure free(__ptr:pointer);cdecl;external;
{$ifdef __USE_MISC}
{ Re-allocate the previously allocated block in PTR, making the new
   block large enough for NMEMB elements of SIZE bytes each.   }
{ __attribute_malloc__ is not used, because if reallocarray returns
   the same pointer that was passed to it, aliasing needs to be allowed
   between objects pointed by the old and new pointers.   }
function reallocarray(__ptr:pointer; __nmemb:Tsize_t; __size:Tsize_t):pointer;cdecl;external;
{ Add reallocarray as its own deallocator.   }
function reallocarray(__ptr:pointer; __nmemb:Tsize_t; __size:Tsize_t):pointer;cdecl;external;
{$endif}
{$ifdef __USE_MISC}
{$include <alloca.h>}
{$endif}
{ Use misc.   }
{ Allocate SIZE bytes on a page boundary.  The storage cannot be freed.   }

function valloc(__size:Tsize_t):pointer;cdecl;external;
{$endif}
{$ifdef __USE_XOPEN2K}
{ Allocate memory of SIZE bytes with an alignment of ALIGNMENT.   }

function posix_memalign(__memptr:Ppointer; __alignment:Tsize_t; __size:Tsize_t):longint;cdecl;external;
{$endif}
{$ifdef __USE_ISOC11}
{ ISO C variant of aligned allocation.   }

function aligned_alloc(__alignment:Tsize_t; __size:Tsize_t):pointer;cdecl;external;
{$endif}
{ Abort execution and generate a core-dump.   }

procedure abort;cdecl;external;
{ Register a function to be called when `exit' is called.   }
function atexit(__func:procedure ):longint;cdecl;external;
{$if defined __USE_ISOC11 || defined __USE_ISOCXX11}
{ Register a function to be called when `quick_exit' is called.   }

function at_quick_exit(__func:procedure ):longint;cdecl;external;
{$endif}
{$ifdef __USE_MISC}
{ Register a function to be called with the status
   given to `exit' and the given argument.   }

function on_exit(__func:procedure (__status:longint; __arg:pointer); __arg:pointer):longint;cdecl;external;
{$endif}
{ Call all functions registered with `atexit' and `on_exit',
   in the reverse of the order in which they were registered,
   perform stdio cleanup, and terminate program execution with STATUS.   }

procedure exit(__status:longint);cdecl;external;
{$if defined __USE_ISOC11 || defined __USE_ISOCXX11}
{ Call all functions registered with `at_quick_exit' in the reverse
   of the order in which they were registered and terminate program
   execution with STATUS.   }

procedure quick_exit(__status:longint);cdecl;external;
{$endif}
{$ifdef __USE_ISOC99}
{ Terminate the program with STATUS without calling any of the
   functions registered with `atexit' or `on_exit'.   }

procedure _Exit(__status:longint);cdecl;external;
{$endif}
{ Return the value of envariable NAME, or NULL if it doesn't exist.   }
(* Const before type ignored *)

function getenv(__name:Pchar):Pchar;cdecl;external;
{$ifdef __USE_GNU}
{ This function is similar to the above but returns NULL if the
   programs is running with SUID or SGID enabled.   }
(* Const before type ignored *)
function secure_getenv(__name:Pchar):Pchar;cdecl;external;
{$endif}
{$if defined __USE_MISC || defined __USE_XOPEN}
{ The SVID says this is in <stdio.h>, but this seems a better place.	 }
{ Put STRING, which is of the form "NAME=VALUE", in the environment.
   If there is no `=', remove NAME from the environment.   }

function putenv(__string:Pchar):longint;cdecl;external;
{$endif}
{$ifdef __USE_XOPEN2K}
{ Set NAME to VALUE in the environment.
   If REPLACE is nonzero, overwrite an existing value.   }
(* Const before type ignored *)
(* Const before type ignored *)

function setenv(__name:Pchar; __value:Pchar; __replace:longint):longint;cdecl;external;
{ Remove the variable NAME from the environment.   }
(* Const before type ignored *)
function unsetenv(__name:Pchar):longint;cdecl;external;
{$endif}
{$ifdef __USE_MISC}
{ The `clearenv' was planned to be added to POSIX.1 but probably
   never made it.  Nevertheless the POSIX.9 standard (POSIX bindings
   for Fortran 77) requires this function.   }

function clearenv:longint;cdecl;external;
{$endif}
{ Generate a unique temporary file name from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the file name unique.
   Always returns TEMPLATE, it's either a temporary file name or a null
   string if it cannot get a unique file name.   }

function mktemp(__template:Pchar):Pchar;cdecl;external;
{$endif}
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8}
{ Generate a unique temporary file name from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the filename unique.
   Returns a file descriptor open on the file for reading and writing,
   or -1 if it cannot create a uniquely-named file.

   This function is a possible cancellation point and therefore not
   marked with .   }
{$ifndef __USE_FILE_OFFSET64}

function mkstemp(__template:Pchar):longint;cdecl;external;
{$else}
{$ifdef __REDIRECT}

function mkstemp64(__template:Pchar):longint;cdecl;external;
{$endif}
{$endif}
{$ifdef __USE_MISC}
{ Similar to mkstemp, but the template can have a suffix after the
   XXXXXX.  The length of the suffix is specified in the second
   parameter.

   This function is a possible cancellation point and therefore not
   marked with .   }
{$ifndef __USE_FILE_OFFSET64}

function mkstemps(__template:Pchar; __suffixlen:longint):longint;cdecl;external;
{$else}

function mkstemps64(__template:Pchar; __suffixlen:longint):longint;cdecl;external;
{$endif}
{$endif}
{$ifdef __USE_XOPEN2K8}
{ Create a unique temporary directory from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the directory name unique.
   Returns TEMPLATE, or a null pointer if it cannot get a unique name.
   The directory is created mode 700.   }

function mkdtemp(__template:Pchar):Pchar;cdecl;external;
{$endif}
{$ifdef __USE_GNU}
{ Generate a unique temporary file name from TEMPLATE similar to
   mkstemp.  But allow the caller to pass additional flags which are
   used in the open call to create the file..

   This function is a possible cancellation point and therefore not
   marked with .   }
{$ifndef __USE_FILE_OFFSET64}

function mkostemp(__template:Pchar; __flags:longint):longint;cdecl;external;
{$else}

function mkostemp64(__template:Pchar; __flags:longint):longint;cdecl;external;
{$endif}
{ Similar to mkostemp, but the template can have a suffix after the
   XXXXXX.  The length of the suffix is specified in the second
   parameter.

   This function is a possible cancellation point and therefore not
   marked with .   }
{$ifndef __USE_FILE_OFFSET64}

function mkostemps(__template:Pchar; __suffixlen:longint; __flags:longint):longint;cdecl;external;
{$else}
{$ifdef __REDIRECT}

function mkostemps64(__template:Pchar; __suffixlen:longint; __flags:longint):longint;cdecl;external;
{$endif}
{$endif}
{ Execute the given line as a shell command.

   This function is a cancellation point and therefore not marked with
   .   }
(* Const before type ignored *)

function system(__command:Pchar):longint;cdecl;external;
{$ifdef __USE_GNU}
{ Return a malloc'd string containing the canonical absolute name of the
   existing named file.   }
(* Const before type ignored *)
function canonicalize_file_name(__name:Pchar):Pchar;cdecl;external;
{$endif}
{$if defined __USE_MISC || defined __USE_XOPEN_EXTENDED}
{ Return the canonical absolute name of file NAME.  If RESOLVED is
   null, the result is malloc'd; otherwise, if the canonical name is
   PATH_MAX chars or more, returns null with `errno' set to
   ENAMETOOLONG; if the name fits in fewer than PATH_MAX chars,
   returns the name in RESOLVED.   }
(* Const before type ignored *)

function realpath(__name:Pchar; __resolved:Pchar):Pchar;cdecl;external;
{$endif}
{ Shorthand for type of comparison functions.   }
{$ifndef __COMPAR_FN_T}
{$define __COMPAR_FN_T}
(* Const before type ignored *)
(* Const before type ignored *)
type

  T_compar_fn_t = function (para1:pointer; para2:pointer):longint;cdecl;
{$ifdef	__USE_GNU}
type
  Pcomparison_fn_t = ^Tcomparison_fn_t;
  Tcomparison_fn_t = Tcompar_fn_t;
{$endif}
{$endif}
{$ifdef __USE_GNU}
(* Const before type ignored *)
(* Const before type ignored *)
type

  T_compar_d_fn_t = function (para1:pointer; para2:pointer; para3:pointer):longint;cdecl;
{$endif}
{ Do a binary search for KEY in BASE, which consists of NMEMB elements
   of SIZE bytes each, using COMPAR to perform the comparisons.   }
(* Const before type ignored *)
(* Const before type ignored *)

function bsearch(__key:pointer; __base:pointer; __nmemb:Tsize_t; __size:Tsize_t; __compar:Tcompar_fn_t):pointer;cdecl;external;
{$ifdef __USE_EXTERN_INLINES}
{$include <bits/stdlib-bsearch.h>}
{$endif}
{ Sort NMEMB elements of BASE, of SIZE bytes each,
   using COMPAR to perform the comparisons.   }

procedure qsort(__base:pointer; __nmemb:Tsize_t; __size:Tsize_t; __compar:Tcompar_fn_t);cdecl;external;
{$ifdef __USE_GNU}
procedure qsort_r(__base:pointer; __nmemb:Tsize_t; __size:Tsize_t; __compar:Tcompar_d_fn_t; __arg:pointer);cdecl;external;
{$endif}
{ Return the absolute value of X.   }

function abs(__x:longint):longint;cdecl;external;
function labs(__x:longint):longint;cdecl;external;
{$ifdef __USE_ISOC99}
function llabs(__x:int64):int64;cdecl;external;
{$endif}
{ Return the `div_t', `ldiv_t' or `lldiv_t' representation
   of the value of NUMER over DENOM.  }
{ GCC may have built-ins for these someday.   }

function div(__numer:longint; __denom:longint):Tdiv_t;cdecl;external;
function ldiv(__numer:longint; __denom:longint):Tldiv_t;cdecl;external;
{$ifdef __USE_ISOC99}
function lldiv(__numer:int64; __denom:int64):Tlldiv_t;cdecl;external;
{$endif}
{ Convert floating point numbers to strings.  The returned values are
   valid only until another call to the same function.   }
{ Convert VALUE to a string with NDIGIT digits and return a pointer to
   this.  Set *DECPT with the position of the decimal character and *SIGN
   with the sign of the number.   }

function ecvt(__value:Tdouble; __ndigit:longint; __decpt:Plongint; __sign:Plongint):Pchar;cdecl;external;
{ Convert VALUE to a string rounded to NDIGIT decimal digits.  Set *DECPT
   with the position of the decimal character and *SIGN with the sign of
   the number.   }
function fcvt(__value:Tdouble; __ndigit:longint; __decpt:Plongint; __sign:Plongint):Pchar;cdecl;external;
{ If possible convert VALUE to a string with NDIGIT significant digits.
   Otherwise use exponential representation.  The resulting string will
   be written to BUF.   }
function gcvt(__value:Tdouble; __ndigit:longint; __buf:Pchar):Pchar;cdecl;external;
{$endif}
{$ifdef __USE_MISC}
{ Long double versions of above functions.   }
{ xx long double }

function qecvt(__value:Tdouble; __ndigit:longint; __decpt:Plongint; __sign:Plongint):Pchar;cdecl;external;
{ xx long double }
function qfcvt(__value:Tdouble; __ndigit:longint; __decpt:Plongint; __sign:Plongint):Pchar;cdecl;external;
{ xx long double }
function qgcvt(__value:Tdouble; __ndigit:longint; __buf:Pchar):Pchar;cdecl;external;
{ Reentrant version of the functions above which provide their own
   buffers.   }
function ecvt_r(__value:Tdouble; __ndigit:longint; __decpt:Plongint; __sign:Plongint; __buf:Pchar; 
           __len:Tsize_t):longint;cdecl;external;
function fcvt_r(__value:Tdouble; __ndigit:longint; __decpt:Plongint; __sign:Plongint; __buf:Pchar; 
           __len:Tsize_t):longint;cdecl;external;
{ xxxxx long double }
function qecvt_r(__value:Tdouble; __ndigit:longint; __decpt:Plongint; __sign:Plongint; __buf:Pchar; 
           __len:Tsize_t):longint;cdecl;external;
{ xxxxx long double }
function qfcvt_r(__value:Tdouble; __ndigit:longint; __decpt:Plongint; __sign:Plongint; __buf:Pchar; 
           __len:Tsize_t):longint;cdecl;external;
{$endif}
{ misc  }
{ Return the length of the multibyte character
   in S, which is no longer than N.   }
(* Const before type ignored *)

function mblen(__s:Pchar; __n:Tsize_t):longint;cdecl;external;
{ Return the length of the given multibyte character,
   putting its `wchar_t' representation in *PWC.   }
(* Const before type ignored *)
function mbtowc(__pwc:Pwchar_t; __s:Pchar; __n:Tsize_t):longint;cdecl;external;
{ Put the multibyte character represented
   by WCHAR in S, returning its length.   }
function wctomb(__s:Pchar; __wchar:Twchar_t):longint;cdecl;external;
{ Convert a multibyte string to a wide char string.   }
(* Const before type ignored *)
function mbstowcs(__pwcs:Pwchar_t; __s:Pchar; __n:Tsize_t):Tsize_t;cdecl;external;
{ Convert a wide char string to multibyte string.   }
(* Const before type ignored *)
function wcstombs(__s:Pchar; __pwcs:Pwchar_t; __n:Tsize_t):Tsize_t;cdecl;external;
{$ifdef __USE_MISC}
{ Determine whether the string value of RESPONSE matches the affirmation
   or negative response expression as specified by the LC_MESSAGES category
   in the program's current locale.  Returns 1 if affirmative, 0 if
   negative, and -1 if not matching.   }
(* Const before type ignored *)
function rpmatch(__response:Pchar):longint;cdecl;external;
{$endif}
{$if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8}
{ Parse comma separated suboption from *OPTIONP and match against
   strings in TOKENS.  If found return index and set *VALUEP to
   optional value introduced by an equal sign.  If the suboption is
   not part of TOKENS return in *VALUEP beginning of unknown
   suboption.  On exit *OPTIONP is set to the beginning of the next
   token or at the terminating NUL character.   }
(* Const before declarator ignored *)

function getsubopt(__optionp:PPchar; __tokens:PPchar; __valuep:PPchar):longint;cdecl;external;
{$endif}
{ X/Open pseudo terminal handling.   }
{$ifdef __USE_XOPEN2KXSI}
{ Return a master pseudo-terminal handle.   }

function posix_openpt(__oflag:longint):longint;cdecl;external;
{$endif}
{$ifdef __USE_XOPEN_EXTENDED}
{ The next four functions all take a master pseudo-tty fd and
   perform an operation on the associated slave:   }
{ Chown the slave to the calling user.   }

function grantpt(__fd:longint):longint;cdecl;external;
{ Release an internal lock so the slave can be opened.
   Call after grantpt().   }
function unlockpt(__fd:longint):longint;cdecl;external;
{ Return the pathname of the pseudo terminal slave associated with
   the master FD is open on, or NULL on errors.
   The returned storage is good until the next call to this function.   }
function ptsname(__fd:longint):Pchar;cdecl;external;
{$endif}
{$ifdef __USE_GNU}
{ Store at most BUFLEN characters of the pathname of the slave pseudo
   terminal associated with the master FD is open on in BUF.
   Return 0 on success, otherwise an error number.   }

function ptsname_r(__fd:longint; __buf:Pchar; __buflen:Tsize_t):longint;cdecl;external;
{ Open a master pseudo terminal and return its file descriptor.   }
function getpt:longint;cdecl;external;
{$endif}
{$ifdef __USE_MISC}
{ Put the 1 minute, 5 minute and 15 minute load averages into the first
   NELEM elements of LOADAVG.  Return the number written (never more than
   three, but may be less than NELEM), or -1 if an error occurred.   }

function getloadavg(__loadavg:Pdouble; __nelem:longint):longint;cdecl;external;
{$endif}
{$if defined __USE_XOPEN_EXTENDED && !defined __USE_XOPEN2K}
{ Return the index into the active-logins file (utmp) for
   the controlling terminal.   }

function ttyslot:longint;cdecl;external;
{$endif}
{$include <bits/stdlib-float.h>}
{ Define some macros helping to catch buffer overflows.   }
{$if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function}
{$include <bits/stdlib.h>}
{$endif}
{$include <bits/floatn.h>}
{$if defined __LDBL_COMPAT || __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI == 1}
{$include <bits/stdlib-ldbl.h>}
{$endif}
{$endif}
{ stdlib.h   }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WEXITSTATUS(status : longint) : longint;
begin
  WEXITSTATUS:=__WEXITSTATUS(status);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WTERMSIG(status : longint) : longint;
begin
  WTERMSIG:=__WTERMSIG(status);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WSTOPSIG(status : longint) : longint;
begin
  WSTOPSIG:=__WSTOPSIG(status);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIFEXITED(status : longint) : longint;
begin
  WIFEXITED:=__WIFEXITED(status);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIFSIGNALED(status : longint) : longint;
begin
  WIFSIGNALED:=__WIFSIGNALED(status);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIFSTOPPED(status : longint) : longint;
begin
  WIFSTOPPED:=__WIFSTOPPED(status);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function WIFCONTINUED(status : longint) : longint;
begin
  WIFCONTINUED:=__WIFCONTINUED(status);
end;


end.
