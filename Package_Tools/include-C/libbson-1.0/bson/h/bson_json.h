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

#include <bson/bson-prelude.h>


#ifndef BSON_JSON_H
#define BSON_JSON_H


#include "bson.h"





typedef struct _bson_json_reader_t bson_json_reader_t;


typedef enum {
   BSON_JSON_ERROR_READ_CORRUPT_JS = 1,
   BSON_JSON_ERROR_READ_INVALID_PARAM,
   BSON_JSON_ERROR_READ_CB_FAILURE,
} bson_json_error_code_t;


/**
 * BSON_MAX_LEN_UNLIMITED
 *
 * Denotes unlimited length limit when converting BSON to JSON.
 */
#define BSON_MAX_LEN_UNLIMITED -1

/**
 * bson_json_mode_t:
 *
 * This enumeration contains the different modes to serialize BSON into extended
 * JSON.
 */
typedef enum {
   BSON_JSON_MODE_LEGACY,
   BSON_JSON_MODE_CANONICAL,
   BSON_JSON_MODE_RELAXED,
} bson_json_mode_t;


extern bson_json_opts_t *
bson_json_opts_new (bson_json_mode_t mode, int32_t max_len);
extern void
bson_json_opts_destroy (bson_json_opts_t *opts);
extern void
bson_json_opts_set_outermost_array (bson_json_opts_t *opts,
                                    bool is_outermost_array);

typedef ssize_t (*bson_json_reader_cb) (void *handle,
                                        uint8_t *buf,
                                        size_t count);
typedef void (*bson_json_destroy_cb) (void *handle);


extern bson_json_reader_t *
bson_json_reader_new (void *data,
                      bson_json_reader_cb cb,
                      bson_json_destroy_cb dcb,
                      bool allow_multiple,
                      size_t buf_size);
extern bson_json_reader_t *
bson_json_reader_new_from_fd (int fd, bool close_on_destroy);
extern bson_json_reader_t *
bson_json_reader_new_from_file (const char *filename, bson_error_t *error);
extern void
bson_json_reader_destroy (bson_json_reader_t *reader);
extern int
bson_json_reader_read (bson_json_reader_t *reader,
                       bson_t *bson,
                       bson_error_t *error);
extern bson_json_reader_t *
bson_json_data_reader_new (bool allow_multiple, size_t size);
extern void
bson_json_data_reader_ingest (bson_json_reader_t *reader,
                              const uint8_t *data,
                              size_t len);





#endif /* BSON_JSON_H */
