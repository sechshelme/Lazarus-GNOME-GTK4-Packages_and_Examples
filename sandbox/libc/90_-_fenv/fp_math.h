/* Declarations for math functions.
   Copyright (C) 1991-2024 Free Software Foundation, Inc.
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
   <https://www.gnu.org/licenses/>.  */

/*
 *	ISO C99 Standard: 7.12 Mathematics	<math.h>
 */

#ifndef	_MATH_H
#define	_MATH_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
#include <bits/libc-header-start.h>



/* Get definitions of __intmax_t and __uintmax_t.  */
#include <bits/types.h>

/* Get machine-dependent vector math functions declarations.  */
#include <bits/math-vector.h>

/* Gather machine dependent type support.  */
#include <bits/floatn.h>

/* Value returned on overflow.  With IEEE 754 floating point, this is
   +Infinity, otherwise the largest representable positive value.  */
#if __GNUC_PREREQ (3, 3)
# define HUGE_VAL (__builtin_huge_val ())
#else
/* This may provoke compiler warnings, and may not be rounded to
   +Infinity in all IEEE 754 rounding modes, but is the best that can
   be done in ISO C while remaining a constant expression.  10,000 is
   greater than the maximum (decimal) exponent for all supported
   floating-point formats and widths.  */
# define HUGE_VAL 1e10000
#endif
#if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)
# define HUGE_VAL_F16 (__builtin_huge_valf16 ())
#endif
#if __HAVE_FLOAT32 && __GLIBC_USE (IEC_60559_TYPES_EXT)
# define HUGE_VAL_F32 (__builtin_huge_valf32 ())
#endif
#if __HAVE_FLOAT64 && __GLIBC_USE (IEC_60559_TYPES_EXT)
# define HUGE_VAL_F64 (__builtin_huge_valf64 ())
#endif
#if __HAVE_FLOAT128 && __GLIBC_USE (IEC_60559_TYPES_EXT)
# define HUGE_VAL_F128 (__builtin_huge_valf128 ())
#endif
#if __HAVE_FLOAT32X && __GLIBC_USE (IEC_60559_TYPES_EXT)
# define HUGE_VAL_F32X (__builtin_huge_valf32x ())
#endif
#if __HAVE_FLOAT64X && __GLIBC_USE (IEC_60559_TYPES_EXT)
# define HUGE_VAL_F64X (__builtin_huge_valf64x ())
#endif
#if __HAVE_FLOAT128X && __GLIBC_USE (IEC_60559_TYPES_EXT)
# define HUGE_VAL_F128X (__builtin_huge_valf128x ())
#endif

#ifdef __USE_ISOC99
/* IEEE positive infinity.  */
# if __GNUC_PREREQ (3, 3)
#  define INFINITY (__builtin_inff ())
# else
#  define INFINITY HUGE_VALF
# endif



/* Get __GLIBC_FLT_EVAL_METHOD.  */
#include <bits/flt-eval-method.h>

#ifdef __USE_ISOC99
/* Define the following typedefs.

    float_t	floating-point type at least as wide as `float' used
		to evaluate `float' expressions
    double_t	floating-point type at least as wide as `double' used
		to evaluate `double' expressions
*/
typedef float float_t;
typedef double double_t;
# elif __GLIBC_FLT_EVAL_METHOD == 1
typedef double float_t;
typedef double double_t;
# elif __GLIBC_FLT_EVAL_METHOD == 2
typedef long_double float_t;
typedef long_double double_t;
# elif __GLIBC_FLT_EVAL_METHOD == 32
typedef _Float32 float_t;
typedef double double_t;
# elif __GLIBC_FLT_EVAL_METHOD == 33
typedef _Float32x float_t;
typedef _Float32x double_t;
# elif __GLIBC_FLT_EVAL_METHOD == 64
typedef _Float64 float_t;
typedef _Float64 double_t;
# elif __GLIBC_FLT_EVAL_METHOD == 65
typedef _Float64x float_t;
typedef _Float64x double_t;
# elif __GLIBC_FLT_EVAL_METHOD == 128
typedef _Float128 float_t;
typedef _Float128 double_t;
# elif __GLIBC_FLT_EVAL_METHOD == 129
typedef _Float128x float_t;
typedef _Float128x double_t;

/* Define macros for the return values of ilogb and llogb, based on
   __FP_LOGB0_IS_MIN and __FP_LOGBNAN_IS_MIN.

    FP_ILOGB0	Expands to a value returned by `ilogb (0.0)'.
    FP_ILOGBNAN	Expands to a value returned by `ilogb (NAN)'.
    FP_LLOGB0	Expands to a value returned by `llogb (0.0)'.
    FP_LLOGBNAN	Expands to a value returned by `llogb (NAN)'.

*/


/* Get the architecture specific values describing the floating-point
   evaluation.  The following symbols will get defined:

    FP_FAST_FMA
    FP_FAST_FMAF
    FP_FAST_FMAL
		If defined it indicates that the `fma' function
		generally executes about as fast as a multiply and an add.
		This macro is defined only iff the `fma' function is
		implemented directly with a hardware multiply-add instructions.
*/

#include <bits/fp-fast.h>
# define FP_INT_UPWARD 0
# define FP_INT_DOWNWARD 1
# define FP_INT_TOWARDZERO 2
# define FP_INT_TONEARESTFROMZERO 3
# define FP_INT_TONEAREST 4

/* The file <bits/mathcalls.h> contains the prototypes for all the
   actual math functions.  These macros are used for those prototypes,
   so we can easily declare each function as both `name' and `__name',
   and can declare the float versions `namef' and `__namef'.  */






/* This variable is used by `gamma' and `lgamma'.  */
extern int signgam;
#endif


# define FP_NAN 0
# define FP_INFINITE 1
# define FP_ZERO 2
# define FP_SUBNORMAL 3
# define FP_NORMAL 4




/* Some useful constants.  */
#if defined __USE_MISC || defined __USE_XOPEN
# define M_E		2.7182818284590452354	/* e */
# define M_LOG2E	1.4426950408889634074	/* log_2 e */
# define M_LOG10E	0.43429448190325182765	/* log_10 e */
# define M_LN2		0.69314718055994530942	/* log_e 2 */
# define M_LN10		2.30258509299404568402	/* log_e 10 */
# define M_PI		3.14159265358979323846	/* pi */
# define M_PI_2		1.57079632679489661923	/* pi/2 */
# define M_PI_4		0.78539816339744830962	/* pi/4 */
# define M_1_PI		0.31830988618379067154	/* 1/pi */
# define M_2_PI		0.63661977236758134308	/* 2/pi */
# define M_2_SQRTPI	1.12837916709551257390	/* 2/sqrt(pi) */
# define M_SQRT2	1.41421356237309504880	/* sqrt(2) */
# define M_SQRT1_2	0.70710678118654752440	/* 1/sqrt(2) */
#endif

/* GNU extension to provide float constants with similar names.  */
#ifdef __USE_GNU
# define M_Ef		2.7182818284590452354	/* e */
# define M_LOG2Ef	1.4426950408889634074	/* log_2 e */
# define M_LOG10Ef	0.43429448190325182765	/* log_10 e */
# define M_LN2f		0.69314718055994530942	/* log_e 2 */
# define M_LN10f	2.30258509299404568402	/* log_e 10 */
# define M_PIf		3.14159265358979323846	/* pi */
# define M_PI_2f	1.57079632679489661923	/* pi/2 */
# define M_PI_4f	0.78539816339744830962	/* pi/4 */
# define M_1_PIf	0.31830988618379067154	/* 1/pi */
# define M_2_PIf	0.63661977236758134308	/* 2/pi */
# define M_2_SQRTPIf	1.12837916709551257390	/* 2/sqrt(pi) */
# define M_SQRT2f	1.41421356237309504880	/* sqrt(2) */
# define M_SQRT1_2f	0.70710678118654752440	/* 1/sqrt(2) */
#endif

/* The above constants are not adequate for computation using `long double's.
   Therefore we provide as an extension constants with similar names as a
   GNU extension.  Provide enough digits for the 128-bit IEEE quad.  */
#ifdef __USE_GNU
# define M_El		2.718281828459045235360287471352662498 /* e */
# define M_LOG2El	1.442695040888963407359924681001892137 /* log_2 e */
# define M_LOG10El	0.434294481903251827651128918916605082 /* log_10 e */
# define M_LN2l		0.693147180559945309417232121458176568 /* log_e 2 */
# define M_LN10l	2.302585092994045684017991454684364208 /* log_e 10 */
# define M_PIl		3.141592653589793238462643383279502884 /* pi */
# define M_PI_2l	1.570796326794896619231321691639751442 /* pi/2 */
# define M_PI_4l	0.785398163397448309615660845819875721 /* pi/4 */
# define M_1_PIl	0.318309886183790671537767526745028724 /* 1/pi */
# define M_2_PIl	0.636619772367581343075535053490057448 /* 2/pi */
# define M_2_SQRTPIl	1.128379167095512573896158903121545172 /* 2/sqrt(pi) */
# define M_SQRT2l	1.414213562373095048801688724209698079 /* sqrt(2) */
# define M_SQRT1_2l	0.707106781186547524400844362104849039 /* 1/sqrt(2) */
#endif





#endif /* math.h  */
