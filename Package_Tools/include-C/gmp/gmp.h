/* Definitions for GNU multiple precision functions.   -*- mode: c -*-

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
see https://www.gnu.org/licenses/.  */

#ifndef __GMP_H__

#if defined (__cplusplus)
#include <iosfwd>   /* for std::istream, std::ostream, std::string */
#include <cstdio>
#endif


/* Instantiated by configure. */
#if ! defined (__GMP_WITHIN_CONFIGURE)
#define __GMP_HAVE_HOST_CPU_FAMILY_power   0
#define __GMP_HAVE_HOST_CPU_FAMILY_powerpc 0
#define GMP_LIMB_BITS                      64
#define GMP_NAIL_BITS                      0
#endif
#define GMP_NUMB_BITS     (GMP_LIMB_BITS - GMP_NAIL_BITS)
#define GMP_NUMB_MASK     ((~ __GMP_CAST (mp_limb_t, 0)) >> GMP_NAIL_BITS)
#define GMP_NUMB_MAX      GMP_NUMB_MASK
#define GMP_NAIL_MASK     (~ GMP_NUMB_MASK)


#ifndef __GNU_MP__
#define __GNU_MP__ 6

#include <stddef.h>    /* for size_t */
#include <limits.h>

/* Instantiated by configure. */
#if ! defined (__GMP_WITHIN_CONFIGURE)
/* #undef _LONG_LONG_LIMB */
#define __GMP_LIBGMP_DLL  0
#endif


/* extern supports Windows DLL versions of libgmp, and is empty in
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
   make use of that.  Probably more trouble than it's worth.  */



#ifdef __GMP_SHORT_LIMB
typedef unsigned int		mp_limb_t;
typedef int			mp_limb_signed_t;
#else
#ifdef _LONG_LONG_LIMB
typedef unsigned long long int	mp_limb_t;
typedef long long int		mp_limb_signed_t;
#else
typedef unsigned long int	mp_limb_t;
typedef long int		mp_limb_signed_t;
#endif
#endif
typedef unsigned long int	mp_bitcnt_t;

/* For reference, note that the name __mpz_struct gets into C++ mangled
   function names, which means although the "__" suggests an internal, we
   must leave this name for binary compatibility.  */
typedef struct
{
  int _mp_alloc;		/* Number of *limbs* allocated and pointed
				   to by the _mp_d field.  */
  int _mp_size;			/* abs(_mp_size) is the number of limbs the
				   last field points to.  If _mp_size is
				   negative this is a negative number.  */
  mp_limb_t *_mp_d;		/* Pointer to the limbs.  */
} __mpz_struct;

#endif /* __GNU_MP__ */


typedef __mpz_struct MP_INT;    /* gmp 1 source compatibility */
typedef __mpz_struct mpz_t[1];

typedef mp_limb_t *		mp_ptr;
typedef const mp_limb_t *	mp_srcptr;
#if defined (_CRAY) && ! defined (_CRAYMPP)
/* plain `int' is much faster (48 bits) */
#define __GMP_MP_SIZE_T_INT     1
typedef int			mp_size_t;
typedef int			mp_exp_t;
#else
#define __GMP_MP_SIZE_T_INT     0
typedef long int		mp_size_t;
typedef long int		mp_exp_t;
#endif

typedef struct
{
  __mpz_struct _mp_num;
  __mpz_struct _mp_den;
} __mpq_struct;

typedef __mpq_struct MP_RAT;    /* gmp 1 source compatibility */
typedef __mpq_struct mpq_t[1];

typedef struct
{
  int _mp_prec;			/* Max precision, in number of `mp_limb_t's.
				   Set by mpf_init and modified by
				   mpf_set_prec.  The area pointed to by the
				   _mp_d field contains `prec' + 1 limbs.  */
  int _mp_size;			/* abs(_mp_size) is the number of limbs the
				   last field points to.  If _mp_size is
				   negative this is a negative number.  */
  mp_exp_t _mp_exp;		/* Exponent, in the base of `mp_limb_t'.  */
  mp_limb_t *_mp_d;		/* Pointer to the limbs.  */
} __mpf_struct;

/* typedef __mpf_struct MP_FLOAT; */
typedef __mpf_struct mpf_t[1];

/* Available random number generation algorithms.  */
typedef enum
{
  GMP_RAND_ALG_DEFAULT = 0,
  GMP_RAND_ALG_LC = GMP_RAND_ALG_DEFAULT /* Linear congruential.  */
} gmp_randalg_t;

/* Random state struct.  */
typedef struct
{
  mpz_t _mp_seed;	  /* _mp_d member points to state of the generator. */
  gmp_randalg_t _mp_alg;  /* Currently unused. */
  union {
    void *_mp_lc;         /* Pointer to function pointers structure.  */
  } _mp_algdata;
} __gmp_randstate_struct;
typedef __gmp_randstate_struct gmp_randstate_t[1];

/* Types for function declarations in gmp files.  */
/* ??? Should not pollute user name space with these ??? */
typedef const __mpz_struct *mpz_srcptr;
typedef __mpz_struct *mpz_ptr;
typedef const __mpf_struct *mpf_srcptr;
typedef __mpf_struct *mpf_ptr;
typedef const __mpq_struct *mpq_srcptr;
typedef __mpq_struct *mpq_ptr;
typedef __gmp_randstate_struct *gmp_randstate_ptr;
typedef const __gmp_randstate_struct *gmp_randstate_srcptr;




/* In ISO C, if a prototype involving "struct obstack *" is given without
   that structure defined, then the struct is scoped down to just the
   prototype, causing a conflict if it's subsequently defined for real.  So
   only give prototypes if we've got obstack.h.  */
#if defined (_OBSTACK_H)   /* glibc <obstack.h> */
#define _GMP_H_HAVE_OBSTACK 1
#endif

/* The prototypes for gmp_vprintf etc are provided only if va_list is defined,
   via an application having included <stdarg.h>.  Usually va_list is a typedef
   so can't be tested directly, but C99 specifies that va_start is a macro.

   <stdio.h> will define some sort of va_list for vprintf and vfprintf, but
   let's not bother trying to use that since it's not standard and since
   application uses for gmp_vprintf etc will almost certainly require the
   whole <stdarg.h> anyway.  */


/* An empty "throw ()" means the function doesn't throw any C++ exceptions,
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
   .  */

/* PORTME: What other compilers have a useful "extern inline"?  "static
   inline" would be an acceptable substitute if the compiler (or linker)
   discards unused statics.  */

 /* gcc has __inline__ in all modes, including strict ansi.  Give a prototype
    for an inline too, so as to correctly specify "dllimport" on windows, in
    case the function is called rather than inlined.
    GCC 4.3 and above with -std=c99 or -std=gnu99 implements ISO C99
    inline semantics, unless -fgnu89-inline is used.  */

/* DEC C (eg. version 5.9) supports "static __inline foo()", even in -std1
   strict ANSI mode.  Inlining is done even when not optimizing (ie. -O0
   mode, which is the default), but an unnecessary local copy of foo is
   emitted unless -O is used.  "extern __inline" is accepted, but the
   "extern" appears to be ignored, ie. it becomes a plain global function
   but which is inlined within its file.  Don't know if all old versions of
   DEC C supported __inline, but as a start let's do the right thing for
   current versions.  */

/* SCO OpenUNIX 8 cc supports "static inline foo()" but not in -Xc strict
   ANSI mode (__STDC__ is 1 in that mode).  Inlining only actually takes
   place under -O.  Without -O "foo" seems to be emitted whether it's used
   or not, which is wasteful.  "extern inline foo()" isn't useful, the
   "extern" is apparently ignored, so foo is inlined if possible but also
   emitted as a global, which causes multiple definition errors when
   building a shared libgmp.  */


/* C++ always has "inline" and since it's a normal feature the linker should
   discard duplicate non-inlined copies, or if it doesn't then that's a
   problem for everyone, not just GMP.  */

/* Don't do any inlining within a configure run, since if the compiler ends
   up emitting copies of the code into the object file it can end up
   demanding the various support routines (like mpn_popcount) for linking,
   making the "alloca" test and perhaps others fail.  And on hppa ia64 a
   pre-release gcc 3.2 was seen not respecting the "extern" in "extern
   __inline__", triggering this problem too.  */

/* By default, don't give a prototype when there's going to be an inline
   version.  Note in particular that Cray C++ objects to the combination of
   prototype and inline.  */




/* Allow direct user access to numerator and denominator of an mpq_t object.  */
#define mpq_numref(Q) (&((Q)->_mp_num))
#define mpq_denref(Q) (&((Q)->_mp_den))



extern void mp_set_memory_functions (void *(*) (size_t),
				      void *(*) (void *, size_t, size_t),
				      void (*) (void *, size_t)) ;

extern void mp_get_memory_functions (void *(**) (size_t),
				      void *(**) (void *, size_t, size_t),
				      void (**) (void *, size_t)) ;

extern const int mp_bits_per_limb;

extern  int gmp_errno;

extern const char * const gmp_version;


/**************** Random number routines.  ****************/

/* obsolete */
extern void gmp_randinit (gmp_randstate_ptr, gmp_randalg_t, ...);

extern void gmp_randinit_default (gmp_randstate_ptr);

extern void gmp_randinit_lc_2exp (gmp_randstate_ptr, mpz_srcptr, unsigned long int, mp_bitcnt_t);

extern int gmp_randinit_lc_2exp_size (gmp_randstate_ptr, mp_bitcnt_t);

extern void gmp_randinit_mt (gmp_randstate_ptr);

extern void gmp_randinit_set (gmp_randstate_ptr, gmp_randstate_srcptr);

extern void gmp_randseed (gmp_randstate_ptr, mpz_srcptr);

extern void gmp_randseed_ui (gmp_randstate_ptr, unsigned long int);

extern void gmp_randclear (gmp_randstate_ptr);

extern unsigned long gmp_urandomb_ui (gmp_randstate_ptr, unsigned long);

extern unsigned long gmp_urandomm_ui (gmp_randstate_ptr, unsigned long);


/**************** Formatted output routines.  ****************/

extern int gmp_asprintf (char **, const char *, ...);

extern int gmp_fprintf (FILE *, const char *, ...);

extern int gmp_obstack_printf (struct obstack *, const char *, ...);

extern int gmp_obstack_vprintf (struct obstack *, const char *, va_list);

extern int gmp_printf (const char *, ...);

extern int gmp_snprintf (char *, size_t, const char *, ...);

extern int gmp_sprintf (char *, const char *, ...);

extern int gmp_vasprintf (char **, const char *, va_list);

extern int gmp_vfprintf (FILE *, const char *, va_list);

extern int gmp_vprintf (const char *, va_list);

extern int gmp_vsnprintf (char *, size_t, const char *, va_list);

extern int gmp_vsprintf (char *, const char *, va_list);


/**************** Formatted input routines.  ****************/

extern int gmp_fscanf (FILE *, const char *, ...);

extern int gmp_scanf (const char *, ...);

extern int gmp_sscanf (const char *, const char *, ...);

extern int gmp_vfscanf (FILE *, const char *, va_list);

extern int gmp_vscanf (const char *, va_list);

extern int gmp_vsscanf (const char *, const char *, va_list);


/**************** Integer (i.e. Z) routines.  ****************/

extern void *_mpz_realloc (mpz_ptr, mp_size_t);

extern void mpz_abs (mpz_ptr, mpz_srcptr);

extern void mpz_add (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_add_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_addmul (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_addmul_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_and (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_array_init (mpz_ptr, mp_size_t, mp_size_t);

extern void mpz_bin_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_bin_uiui (mpz_ptr, unsigned long int, unsigned long int);

extern void mpz_cdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_cdiv_q_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

extern unsigned long int mpz_cdiv_q_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_cdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);

extern unsigned long int mpz_cdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_cdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_cdiv_r_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

extern unsigned long int mpz_cdiv_r_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern unsigned long int mpz_cdiv_ui (mpz_srcptr, unsigned long int) ;

extern void mpz_clear (mpz_ptr);

extern void mpz_clears (mpz_ptr, ...);

extern void mpz_clrbit (mpz_ptr, mp_bitcnt_t);

extern int mpz_cmp (mpz_srcptr, mpz_srcptr)  ;

extern int mpz_cmp_d (mpz_srcptr, double) ;

extern int _mpz_cmp_si (mpz_srcptr, signed long int)  ;

extern int _mpz_cmp_ui (mpz_srcptr, unsigned long int)  ;

extern int mpz_cmpabs (mpz_srcptr, mpz_srcptr)  ;

extern int mpz_cmpabs_d (mpz_srcptr, double) ;

extern int mpz_cmpabs_ui (mpz_srcptr, unsigned long int)  ;

extern void mpz_com (mpz_ptr, mpz_srcptr);

extern void mpz_combit (mpz_ptr, mp_bitcnt_t);

extern int mpz_congruent_p (mpz_srcptr, mpz_srcptr, mpz_srcptr) ;

extern int mpz_congruent_2exp_p (mpz_srcptr, mpz_srcptr, mp_bitcnt_t)  ;

extern int mpz_congruent_ui_p (mpz_srcptr, unsigned long, unsigned long) ;

extern void mpz_divexact (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_divexact_ui (mpz_ptr, mpz_srcptr, unsigned long);

extern int mpz_divisible_p (mpz_srcptr, mpz_srcptr) ;

extern int mpz_divisible_ui_p (mpz_srcptr, unsigned long) ;

extern int mpz_divisible_2exp_p (mpz_srcptr, mp_bitcnt_t)  ;

extern void mpz_dump (mpz_srcptr);

extern void *mpz_export (void *, size_t *, int, size_t, int, size_t, mpz_srcptr);

extern void mpz_fac_ui (mpz_ptr, unsigned long int);

extern void mpz_2fac_ui (mpz_ptr, unsigned long int);

extern void mpz_mfac_uiui (mpz_ptr, unsigned long int, unsigned long int);

extern void mpz_primorial_ui (mpz_ptr, unsigned long int);

extern void mpz_fdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_fdiv_q_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

extern unsigned long int mpz_fdiv_q_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_fdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);

extern unsigned long int mpz_fdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_fdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_fdiv_r_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

extern unsigned long int mpz_fdiv_r_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern unsigned long int mpz_fdiv_ui (mpz_srcptr, unsigned long int) ;

extern void mpz_fib_ui (mpz_ptr, unsigned long int);

extern void mpz_fib2_ui (mpz_ptr, mpz_ptr, unsigned long int);

extern int mpz_fits_sint_p (mpz_srcptr)  ;

extern int mpz_fits_slong_p (mpz_srcptr)  ;

extern int mpz_fits_sshort_p (mpz_srcptr)  ;

extern int mpz_fits_uint_p (mpz_srcptr)  ;

extern int mpz_fits_ulong_p (mpz_srcptr)  ;

extern int mpz_fits_ushort_p (mpz_srcptr)  ;

extern void mpz_gcd (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern unsigned long int mpz_gcd_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_gcdext (mpz_ptr, mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);

extern double mpz_get_d (mpz_srcptr) ;

extern double mpz_get_d_2exp (signed long int *, mpz_srcptr);

extern /* signed */ long int mpz_get_si (mpz_srcptr)  ;

extern char *mpz_get_str (char *, int, mpz_srcptr);

extern unsigned long int mpz_get_ui (mpz_srcptr)  ;

extern mp_limb_t mpz_getlimbn (mpz_srcptr, mp_size_t)  ;

extern mp_bitcnt_t mpz_hamdist (mpz_srcptr, mpz_srcptr)  ;

extern void mpz_import (mpz_ptr, size_t, int, size_t, int, size_t, const void *);

extern void mpz_init (mpz_ptr) ;

extern void mpz_init2 (mpz_ptr, mp_bitcnt_t);

extern void mpz_inits (mpz_ptr, ...) ;

extern void mpz_init_set (mpz_ptr, mpz_srcptr);

extern void mpz_init_set_d (mpz_ptr, double);

extern void mpz_init_set_si (mpz_ptr, signed long int);

extern int mpz_init_set_str (mpz_ptr, const char *, int);

extern void mpz_init_set_ui (mpz_ptr, unsigned long int);

extern size_t mpz_inp_raw (mpz_ptr, FILE *);

extern size_t mpz_inp_str (mpz_ptr, FILE *, int);

extern int mpz_invert (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_ior (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern int mpz_jacobi (mpz_srcptr, mpz_srcptr) ;

extern int mpz_kronecker_si (mpz_srcptr, long) ;

extern int mpz_kronecker_ui (mpz_srcptr, unsigned long) ;

extern int mpz_si_kronecker (long, mpz_srcptr) ;

extern int mpz_ui_kronecker (unsigned long, mpz_srcptr) ;

extern void mpz_lcm (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_lcm_ui (mpz_ptr, mpz_srcptr, unsigned long);

extern void mpz_lucnum_ui (mpz_ptr, unsigned long int);

extern void mpz_lucnum2_ui (mpz_ptr, mpz_ptr, unsigned long int);

extern int mpz_millerrabin (mpz_srcptr, int) ;

extern void mpz_mod (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_mul (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_mul_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

extern void mpz_mul_si (mpz_ptr, mpz_srcptr, long int);

extern void mpz_mul_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_neg (mpz_ptr, mpz_srcptr);

extern void mpz_nextprime (mpz_ptr, mpz_srcptr);

extern int mpz_prevprime (mpz_ptr, mpz_srcptr);

extern size_t mpz_out_raw (FILE *, mpz_srcptr);

extern size_t mpz_out_str (FILE *, int, mpz_srcptr);

extern int mpz_perfect_power_p (mpz_srcptr) ;

extern int mpz_perfect_square_p (mpz_srcptr) ;

extern mp_bitcnt_t mpz_popcount (mpz_srcptr)  ;

extern void mpz_pow_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_powm (mpz_ptr, mpz_srcptr, mpz_srcptr, mpz_srcptr);

extern void mpz_powm_sec (mpz_ptr, mpz_srcptr, mpz_srcptr, mpz_srcptr);

extern void mpz_powm_ui (mpz_ptr, mpz_srcptr, unsigned long int, mpz_srcptr);

extern int mpz_probab_prime_p (mpz_srcptr, int) ;

extern void mpz_random (mpz_ptr, mp_size_t);

extern void mpz_random2 (mpz_ptr, mp_size_t);

extern void mpz_realloc2 (mpz_ptr, mp_bitcnt_t);

extern mp_bitcnt_t mpz_remove (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern int mpz_root (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_rootrem (mpz_ptr, mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_rrandomb (mpz_ptr, gmp_randstate_ptr, mp_bitcnt_t);

extern mp_bitcnt_t mpz_scan0 (mpz_srcptr, mp_bitcnt_t)  ;

extern mp_bitcnt_t mpz_scan1 (mpz_srcptr, mp_bitcnt_t)  ;

extern void mpz_set (mpz_ptr, mpz_srcptr);

extern void mpz_set_d (mpz_ptr, double);

extern void mpz_set_f (mpz_ptr, mpf_srcptr);

extern void mpz_set_q (mpz_ptr, mpq_srcptr);

extern void mpz_set_si (mpz_ptr, signed long int);

extern int mpz_set_str (mpz_ptr, const char *, int);

extern void mpz_set_ui (mpz_ptr, unsigned long int);

extern void mpz_setbit (mpz_ptr, mp_bitcnt_t);

extern size_t mpz_size (mpz_srcptr)  ;

extern size_t mpz_sizeinbase (mpz_srcptr, int)  ;

extern void mpz_sqrt (mpz_ptr, mpz_srcptr);

extern void mpz_sqrtrem (mpz_ptr, mpz_ptr, mpz_srcptr);

extern void mpz_sub (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_sub_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_ui_sub (mpz_ptr, unsigned long int, mpz_srcptr);

extern void mpz_submul (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_submul_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_swap (mpz_ptr, mpz_ptr) ;

extern unsigned long int mpz_tdiv_ui (mpz_srcptr, unsigned long int) ;

extern void mpz_tdiv_q (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_tdiv_q_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

extern unsigned long int mpz_tdiv_q_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_tdiv_qr (mpz_ptr, mpz_ptr, mpz_srcptr, mpz_srcptr);

extern unsigned long int mpz_tdiv_qr_ui (mpz_ptr, mpz_ptr, mpz_srcptr, unsigned long int);

extern void mpz_tdiv_r (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern void mpz_tdiv_r_2exp (mpz_ptr, mpz_srcptr, mp_bitcnt_t);

extern unsigned long int mpz_tdiv_r_ui (mpz_ptr, mpz_srcptr, unsigned long int);

extern int mpz_tstbit (mpz_srcptr, mp_bitcnt_t)  ;

extern void mpz_ui_pow_ui (mpz_ptr, unsigned long int, unsigned long int);

extern void mpz_urandomb (mpz_ptr, gmp_randstate_ptr, mp_bitcnt_t);

extern void mpz_urandomm (mpz_ptr, gmp_randstate_ptr, mpz_srcptr);

extern void mpz_xor (mpz_ptr, mpz_srcptr, mpz_srcptr);

extern mp_srcptr mpz_limbs_read (mpz_srcptr);

extern mp_ptr mpz_limbs_write (mpz_ptr, mp_size_t);

extern mp_ptr mpz_limbs_modify (mpz_ptr, mp_size_t);

extern void mpz_limbs_finish (mpz_ptr, mp_size_t);

extern mpz_srcptr mpz_roinit_n (mpz_ptr, mp_srcptr, mp_size_t);



/**************** Rational (i.e. Q) routines.  ****************/

extern void mpq_abs (mpq_ptr, mpq_srcptr);

extern void mpq_add (mpq_ptr, mpq_srcptr, mpq_srcptr);

extern void mpq_canonicalize (mpq_ptr);

extern void mpq_clear (mpq_ptr);

extern void mpq_clears (mpq_ptr, ...);

extern int mpq_cmp (mpq_srcptr, mpq_srcptr) ;

extern int _mpq_cmp_si (mpq_srcptr, long, unsigned long) ;

extern int _mpq_cmp_ui (mpq_srcptr, unsigned long int, unsigned long int) ;

extern int mpq_cmp_z (mpq_srcptr, mpz_srcptr) ;

extern void mpq_div (mpq_ptr, mpq_srcptr, mpq_srcptr);

extern void mpq_div_2exp (mpq_ptr, mpq_srcptr, mp_bitcnt_t);

extern int mpq_equal (mpq_srcptr, mpq_srcptr)  ;

extern void mpq_get_num (mpz_ptr, mpq_srcptr);

extern void mpq_get_den (mpz_ptr, mpq_srcptr);

extern double mpq_get_d (mpq_srcptr) ;

extern char *mpq_get_str (char *, int, mpq_srcptr);

extern void mpq_init (mpq_ptr);

extern void mpq_inits (mpq_ptr, ...);

extern size_t mpq_inp_str (mpq_ptr, FILE *, int);

extern void mpq_inv (mpq_ptr, mpq_srcptr);

extern void mpq_mul (mpq_ptr, mpq_srcptr, mpq_srcptr);

extern void mpq_mul_2exp (mpq_ptr, mpq_srcptr, mp_bitcnt_t);

extern void mpq_neg (mpq_ptr, mpq_srcptr);

extern size_t mpq_out_str (FILE *, int, mpq_srcptr);

extern void mpq_set (mpq_ptr, mpq_srcptr);

extern void mpq_set_d (mpq_ptr, double);

extern void mpq_set_den (mpq_ptr, mpz_srcptr);

extern void mpq_set_f (mpq_ptr, mpf_srcptr);

extern void mpq_set_num (mpq_ptr, mpz_srcptr);

extern void mpq_set_si (mpq_ptr, signed long int, unsigned long int);

extern int mpq_set_str (mpq_ptr, const char *, int);

extern void mpq_set_ui (mpq_ptr, unsigned long int, unsigned long int);

extern void mpq_set_z (mpq_ptr, mpz_srcptr);

extern void mpq_sub (mpq_ptr, mpq_srcptr, mpq_srcptr);

extern void mpq_swap (mpq_ptr, mpq_ptr) ;


/**************** Float (i.e. F) routines.  ****************/

extern void mpf_abs (mpf_ptr, mpf_srcptr);

extern void mpf_add (mpf_ptr, mpf_srcptr, mpf_srcptr);

extern void mpf_add_ui (mpf_ptr, mpf_srcptr, unsigned long int);
extern void mpf_ceil (mpf_ptr, mpf_srcptr);

extern void mpf_clear (mpf_ptr);

extern void mpf_clears (mpf_ptr, ...);

extern int mpf_cmp (mpf_srcptr, mpf_srcptr)  ;

extern int mpf_cmp_z (mpf_srcptr, mpz_srcptr)  ;

extern int mpf_cmp_d (mpf_srcptr, double) ;

extern int mpf_cmp_si (mpf_srcptr, signed long int)  ;

extern int mpf_cmp_ui (mpf_srcptr, unsigned long int)  ;

extern void mpf_div (mpf_ptr, mpf_srcptr, mpf_srcptr);

extern void mpf_div_2exp (mpf_ptr, mpf_srcptr, mp_bitcnt_t);

extern void mpf_div_ui (mpf_ptr, mpf_srcptr, unsigned long int);

extern void mpf_dump (mpf_srcptr);

extern int mpf_eq (mpf_srcptr, mpf_srcptr, mp_bitcnt_t) ;

extern int mpf_fits_sint_p (mpf_srcptr)  ;

extern int mpf_fits_slong_p (mpf_srcptr)  ;

extern int mpf_fits_sshort_p (mpf_srcptr)  ;

extern int mpf_fits_uint_p (mpf_srcptr)  ;

extern int mpf_fits_ulong_p (mpf_srcptr)  ;

extern int mpf_fits_ushort_p (mpf_srcptr)  ;

extern void mpf_floor (mpf_ptr, mpf_srcptr);

extern double mpf_get_d (mpf_srcptr) ;

extern double mpf_get_d_2exp (signed long int *, mpf_srcptr);

extern mp_bitcnt_t mpf_get_default_prec (void)  ;

extern mp_bitcnt_t mpf_get_prec (mpf_srcptr)  ;

extern long mpf_get_si (mpf_srcptr)  ;

extern char *mpf_get_str (char *, mp_exp_t *, int, size_t, mpf_srcptr);

extern unsigned long mpf_get_ui (mpf_srcptr)  ;

extern void mpf_init (mpf_ptr);

extern void mpf_init2 (mpf_ptr, mp_bitcnt_t);

extern void mpf_inits (mpf_ptr, ...);

extern void mpf_init_set (mpf_ptr, mpf_srcptr);

extern void mpf_init_set_d (mpf_ptr, double);

extern void mpf_init_set_si (mpf_ptr, signed long int);

extern int mpf_init_set_str (mpf_ptr, const char *, int);

extern void mpf_init_set_ui (mpf_ptr, unsigned long int);

extern size_t mpf_inp_str (mpf_ptr, FILE *, int);

extern int mpf_integer_p (mpf_srcptr)  ;

extern void mpf_mul (mpf_ptr, mpf_srcptr, mpf_srcptr);

extern void mpf_mul_2exp (mpf_ptr, mpf_srcptr, mp_bitcnt_t);

extern void mpf_mul_ui (mpf_ptr, mpf_srcptr, unsigned long int);

extern void mpf_neg (mpf_ptr, mpf_srcptr);

extern size_t mpf_out_str (FILE *, int, size_t, mpf_srcptr);

extern void mpf_pow_ui (mpf_ptr, mpf_srcptr, unsigned long int);

extern void mpf_random2 (mpf_ptr, mp_size_t, mp_exp_t);

extern void mpf_reldiff (mpf_ptr, mpf_srcptr, mpf_srcptr);

extern void mpf_set (mpf_ptr, mpf_srcptr);

extern void mpf_set_d (mpf_ptr, double);

extern void mpf_set_default_prec (mp_bitcnt_t) ;

extern void mpf_set_prec (mpf_ptr, mp_bitcnt_t);

extern void mpf_set_prec_raw (mpf_ptr, mp_bitcnt_t) ;

extern void mpf_set_q (mpf_ptr, mpq_srcptr);

extern void mpf_set_si (mpf_ptr, signed long int);

extern int mpf_set_str (mpf_ptr, const char *, int);

extern void mpf_set_ui (mpf_ptr, unsigned long int);

extern void mpf_set_z (mpf_ptr, mpz_srcptr);

extern size_t mpf_size (mpf_srcptr)  ;

extern void mpf_sqrt (mpf_ptr, mpf_srcptr);

extern void mpf_sqrt_ui (mpf_ptr, unsigned long int);

extern void mpf_sub (mpf_ptr, mpf_srcptr, mpf_srcptr);

extern void mpf_sub_ui (mpf_ptr, mpf_srcptr, unsigned long int);

extern void mpf_swap (mpf_ptr, mpf_ptr) ;

extern void mpf_trunc (mpf_ptr, mpf_srcptr);

extern void mpf_ui_div (mpf_ptr, unsigned long int, mpf_srcptr);

extern void mpf_ui_sub (mpf_ptr, unsigned long int, mpf_srcptr);

extern void mpf_urandomb (mpf_ptr, gmp_randstate_ptr, mp_bitcnt_t);


/************ Low level positive-integer (i.e. N) routines.  ************/

/* This is ugly, but we need to make user calls reach the prefixed function. */

extern mp_limb_t mpn_add (mp_ptr, mp_srcptr, mp_size_t, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_add_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t) ;

extern mp_limb_t mpn_add_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_addmul_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);

extern int mpn_cmp (mp_srcptr, mp_srcptr, mp_size_t)  ;

extern int mpn_zero_p (mp_srcptr, mp_size_t)  ;

extern void mpn_divexact_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);

extern mp_limb_t mpn_divexact_by3c (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);

extern mp_limb_t mpn_divrem (mp_ptr, mp_size_t, mp_ptr, mp_size_t, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_divrem_1 (mp_ptr, mp_size_t, mp_srcptr, mp_size_t, mp_limb_t);

extern mp_limb_t mpn_divrem_2 (mp_ptr, mp_size_t, mp_ptr, mp_size_t, mp_srcptr);

extern mp_limb_t mpn_div_qr_1 (mp_ptr, mp_limb_t *, mp_srcptr, mp_size_t, mp_limb_t);

extern mp_limb_t mpn_div_qr_2 (mp_ptr, mp_ptr, mp_srcptr, mp_size_t, mp_srcptr);

extern mp_size_t mpn_gcd (mp_ptr, mp_ptr, mp_size_t, mp_ptr, mp_size_t);

extern mp_limb_t mpn_gcd_11 (mp_limb_t, mp_limb_t) ;

extern mp_limb_t mpn_gcd_1 (mp_srcptr, mp_size_t, mp_limb_t) ;

extern mp_limb_t mpn_gcdext_1 (mp_limb_signed_t *, mp_limb_signed_t *, mp_limb_t, mp_limb_t);

extern mp_size_t mpn_gcdext (mp_ptr, mp_ptr, mp_size_t *, mp_ptr, mp_size_t, mp_ptr, mp_size_t);

extern size_t mpn_get_str (unsigned char *, int, mp_ptr, mp_size_t);

extern mp_bitcnt_t mpn_hamdist (mp_srcptr, mp_srcptr, mp_size_t)  ;

extern mp_limb_t mpn_lshift (mp_ptr, mp_srcptr, mp_size_t, unsigned int);

extern mp_limb_t mpn_mod_1 (mp_srcptr, mp_size_t, mp_limb_t) ;

extern mp_limb_t mpn_mul (mp_ptr, mp_srcptr, mp_size_t, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_mul_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);

extern void mpn_mul_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);

extern void mpn_sqr (mp_ptr, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_neg (mp_ptr, mp_srcptr, mp_size_t);

extern void mpn_com (mp_ptr, mp_srcptr, mp_size_t);

extern int mpn_perfect_square_p (mp_srcptr, mp_size_t) ;

extern int mpn_perfect_power_p (mp_srcptr, mp_size_t) ;

extern mp_bitcnt_t mpn_popcount (mp_srcptr, mp_size_t)  ;

extern mp_size_t mpn_pow_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t, mp_ptr);

extern mp_limb_t mpn_preinv_mod_1 (mp_srcptr, mp_size_t, mp_limb_t, mp_limb_t) ;

extern void mpn_random (mp_ptr, mp_size_t);

extern void mpn_random2 (mp_ptr, mp_size_t);

extern mp_limb_t mpn_rshift (mp_ptr, mp_srcptr, mp_size_t, unsigned int);

extern mp_bitcnt_t mpn_scan0 (mp_srcptr, mp_bitcnt_t) ;

extern mp_bitcnt_t mpn_scan1 (mp_srcptr, mp_bitcnt_t) ;

extern mp_size_t mpn_set_str (mp_ptr, const unsigned char *, size_t, int);

extern size_t mpn_sizeinbase (mp_srcptr, mp_size_t, int);

extern mp_size_t mpn_sqrtrem (mp_ptr, mp_ptr, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_sub (mp_ptr, mp_srcptr, mp_size_t, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_sub_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t) ;

extern mp_limb_t mpn_sub_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_submul_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t);

extern void mpn_tdiv_qr (mp_ptr, mp_ptr, mp_size_t, mp_srcptr, mp_size_t, mp_srcptr, mp_size_t);

extern void mpn_and_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);
extern void mpn_andn_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);
extern void mpn_nand_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);
extern void mpn_ior_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);
extern void mpn_iorn_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);
extern void mpn_nior_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);
extern void mpn_xor_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);
extern void mpn_xnor_n (mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);

extern void mpn_copyi (mp_ptr, mp_srcptr, mp_size_t);
extern void mpn_copyd (mp_ptr, mp_srcptr, mp_size_t);
extern void mpn_zero (mp_ptr, mp_size_t);

extern mp_limb_t mpn_cnd_add_n (mp_limb_t, mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);
extern mp_limb_t mpn_cnd_sub_n (mp_limb_t, mp_ptr, mp_srcptr, mp_srcptr, mp_size_t);

extern mp_limb_t mpn_sec_add_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t, mp_ptr);
extern mp_size_t mpn_sec_add_1_itch (mp_size_t) ;

extern mp_limb_t mpn_sec_sub_1 (mp_ptr, mp_srcptr, mp_size_t, mp_limb_t, mp_ptr);
extern mp_size_t mpn_sec_sub_1_itch (mp_size_t) ;

extern void mpn_cnd_swap (mp_limb_t,  mp_limb_t *,  mp_limb_t *, mp_size_t);

extern void mpn_sec_mul (mp_ptr, mp_srcptr, mp_size_t, mp_srcptr, mp_size_t, mp_ptr);
extern mp_size_t mpn_sec_mul_itch (mp_size_t, mp_size_t) ;

extern void mpn_sec_sqr (mp_ptr, mp_srcptr, mp_size_t, mp_ptr);
extern mp_size_t mpn_sec_sqr_itch (mp_size_t) ;

extern void mpn_sec_powm (mp_ptr, mp_srcptr, mp_size_t, mp_srcptr, mp_bitcnt_t, mp_srcptr, mp_size_t, mp_ptr);
extern mp_size_t mpn_sec_powm_itch (mp_size_t, mp_bitcnt_t, mp_size_t) ;

extern void mpn_sec_tabselect ( mp_limb_t *,  const mp_limb_t *, mp_size_t, mp_size_t, mp_size_t);

extern mp_limb_t mpn_sec_div_qr (mp_ptr, mp_ptr, mp_size_t, mp_srcptr, mp_size_t, mp_ptr);
extern mp_size_t mpn_sec_div_qr_itch (mp_size_t, mp_size_t) ;
extern void mpn_sec_div_r (mp_ptr, mp_size_t, mp_srcptr, mp_size_t, mp_ptr);
extern mp_size_t mpn_sec_div_r_itch (mp_size_t, mp_size_t) ;

extern int mpn_sec_invert (mp_ptr, mp_ptr, mp_srcptr, mp_size_t, mp_bitcnt_t, mp_ptr);
extern mp_size_t mpn_sec_invert_itch (mp_size_t) ;


/**************** mpz inlines ****************/

/* The following are provided as inlines where possible, but always exist as
   library functions too, for binary compatibility.

   Within gmp itself this inlining generally isn't relied on, since it
   doesn't get done for all compilers, whereas if something is worth
   inlining then it's worth arranging always.

   There are two styles of inlining here.  When the same bit of code is
   wanted for the inline as for the library version, then __GMP_FORCE_foo
   arranges for that code to be emitted and the __GMP_EXTERN_INLINE
   directive suppressed, eg. mpz_fits_uint_p.  When a different bit of code
   is wanted for the inline than for the library version, then
   __GMP_FORCE_foo arranges the inline to be suppressed, eg. mpz_abs.  */






/**************** mpn inlines ****************/

/* The comments with __GMPN_ADD_1 below apply here too.

   The test for FUNCTION returning 0 should predict well.  If it's assumed
   {yp,ysize} will usually have a random number of bits then the high limb
   won't be full and a carry out will occur a good deal less than 50% of the
   time.

   ysize==0 isn't a documented feature, but is used internally in a few
   places.

   Producing cout last stops it using up a register during the main part of
   the calculation, though gcc (as of 3.0) on an "if (mpn_add (...))"
   doesn't seem able to move the true and false legs of the conditional up
   to the two places cout is generated.  */



/* Allow faster testing for negative, zero, and positive.  */
#define mpz_sgn(Z) ((Z)->_mp_size < 0 ? -1 : (Z)->_mp_size > 0)
#define mpf_sgn(F) ((F)->_mp_size < 0 ? -1 : (F)->_mp_size > 0)
#define mpq_sgn(Q) ((Q)->_mp_num._mp_size < 0 ? -1 : (Q)->_mp_num._mp_size > 0)

#define mpz_cmp_ui(Z,UI) _mpz_cmp_ui (Z,UI)
#define mpz_cmp_si(Z,UI) _mpz_cmp_si (Z,UI)
#define mpq_cmp_ui(Q,NUI,DUI) _mpq_cmp_ui (Q,NUI,DUI)
#define mpq_cmp_si(q,n,d)  _mpq_cmp_si(q,n,d)


/* Using "&" rather than "&&" means these can come out branch-free.  Every
   mpz_t has at least one limb allocated, so fetching the low limb is always
   allowed.  */
#define mpz_odd_p(z)   (((z)->_mp_size != 0) & __GMP_CAST (int, (z)->_mp_d[0]))
#define mpz_even_p(z)  (! mpz_odd_p (z))


/**************** C++ routines ****************/


/* Source-level compatibility with GMP 2 and earlier. */
#define mpn_divmod(qp,np,nsize,dp,dsize) \
  mpn_divrem (qp, __GMP_CAST (mp_size_t, 0), np, nsize, dp, dsize)

/* Source-level compatibility with GMP 1.  */
#define mpz_mdiv	mpz_fdiv_q
#define mpz_mdivmod	mpz_fdiv_qr
#define mpz_mmod	mpz_fdiv_r
#define mpz_mdiv_ui	mpz_fdiv_q_ui
#define mpz_mdivmod_ui(q,r,n,d) \
  (((r) == 0) ? mpz_fdiv_q_ui (q,n,d) : mpz_fdiv_qr_ui (q,r,n,d))
#define mpz_mmod_ui(r,n,d) \
  (((r) == 0) ? mpz_fdiv_ui (n,d) : mpz_fdiv_r_ui (r,n,d))

/* Useful synonyms, but not quite compatible with GMP 1.  */
#define mpz_div		mpz_fdiv_q
#define mpz_divmod	mpz_fdiv_qr
#define mpz_div_ui	mpz_fdiv_q_ui
#define mpz_divmod_ui	mpz_fdiv_qr_ui
#define mpz_div_2exp	mpz_fdiv_q_2exp
#define mpz_mod_2exp	mpz_fdiv_r_2exp

// xxxxxxxxxxxxxxx
/*enum
{
  GMP_ERROR_NONE = 0,
  GMP_ERROR_UNSUPPORTED_ARGUMENT = 1,
  GMP_ERROR_DIVISION_BY_ZERO = 2,
  GMP_ERROR_SQRT_OF_NEGATIVE = 4,
  GMP_ERROR_INVALID_ARGUMENT = 8,
  GMP_ERROR_MPZ_OVERFLOW = 16
};
*/

/* Define CC and CFLAGS which were used to build this version of GMP */
#define __GMP_CC "x86_64-linux-gnu-gcc"
#define __GMP_CFLAGS "-g -O2 -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -ffile-prefix-map=BUILDPATH=. -flto=auto -ffat-lto-objects -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection -fdebug-prefix-map=BUILDPATH=/usr/src/gmp-2:6.3.0+dfsg-2ubuntu6.1 -O3"

/* Major version number is the value of __GNU_MP__ too, above. */
#define __GNU_MP_VERSION            6
#define __GNU_MP_VERSION_MINOR      3
#define __GNU_MP_VERSION_PATCHLEVEL 0
// xxxxxxxxxxxxxxxxxxxxx
// #define __GNU_MP_RELEASE (__GNU_MP_VERSION * 10000 + __GNU_MP_VERSION_MINOR * 100 + __GNU_MP_VERSION_PATCHLEVEL)

#define __GMP_H__
#endif /* __GMP_H__ */
