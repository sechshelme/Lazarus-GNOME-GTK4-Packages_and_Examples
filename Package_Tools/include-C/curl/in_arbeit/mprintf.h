#ifndef CURLINC_MPRINTF_H
#define CURLINC_MPRINTF_H
/***************************************************************************
 *                                  _   _ ____  _
 *  Project                     ___| | | |  _ \| |
 *                             / __| | | | |_) | |
 *                            | (__| |_| |  _ <| |___
 *                             \___|\___/|_| \_\_____|
 *
 * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
 *
 * This software is licensed as described in the file COPYING, which
 * you should have received as part of this distribution. The terms
 * are also available at https://curl.se/docs/copyright.html.
 *
 * You may opt to use, copy, modify, merge, publish, distribute and/or sell
 * copies of the Software, and permit persons to whom the Software is
 * furnished to do so, under the terms of the COPYING file.
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
 * KIND, either express or implied.
 *
 * SPDX-License-Identifier: curl
 *
 ***************************************************************************/

#include <stdarg.h>
#include <stdio.h> /* needed for FILE */
#include "curl.h"  /* for extern */

#ifdef  __cplusplus
extern "C" {
#endif


extern int curl_mprintf(const char *format, ...);
extern int curl_mfprintf(FILE *fd, const char *format, ...)
;
extern int curl_msprintf(char *buffer, const char *format, ...)
;
extern int curl_msnprintf(char *buffer, size_t maxlength,
                               const char *format, ...) ;
extern int curl_mvprintf(const char *format, va_list args)
;
extern int curl_mvfprintf(FILE *fd, const char *format, va_list args)
;
extern int curl_mvsprintf(char *buffer, const char *format, va_list args)
;
extern int curl_mvsnprintf(char *buffer, size_t maxlength,
                                const char *format, va_list args)
;
extern char *curl_maprintf(const char *format, ...)
;
extern char *curl_mvaprintf(const char *format, va_list args)
;

#undef CURL_TEMP_PRINTF

#ifdef  __cplusplus
} /* end of extern "C" */
#endif

#endif /* CURLINC_MPRINTF_H */
