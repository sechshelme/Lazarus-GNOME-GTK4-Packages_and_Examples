/*
 * @file bcon.h
 * @brief BCON (BSON C Object Notation) Declarations
 */

#include <bson/bson-prelude.h>

/*    Copyright 2009-2013 MongoDB, Inc.
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

#ifndef BCON_H_
#define BCON_H_

#include "bson.h"




typedef enum {
   BCON_TYPE_UTF8,
   BCON_TYPE_DOUBLE,
   BCON_TYPE_DOCUMENT,
   BCON_TYPE_ARRAY,
   BCON_TYPE_BIN,
   BCON_TYPE_UNDEFINED,
   BCON_TYPE_OID,
   BCON_TYPE_BOOL,
   BCON_TYPE_DATE_TIME,
   BCON_TYPE_NULL,
   BCON_TYPE_REGEX,
   BCON_TYPE_DBPOINTER,
   BCON_TYPE_CODE,
   BCON_TYPE_SYMBOL,
   BCON_TYPE_CODEWSCOPE,
   BCON_TYPE_INT32,
   BCON_TYPE_TIMESTAMP,
   BCON_TYPE_INT64,
   BCON_TYPE_DECIMAL128,
   BCON_TYPE_MAXKEY,
   BCON_TYPE_MINKEY,
   BCON_TYPE_BCON,
   BCON_TYPE_ARRAY_START,
   BCON_TYPE_ARRAY_END,
   BCON_TYPE_DOC_START,
   BCON_TYPE_DOC_END,
   BCON_TYPE_END,
   BCON_TYPE_RAW,
   BCON_TYPE_SKIP,
   BCON_TYPE_ITER,
   BCON_TYPE_ERROR,
} bcon_type_t;

typedef struct bcon_append_ctx_frame {
   int i;
   bool is_array;
   bson_t bson;
} bcon_append_ctx_frame_t;

typedef struct bcon_extract_ctx_frame {
   int i;
   bool is_array;
   bson_iter_t iter;
} bcon_extract_ctx_frame_t;

typedef struct _bcon_append_ctx_t {
   bcon_append_ctx_frame_t stack[BCON_STACK_MAX];
   int n;
} bcon_append_ctx_t;

typedef struct _bcon_extract_ctx_t {
   bcon_extract_ctx_frame_t stack[BCON_STACK_MAX];
   int n;
} bcon_extract_ctx_t;

extern void
bcon_append (bson_t *bson, ...) ;
extern void
bcon_append_ctx (bson_t *bson,
                 bcon_append_ctx_t *ctx,
                 ...) ;
extern void
bcon_append_ctx_va (bson_t *bson, bcon_append_ctx_t *ctx, va_list *va);
extern void
bcon_append_ctx_init (bcon_append_ctx_t *ctx);

extern void
bcon_extract_ctx_init (bcon_extract_ctx_t *ctx);

extern void
bcon_extract_ctx (bson_t *bson,
                  bcon_extract_ctx_t *ctx,
                  ...) ;

extern bool
bcon_extract_ctx_va (bson_t *bson, bcon_extract_ctx_t *ctx, va_list *ap);

extern bool
bcon_extract (bson_t *bson, ...) ;

extern bool
bcon_extract_va (bson_t *bson,
                 bcon_extract_ctx_t *ctx,
                 ...) ;

extern bson_t *
bcon_new (void *unused, ...) ;

/**
 * The bcon_..() functions are all declared with __attribute__((sentinel)).
 *
 * From GCC manual for "sentinel": "A valid NULL in this context is defined as
 * zero with any pointer type. If your system defines the NULL macro with an
 * integer type then you need to add an explicit cast."
 * Case in point: GCC on Solaris (at least)
 */

extern const char *
bson_bcon_magic (void);
extern const char *
bson_bcone_magic (void) ;





#endif
