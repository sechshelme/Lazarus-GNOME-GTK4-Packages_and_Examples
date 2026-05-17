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


#ifndef BSON_ITER_H
#define BSON_ITER_H


#include "bson.h"
#include <bson/bson-endian.h>
#include <bson/bson-macros.h>
#include <bson/bson-types.h>





extern const bson_value_t *
bson_iter_value (bson_iter_t *iter);


/**
 * bson_iter_utf8_len_unsafe:
 * @iter: a bson_iter_t.
 *
 * Returns the length of a string currently pointed to by @iter. This performs
 * no validation so the is responsible for knowing the BSON is valid. Calling
 * bson_validate() is one way to do this ahead of time.
 */

extern void
bson_iter_array (const bson_iter_t *iter,
                 uint32_t *array_len,
                 const uint8_t **array);


extern void
bson_iter_binary (const bson_iter_t *iter,
                  bson_subtype_t *subtype,
                  uint32_t *binary_len,
                  const uint8_t **binary);


extern const char *
bson_iter_code (const bson_iter_t *iter, uint32_t *length);


/**
 * bson_iter_code_unsafe:
 * @iter: A bson_iter_t.
 * @length: A location for the length of the resulting string.
 *
 * Like bson_iter_code() but performs no integrity checks.
 *
 * Returns: A string that should not be modified or freed.
 */

extern const char *
bson_iter_codewscope (const bson_iter_t *iter,
                      uint32_t *length,
                      uint32_t *scope_len,
                      const uint8_t **scope);


extern void
bson_iter_dbpointer (const bson_iter_t *iter,
                     uint32_t *collection_len,
                     const char **collection,
                     const bson_oid_t **oid);


extern void
bson_iter_document (const bson_iter_t *iter,
                    uint32_t *document_len,
                    const uint8_t **document);


extern double
bson_iter_double (const bson_iter_t *iter);

extern double
bson_iter_as_double (const bson_iter_t *iter);

/**
 * bson_iter_double_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_double() but does not perform an integrity checking.
 *
 * Returns: A double.
 */

extern bool
bson_iter_init (bson_iter_t *iter, const bson_t *bson);

extern bool
bson_iter_init_from_data (bson_iter_t *iter,
                          const uint8_t *data,
                          size_t length);


extern bool
bson_iter_init_find (bson_iter_t *iter, const bson_t *bson, const char *key);


extern bool
bson_iter_init_find_w_len (bson_iter_t *iter,
                           const bson_t *bson,
                           const char *key,
                           int keylen);


extern bool
bson_iter_init_find_case (bson_iter_t *iter,
                          const bson_t *bson,
                          const char *key);

extern bool
bson_iter_init_from_data_at_offset (bson_iter_t *iter,
                                    const uint8_t *data,
                                    size_t length,
                                    uint32_t offset,
                                    uint32_t keylen);

extern int32_t
bson_iter_int32 (const bson_iter_t *iter);


/**
 * bson_iter_int32_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_int32() but with no integrity checking.
 *
 * Returns: A 32-bit signed integer.
 */

extern int64_t
bson_iter_int64 (const bson_iter_t *iter);


extern int64_t
bson_iter_as_int64 (const bson_iter_t *iter);


/**
 * bson_iter_int64_unsafe:
 * @iter: a bson_iter_t.
 *
 * Similar to bson_iter_int64() but without integrity checking.
 *
 * Returns: A 64-bit signed integer.
 */

extern bool
bson_iter_find (bson_iter_t *iter, const char *key);


extern bool
bson_iter_find_w_len (bson_iter_t *iter, const char *key, int keylen);


extern bool
bson_iter_find_case (bson_iter_t *iter, const char *key);


extern bool
bson_iter_find_descendant (bson_iter_t *iter,
                           const char *dotkey,
                           bson_iter_t *descendant);


extern bool
bson_iter_next (bson_iter_t *iter);


extern const bson_oid_t *
bson_iter_oid (const bson_iter_t *iter);


/**
 * bson_iter_oid_unsafe:
 * @iter: A #bson_iter_t.
 *
 * Similar to bson_iter_oid() but performs no integrity checks.
 *
 * Returns: A #bson_oid_t that should not be modified or freed.
 */

extern bool
bson_iter_decimal128 (const bson_iter_t *iter, bson_decimal128_t *dec);


/**
 * bson_iter_decimal128_unsafe:
 * @iter: A #bson_iter_t.
 *
 * Similar to bson_iter_decimal128() but performs no integrity checks.
 *
 * Returns: A #bson_decimal128_t.
 */

extern const char *
bson_iter_key (const bson_iter_t *iter);

extern uint32_t
bson_iter_key_len (const bson_iter_t *iter);


/**
 * bson_iter_key_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_key() but performs no integrity checking.
 *
 * Returns: A string that should not be modified or freed.
 */

extern const char *
bson_iter_utf8 (const bson_iter_t *iter, uint32_t *length);


/**
 * bson_iter_utf8_unsafe:
 *
 * Similar to bson_iter_utf8() but performs no integrity checking.
 *
 * Returns: A string that should not be modified or freed.
 */


extern char *
bson_iter_dup_utf8 (const bson_iter_t *iter, uint32_t *length);


extern int64_t
bson_iter_date_time (const bson_iter_t *iter);


extern time_t
bson_iter_time_t (const bson_iter_t *iter);


/**
 * bson_iter_time_t_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_time_t() but performs no integrity checking.
 *
 * Returns: A time_t containing the number of seconds since UNIX epoch
 *          in UTC.
 */


extern void
bson_iter_timeval (const bson_iter_t *iter, struct timeval *tv);


/**
 * bson_iter_timeval_unsafe:
 * @iter: A bson_iter_t.
 * @tv: A struct timeval.
 *
 * Similar to bson_iter_timeval() but performs no integrity checking.
 */

extern void
bson_iter_timestamp (const bson_iter_t *iter,
                     uint32_t *timestamp,
                     uint32_t *increment);


extern bool
bson_iter_bool (const bson_iter_t *iter);


/**
 * bson_iter_bool_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_bool() but performs no integrity checking.
 *
 * Returns: true or false.
 */

extern bool
bson_iter_as_bool (const bson_iter_t *iter);


extern const char *
bson_iter_regex (const bson_iter_t *iter, const char **options);


extern const char *
bson_iter_symbol (const bson_iter_t *iter, uint32_t *length);


extern bson_type_t
bson_iter_type (const bson_iter_t *iter);


/**
 * bson_iter_type_unsafe:
 * @iter: A bson_iter_t.
 *
 * Similar to bson_iter_type() but performs no integrity checking.
 *
 * Returns: A bson_type_t.
 */

extern bool
bson_iter_recurse (const bson_iter_t *iter, bson_iter_t *child);


extern void
bson_iter_overwrite_int32 (bson_iter_t *iter, int32_t value);


extern void
bson_iter_overwrite_int64 (bson_iter_t *iter, int64_t value);


extern void
bson_iter_overwrite_double (bson_iter_t *iter, double value);


extern void
bson_iter_overwrite_decimal128 (bson_iter_t *iter,
                                const bson_decimal128_t *value);


extern void
bson_iter_overwrite_bool (bson_iter_t *iter, bool value);


extern void
bson_iter_overwrite_oid (bson_iter_t *iter, const bson_oid_t *value);


extern void
bson_iter_overwrite_timestamp (bson_iter_t *iter,
                               uint32_t timestamp,
                               uint32_t increment);


extern void
bson_iter_overwrite_date_time (bson_iter_t *iter, int64_t value);


extern bool
bson_iter_visit_all (bson_iter_t *iter,
                     const bson_visitor_t *visitor,
                     void *data);

extern uint32_t
bson_iter_offset (bson_iter_t *iter);





#endif /* BSON_ITER_H */
