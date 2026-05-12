/*
 * Copyright 2014 MongoDB, Inc.
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

#include "mongoc-prelude.h"

#ifndef MONGOC_MATCHER_H
#define MONGOC_MATCHER_H

#include <bson/bson.h>

#include "mongoc-macros.h"




typedef struct _mongoc_matcher_t mongoc_matcher_t;


extern mongoc_matcher_t *
mongoc_matcher_new (const bson_t *query, bson_error_t *error)
    ;//xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;
extern bool
mongoc_matcher_match (const mongoc_matcher_t *matcher,
                      const bson_t *document) ;//xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;
extern void
mongoc_matcher_destroy (mongoc_matcher_t *matcher) ;//xxxxxxxx ;//xxxxxxxx BSON_GNUC_DEPRECATED;;





#endif /* MONGOC_MATCHER_H */
