/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * soup-version.h: Version information
 *
 * Copyright (C) 2012 Igalia S.L.
 */

#pragma once

#include <glib.h>



#define SOUP_MAJOR_VERSION (3)
#define SOUP_MINOR_VERSION (4)
#define SOUP_MICRO_VERSION (4)

/* xxxxxxxxx
#define SOUP_CHECK_VERSION(major, minor, micro) \
    (SOUP_MAJOR_VERSION > (major) || \
    (SOUP_MAJOR_VERSION == (major) && SOUP_MINOR_VERSION > (minor)) || \
    (SOUP_MAJOR_VERSION == (major) && SOUP_MINOR_VERSION == (minor) && \
     SOUP_MICRO_VERSION >= (micro)))
*/

/* Deprecation / Availability macros */
/**
 * SOUP_VERSION_3_0:
 *
 * A macro that evaluates to the 3.0 version of libsoup, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 3.0
 */
#define SOUP_VERSION_3_0 (G_ENCODE_VERSION (3, 0))
/**
 * SOUP_VERSION_3_2:
 *
 * A macro that evaluates to the 3.2 version of libsoup, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 3.2
 */
#define SOUP_VERSION_3_2 (G_ENCODE_VERSION (3, 2))
/**
 * SOUP_VERSION_3_4:
 *
 * A macro that evaluates to the 3.4 version of libsoup, in a format
 * that can be used by the C pre-processor.
 *
 * Since: 3.4
 */
#define SOUP_VERSION_3_4 (G_ENCODE_VERSION (3, 4))


/* evaluates to the current stable version; for development cycles,
 * this means the next stable target
 */

extern
guint    soup_get_major_version (void);

extern
guint    soup_get_minor_version (void);

extern
guint    soup_get_micro_version (void);

extern
gboolean soup_check_version     (guint major,
				 guint minor,
				 guint micro);


