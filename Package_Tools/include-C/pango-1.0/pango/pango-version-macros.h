/* Pango - Internationalized text layout and rendering library
 * Copyright (C) 1999 Red Hat Software
 * Copyright (C) 2012 Ryan Lortie, Matthias Clasen and Emmanuele Bassi
 * Copyright (C) 2016 Chun-wei Fan
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __PANGO_VERSION_H__
#define __PANGO_VERSION_H__

#include <pango/pango-features.h>

#include <glib.h>

#ifndef _PANGO_EXTERN
#define _PANGO_EXTERN extern
#endif

#define extern                   _PANGO_EXTERN

/* XXX: Every new stable minor release bump should add a macro here */

/**
 * PANGO_VERSION_1_2:
 *
 * A macro that evaluates to the 1.2 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_2        (G_ENCODE_VERSION (1, 2))

/**
 * PANGO_VERSION_1_4:
 *
 * A macro that evaluates to the 1.4 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_4        (G_ENCODE_VERSION (1, 4))

/**
 * PANGO_VERSION_1_6:
 *
 * A macro that evaluates to the 1.6 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_6        (G_ENCODE_VERSION (1, 6))

/**
 * PANGO_VERSION_1_8:
 *
 * A macro that evaluates to the 1.8 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_8        (G_ENCODE_VERSION (1, 8))

/**
 * PANGO_VERSION_1_10:
 *
 * A macro that evaluates to the 1.10 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_10       (G_ENCODE_VERSION (1, 10))

/**
 * PANGO_VERSION_1_12:
 *
 * A macro that evaluates to the 1.12 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_12       (G_ENCODE_VERSION (1, 12))

/**
 * PANGO_VERSION_1_14:
 *
 * A macro that evaluates to the 1.14 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_14       (G_ENCODE_VERSION (1, 14))

/**
 * PANGO_VERSION_1_16:
 *
 * A macro that evaluates to the 1.16 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_16       (G_ENCODE_VERSION (1, 16))

/**
 * PANGO_VERSION_1_18:
 *
 * A macro that evaluates to the 1.18 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_18       (G_ENCODE_VERSION (1, 18))

/**
 * PANGO_VERSION_1_20:
 *
 * A macro that evaluates to the 1.20 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_20       (G_ENCODE_VERSION (1, 20))

/**
 * PANGO_VERSION_1_22:
 *
 * A macro that evaluates to the 1.22 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_22       (G_ENCODE_VERSION (1, 22))

/**
 * PANGO_VERSION_1_24:
 *
 * A macro that evaluates to the 1.24 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_24       (G_ENCODE_VERSION (1, 24))

/**
 * PANGO_VERSION_1_26:
 *
 * A macro that evaluates to the 1.26 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_26       (G_ENCODE_VERSION (1, 26))

/**
 * PANGO_VERSION_1_28:
 *
 * A macro that evaluates to the 1.28 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_28       (G_ENCODE_VERSION (1, 28))

/**
 * PANGO_VERSION_1_30:
 *
 * A macro that evaluates to the 1.30 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_30       (G_ENCODE_VERSION (1, 30))

/**
 * PANGO_VERSION_1_32:
 *
 * A macro that evaluates to the 1.32 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_32       (G_ENCODE_VERSION (1, 32))

/**
 * PANGO_VERSION_1_34:
 *
 * A macro that evaluates to the 1.34 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_34       (G_ENCODE_VERSION (1, 34))

/**
 * PANGO_VERSION_1_36:
 *
 * A macro that evaluates to the 1.36 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_36       (G_ENCODE_VERSION (1, 36))

/**
 * PANGO_VERSION_1_38:
 *
 * A macro that evaluates to the 1.38 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_38       (G_ENCODE_VERSION (1, 38))

/**
 * PANGO_VERSION_1_40:
 *
 * A macro that evaluates to the 1.40 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_40       (G_ENCODE_VERSION (1, 40))

/**
 * PANGO_VERSION_1_42:
 *
 * A macro that evaluates to the 1.42 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.42
 */
#define PANGO_VERSION_1_42       (G_ENCODE_VERSION (1, 42))

/**
 * PANGO_VERSION_1_44:
 *
 * A macro that evaluates to the 1.44 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.44
 */
#define PANGO_VERSION_1_44       (G_ENCODE_VERSION (1, 44))

/**
 * PANGO_VERSION_1_46:
 *
 * A macro that evaluates to the 1.46 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.46
 */
#define PANGO_VERSION_1_46       (G_ENCODE_VERSION (1, 46))

/**
 * PANGO_VERSION_1_48:
 *
 * A macro that evaluates to the 1.48 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.48
 */
#define PANGO_VERSION_1_48       (G_ENCODE_VERSION (1, 48))

/**
 * PANGO_VERSION_1_50:
 *
 * A macro that evaluates to the 1.50 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.50
 */
#define PANGO_VERSION_1_50       (G_ENCODE_VERSION (1, 50))

/**
 * PANGO_VERSION_1_52:
 *
 * A macro that evaluates to the 1.52 version of Pango, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.52
 */
#define PANGO_VERSION_1_52       (G_ENCODE_VERSION (1, 52))

/* evaluates to the current stable version; for development cycles,
 * this means the next stable target
 */
#if (PANGO_VERSION_MINOR % 2)
#define PANGO_VERSION_CUR_STABLE         (G_ENCODE_VERSION (PANGO_VERSION_MAJOR, PANGO_VERSION_MINOR + 1))
#else
#define PANGO_VERSION_CUR_STABLE         (G_ENCODE_VERSION (PANGO_VERSION_MAJOR, PANGO_VERSION_MINOR))
#endif

/* evaluates to the previous stable version */
#if (PANGO_VERSION_MINOR % 2)
#define PANGO_VERSION_PREV_STABLE        (G_ENCODE_VERSION (PANGO_VERSION_MAJOR, PANGO_VERSION_MINOR - 1))
#else
#define PANGO_VERSION_PREV_STABLE        (G_ENCODE_VERSION (PANGO_VERSION_MAJOR, PANGO_VERSION_MINOR - 2))
#endif

/**
 * PANGO_VERSION_MIN_REQUIRED:
 *
 * A macro that should be defined by the user prior to including
 * the pango.h header.
 * The definition should be one of the predefined Pango version
 * macros: %PANGO_VERSION_1_2, %PANGO_VERSION_1_4,...
 *
 * This macro defines the earliest version of Pango that the package is
 * required to be able to compile against.
 *
 * If the compiler is configured to warn about the use of deprecated
 * functions, then using functions that were deprecated in version
 * %PANGO_VERSION_MIN_REQUIRED or earlier will cause warnings (but
 * using functions deprecated in later releases will not).
 *
 * Since: 1.42
 */
/* If the package sets PANGO_VERSION_MIN_REQUIRED to some future
 * PANGO_VERSION_X_Y value that we don't know about, it will compare as
 * 0 in preprocessor tests.
 */
#ifndef PANGO_VERSION_MIN_REQUIRED
# define PANGO_VERSION_MIN_REQUIRED      (PANGO_VERSION_CUR_STABLE)
#elif PANGO_VERSION_MIN_REQUIRED == 0
# undef  PANGO_VERSION_MIN_REQUIRED
# define PANGO_VERSION_MIN_REQUIRED      (PANGO_VERSION_CUR_STABLE + 2)
#endif

/**
 * PANGO_VERSION_MAX_ALLOWED:
 *
 * A macro that should be defined by the user prior to including
 * the glib.h header.
 * The definition should be one of the predefined Pango version
 * macros: %PANGO_VERSION_1_2, %PANGO_VERSION_1_4,...
 *
 * This macro defines the latest version of the Pango API that the
 * package is allowed to make use of.
 *
 * If the compiler is configured to warn about the use of deprecated
 * functions, then using functions added after version
 * %PANGO_VERSION_MAX_ALLOWED will cause warnings.
 *
 * Unless you are using PANGO_VERSION_CHECK() or the like to compile
 * different code depending on the Pango version, then this should be
 * set to the same value as %PANGO_VERSION_MIN_REQUIRED.
 *
 * Since: 1.42
 */
#if !defined (PANGO_VERSION_MAX_ALLOWED) || (PANGO_VERSION_MAX_ALLOWED == 0)
# undef PANGO_VERSION_MAX_ALLOWED
# define PANGO_VERSION_MAX_ALLOWED      (PANGO_VERSION_CUR_STABLE)
#endif

/* sanity checks */
#if PANGO_VERSION_MIN_REQUIRED > PANGO_VERSION_CUR_STABLE
#error "PANGO_VERSION_MIN_REQUIRED must be <= PANGO_VERSION_CUR_STABLE"
#endif
#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_MIN_REQUIRED
#error "PANGO_VERSION_MAX_ALLOWED must be >= PANGO_VERSION_MIN_REQUIRED"
#endif
#if PANGO_VERSION_MIN_REQUIRED < PANGO_VERSION_1_2
#error "PANGO_VERSION_MIN_REQUIRED must be >= PANGO_VERSION_1_2"
#endif

/* These macros are used to mark deprecated functions in Pango headers,
 * and thus have to be exposed in installed headers.
 */
#ifdef PANGO_DISABLE_DEPRECATION_WARNINGS
# define PANGO_DEPRECATED                       _PANGO_EXTERN
# define PANGO_DEPRECATED_FOR(f)                _PANGO_EXTERN
# define PANGO_UNAVAILABLE(maj,min)             _PANGO_EXTERN
#else
# define PANGO_DEPRECATED                       G_DEPRECATED _PANGO_EXTERN
# define PANGO_DEPRECATED_FOR(f)                G_DEPRECATED_FOR(f) _PANGO_EXTERN
# define PANGO_UNAVAILABLE(maj,min)             G_UNAVAILABLE(maj,min) _PANGO_EXTERN
#endif

/* XXX: Every new stable minor release should add a set of macros here */
#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_2
# define extern                PANGO_DEPRECATED
# define extern_FOR(f)         PANGO_DEPRECATED_FOR(f)
#else
# define extern                _PANGO_EXTERN
# define extern_FOR(f)         _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_2
# define extern                 PANGO_UNAVAILABLE(1, 2)
#else
# define extern                 _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_4
# define extern                PANGO_DEPRECATED
# define extern_FOR(f)         PANGO_DEPRECATED_FOR(f)
#else
# define extern                _PANGO_EXTERN
# define extern_FOR(f)         _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_4
# define extern                 PANGO_UNAVAILABLE(1, 4)
#else
# define extern                 _PANGO_EXTERN
#endif


#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_6
# define extern                PANGO_DEPRECATED
# define extern_FOR(f)         PANGO_DEPRECATED_FOR(f)
#else
# define extern                _PANGO_EXTERN
# define extern_FOR(f)         _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_6
# define extern                 PANGO_UNAVAILABLE(1, 6)
#else
# define extern                 _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_8
# define extern                PANGO_DEPRECATED
# define extern_FOR(f)         PANGO_DEPRECATED_FOR(f)
#else
# define extern                _PANGO_EXTERN
# define extern_FOR(f)         _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_8
# define extern                 PANGO_UNAVAILABLE(1, 8)
#else
# define extern                 _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_10
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_10
# define extern                PANGO_UNAVAILABLE(1, 10)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_12
# define extern                PANGO_UNAVAILABLE(1, 12)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_12
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_14
# define extern                PANGO_UNAVAILABLE(1, 14)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_14
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_16
# define extern                PANGO_UNAVAILABLE(1, 16)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_16
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_18
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_18
# define extern                PANGO_UNAVAILABLE(1, 18)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_20
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_20
# define extern                PANGO_UNAVAILABLE(1, 20)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_22
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_22
# define extern                PANGO_UNAVAILABLE(1, 22)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_24
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_24
# define extern                PANGO_UNAVAILABLE(1, 24)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_26
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_26
# define extern                PANGO_UNAVAILABLE(1, 26)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_28
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_28
# define extern                PANGO_UNAVAILABLE(1, 28)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_30
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_30
# define extern                PANGO_UNAVAILABLE(1, 30)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_32
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_32
# define extern                PANGO_UNAVAILABLE(1, 32)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_34
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_34
# define extern                PANGO_UNAVAILABLE(1, 34)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_36
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_36
# define extern                PANGO_UNAVAILABLE(1, 36)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_38
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_38
# define extern                PANGO_UNAVAILABLE(1, 38)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_40
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_40
# define extern                PANGO_UNAVAILABLE(1, 40)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_42
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_42
# define extern                PANGO_UNAVAILABLE(1, 42)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_44
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_44
# define extern                PANGO_UNAVAILABLE(1, 44)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_46
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_46
# define extern                PANGO_UNAVAILABLE(1, 46)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_48
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_48
# define extern                PANGO_UNAVAILABLE(1, 48)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_50
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_50
# define extern                PANGO_UNAVAILABLE(1, 50)
#else
# define extern                _PANGO_EXTERN
#endif

#if PANGO_VERSION_MIN_REQUIRED >= PANGO_VERSION_1_52
# define extern               PANGO_DEPRECATED
# define extern_FOR(f)        PANGO_DEPRECATED_FOR(f)
#else
# define extern               _PANGO_EXTERN
# define extern_FOR(f)        _PANGO_EXTERN
#endif

#if PANGO_VERSION_MAX_ALLOWED < PANGO_VERSION_1_52
# define extern                PANGO_UNAVAILABLE(1, 52)
#else
# define extern                _PANGO_EXTERN
#endif

#endif /* __PANGO_VERSION_H__ */
