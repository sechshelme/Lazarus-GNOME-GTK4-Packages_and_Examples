/*
 * Copyright (C) 2017-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include <glib.h>



/**
 * ADAP_MAJOR_VERSION:
 *
 * Adapta major version component (e.g. 1 if the version is 1.2.3).
 */
#define ADAP_MAJOR_VERSION              (1)

/**
 * ADAP_MINOR_VERSION:
 *
 * Adapta minor version component (e.g. 2 if the version is 1.2.3).
 */
#define ADAP_MINOR_VERSION              (5)

/**
 * ADAP_MICRO_VERSION:
 *
 * Adapta micro version component (e.g. 3 if the version is 1.2.3).
 */
#define ADAP_MICRO_VERSION              (0)

/**
 * ADAP_VERSION:
 *
 * Adapta version (e.g. 1.2.3).
 */
#define ADAP_VERSION                    (1.5.0)

/**
 * ADAP_VERSION_S:
 *
 * Adapta version, encoded as a string, useful for printing and
 * concatenation.
 */
#define ADAP_VERSION_S                  "1.5.0"

#define ADAP_ENCODE_VERSION(major,minor,micro) \
        ((major) << 24 | (minor) << 16 | (micro) << 8)

/**
 * ADAP_VERSION_HEX:
 *
 * Adapta version, encoded as an hexadecimal number, useful for
 * integer comparisons.
 */
#define ADAP_VERSION_HEX \
        (ADAP_ENCODE_VERSION (ADAP_MAJOR_VERSION, ADAP_MINOR_VERSION, ADAP_MICRO_VERSION))

/**
 * ADAP_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to `TRUE` if the version
 * of Adapta is greater than the required one.
 */
/*xxxxxxxxxxxx
#define ADAP_CHECK_VERSION(major,minor,micro)   \
        (ADAP_MAJOR_VERSION > (major) || \
         (ADAP_MAJOR_VERSION == (major) && ADAP_MINOR_VERSION > (minor)) || \
         (ADAP_MAJOR_VERSION == (major) && ADAP_MINOR_VERSION == (minor) && \
          ADAP_MICRO_VERSION >= (micro)))
*/

/**
 * ADAP_VERSION_1_1:
 *
 * A macro that evaluates to the 1.2 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.1
 */
#define ADAP_VERSION_1_1 (ADAP_ENCODE_VERSION (1, 1, 0))

/**
 * ADAP_VERSION_1_2:
 *
 * A macro that evaluates to the 1.2 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.2
 */
#define ADAP_VERSION_1_2 (ADAP_ENCODE_VERSION (1, 2, 0))

/**
 * ADAP_VERSION_1_3:
 *
 * A macro that evaluates to the 1.3 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.3
 */
#define ADAP_VERSION_1_3 (ADAP_ENCODE_VERSION (1, 3, 0))

/**
 * ADAP_VERSION_1_4:
 *
 * A macro that evaluates to the 1.4 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.4
 */
#define ADAP_VERSION_1_4 (ADAP_ENCODE_VERSION (1, 4, 0))

/**
 * ADAP_VERSION_1_5:
 *
 * A macro that evaluates to the 1.5 version of Adapta, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.5
 */
#define ADAP_VERSION_1_5 (ADAP_ENCODE_VERSION (1, 5, 0))



extern
guint adap_get_major_version (void) ;
extern
guint adap_get_minor_version (void) ;
extern
guint adap_get_micro_version (void) ;


