/* json-version-macros.h - JSON-GLib symbol versioning macros
 * 
 * This file is part of JSON-GLib
 * Copyright © 2014  Emmanuele Bassi
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __JSON_VERSION_MACROS_H__
#define __JSON_VERSION_MACROS_H__

#if !defined(__JSON_GLIB_INSIDE__) && !defined(JSON_COMPILATION)
#error "Only <json-glib/json-glib.h> can be included directly."
#endif

#include "json-version.h"


/* XXX: Each new cycle should add a new version symbol here */
/**
 * JSON_VERSION_1_0:
 *
 * The encoded representation of JSON-GLib version "1.0".
 *
 * Since: 1.0
 */
#define JSON_VERSION_1_0        (G_ENCODE_VERSION (1, 0))

/**
 * JSON_VERSION_1_2:
 *
 * The encoded representation of JSON-GLib version "1.2".
 *
 * Since: 1.2
 */
#define JSON_VERSION_1_2        (G_ENCODE_VERSION (1, 2))

/**
 * JSON_VERSION_1_4:
 *
 * The encoded representation of JSON-GLib version "1.4".
 *
 * Since: 1.4
 */
#define JSON_VERSION_1_4        (G_ENCODE_VERSION (1, 4))

/**
 * JSON_VERSION_1_6:
 *
 * The encoded representation of JSON-GLib version "1.6".
 *
 * Since: 1.6
 */
#define JSON_VERSION_1_6        (G_ENCODE_VERSION (1, 6))

/**
 * JSON_VERSION_1_8:
 *
 * The encoded representation of JSON-GLib version "1.8".
 *
 * Since: 1.8
 */
#define JSON_VERSION_1_8        (G_ENCODE_VERSION (1, 8))

/* evaluates to the current stable version; for development cycles,
 * this means the next stable target
 */

/**
 * JSON_VERSION_MIN_REQUIRED:
 *
 * A macro that should be defined by the user prior to including
 * the `json-glib/json-glib.h` header.
 *
 * The definition should be one of the predefined JSON-GLib version
 * macros: `JSON_VERSION_1_0`, `JSON_VERSION_1_2`, ...
 *
 * This macro defines the lower bound for the JSON-GLib API to use.
 *
 * If a function has been deprecated in a newer version of JSON-GLib,
 * it is possible to use this symbol to avoid the compiler warnings
 * without disabling warning for every deprecated function.
 *
 * Since: 1.0
 */
#ifndef JSON_VERSION_MIN_REQUIRED
# define JSON_VERSION_MIN_REQUIRED      (JSON_VERSION_CUR_STABLE)
#endif

/**
 * JSON_VERSION_MAX_ALLOWED:
 *
 * A macro that should be defined by the user prior to including
 * the `json-glib/json-glib.h` header.

 * The definition should be one of the predefined JSON-GLib version
 * macros: `JSON_VERSION_1_0`, `JSON_VERSION_1_2`, ...
 *
 * This macro defines the upper bound for the JSON API-GLib to use.
 *
 * If a function has been introduced in a newer version of JSON-GLib,
 * it is possible to use this symbol to get compiler warnings when
 * trying to use that function.
 *
 * Since: 1.0
 */

