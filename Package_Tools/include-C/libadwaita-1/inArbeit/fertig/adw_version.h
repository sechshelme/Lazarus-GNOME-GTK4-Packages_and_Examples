/*
 * Copyright (C) 2017-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */


/**
 * ADW_MAJOR_VERSION:
 *
 * Adwaita major version component (e.g. 1 if the version is 1.2.3).
 */
#define ADW_MAJOR_VERSION              (1)

/**
 * ADW_MINOR_VERSION:
 *
 * Adwaita minor version component (e.g. 2 if the version is 1.2.3).
 */
#define ADW_MINOR_VERSION              (5)

/**
 * ADW_MICRO_VERSION:
 *
 * Adwaita micro version component (e.g. 3 if the version is 1.2.3).
 */
#define ADW_MICRO_VERSION              (0)

/**
 * ADW_VERSION:
 *
 * Adwaita version (e.g. 1.2.3).
 */
#define ADW_VERSION                    (1.5.0)

/**
 * ADW_VERSION_S:
 *
 * Adwaita version, encoded as a string, useful for printing and
 * concatenation.
 */
#define ADW_VERSION_S                  "1.5.0"

#define ADW_ENCODE_VERSION(major,minor,micro) \
        ((major) << 24 | (minor) << 16 | (micro) << 8)

/**
 * ADW_VERSION_HEX:
 *
 * Adwaita version, encoded as an hexadecimal number, useful for
 * integer comparisons.
 */
#define ADW_VERSION_HEX \
        (ADW_ENCODE_VERSION (ADW_MAJOR_VERSION, ADW_MINOR_VERSION, ADW_MICRO_VERSION))

/**
 * ADW_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to `TRUE` if the version
 * of Adwaita is greater than the required one.
 */
#define ADW_CHECK_VERSION(major,minor,micro)   \
        (ADW_MAJOR_VERSION > (major) | \
         (ADW_MAJOR_VERSION == (major) && ADW_MINOR_VERSION > (minor)) | \
         (ADW_MAJOR_VERSION == (major) && ADW_MINOR_VERSION == (minor) && \
          ADW_MICRO_VERSION >= (micro)))

/**
 * ADW_VERSION_1_1:
 *
 * A macro that evaluates to the 1.2 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.1
 */
#define ADW_VERSION_1_1 (ADW_ENCODE_VERSION (1, 1, 0))

/**
 * ADW_VERSION_1_2:
 *
 * A macro that evaluates to the 1.2 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.2
 */
#define ADW_VERSION_1_2 (ADW_ENCODE_VERSION (1, 2, 0))

/**
 * ADW_VERSION_1_3:
 *
 * A macro that evaluates to the 1.3 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.3
 */
#define ADW_VERSION_1_3 (ADW_ENCODE_VERSION (1, 3, 0))

/**
 * ADW_VERSION_1_4:
 *
 * A macro that evaluates to the 1.4 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.4
 */
#define ADW_VERSION_1_4 (ADW_ENCODE_VERSION (1, 4, 0))

/**
 * ADW_VERSION_1_5:
 *
 * A macro that evaluates to the 1.5 version of Adwaita, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 1.5
 */
#define ADW_VERSION_1_5 (ADW_ENCODE_VERSION (1, 5, 0))





extern
guint adw_get_major_version (void) ;
extern
guint adw_get_minor_version (void) ;
extern
guint adw_get_micro_version (void) ;


