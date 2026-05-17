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


#ifndef BSON_OID_H
#define BSON_OID_H


#include <time.h>

#include <bson/bson-context.h>
#include <bson/bson-macros.h>
#include <bson/bson-types.h>
#include <bson/bson-endian.h>





extern int
bson_oid_compare (const bson_oid_t *oid1, const bson_oid_t *oid2);
extern void
bson_oid_copy (const bson_oid_t *src, bson_oid_t *dst);
extern bool
bson_oid_equal (const bson_oid_t *oid1, const bson_oid_t *oid2);
extern bool
bson_oid_is_valid (const char *str, size_t length);
extern time_t
bson_oid_get_time_t (const bson_oid_t *oid);
extern uint32_t
bson_oid_hash (const bson_oid_t *oid);
extern void
bson_oid_init (bson_oid_t *oid, bson_context_t *context);
extern void
bson_oid_init_from_data (bson_oid_t *oid, const uint8_t *data);
extern void
bson_oid_init_from_string (bson_oid_t *oid, const char *str);
extern void
bson_oid_init_sequence (bson_oid_t *oid, bson_context_t *context)
   ;//xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;_FOR (bson_oid_init);
extern void
bson_oid_to_string (const bson_oid_t *oid, char str[25]);


/**
 * bson_oid_compare_unsafe:
 * @oid1: A bson_oid_t.
 * @oid2: A bson_oid_t.
 *
 * Performs a qsort() style comparison between @oid1 and @oid2.
 *
 * This function is meant to be as fast as possible and therefore performs
 * no argument validation. That is the callers responsibility.
 *
 * Returns: An integer < 0 if @oid1 is less than @oid2. Zero if they are equal.
 *          An integer > 0 if @oid1 is greater than @oid2.
 */




#endif /* BSON_OID_H */
