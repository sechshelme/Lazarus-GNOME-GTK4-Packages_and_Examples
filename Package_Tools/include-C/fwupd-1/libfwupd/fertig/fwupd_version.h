/*
 * Copyright (C) 2015 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
 */

#pragma once

#include <glib.h>

#if !defined(__FWUPD_H_INSIDE__) && !defined(FWUPD_COMPILATION)
#error "Only <fwupd.h> can be included directly."
#endif

/* clang-format off */
/**
 * FWUPD_MAJOR_VERSION:
 *
 * The compile-time major version
 */
#define FWUPD_MAJOR_VERSION 1

/**
 * FWUPD_MINOR_VERSION:
 *
 * The compile-time minor version
 */
#define FWUPD_MINOR_VERSION 9

/**
 * FWUPD_MICRO_VERSION:
 *
 * The compile-time micro version
 */
#define FWUPD_MICRO_VERSION 34
/* clang-format on */

/**
#define FWUPD_CHECK_VERSION(major, minor, micro)                                                   \
	(FWUPD_MAJOR_VERSION > major ||                                                            \
	 (FWUPD_MAJOR_VERSION == major && FWUPD_MINOR_VERSION > minor) ||                          \
	 (FWUPD_MAJOR_VERSION == major && FWUPD_MINOR_VERSION == minor &&                          \
	  FWUPD_MICRO_VERSION >= micro))
 */

const gchar *
fwupd_version_string(void);
