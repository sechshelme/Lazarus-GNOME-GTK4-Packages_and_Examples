/*
 * Copyright 2013 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <bson/bson-prelude.h>


#ifndef BSON_STRING_H
#define BSON_STRING_H


#include <stdarg.h>

#include <bson/bson-macros.h>
#include <bson/bson-types.h>





typedef struct {
   char *str;
   uint32_t len;
   uint32_t alloc;
} bson_string_t;


extern bson_string_t *
bson_string_new (const char *str);
extern char *
bson_string_free (bson_string_t *string, bool free_segment);
extern void
bson_string_append (bson_string_t *string, const char *str);
extern void
bson_string_append_c (bson_string_t *string, char str);
extern void
bson_string_append_unichar (bson_string_t *string, bson_unichar_t unichar);
extern void
bson_string_append_printf (bson_string_t *string, const char *format, ...)
;
extern void
bson_string_truncate (bson_string_t *string, uint32_t len);
extern char *
bson_strdup (const char *str);
extern char *
bson_strdup_printf (const char *format, ...);
extern char *
bson_strdupv_printf (const char *format, va_list args) ;
extern char *
bson_strndup (const char *str, size_t n_bytes);
extern void
bson_strncpy (char *dst, const char *src, size_t size);
extern int
bson_vsnprintf (char *str, size_t size, const char *format, va_list ap)
 ;
extern int
bson_snprintf (char *str, size_t size, const char *format, ...)
 ;
extern void
bson_strfreev (char **strv);
extern size_t
bson_strnlen (const char *s, size_t maxlen);
extern int64_t
bson_ascii_strtoll (const char *str, char **endptr, int base);
extern int
bson_strcasecmp (const char *s1, const char *s2);
extern bool
bson_isspace (int c);





#endif /* BSON_STRING_H */
