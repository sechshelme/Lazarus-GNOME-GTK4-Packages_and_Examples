/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2000-2003, Ximian, Inc.
 */

#pragma once

#include "soup-types.h"
#include "soup-message-body.h"
#include "soup-message-headers.h"
#include "soup-method.h"
#include "soup-multipart.h"



#define SOUP_TYPE_MESSAGE (soup_message_get_type ())
//G_DECLARE_FINAL_TYPE (SoupMessage, soup_message, SOUP, MESSAGE, GObject)

extern
SoupMessage   *soup_message_new                   (const char        *method,
						   const char        *uri_string);
extern
SoupMessage   *soup_message_new_from_uri          (const char        *method,
						   GUri              *uri);

extern
SoupMessage   *soup_message_new_options_ping      (GUri              *base_uri);

extern
SoupMessage   *soup_message_new_from_encoded_form (const char        *method,
						   const char        *uri_string,
						   char              *encoded_form);

extern
SoupMessage   *soup_message_new_from_multipart    (const char        *uri_string,
						   SoupMultipart     *multipart);

extern
void           soup_message_set_request_body    (SoupMessage       *msg,
						 const char        *content_type,
						 GInputStream      *stream,
						 gssize             content_length);
extern
void           soup_message_set_request_body_from_bytes (SoupMessage  *msg,
							 const char   *content_type,
							 GBytes       *bytes);

extern
SoupHTTPVersion  soup_message_get_http_version    (SoupMessage       *msg);

extern
gboolean         soup_message_is_keepalive        (SoupMessage       *msg);

extern
GUri           *soup_message_get_uri             (SoupMessage       *msg);
extern
void             soup_message_set_uri             (SoupMessage       *msg,
						   GUri              *uri);
extern
GUri            *soup_message_get_first_party     (SoupMessage       *msg);
extern
void             soup_message_set_first_party     (SoupMessage       *msg,
						   GUri              *first_party);
extern
GUri            *soup_message_get_site_for_cookies (SoupMessage      *msg);
extern
void             soup_message_set_site_for_cookies (SoupMessage      *msg,
						    GUri             *site_for_cookies);
extern
void             soup_message_set_is_top_level_navigation (SoupMessage      *msg,
			                                   gboolean          is_top_level_navigation);
extern
gboolean         soup_message_get_is_top_level_navigation (SoupMessage      *msg);

typedef enum {
	SOUP_MESSAGE_NO_REDIRECT              = (1 << 1),
	SOUP_MESSAGE_NEW_CONNECTION           = (1 << 2),
	SOUP_MESSAGE_IDEMPOTENT               = (1 << 3),
	SOUP_MESSAGE_DO_NOT_USE_AUTH_CACHE    = (1 << 4),
        SOUP_MESSAGE_COLLECT_METRICS          = (1 << 5)
} SoupMessageFlags;

extern
void             soup_message_set_flags           (SoupMessage           *msg,
						   SoupMessageFlags       flags);

extern
SoupMessageFlags soup_message_get_flags           (SoupMessage           *msg);

extern
void             soup_message_add_flags           (SoupMessage           *msg,
						   SoupMessageFlags       flags);

extern
void             soup_message_remove_flags        (SoupMessage           *msg,
						   SoupMessageFlags       flags);

extern
gboolean         soup_message_query_flags         (SoupMessage           *msg,
                                                   SoupMessageFlags       flags);

extern
GTlsCertificate     *soup_message_get_tls_peer_certificate                         (SoupMessage     *msg);

extern
GTlsCertificateFlags soup_message_get_tls_peer_certificate_errors                  (SoupMessage     *msg);

extern
GTlsProtocolVersion  soup_message_get_tls_protocol_version                         (SoupMessage     *msg);

extern
const char          *soup_message_get_tls_ciphersuite_name                         (SoupMessage     *msg);

extern
void                 soup_message_set_tls_client_certificate                       (SoupMessage     *msg,
                                                                                    GTlsCertificate *certificate);

extern
void                 soup_message_tls_client_certificate_password_request_complete (SoupMessage     *msg);


/* Specialized signal handlers */
extern
guint          soup_message_add_header_handler  (SoupMessage       *msg,
						 const char        *signal,
						 const char        *header,
						 GCallback          callback,
						 gpointer           user_data);

extern
guint          soup_message_add_status_code_handler (
						 SoupMessage       *msg,
						 const char        *signal,
						 guint              status_code,
						 GCallback          callback,
						 gpointer           user_data);

extern
void           soup_message_disable_feature     (SoupMessage       *msg,
						 GType              feature_type);

extern
gboolean       soup_message_is_feature_disabled (SoupMessage       *msg,
						 GType              feature_type);


typedef enum {
	SOUP_MESSAGE_PRIORITY_VERY_LOW = 0,
	SOUP_MESSAGE_PRIORITY_LOW,
	SOUP_MESSAGE_PRIORITY_NORMAL,
	SOUP_MESSAGE_PRIORITY_HIGH,
	SOUP_MESSAGE_PRIORITY_VERY_HIGH
} SoupMessagePriority;

extern
void                soup_message_set_priority   (SoupMessage        *msg,
						 SoupMessagePriority priority);


extern
SoupMessagePriority soup_message_get_priority   (SoupMessage        *msg);

extern
const char         *soup_message_get_method     (SoupMessage        *msg);

extern
void                soup_message_set_method     (SoupMessage        *msg,
                                                 const char         *method);

extern
SoupStatus          soup_message_get_status     (SoupMessage        *msg);

extern
const char         *soup_message_get_reason_phrase (SoupMessage     *msg);

extern
SoupMessageHeaders *soup_message_get_request_headers  (SoupMessage  *msg);

extern
SoupMessageHeaders *soup_message_get_response_headers (SoupMessage  *msg);

extern
gboolean            soup_message_get_is_options_ping  (SoupMessage  *msg);

extern
void                soup_message_set_is_options_ping  (SoupMessage  *msg,
                                                       gboolean      is_options_ping);
extern
guint64             soup_message_get_connection_id    (SoupMessage *msg);

extern
GSocketAddress     *soup_message_get_remote_address   (SoupMessage *msg);

extern
SoupMessageMetrics *soup_message_get_metrics          (SoupMessage  *msg);

void                soup_message_set_force_http1      (SoupMessage *msg,
                                                       gboolean value);
gboolean            soup_message_get_force_http1      (SoupMessage *msg);


