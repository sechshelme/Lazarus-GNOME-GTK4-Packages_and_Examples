/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2001-2003, Ximian, Inc.
 */

#ifndef __SOUP_HEADERS_H__
#define __SOUP_HEADERS_H__ 1

#include <glib.h>
#include "soup-message.h"



/* HTTP Header Parsing */

extern
gboolean    soup_headers_parse              (const char          *str,
					     int                  len,
					     SoupMessageHeaders  *dest);

extern
guint       soup_headers_parse_request      (const char          *str,
					     int                  len,
					     SoupMessageHeaders  *req_headers,
					     char               **req_method,
					     char               **req_path,
					     SoupHTTPVersion     *ver);

extern
gboolean    soup_headers_parse_status_line  (const char          *status_line,
					     SoupHTTPVersion     *ver,
					     guint               *status_code,
					     char               **reason_phrase);

extern
gboolean    soup_headers_parse_response     (const char          *str,
					     int                  len,
					     SoupMessageHeaders  *headers,
					     SoupHTTPVersion     *ver,
					     guint               *status_code,
					     char               **reason_phrase);

/* Individual header parsing */
extern
GSList     *soup_header_parse_list          (const char       *header);
extern
GSList     *soup_header_parse_quality_list  (const char       *header,
					     GSList          **unacceptable);
extern
void        soup_header_free_list           (GSList           *list);

extern
gboolean    soup_header_contains            (const char       *header,
					     const char       *token);

extern
GHashTable *soup_header_parse_param_list      (const char       *header);
extern
GHashTable *soup_header_parse_semi_param_list (const char       *header);
extern
GHashTable *soup_header_parse_param_list_strict      (const char       *header);
extern
GHashTable *soup_header_parse_semi_param_list_strict (const char       *header);
extern
void        soup_header_free_param_list       (GHashTable       *param_list);

extern
void        soup_header_g_string_append_param (GString          *string,
					       const char       *name,
					       const char       *value);
extern
void        soup_header_g_string_append_param_quoted (GString    *string,
						      const char *name,
						      const char *value);



#endif /* __SOUP_HEADERS_H__ */
