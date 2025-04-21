
unit gmp;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmp.h
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
P_gmp_randstate_struct  = ^_gmp_randstate_struct;
P_mpf_struct  = ^_mpf_struct;
P_mpq_struct  = ^_mpq_struct;
P_mpz_struct  = ^_mpz_struct;
Pbyte  = ^byte;
Pchar  = ^char;
PFILE  = ^FILE;
Pgmp_randalg_t  = ^gmp_randalg_t;
Pgmp_randstate_ptr  = ^gmp_randstate_ptr;
Pgmp_randstate_srcptr  = ^gmp_randstate_srcptr;
Pgmp_randstate_struct  = ^gmp_randstate_struct;
Pgmp_randstate_t  = ^gmp_randstate_t;
Plongint  = ^longint;
Pmp_bitcnt_t  = ^mp_bitcnt_t;
Pmp_exp_t  = ^mp_exp_t;
PMP_INT  = ^MP_INT;
Pmp_limb_signed_t  = ^mp_limb_signed_t;
Pmp_limb_t  = ^mp_limb_t;
Pmp_ptr  = ^mp_ptr;
PMP_RAT  = ^MP_RAT;
Pmp_size_t  = ^mp_size_t;
Pmp_srcptr  = ^mp_srcptr;
Pmpf_ptr  = ^mpf_ptr;
Pmpf_srcptr  = ^mpf_srcptr;
Pmpf_struct  = ^mpf_struct;
Pmpf_t  = ^mpf_t;
Pmpq_ptr  = ^mpq_ptr;
Pmpq_srcptr  = ^mpq_srcptr;
Pmpq_struct  = ^mpq_struct;
Pmpq_t  = ^mpq_t;
Pmpz_ptr  = ^mpz_ptr;
Pmpz_srcptr  = ^mpz_srcptr;
Pmpz_struct  = ^mpz_struct;
Pmpz_t  = ^mpz_t;
Pobstack  = ^obstack;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Definitions for GNU multiple precision functions.   -*- mode: c -*-

Copyright 1991, 1993-1997, 1999-2016, 2020, 2021 Free Software
Foundation, Inc.

This file is part of the GNU MP Library.

The GNU MP Library is free software; you can redistribute it and/or modify
it under the terms of either:

  * the GNU Lesser General Public License as published by the Free
    Software Foundation; either version 3 of the License, or (at your
    option) any later version.

or

  * the GNU General Public License as published by the Free Software
    Foundation; either version 2 of the License, or (at your option) any
    later version.

or both in parallel, as here.

The GNU MP Library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received copies of the GNU General Public License and the
GNU Lesser General Public License along with the GNU MP Library.  If not,
see https://www.gnu.org/licenses/.   }
{$ifndef __GMP_H__}
{$if defined (__cplusplus)}
{$include <iosfwd>   /* for std::istream, std::ostream, std::string */}
{$include <cstdio>}
{$endif}
{ Instantiated by configure.  }
{$if ! defined (__GMP_WITHIN_CONFIGURE)}

const
  __GMP_HAVE_HOST_CPU_FAMILY_power = 0;  
  __GMP_HAVE_HOST_CPU_FAMILY_powerpc = 0;  
  GMP_LIMB_BITS = 64;  
  GMP_NAIL_BITS = 0;  
{$endif}

const
  GMP_NUMB_BITS = GMP_LIMB_BITS-GMP_NAIL_BITS;  

{ was #define dname def_expr }
function GMP_NUMB_MASK : longint; { return type might be wrong }

const
  GMP_NUMB_MAX = GMP_NUMB_MASK;  
  GMP_NAIL_MASK =  not (GMP_NUMB_MASK);  
{$ifndef __GNU_MP__}

const
  __GNU_MP__ = 6;  
{$include <stddef.h>    /* for size_t */}
{$include <limits.h>}
{ Instantiated by configure.  }
{$if ! defined (__GMP_WITHIN_CONFIGURE)}
{ #undef _LONG_LONG_LIMB  }

const
  __GMP_LIBGMP_DLL = 0;  
{$endif}
{ extern supports Windows DLL versions of libgmp, and is empty in
   all other circumstances.

   When compiling objects for libgmp, extern is an export directive,
   or when compiling for an application it's an import directive.  The two
   cases are differentiated by __GMP_WITHIN_GMP defined by the GMP Makefiles
   (and not defined from an application).

   extern_XX is similarly used for libgmpxx.  __GMP_WITHIN_GMPXX
   indicates when building libgmpxx, and in that case libgmpxx functions are
   exports, but libgmp functions which might get called are imports.

   Libtool DLL_EXPORT define is not used.

   There's no attempt to support GMP built both static and DLL.  Doing so
   would mean applications would have to tell us which of the two is going
   to be used when linking, and that seems very tedious and error prone if
   using GMP by hand, and equally tedious from a package since autoconf and
   automake don't give much help.

   extern is required on all documented global functions and
   variables, the various internals in gmp-impl.h etc can be left unadorned.
   But internals used by the test programs or speed measuring programs
   should have extern, and certainly constants or variables must
   have it or the wrong address will be resolved.

   In gcc __declspec can go at either the start or end of a prototype.

   In Microsoft C __declspec must go at the start, or after the type like
   void __declspec(...) *foo()".  There's no __dllexport or anything to
   guard against someone foolish #defining dllexport.  _export used to be
   available, but no longer.

   In Borland C _export still exists, but needs to go after the type, like
   "void _export foo();".  Would have to change the extern syntax to
   make use of that.  Probably more trouble than it's worth.   }
{$ifdef __GMP_SHORT_LIMB}
type
  Pmp_limb_t = ^Tmp_limb_t;
  Tmp_limb_t = dword;

  Pmp_limb_signed_t = ^Tmp_limb_signed_t;
  Tmp_limb_signed_t = longint;
{$else}
{$ifdef _LONG_LONG_LIMB}
type
  Pmp_limb_t = ^Tmp_limb_t;
  Tmp_limb_t = qword;

  Pmp_limb_signed_t = ^Tmp_limb_signed_t;
  Tmp_limb_signed_t = int64;
{$else}
type
  Pmp_limb_t = ^Tmp_limb_t;
  Tmp_limb_t = dword;

  Pmp_limb_signed_t = ^Tmp_limb_signed_t;
  Tmp_limb_signed_t = longint;
{$endif}
{$endif}
type
  Pmp_bitcnt_t = ^Tmp_bitcnt_t;
  Tmp_bitcnt_t = dword;
{ For reference, note that the name __mpz_struct gets into C++ mangled
   function names, which means although the "__" suggests an internal, we
   must leave this name for binary compatibility.   }
{ Number of *limbs* allocated and pointed
				   to by the _mp_d field.   }
{ abs(_mp_size) is the number of limbs the
				   last field points to.  If _mp_size is
				   negative this is a negative number.   }
{ Pointer to the limbs.   }

  P_mpz_struct = ^T_mpz_struct;
  T_mpz_struct = record
      _mp_alloc : longint;
      _mp_size : longint;
      _mp_d : Pmp_limb_t;
    end;
{$endif}
{ __GNU_MP__  }
type
  PMP_INT = ^TMP_INT;
  TMP_INT = Tmpz_struct;
{ gmp 1 source compatibility  }

  Pmpz_t = ^Tmpz_t;
  Tmpz_t = array[0..0] of Tmpz_struct;

  Pmp_ptr = ^Tmp_ptr;
  Tmp_ptr = Pmp_limb_t;
(* Const before type ignored *)

  Pmp_srcptr = ^Tmp_srcptr;
  Tmp_srcptr = Pmp_limb_t;
{$if defined (_CRAY) && ! defined (_CRAYMPP)}
{ plain `int' is much faster (48 bits)  }

const
  __GMP_MP_SIZE_T_INT = 1;  
type
  Pmp_size_t = ^Tmp_size_t;
  Tmp_size_t = longint;

  Pmp_exp_t = ^Tmp_exp_t;
  Tmp_exp_t = longint;
{$else}

const
  __GMP_MP_SIZE_T_INT = 0;  
type
  Pmp_size_t = ^Tmp_size_t;
  Tmp_size_t = longint;

  Pmp_exp_t = ^Tmp_exp_t;
  Tmp_exp_t = longint;
{$endif}
type
  P_mpq_struct = ^T_mpq_struct;
  T_mpq_struct = record
      _mp_num : Tmpz_struct;
      _mp_den : Tmpz_struct;
    end;

  PMP_RAT = ^TMP_RAT;
  TMP_RAT = Tmpq_struct;
{ gmp 1 source compatibility  }

  Pmpq_t = ^Tmpq_t;
  Tmpq_t = array[0..0] of Tmpq_struct;
{ Max precision, in number of `mp_limb_t's.
				   Set by mpf_init and modified by
				   mpf_set_prec.  The area pointed to by the
				   _mp_d field contains `prec' + 1 limbs.   }
{ abs(_mp_size) is the number of limbs the
				   last field points to.  If _mp_size is
				   negative this is a negative number.   }
{ Exponent, in the base of `mp_limb_t'.   }
{ Pointer to the limbs.   }

  P_mpf_struct = ^T_mpf_struct;
  T_mpf_struct = record
      _mp_prec : longint;
      _mp_size : longint;
      _mp_exp : Tmp_exp_t;
      _mp_d : Pmp_limb_t;
    end;
{ typedef __mpf_struct MP_FLOAT;  }

  Pmpf_t = ^Tmpf_t;
  Tmpf_t = array[0..0] of Tmpf_struct;
{ Available random number generation algorithms.   }
{ Linear congruential.   }

  Pgmp_randalg_t = ^Tgmp_randalg_t;
  Tgmp_randalg_t =  Longint;
  Const
    GMP_RAND_ALG_DEFAULT = 0;
    GMP_RAND_ALG_LC = GMP_RAND_ALG_DEFAULT;
;
{ Random state struct.   }
{ _mp_d member points to state of the generator.  }
{ Currently unused.  }
{ Pointer to function pointers structure.   }
type
  P_gmp_randstate_struct = ^T_gmp_randstate_struct;
  T_gmp_randstate_struct = record
      _mp_seed : Tmpz_t;
      _mp_alg : Tgmp_randalg_t;
      _mp_algdata : record
          case longint of
            0 : ( _mp_lc : pointer );
          end;
    end;

  Pgmp_randstate_t = ^Tgmp_randstate_t;
  Tgmp_randstate_t = array[0..0] of Tgmp_randstate_struct;
{ Types for function declarations in gmp files.   }
{ ??? Should not pollute user name space with these ???  }
(* Const before type ignored *)

  Pmpz_srcptr = ^Tmpz_srcptr;
  Tmpz_srcptr = Pmpz_struct;

  Pmpz_ptr = ^Tmpz_ptr;
  Tmpz_ptr = Pmpz_struct;
(* Const before type ignored *)

  Pmpf_srcptr = ^Tmpf_srcptr;
  Tmpf_srcptr = Pmpf_struct;

  Pmpf_ptr = ^Tmpf_ptr;
  Tmpf_ptr = Pmpf_struct;
(* Const before type ignored *)

  Pmpq_srcptr = ^Tmpq_srcptr;
  Tmpq_srcptr = Pmpq_struct;

  Pmpq_ptr = ^Tmpq_ptr;
  Tmpq_ptr = Pmpq_struct;

  Pgmp_randstate_ptr = ^Tgmp_randstate_ptr;
  Tgmp_randstate_ptr = Pgmp_randstate_struct;
(* Const before type ignored *)

  Pgmp_randstate_srcptr = ^Tgmp_randstate_srcptr;
  Tgmp_randstate_srcptr = Pgmp_randstate_struct;
{ In ISO C, if a prototype involving "struct obstack *" is given without
   that structure defined, then the struct is scoped down to just the
   prototype, causing a conflict if it's subsequently defined for real.  So
   only give prototypes if we've got obstack.h.   }
{$if defined (_OBSTACK_H)   /* glibc <obstack.h> */}

const
  _GMP_H_HAVE_OBSTACK = 1;  
{$endif}
{ The prototypes for gmp_vprintf etc are provided only if va_list is defined,
   via an application having included <stdarg.h>.  Usually va_list is a typedef
   so can't be tested directly, but C99 specifies that va_start is a macro.

   <stdio.h> will define some sort of va_list for vprintf and vfprintf, but
   let's not bother trying to use that since it's not standard and since
   application uses for gmp_vprintf etc will almost certainly require the
   whole <stdarg.h> anyway.   }
{ An empty "throw ()" means the function doesn't throw any C++ exceptions,
   this can save some stack frame info in applications.

   Currently it's given only on functions which never divide-by-zero etc,
   don't allocate memory, and are expected to never need to allocate memory.
   This leaves open the possibility of a C++ throw from a future GMP
   exceptions scheme.

   mpz_set_ui etc are omitted to leave open the lazy allocation scheme
   described in doc/tasks.html.  mpz_get_d etc are omitted to leave open
   exceptions for float overflows.

   Note that  must be given on any inlines the same as on their
   prototypes (for g++ at least, where they're used together).  Note also
   that g++ 3.0 demands that  is before other attributes like
   .   }
{ PORTME: What other compilers have a useful "extern inline"?  "static
   inline" would be an acceptable substitute if the compiler (or linker)
   discards unused statics.   }
{ gcc has __inline__ in all modes, including strict ansi.  Give a prototype
    for an inline too, so as to correctly specify "dllimport" on windows, in
    case the function is called rather than inlined.
    GCC 4.3 and above with -std=c99 or -std=gnu99 implements ISO C99
    inline semantics, unless -fgnu89-inline is used.   }
{ DEC C (eg. version 5.9) supports "static __inline foo()", even in -std1
   strict ANSI mode.  Inlining is done even when not optimizing (ie. -O0
   mode, which is the default), but an unnecessary local copy of foo is
   emitted unless -O is used.  "extern __inline" is accepted, but the
   "extern" appears to be ignored, ie. it becomes a plain global function
   but which is inlined within its file.  Don't know if all old versions of
   DEC C supported __inline, but as a start let's do the right thing for
   current versions.   }
{ SCO OpenUNIX 8 cc supports "static inline foo()" but not in -Xc strict
   ANSI mode (__STDC__ is 1 in that mode).  Inlining only actually takes
   place under -O.  Without -O "foo" seems to be emitted whether it's used
   or not, which is wasteful.  "extern inline foo()" isn't useful, the
   "extern" is apparently ignored, so foo is inlined if possible but also
   emitted as a global, which causes multiple definition errors when
   building a shared libgmp.   }
{ C++ always has "inline" and since it's a normal feature the linker should
   discard duplicate non-inlined copies, or if it doesn't then that's a
   problem for everyone, not just GMP.   }
{ Don't do any inlining within a configure run, since if the compiler ends
   up emitting copies of the code into the object file it can end up
   demanding the various support routines (like mpn_popcount) for linking,
   making the "alloca" test and perhaps others fail.  And on hppa ia64 a
   pre-release gcc 3.2 was seen not respecting the "extern" in "extern
   __inline__", triggering this problem too.   }
{ By default, don't give a prototype when there's going to be an inline
   version.  Note in particular that Cray C++ objects to the combination of
   prototype and inline.   }
{ Allow direct user access to numerator and denominator of an mpq_t object.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function mpq_numref(Q : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_denref(Q : longint) : longint;

procedure mp_set_memory_functions(para1:Pprocedure (para1:Tsize_t); para2:Pprocedure (para1:pointer; para2:Tsize_t; para3:Tsize_t); para3:procedure (para1:pointer; para2:Tsize_t));cdecl;external;
procedure mp_get_memory_functions(para1:PPprocedure (para1:Tsize_t); para2:PPprocedure (para1:pointer; para2:Tsize_t; para3:Tsize_t); para3:Pprocedure (para1:pointer; para2:Tsize_t));cdecl;external;
(* Const before type ignored *)
  var
    mp_bits_per_limb : longint;cvar;external;
    gmp_errno : longint;cvar;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
    gmp_version : Pchar;cvar;external;
{*************** Random number routines.  *************** }
{ obsolete  }

procedure gmp_randinit(para1:Tgmp_randstate_ptr; para2:Tgmp_randalg_t; args:array of const);cdecl;external;
procedure gmp_randinit(para1:Tgmp_randstate_ptr; para2:Tgmp_randalg_t);cdecl;external;
procedure gmp_randinit_default(para1:Tgmp_randstate_ptr);cdecl;external;
procedure gmp_randinit_lc_2exp(para1:Tgmp_randstate_ptr; para2:Tmpz_srcptr; para3:dword; para4:Tmp_bitcnt_t);cdecl;external;
function gmp_randinit_lc_2exp_size(para1:Tgmp_randstate_ptr; para2:Tmp_bitcnt_t):longint;cdecl;external;
procedure gmp_randinit_mt(para1:Tgmp_randstate_ptr);cdecl;external;
procedure gmp_randinit_set(para1:Tgmp_randstate_ptr; para2:Tgmp_randstate_srcptr);cdecl;external;
procedure gmp_randseed(para1:Tgmp_randstate_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure gmp_randseed_ui(para1:Tgmp_randstate_ptr; para2:dword);cdecl;external;
procedure gmp_randclear(para1:Tgmp_randstate_ptr);cdecl;external;
function gmp_urandomb_ui(para1:Tgmp_randstate_ptr; para2:dword):dword;cdecl;external;
function gmp_urandomm_ui(para1:Tgmp_randstate_ptr; para2:dword):dword;cdecl;external;
{*************** Formatted output routines.  *************** }
(* Const before type ignored *)
function gmp_asprintf(para1:PPchar; para2:Pchar; args:array of const):longint;cdecl;external;
function gmp_asprintf(para1:PPchar; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gmp_fprintf(para1:PFILE; para2:Pchar; args:array of const):longint;cdecl;external;
function gmp_fprintf(para1:PFILE; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gmp_obstack_printf(para1:Pobstack; para2:Pchar; args:array of const):longint;cdecl;external;
function gmp_obstack_printf(para1:Pobstack; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gmp_obstack_vprintf(para1:Pobstack; para2:Pchar; para3:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function gmp_printf(para1:Pchar; args:array of const):longint;cdecl;external;
function gmp_printf(para1:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gmp_snprintf(para1:Pchar; para2:Tsize_t; para3:Pchar; args:array of const):longint;cdecl;external;
function gmp_snprintf(para1:Pchar; para2:Tsize_t; para3:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gmp_sprintf(para1:Pchar; para2:Pchar; args:array of const):longint;cdecl;external;
function gmp_sprintf(para1:Pchar; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gmp_vasprintf(para1:PPchar; para2:Pchar; para3:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function gmp_vfprintf(para1:PFILE; para2:Pchar; para3:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function gmp_vprintf(para1:Pchar; para2:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function gmp_vsnprintf(para1:Pchar; para2:Tsize_t; para3:Pchar; para4:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function gmp_vsprintf(para1:Pchar; para2:Pchar; para3:Tva_list):longint;cdecl;external;
{*************** Formatted input routines.  *************** }
(* Const before type ignored *)
function gmp_fscanf(para1:PFILE; para2:Pchar; args:array of const):longint;cdecl;external;
function gmp_fscanf(para1:PFILE; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gmp_scanf(para1:Pchar; args:array of const):longint;cdecl;external;
function gmp_scanf(para1:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gmp_sscanf(para1:Pchar; para2:Pchar; args:array of const):longint;cdecl;external;
function gmp_sscanf(para1:Pchar; para2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gmp_vfscanf(para1:PFILE; para2:Pchar; para3:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function gmp_vscanf(para1:Pchar; para2:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gmp_vsscanf(para1:Pchar; para2:Pchar; para3:Tva_list):longint;cdecl;external;
{*************** Integer (i.e. Z) routines.  *************** }
function _mpz_realloc(para1:Tmpz_ptr; para2:Tmp_size_t):pointer;cdecl;external;
procedure mpz_abs(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpz_add(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_add_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
procedure mpz_addmul(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_addmul_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
procedure mpz_and(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_array_init(para1:Tmpz_ptr; para2:Tmp_size_t; para3:Tmp_size_t);cdecl;external;
procedure mpz_bin_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
procedure mpz_bin_uiui(para1:Tmpz_ptr; para2:dword; para3:dword);cdecl;external;
procedure mpz_cdiv_q(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_cdiv_q_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
function mpz_cdiv_q_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external;
procedure mpz_cdiv_qr(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external;
function mpz_cdiv_qr_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:dword):dword;cdecl;external;
procedure mpz_cdiv_r(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_cdiv_r_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
function mpz_cdiv_r_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external;
function mpz_cdiv_ui(para1:Tmpz_srcptr; para2:dword):dword;cdecl;external;
procedure mpz_clear(para1:Tmpz_ptr);cdecl;external;
procedure mpz_clears(para1:Tmpz_ptr; args:array of const);cdecl;external;
procedure mpz_clears(para1:Tmpz_ptr);cdecl;external;
procedure mpz_clrbit(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external;
function mpz_cmp(para1:Tmpz_srcptr; para2:Tmpz_srcptr):longint;cdecl;external;
function mpz_cmp_d(para1:Tmpz_srcptr; para2:Tdouble):longint;cdecl;external;
function _mpz_cmp_si(para1:Tmpz_srcptr; para2:longint):longint;cdecl;external;
function _mpz_cmp_ui(para1:Tmpz_srcptr; para2:dword):longint;cdecl;external;
function mpz_cmpabs(para1:Tmpz_srcptr; para2:Tmpz_srcptr):longint;cdecl;external;
function mpz_cmpabs_d(para1:Tmpz_srcptr; para2:Tdouble):longint;cdecl;external;
function mpz_cmpabs_ui(para1:Tmpz_srcptr; para2:dword):longint;cdecl;external;
procedure mpz_com(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpz_combit(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external;
function mpz_congruent_p(para1:Tmpz_srcptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr):longint;cdecl;external;
function mpz_congruent_2exp_p(para1:Tmpz_srcptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t):longint;cdecl;external;
function mpz_congruent_ui_p(para1:Tmpz_srcptr; para2:dword; para3:dword):longint;cdecl;external;
procedure mpz_divexact(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_divexact_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
function mpz_divisible_p(para1:Tmpz_srcptr; para2:Tmpz_srcptr):longint;cdecl;external;
function mpz_divisible_ui_p(para1:Tmpz_srcptr; para2:dword):longint;cdecl;external;
function mpz_divisible_2exp_p(para1:Tmpz_srcptr; para2:Tmp_bitcnt_t):longint;cdecl;external;
procedure mpz_dump(para1:Tmpz_srcptr);cdecl;external;
function mpz_export(para1:pointer; para2:Psize_t; para3:longint; para4:Tsize_t; para5:longint; 
           para6:Tsize_t; para7:Tmpz_srcptr):pointer;cdecl;external;
procedure mpz_fac_ui(para1:Tmpz_ptr; para2:dword);cdecl;external;
procedure mpz_2fac_ui(para1:Tmpz_ptr; para2:dword);cdecl;external;
procedure mpz_mfac_uiui(para1:Tmpz_ptr; para2:dword; para3:dword);cdecl;external;
procedure mpz_primorial_ui(para1:Tmpz_ptr; para2:dword);cdecl;external;
procedure mpz_fdiv_q(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_fdiv_q_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
function mpz_fdiv_q_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external;
procedure mpz_fdiv_qr(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external;
function mpz_fdiv_qr_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:dword):dword;cdecl;external;
procedure mpz_fdiv_r(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_fdiv_r_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
function mpz_fdiv_r_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external;
function mpz_fdiv_ui(para1:Tmpz_srcptr; para2:dword):dword;cdecl;external;
procedure mpz_fib_ui(para1:Tmpz_ptr; para2:dword);cdecl;external;
procedure mpz_fib2_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:dword);cdecl;external;
function mpz_fits_sint_p(para1:Tmpz_srcptr):longint;cdecl;external;
function mpz_fits_slong_p(para1:Tmpz_srcptr):longint;cdecl;external;
function mpz_fits_sshort_p(para1:Tmpz_srcptr):longint;cdecl;external;
function mpz_fits_uint_p(para1:Tmpz_srcptr):longint;cdecl;external;
function mpz_fits_ulong_p(para1:Tmpz_srcptr):longint;cdecl;external;
function mpz_fits_ushort_p(para1:Tmpz_srcptr):longint;cdecl;external;
procedure mpz_gcd(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
function mpz_gcd_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external;
procedure mpz_gcdext(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_ptr; para4:Tmpz_srcptr; para5:Tmpz_srcptr);cdecl;external;
function mpz_get_d(para1:Tmpz_srcptr):Tdouble;cdecl;external;
function mpz_get_d_2exp(para1:Plongint; para2:Tmpz_srcptr):Tdouble;cdecl;external;
{ signed  }function mpz_get_si(para1:Tmpz_srcptr):longint;cdecl;external;
function mpz_get_str(para1:Pchar; para2:longint; para3:Tmpz_srcptr):Pchar;cdecl;external;
function mpz_get_ui(para1:Tmpz_srcptr):dword;cdecl;external;
function mpz_getlimbn(para1:Tmpz_srcptr; para2:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpz_hamdist(para1:Tmpz_srcptr; para2:Tmpz_srcptr):Tmp_bitcnt_t;cdecl;external;
(* Const before type ignored *)
procedure mpz_import(para1:Tmpz_ptr; para2:Tsize_t; para3:longint; para4:Tsize_t; para5:longint; 
            para6:Tsize_t; para7:pointer);cdecl;external;
procedure mpz_init(para1:Tmpz_ptr);cdecl;external;
procedure mpz_init2(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external;
procedure mpz_inits(para1:Tmpz_ptr; args:array of const);cdecl;external;
procedure mpz_inits(para1:Tmpz_ptr);cdecl;external;
procedure mpz_init_set(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpz_init_set_d(para1:Tmpz_ptr; para2:Tdouble);cdecl;external;
procedure mpz_init_set_si(para1:Tmpz_ptr; para2:longint);cdecl;external;
(* Const before type ignored *)
function mpz_init_set_str(para1:Tmpz_ptr; para2:Pchar; para3:longint):longint;cdecl;external;
procedure mpz_init_set_ui(para1:Tmpz_ptr; para2:dword);cdecl;external;
function mpz_inp_raw(para1:Tmpz_ptr; para2:PFILE):Tsize_t;cdecl;external;
function mpz_inp_str(para1:Tmpz_ptr; para2:PFILE; para3:longint):Tsize_t;cdecl;external;
function mpz_invert(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr):longint;cdecl;external;
procedure mpz_ior(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
function mpz_jacobi(para1:Tmpz_srcptr; para2:Tmpz_srcptr):longint;cdecl;external;
function mpz_kronecker_si(para1:Tmpz_srcptr; para2:longint):longint;cdecl;external;
function mpz_kronecker_ui(para1:Tmpz_srcptr; para2:dword):longint;cdecl;external;
function mpz_si_kronecker(para1:longint; para2:Tmpz_srcptr):longint;cdecl;external;
function mpz_ui_kronecker(para1:dword; para2:Tmpz_srcptr):longint;cdecl;external;
procedure mpz_lcm(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_lcm_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
procedure mpz_lucnum_ui(para1:Tmpz_ptr; para2:dword);cdecl;external;
procedure mpz_lucnum2_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:dword);cdecl;external;
function mpz_millerrabin(para1:Tmpz_srcptr; para2:longint):longint;cdecl;external;
procedure mpz_mod(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_mul(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_mul_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
procedure mpz_mul_si(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:longint);cdecl;external;
procedure mpz_mul_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
procedure mpz_neg(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpz_nextprime(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external;
function mpz_prevprime(para1:Tmpz_ptr; para2:Tmpz_srcptr):longint;cdecl;external;
function mpz_out_raw(para1:PFILE; para2:Tmpz_srcptr):Tsize_t;cdecl;external;
function mpz_out_str(para1:PFILE; para2:longint; para3:Tmpz_srcptr):Tsize_t;cdecl;external;
function mpz_perfect_power_p(para1:Tmpz_srcptr):longint;cdecl;external;
function mpz_perfect_square_p(para1:Tmpz_srcptr):longint;cdecl;external;
function mpz_popcount(para1:Tmpz_srcptr):Tmp_bitcnt_t;cdecl;external;
procedure mpz_pow_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
procedure mpz_powm(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external;
procedure mpz_powm_sec(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external;
procedure mpz_powm_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword; para4:Tmpz_srcptr);cdecl;external;
function mpz_probab_prime_p(para1:Tmpz_srcptr; para2:longint):longint;cdecl;external;
procedure mpz_random(para1:Tmpz_ptr; para2:Tmp_size_t);cdecl;external;
procedure mpz_random2(para1:Tmpz_ptr; para2:Tmp_size_t);cdecl;external;
procedure mpz_realloc2(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external;
function mpz_remove(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr):Tmp_bitcnt_t;cdecl;external;
function mpz_root(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):longint;cdecl;external;
procedure mpz_rootrem(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:dword);cdecl;external;
procedure mpz_rrandomb(para1:Tmpz_ptr; para2:Tgmp_randstate_ptr; para3:Tmp_bitcnt_t);cdecl;external;
function mpz_scan0(para1:Tmpz_srcptr; para2:Tmp_bitcnt_t):Tmp_bitcnt_t;cdecl;external;
function mpz_scan1(para1:Tmpz_srcptr; para2:Tmp_bitcnt_t):Tmp_bitcnt_t;cdecl;external;
procedure mpz_set(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpz_set_d(para1:Tmpz_ptr; para2:Tdouble);cdecl;external;
procedure mpz_set_f(para1:Tmpz_ptr; para2:Tmpf_srcptr);cdecl;external;
procedure mpz_set_q(para1:Tmpz_ptr; para2:Tmpq_srcptr);cdecl;external;
procedure mpz_set_si(para1:Tmpz_ptr; para2:longint);cdecl;external;
(* Const before type ignored *)
function mpz_set_str(para1:Tmpz_ptr; para2:Pchar; para3:longint):longint;cdecl;external;
procedure mpz_set_ui(para1:Tmpz_ptr; para2:dword);cdecl;external;
procedure mpz_setbit(para1:Tmpz_ptr; para2:Tmp_bitcnt_t);cdecl;external;
function mpz_size(para1:Tmpz_srcptr):Tsize_t;cdecl;external;
function mpz_sizeinbase(para1:Tmpz_srcptr; para2:longint):Tsize_t;cdecl;external;
procedure mpz_sqrt(para1:Tmpz_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpz_sqrtrem(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_sub(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_sub_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
procedure mpz_ui_sub(para1:Tmpz_ptr; para2:dword; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_submul(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_submul_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword);cdecl;external;
procedure mpz_swap(para1:Tmpz_ptr; para2:Tmpz_ptr);cdecl;external;
function mpz_tdiv_ui(para1:Tmpz_srcptr; para2:dword):dword;cdecl;external;
procedure mpz_tdiv_q(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_tdiv_q_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
function mpz_tdiv_q_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external;
procedure mpz_tdiv_qr(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:Tmpz_srcptr);cdecl;external;
function mpz_tdiv_qr_ui(para1:Tmpz_ptr; para2:Tmpz_ptr; para3:Tmpz_srcptr; para4:dword):dword;cdecl;external;
procedure mpz_tdiv_r(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_tdiv_r_2exp(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
function mpz_tdiv_r_ui(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:dword):dword;cdecl;external;
function mpz_tstbit(para1:Tmpz_srcptr; para2:Tmp_bitcnt_t):longint;cdecl;external;
procedure mpz_ui_pow_ui(para1:Tmpz_ptr; para2:dword; para3:dword);cdecl;external;
procedure mpz_urandomb(para1:Tmpz_ptr; para2:Tgmp_randstate_ptr; para3:Tmp_bitcnt_t);cdecl;external;
procedure mpz_urandomm(para1:Tmpz_ptr; para2:Tgmp_randstate_ptr; para3:Tmpz_srcptr);cdecl;external;
procedure mpz_xor(para1:Tmpz_ptr; para2:Tmpz_srcptr; para3:Tmpz_srcptr);cdecl;external;
function mpz_limbs_read(para1:Tmpz_srcptr):Tmp_srcptr;cdecl;external;
function mpz_limbs_write(para1:Tmpz_ptr; para2:Tmp_size_t):Tmp_ptr;cdecl;external;
function mpz_limbs_modify(para1:Tmpz_ptr; para2:Tmp_size_t):Tmp_ptr;cdecl;external;
procedure mpz_limbs_finish(para1:Tmpz_ptr; para2:Tmp_size_t);cdecl;external;
function mpz_roinit_n(para1:Tmpz_ptr; para2:Tmp_srcptr; para3:Tmp_size_t):Tmpz_srcptr;cdecl;external;
{*************** Rational (i.e. Q) routines.  *************** }
procedure mpq_abs(para1:Tmpq_ptr; para2:Tmpq_srcptr);cdecl;external;
procedure mpq_add(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr);cdecl;external;
procedure mpq_canonicalize(para1:Tmpq_ptr);cdecl;external;
procedure mpq_clear(para1:Tmpq_ptr);cdecl;external;
procedure mpq_clears(para1:Tmpq_ptr; args:array of const);cdecl;external;
procedure mpq_clears(para1:Tmpq_ptr);cdecl;external;
function mpq_cmp(para1:Tmpq_srcptr; para2:Tmpq_srcptr):longint;cdecl;external;
function _mpq_cmp_si(para1:Tmpq_srcptr; para2:longint; para3:dword):longint;cdecl;external;
function _mpq_cmp_ui(para1:Tmpq_srcptr; para2:dword; para3:dword):longint;cdecl;external;
function mpq_cmp_z(para1:Tmpq_srcptr; para2:Tmpz_srcptr):longint;cdecl;external;
procedure mpq_div(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr);cdecl;external;
procedure mpq_div_2exp(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
function mpq_equal(para1:Tmpq_srcptr; para2:Tmpq_srcptr):longint;cdecl;external;
procedure mpq_get_num(para1:Tmpz_ptr; para2:Tmpq_srcptr);cdecl;external;
procedure mpq_get_den(para1:Tmpz_ptr; para2:Tmpq_srcptr);cdecl;external;
function mpq_get_d(para1:Tmpq_srcptr):Tdouble;cdecl;external;
function mpq_get_str(para1:Pchar; para2:longint; para3:Tmpq_srcptr):Pchar;cdecl;external;
procedure mpq_init(para1:Tmpq_ptr);cdecl;external;
procedure mpq_inits(para1:Tmpq_ptr; args:array of const);cdecl;external;
procedure mpq_inits(para1:Tmpq_ptr);cdecl;external;
function mpq_inp_str(para1:Tmpq_ptr; para2:PFILE; para3:longint):Tsize_t;cdecl;external;
procedure mpq_inv(para1:Tmpq_ptr; para2:Tmpq_srcptr);cdecl;external;
procedure mpq_mul(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr);cdecl;external;
procedure mpq_mul_2exp(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
procedure mpq_neg(para1:Tmpq_ptr; para2:Tmpq_srcptr);cdecl;external;
function mpq_out_str(para1:PFILE; para2:longint; para3:Tmpq_srcptr):Tsize_t;cdecl;external;
procedure mpq_set(para1:Tmpq_ptr; para2:Tmpq_srcptr);cdecl;external;
procedure mpq_set_d(para1:Tmpq_ptr; para2:Tdouble);cdecl;external;
procedure mpq_set_den(para1:Tmpq_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpq_set_f(para1:Tmpq_ptr; para2:Tmpf_srcptr);cdecl;external;
procedure mpq_set_num(para1:Tmpq_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpq_set_si(para1:Tmpq_ptr; para2:longint; para3:dword);cdecl;external;
(* Const before type ignored *)
function mpq_set_str(para1:Tmpq_ptr; para2:Pchar; para3:longint):longint;cdecl;external;
procedure mpq_set_ui(para1:Tmpq_ptr; para2:dword; para3:dword);cdecl;external;
procedure mpq_set_z(para1:Tmpq_ptr; para2:Tmpz_srcptr);cdecl;external;
procedure mpq_sub(para1:Tmpq_ptr; para2:Tmpq_srcptr; para3:Tmpq_srcptr);cdecl;external;
procedure mpq_swap(para1:Tmpq_ptr; para2:Tmpq_ptr);cdecl;external;
{*************** Float (i.e. F) routines.  *************** }
procedure mpf_abs(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external;
procedure mpf_add(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external;
procedure mpf_add_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external;
procedure mpf_ceil(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external;
procedure mpf_clear(para1:Tmpf_ptr);cdecl;external;
procedure mpf_clears(para1:Tmpf_ptr; args:array of const);cdecl;external;
procedure mpf_clears(para1:Tmpf_ptr);cdecl;external;
function mpf_cmp(para1:Tmpf_srcptr; para2:Tmpf_srcptr):longint;cdecl;external;
function mpf_cmp_z(para1:Tmpf_srcptr; para2:Tmpz_srcptr):longint;cdecl;external;
function mpf_cmp_d(para1:Tmpf_srcptr; para2:Tdouble):longint;cdecl;external;
function mpf_cmp_si(para1:Tmpf_srcptr; para2:longint):longint;cdecl;external;
function mpf_cmp_ui(para1:Tmpf_srcptr; para2:dword):longint;cdecl;external;
procedure mpf_div(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external;
procedure mpf_div_2exp(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
procedure mpf_div_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external;
procedure mpf_dump(para1:Tmpf_srcptr);cdecl;external;
function mpf_eq(para1:Tmpf_srcptr; para2:Tmpf_srcptr; para3:Tmp_bitcnt_t):longint;cdecl;external;
function mpf_fits_sint_p(para1:Tmpf_srcptr):longint;cdecl;external;
function mpf_fits_slong_p(para1:Tmpf_srcptr):longint;cdecl;external;
function mpf_fits_sshort_p(para1:Tmpf_srcptr):longint;cdecl;external;
function mpf_fits_uint_p(para1:Tmpf_srcptr):longint;cdecl;external;
function mpf_fits_ulong_p(para1:Tmpf_srcptr):longint;cdecl;external;
function mpf_fits_ushort_p(para1:Tmpf_srcptr):longint;cdecl;external;
procedure mpf_floor(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external;
function mpf_get_d(para1:Tmpf_srcptr):Tdouble;cdecl;external;
function mpf_get_d_2exp(para1:Plongint; para2:Tmpf_srcptr):Tdouble;cdecl;external;
function mpf_get_default_prec:Tmp_bitcnt_t;cdecl;external;
function mpf_get_prec(para1:Tmpf_srcptr):Tmp_bitcnt_t;cdecl;external;
function mpf_get_si(para1:Tmpf_srcptr):longint;cdecl;external;
function mpf_get_str(para1:Pchar; para2:Pmp_exp_t; para3:longint; para4:Tsize_t; para5:Tmpf_srcptr):Pchar;cdecl;external;
function mpf_get_ui(para1:Tmpf_srcptr):dword;cdecl;external;
procedure mpf_init(para1:Tmpf_ptr);cdecl;external;
procedure mpf_init2(para1:Tmpf_ptr; para2:Tmp_bitcnt_t);cdecl;external;
procedure mpf_inits(para1:Tmpf_ptr; args:array of const);cdecl;external;
procedure mpf_inits(para1:Tmpf_ptr);cdecl;external;
procedure mpf_init_set(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external;
procedure mpf_init_set_d(para1:Tmpf_ptr; para2:Tdouble);cdecl;external;
procedure mpf_init_set_si(para1:Tmpf_ptr; para2:longint);cdecl;external;
(* Const before type ignored *)
function mpf_init_set_str(para1:Tmpf_ptr; para2:Pchar; para3:longint):longint;cdecl;external;
procedure mpf_init_set_ui(para1:Tmpf_ptr; para2:dword);cdecl;external;
function mpf_inp_str(para1:Tmpf_ptr; para2:PFILE; para3:longint):Tsize_t;cdecl;external;
function mpf_integer_p(para1:Tmpf_srcptr):longint;cdecl;external;
procedure mpf_mul(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external;
procedure mpf_mul_2exp(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmp_bitcnt_t);cdecl;external;
procedure mpf_mul_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external;
procedure mpf_neg(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external;
function mpf_out_str(para1:PFILE; para2:longint; para3:Tsize_t; para4:Tmpf_srcptr):Tsize_t;cdecl;external;
procedure mpf_pow_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external;
procedure mpf_random2(para1:Tmpf_ptr; para2:Tmp_size_t; para3:Tmp_exp_t);cdecl;external;
procedure mpf_reldiff(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external;
procedure mpf_set(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external;
procedure mpf_set_d(para1:Tmpf_ptr; para2:Tdouble);cdecl;external;
procedure mpf_set_default_prec(para1:Tmp_bitcnt_t);cdecl;external;
procedure mpf_set_prec(para1:Tmpf_ptr; para2:Tmp_bitcnt_t);cdecl;external;
procedure mpf_set_prec_raw(para1:Tmpf_ptr; para2:Tmp_bitcnt_t);cdecl;external;
procedure mpf_set_q(para1:Tmpf_ptr; para2:Tmpq_srcptr);cdecl;external;
procedure mpf_set_si(para1:Tmpf_ptr; para2:longint);cdecl;external;
(* Const before type ignored *)
function mpf_set_str(para1:Tmpf_ptr; para2:Pchar; para3:longint):longint;cdecl;external;
procedure mpf_set_ui(para1:Tmpf_ptr; para2:dword);cdecl;external;
procedure mpf_set_z(para1:Tmpf_ptr; para2:Tmpz_srcptr);cdecl;external;
function mpf_size(para1:Tmpf_srcptr):Tsize_t;cdecl;external;
procedure mpf_sqrt(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external;
procedure mpf_sqrt_ui(para1:Tmpf_ptr; para2:dword);cdecl;external;
procedure mpf_sub(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:Tmpf_srcptr);cdecl;external;
procedure mpf_sub_ui(para1:Tmpf_ptr; para2:Tmpf_srcptr; para3:dword);cdecl;external;
procedure mpf_swap(para1:Tmpf_ptr; para2:Tmpf_ptr);cdecl;external;
procedure mpf_trunc(para1:Tmpf_ptr; para2:Tmpf_srcptr);cdecl;external;
procedure mpf_ui_div(para1:Tmpf_ptr; para2:dword; para3:Tmpf_srcptr);cdecl;external;
procedure mpf_ui_sub(para1:Tmpf_ptr; para2:dword; para3:Tmpf_srcptr);cdecl;external;
procedure mpf_urandomb(para1:Tmpf_ptr; para2:Tgmp_randstate_ptr; para3:Tmp_bitcnt_t);cdecl;external;
{*********** Low level positive-integer (i.e. N) routines.  *********** }
{ This is ugly, but we need to make user calls reach the prefixed function.  }
function mpn_add(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpn_add_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_add_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpn_addmul_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_cmp(para1:Tmp_srcptr; para2:Tmp_srcptr; para3:Tmp_size_t):longint;cdecl;external;
function mpn_zero_p(para1:Tmp_srcptr; para2:Tmp_size_t):longint;cdecl;external;
procedure mpn_divexact_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t);cdecl;external;
function mpn_divexact_by3c(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_divrem(para1:Tmp_ptr; para2:Tmp_size_t; para3:Tmp_ptr; para4:Tmp_size_t; para5:Tmp_srcptr; 
           para6:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpn_divrem_1(para1:Tmp_ptr; para2:Tmp_size_t; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_divrem_2(para1:Tmp_ptr; para2:Tmp_size_t; para3:Tmp_ptr; para4:Tmp_size_t; para5:Tmp_srcptr):Tmp_limb_t;cdecl;external;
function mpn_div_qr_1(para1:Tmp_ptr; para2:Pmp_limb_t; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_div_qr_2(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_srcptr):Tmp_limb_t;cdecl;external;
function mpn_gcd(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_size_t; para4:Tmp_ptr; para5:Tmp_size_t):Tmp_size_t;cdecl;external;
function mpn_gcd_11(para1:Tmp_limb_t; para2:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_gcd_1(para1:Tmp_srcptr; para2:Tmp_size_t; para3:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_gcdext_1(para1:Pmp_limb_signed_t; para2:Pmp_limb_signed_t; para3:Tmp_limb_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_gcdext(para1:Tmp_ptr; para2:Tmp_ptr; para3:Pmp_size_t; para4:Tmp_ptr; para5:Tmp_size_t; 
           para6:Tmp_ptr; para7:Tmp_size_t):Tmp_size_t;cdecl;external;
function mpn_get_str(para1:Pbyte; para2:longint; para3:Tmp_ptr; para4:Tmp_size_t):Tsize_t;cdecl;external;
function mpn_hamdist(para1:Tmp_srcptr; para2:Tmp_srcptr; para3:Tmp_size_t):Tmp_bitcnt_t;cdecl;external;
function mpn_lshift(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:dword):Tmp_limb_t;cdecl;external;
function mpn_mod_1(para1:Tmp_srcptr; para2:Tmp_size_t; para3:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_mul(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpn_mul_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external;
procedure mpn_mul_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_sqr(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t);cdecl;external;
function mpn_neg(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t):Tmp_limb_t;cdecl;external;
procedure mpn_com(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t);cdecl;external;
function mpn_perfect_square_p(para1:Tmp_srcptr; para2:Tmp_size_t):longint;cdecl;external;
function mpn_perfect_power_p(para1:Tmp_srcptr; para2:Tmp_size_t):longint;cdecl;external;
function mpn_popcount(para1:Tmp_srcptr; para2:Tmp_size_t):Tmp_bitcnt_t;cdecl;external;
function mpn_pow_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t; para5:Tmp_ptr):Tmp_size_t;cdecl;external;
function mpn_preinv_mod_1(para1:Tmp_srcptr; para2:Tmp_size_t; para3:Tmp_limb_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external;
procedure mpn_random(para1:Tmp_ptr; para2:Tmp_size_t);cdecl;external;
procedure mpn_random2(para1:Tmp_ptr; para2:Tmp_size_t);cdecl;external;
function mpn_rshift(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:dword):Tmp_limb_t;cdecl;external;
function mpn_scan0(para1:Tmp_srcptr; para2:Tmp_bitcnt_t):Tmp_bitcnt_t;cdecl;external;
function mpn_scan1(para1:Tmp_srcptr; para2:Tmp_bitcnt_t):Tmp_bitcnt_t;cdecl;external;
(* Const before type ignored *)
function mpn_set_str(para1:Tmp_ptr; para2:Pbyte; para3:Tsize_t; para4:longint):Tmp_size_t;cdecl;external;
function mpn_sizeinbase(para1:Tmp_srcptr; para2:Tmp_size_t; para3:longint):Tsize_t;cdecl;external;
function mpn_sqrtrem(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_size_t):Tmp_size_t;cdecl;external;
function mpn_sub(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpn_sub_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external;
function mpn_sub_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpn_submul_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t):Tmp_limb_t;cdecl;external;
procedure mpn_tdiv_qr(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t; 
            para6:Tmp_srcptr; para7:Tmp_size_t);cdecl;external;
procedure mpn_and_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_andn_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_nand_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_ior_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_iorn_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_nior_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_xor_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_xnor_n(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_srcptr; para4:Tmp_size_t);cdecl;external;
procedure mpn_copyi(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t);cdecl;external;
procedure mpn_copyd(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t);cdecl;external;
procedure mpn_zero(para1:Tmp_ptr; para2:Tmp_size_t);cdecl;external;
function mpn_cnd_add_n(para1:Tmp_limb_t; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpn_cnd_sub_n(para1:Tmp_limb_t; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_srcptr; para5:Tmp_size_t):Tmp_limb_t;cdecl;external;
function mpn_sec_add_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t; para5:Tmp_ptr):Tmp_limb_t;cdecl;external;
function mpn_sec_add_1_itch(para1:Tmp_size_t):Tmp_size_t;cdecl;external;
function mpn_sec_sub_1(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_limb_t; para5:Tmp_ptr):Tmp_limb_t;cdecl;external;
function mpn_sec_sub_1_itch(para1:Tmp_size_t):Tmp_size_t;cdecl;external;
procedure mpn_cnd_swap(para1:Tmp_limb_t; para2:Pmp_limb_t; para3:Pmp_limb_t; para4:Tmp_size_t);cdecl;external;
procedure mpn_sec_mul(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t; 
            para6:Tmp_ptr);cdecl;external;
function mpn_sec_mul_itch(para1:Tmp_size_t; para2:Tmp_size_t):Tmp_size_t;cdecl;external;
procedure mpn_sec_sqr(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_ptr);cdecl;external;
function mpn_sec_sqr_itch(para1:Tmp_size_t):Tmp_size_t;cdecl;external;
procedure mpn_sec_powm(para1:Tmp_ptr; para2:Tmp_srcptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_bitcnt_t; 
            para6:Tmp_srcptr; para7:Tmp_size_t; para8:Tmp_ptr);cdecl;external;
function mpn_sec_powm_itch(para1:Tmp_size_t; para2:Tmp_bitcnt_t; para3:Tmp_size_t):Tmp_size_t;cdecl;external;
(* Const before type ignored *)
procedure mpn_sec_tabselect(para1:Pmp_limb_t; para2:Pmp_limb_t; para3:Tmp_size_t; para4:Tmp_size_t; para5:Tmp_size_t);cdecl;external;
function mpn_sec_div_qr(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_size_t; para4:Tmp_srcptr; para5:Tmp_size_t; 
           para6:Tmp_ptr):Tmp_limb_t;cdecl;external;
function mpn_sec_div_qr_itch(para1:Tmp_size_t; para2:Tmp_size_t):Tmp_size_t;cdecl;external;
procedure mpn_sec_div_r(para1:Tmp_ptr; para2:Tmp_size_t; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_ptr);cdecl;external;
function mpn_sec_div_r_itch(para1:Tmp_size_t; para2:Tmp_size_t):Tmp_size_t;cdecl;external;
function mpn_sec_invert(para1:Tmp_ptr; para2:Tmp_ptr; para3:Tmp_srcptr; para4:Tmp_size_t; para5:Tmp_bitcnt_t; 
           para6:Tmp_ptr):longint;cdecl;external;
function mpn_sec_invert_itch(para1:Tmp_size_t):Tmp_size_t;cdecl;external;
{*************** mpz inlines *************** }
{ The following are provided as inlines where possible, but always exist as
   library functions too, for binary compatibility.

   Within gmp itself this inlining generally isn't relied on, since it
   doesn't get done for all compilers, whereas if something is worth
   inlining then it's worth arranging always.

   There are two styles of inlining here.  When the same bit of code is
   wanted for the inline as for the library version, then __GMP_FORCE_foo
   arranges for that code to be emitted and the __GMP_EXTERN_INLINE
   directive suppressed, eg. mpz_fits_uint_p.  When a different bit of code
   is wanted for the inline than for the library version, then
   __GMP_FORCE_foo arranges the inline to be suppressed, eg. mpz_abs.   }
{*************** mpn inlines *************** }
{ The comments with __GMPN_ADD_1 below apply here too.

   The test for FUNCTION returning 0 should predict well.  If it's assumed
   yp,ysize will usually have a random number of bits then the high limb
   won't be full and a carry out will occur a good deal less than 50% of the
   time.

   ysize==0 isn't a documented feature, but is used internally in a few
   places.

   Producing cout last stops it using up a register during the main part of
   the calculation, though gcc (as of 3.0) on an "if (mpn_add (...))"
   doesn't seem able to move the true and false legs of the conditional up
   to the two places cout is generated.   }
{ Allow faster testing for negative, zero, and positive.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_sgn(Z : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpf_sgn(F : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_sgn(Q : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_cmp_ui(Z,UI : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_cmp_si(Z,UI : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_cmp_ui(Q,NUI,DUI : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_cmp_si(q,n,d : longint) : longint;

{ Using "&" rather than "&&" means these can come out branch-free.  Every
   mpz_t has at least one limb allocated, so fetching the low limb is always
   allowed.   }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_odd_p(z : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_even_p(z : longint) : longint;

{*************** C++ routines *************** }
{ Source-level compatibility with GMP 2 and earlier.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpn_divmod(qp,np,nsize,dp,dsize : longint) : longint;

{ Source-level compatibility with GMP 1.   }
const
  mpz_mdiv = mpz_fdiv_q;  
  mpz_mdivmod = mpz_fdiv_qr;  
  mpz_mmod = mpz_fdiv_r;  
  mpz_mdiv_ui = mpz_fdiv_q_ui;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function mpz_mdivmod_ui(q,r,n,d : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_mmod_ui(r,n,d : longint) : longint;

{ Useful synonyms, but not quite compatible with GMP 1.   }
const
  mpz_div = mpz_fdiv_q;  
  mpz_divmod = mpz_fdiv_qr;  
  mpz_div_ui = mpz_fdiv_q_ui;  
  mpz_divmod_ui = mpz_fdiv_qr_ui;  
  mpz_div_2exp = mpz_fdiv_q_2exp;  
  mpz_mod_2exp = mpz_fdiv_r_2exp;  
{ xxxxxxxxxxxxxxx }
{enum

  GMP_ERROR_NONE = 0,
  GMP_ERROR_UNSUPPORTED_ARGUMENT = 1,
  GMP_ERROR_DIVISION_BY_ZERO = 2,
  GMP_ERROR_SQRT_OF_NEGATIVE = 4,
  GMP_ERROR_INVALID_ARGUMENT = 8,
  GMP_ERROR_MPZ_OVERFLOW = 16
;
 }
{ Define CC and CFLAGS which were used to build this version of GMP  }
  __GMP_CC = 'x86_64-linux-gnu-gcc';  
  __GMP_CFLAGS = '-g -O2 -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -ffile-prefix-map=BUILDPATH=. -flto=auto -ffat-lto-objects -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection -fdebug-prefix-map=BUILDPATH=/usr/sr;  
{ Major version number is the value of __GNU_MP__ too, above.  }
  __GNU_MP_VERSION = 6;  
  __GNU_MP_VERSION_MINOR = 3;  
  __GNU_MP_VERSION_PATCHLEVEL = 0;  
{ xxxxxxxxxxxxxxxxxxxxx }
{ #define __GNU_MP_RELEASE (__GNU_MP_VERSION * 10000 + __GNU_MP_VERSION_MINOR * 100 + __GNU_MP_VERSION_PATCHLEVEL) }
{$define __GMP_H__}
{$endif}
{ __GMP_H__  }

implementation

{ was #define dname def_expr }
function GMP_NUMB_MASK : longint; { return type might be wrong }
  begin
    GMP_NUMB_MASK:=( not (__GMP_CAST(mp_limb_t,0))) shr GMP_NAIL_BITS;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_numref(Q : longint) : longint;
begin
  mpq_numref:=@(Q^._mp_num);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_denref(Q : longint) : longint;
begin
  mpq_denref:=@(Q^._mp_den);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_sgn(Z : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if 0 then
    if_local1:=-(1)
  else
    if_local1:=Z^._mp_size;
  mpz_sgn:=((Z^._mp_size)<(if_local1))>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpf_sgn(F : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if 0 then
    if_local1:=-(1)
  else
    if_local1:=F^._mp_size;
  mpf_sgn:=((F^._mp_size)<(if_local1))>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_sgn(Q : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if 0 then
    if_local1:=-(1)
  else
    if_local1:=Q^.(_mp_num._mp_size);
  mpq_sgn:=((Q^.(_mp_num._mp_size))<(if_local1))>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_cmp_ui(Z,UI : longint) : longint;
begin
  mpz_cmp_ui:=_mpz_cmp_ui(Z,UI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_cmp_si(Z,UI : longint) : longint;
begin
  mpz_cmp_si:=_mpz_cmp_si(Z,UI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_cmp_ui(Q,NUI,DUI : longint) : longint;
begin
  mpq_cmp_ui:=_mpq_cmp_ui(Q,NUI,DUI);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpq_cmp_si(q,n,d : longint) : longint;
begin
  mpq_cmp_si:=_mpq_cmp_si(q,n,d);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_odd_p(z : longint) : longint;
begin
  mpz_odd_p:=((z^._mp_size)<>0) and (__GMP_CAST(longint,z^.(_mp_d[0])));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_even_p(z : longint) : longint;
begin
  mpz_even_p:= not (mpz_odd_p(z));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpn_divmod(qp,np,nsize,dp,dsize : longint) : longint;
begin
  mpn_divmod:=mpn_divrem(qp,__GMP_CAST(mp_size_t,0),np,nsize,dp,dsize);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_mdivmod_ui(q,r,n,d : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if r=0 then
    if_local1:=mpz_fdiv_q_ui(q,n,d)
  else
    if_local1:=mpz_fdiv_qr_ui(q,r,n,d);
  mpz_mdivmod_ui:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function mpz_mmod_ui(r,n,d : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if r=0 then
    if_local1:=mpz_fdiv_ui(n,d)
  else
    if_local1:=mpz_fdiv_r_ui(r,n,d);
  mpz_mmod_ui:=if_local1;
end;


end.
