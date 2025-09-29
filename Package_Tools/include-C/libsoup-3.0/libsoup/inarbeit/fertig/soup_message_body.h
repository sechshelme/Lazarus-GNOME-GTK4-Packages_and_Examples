/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2000-2003, Ximian, Inc.
 */

#pragma once

#include "soup-types.h"



typedef enum {
	SOUP_MEMORY_STATIC,
	SOUP_MEMORY_TAKE,
	SOUP_MEMORY_COPY,
} SoupMemoryUse;

typedef struct {
	const char *data;
	goffset     length;
} SoupMessageBody;

extern
GType soup_message_body_get_type (void);
#define SOUP_TYPE_MESSAGE_BODY (soup_message_body_get_type ())

extern
SoupMessageBody *soup_message_body_new           (void);

extern
SoupMessageBody *soup_message_body_ref           (SoupMessageBody *body);

extern
void             soup_message_body_unref         (SoupMessageBody *body);

extern
void             soup_message_body_set_accumulate(SoupMessageBody *body,
						  gboolean         accumulate);
extern
gboolean         soup_message_body_get_accumulate(SoupMessageBody *body);

extern
void             soup_message_body_append        (SoupMessageBody *body,
						  SoupMemoryUse    use,
						  gconstpointer    data,
						  gsize            length);
extern
void             soup_message_body_append_take   (SoupMessageBody *body,
						  guchar          *data,
						  gsize            length);
extern
void             soup_message_body_append_bytes (SoupMessageBody *body,
						  GBytes          *buffer);
extern
void             soup_message_body_truncate      (SoupMessageBody *body);
extern
void             soup_message_body_complete      (SoupMessageBody *body);

extern
GBytes          *soup_message_body_flatten       (SoupMessageBody *body);

extern
GBytes          *soup_message_body_get_chunk     (SoupMessageBody *body,
						  goffset          offset);

extern
void             soup_message_body_got_chunk     (SoupMessageBody *body,
						  GBytes          *chunk);
extern
void             soup_message_body_wrote_chunk   (SoupMessageBody *body,
						  GBytes          *chunk);


