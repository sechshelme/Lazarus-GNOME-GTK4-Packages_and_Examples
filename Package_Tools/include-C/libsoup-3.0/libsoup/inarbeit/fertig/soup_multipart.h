/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2008 Red Hat, Inc.
 */

#pragma once

#include "soup-types.h"
#include "soup-message-body.h"
#include "soup-message-headers.h"



typedef struct _SoupMultipart SoupMultipart;

extern
GType soup_multipart_get_type (void);
#define SOUP_TYPE_MULTIPART (soup_multipart_get_type ())

extern
SoupMultipart *soup_multipart_new              (const char          *mime_type);
extern
SoupMultipart *soup_multipart_new_from_message (SoupMessageHeaders  *headers,
						GBytes              *body);

extern
int      soup_multipart_get_length         (SoupMultipart       *multipart);
extern
gboolean soup_multipart_get_part           (SoupMultipart       *multipart,
					    int                  part,
					    SoupMessageHeaders **headers,
					    GBytes             **body);

extern
void     soup_multipart_append_part        (SoupMultipart       *multipart,
					    SoupMessageHeaders  *headers,
					    GBytes              *body);

extern
void     soup_multipart_append_form_string (SoupMultipart       *multipart,
					    const char          *control_name,
					    const char          *data);
extern
void     soup_multipart_append_form_file   (SoupMultipart       *multipart,
					    const char          *control_name,
					    const char          *filename,
					    const char          *content_type,
					    GBytes              *body);

extern
void     soup_multipart_to_message         (SoupMultipart       *multipart,
					    SoupMessageHeaders  *dest_headers,
					    GBytes             **dest_body);

extern
void     soup_multipart_free               (SoupMultipart       *multipart);



