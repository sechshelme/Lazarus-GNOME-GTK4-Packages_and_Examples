/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2005 Novell, Inc.
 */

#pragma once

#include "soup-types.h"



typedef struct _SoupMessageHeaders SoupMessageHeaders;
extern
GType soup_message_headers_get_type (void);
#define SOUP_TYPE_MESSAGE_HEADERS (soup_message_headers_get_type ())

typedef enum {
	SOUP_MESSAGE_HEADERS_REQUEST,
	SOUP_MESSAGE_HEADERS_RESPONSE,
	SOUP_MESSAGE_HEADERS_MULTIPART
} SoupMessageHeadersType;

extern
SoupMessageHeaders *soup_message_headers_new      (SoupMessageHeadersType type);

extern
SoupMessageHeaders *soup_message_headers_ref      (SoupMessageHeaders *hdrs);

extern
void                soup_message_headers_unref    (SoupMessageHeaders *hdrs);

extern
void                soup_message_headers_append   (SoupMessageHeaders *hdrs,
						   const char         *name,
						   const char         *value);
extern
void                soup_message_headers_replace  (SoupMessageHeaders *hdrs,
						   const char         *name,
						   const char         *value);

extern
void                soup_message_headers_remove   (SoupMessageHeaders *hdrs,
						   const char         *name);
extern
void                soup_message_headers_clear    (SoupMessageHeaders *hdrs);

extern
void                soup_message_headers_clean_connection_headers (SoupMessageHeaders *hdrs);

extern
const char         *soup_message_headers_get_one  (SoupMessageHeaders *hdrs,
						   const char         *name);
extern
const char         *soup_message_headers_get_list (SoupMessageHeaders *hdrs,
						   const char         *name);
extern
gboolean            soup_message_headers_header_contains (SoupMessageHeaders *hdrs,
							  const char         *name,
							  const char         *token);
extern
gboolean            soup_message_headers_header_equals   (SoupMessageHeaders *hdrs,
							  const char         *name,
							  const char         *value);

typedef void      (*SoupMessageHeadersForeachFunc)(const char         *name,
						   const char         *value,
						   gpointer            user_data);

extern
void                soup_message_headers_foreach  (SoupMessageHeaders *hdrs,
						   SoupMessageHeadersForeachFunc func,
						   gpointer            user_data);

extern
SoupMessageHeadersType soup_message_headers_get_headers_type (SoupMessageHeaders *hdrs);

typedef struct {
	/*< private >*/
	gpointer dummy[3];
} SoupMessageHeadersIter;

extern
void                soup_message_headers_iter_init (SoupMessageHeadersIter  *iter,
						    SoupMessageHeaders      *hdrs);
extern
gboolean            soup_message_headers_iter_next (SoupMessageHeadersIter  *iter,
						    const char             **name,
						    const char             **value);

/* Specific headers */

typedef enum {
	SOUP_ENCODING_UNRECOGNIZED,
	SOUP_ENCODING_NONE,
	SOUP_ENCODING_CONTENT_LENGTH,
	SOUP_ENCODING_EOF,
	SOUP_ENCODING_CHUNKED,
	SOUP_ENCODING_BYTERANGES
} SoupEncoding;

extern
SoupEncoding    soup_message_headers_get_encoding        (SoupMessageHeaders *hdrs);
extern
void            soup_message_headers_set_encoding        (SoupMessageHeaders *hdrs,
							  SoupEncoding        encoding);

extern
goffset         soup_message_headers_get_content_length  (SoupMessageHeaders *hdrs);
extern
void            soup_message_headers_set_content_length  (SoupMessageHeaders *hdrs,
							  goffset             content_length);

typedef enum {
	SOUP_EXPECTATION_UNRECOGNIZED = (1 << 0),
	SOUP_EXPECTATION_CONTINUE     = (1 << 1)
} SoupExpectation;

extern
SoupExpectation soup_message_headers_get_expectations    (SoupMessageHeaders *hdrs);
extern
void            soup_message_headers_set_expectations    (SoupMessageHeaders *hdrs,
							  SoupExpectation     expectations);

typedef struct {
	goffset start;
	goffset end;
} SoupRange;

extern
gboolean        soup_message_headers_get_ranges          (SoupMessageHeaders  *hdrs,
							  goffset              total_length,
							  SoupRange          **ranges,
							  int                 *length);
extern
void            soup_message_headers_free_ranges         (SoupMessageHeaders  *hdrs,
							  SoupRange           *ranges);
extern
void            soup_message_headers_set_ranges          (SoupMessageHeaders  *hdrs,
							  SoupRange           *ranges,
							  int                  length);
extern
void            soup_message_headers_set_range           (SoupMessageHeaders  *hdrs,
							  goffset              start,
							  goffset              end);

extern
gboolean        soup_message_headers_get_content_range   (SoupMessageHeaders  *hdrs,
							  goffset             *start,
							  goffset             *end,
							  goffset             *total_length);
extern
void            soup_message_headers_set_content_range   (SoupMessageHeaders  *hdrs,
							  goffset              start,
							  goffset              end,
							  goffset              total_length);


extern
const char *soup_message_headers_get_content_type     (SoupMessageHeaders  *hdrs,
						       GHashTable         **params);
extern
void        soup_message_headers_set_content_type     (SoupMessageHeaders  *hdrs,
						       const char          *content_type,
						       GHashTable          *params);

extern
gboolean soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
						       char               **disposition,
						       GHashTable         **params);
extern
void     soup_message_headers_set_content_disposition (SoupMessageHeaders  *hdrs,
						       const char          *disposition,
						       GHashTable          *params);



