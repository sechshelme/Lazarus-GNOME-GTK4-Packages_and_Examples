/* src/flint-config.h.  Generated from flint-config.h.in by configure.  */
/*
    Copyright (C) 2023 Albin Ahlbäck

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
*/

/* Define if system is big endian. */
/* #undef FLINT_BIG_ENDIAN */

/* Define if compiler has CLZ intrinsics */
#define FLINT_HAS_CLZ 1

/* Define if compiler has CTZ intrinsics */
#define FLINT_HAS_CTZ 1

/* Define if compiler has popcount intrinsics */
#define FLINT_HAS_POPCNT 1

/* Define if system has AVX2 */
/* #undef FLINT_HAVE_AVX2 */

/* Define if system has AVX512 */
/* #undef FLINT_HAVE_AVX512 */

/* Define if compiler has __builtin_constant_p */
#define FLINT_HAVE_CONSTANT_P 1

/* Define to use the fft_small module */
/* #undef FLINT_HAVE_FFT_SMALL */

/* Define to enable reentrant. */
/* #undef FLINT_REENTRANT */

/* Define to enable BLAS. */
/* #undef FLINT_USES_BLAS */

/* Define if system has cpu_set_t */
#define FLINT_USES_CPUSET 1

/* Define to enable the Boehm-Demers-Weise garbage collector. */
/* #undef FLINT_USES_GC */

/* Define to enable the use of pthread. */
#define FLINT_USES_PTHREAD 1

/* Define to enable thread-local storage. */
#define FLINT_USES_TLS 1

/* Define to enable use of asserts. */
/* #undef FLINT_WANT_ASSERT */

/* Define to enable use of GMP internals. */
#define FLINT_WANT_GMP_INTERNALS 1
