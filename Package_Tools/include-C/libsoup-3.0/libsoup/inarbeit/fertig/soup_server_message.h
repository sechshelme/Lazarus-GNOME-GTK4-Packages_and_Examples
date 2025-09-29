/*
 * Copyright (C) 2020 Igalia S.L.
 */

#ifndef __SOUP_SERVER_MESSAGE_H__
#define __SOUP_SERVER_MESSAGE_H__ 1

#include "soup-types.h"
#include "soup-message-body.h"
#include "soup-message-headers.h"
#include "soup-method.h"



#define SOUP_TYPE_SERVER_MESSAGE (soup_server_message_get_type ())
//G_DECLARE_FINAL_TYPE (SoupServerMessage, soup_server_message, SOUP, SERVER_MESSAGE, GObject)

extern
SoupMessageHeaders *soup_server_message_get_request_headers  (SoupServerMessage *msg);

extern
SoupMessageHeaders *soup_server_message_get_response_headers (SoupServerMessage *msg);

extern
SoupMessageBody    *soup_server_message_get_request_body     (SoupServerMessage *msg);

extern
SoupMessageBody    *soup_server_message_get_response_body    (SoupServerMessage *msg);

extern
const char         *soup_server_message_get_method           (SoupServerMessage *msg);

extern
SoupHTTPVersion     soup_server_message_get_http_version     (SoupServerMessage *msg);

extern
void                soup_server_message_set_http_version     (SoupServerMessage *msg,
                                                              SoupHTTPVersion    version);

extern
const char         *soup_server_message_get_reason_phrase    (SoupServerMessage  *msg);

extern
guint               soup_server_message_get_status           (SoupServerMessage  *msg);

extern
void                soup_server_message_set_status           (SoupServerMessage *msg,
                                                              guint              status_code,
                                                              const char        *reason_phrase);
extern
GUri               *soup_server_message_get_uri              (SoupServerMessage *msg);

extern
void                soup_server_message_set_response         (SoupServerMessage *msg,
                                                              const char        *content_type,
                                                              SoupMemoryUse      resp_use,
                                                              const char        *resp_body,
                                                              gsize              resp_length);
extern
void                soup_server_message_set_redirect          (SoupServerMessage *msg,
                                                               guint              status_code,
                                                               const char        *redirect_uri);

extern
GSocket            *soup_server_message_get_socket            (SoupServerMessage *msg);

extern
GSocketAddress     *soup_server_message_get_local_address     (SoupServerMessage *msg);

extern
GSocketAddress     *soup_server_message_get_remote_address    (SoupServerMessage *msg);

extern
const char         *soup_server_message_get_remote_host       (SoupServerMessage *msg);

extern
GIOStream          *soup_server_message_steal_connection      (SoupServerMessage *msg);

extern
gboolean            soup_server_message_is_options_ping       (SoupServerMessage *msg);

void                 soup_server_message_pause                (SoupServerMessage *msg);

void                 soup_server_message_unpause              (SoupServerMessage *msg);

GTlsCertificate     *soup_server_message_get_tls_peer_certificate          (SoupServerMessage *msg);

GTlsCertificateFlags soup_server_message_get_tls_peer_certificate_errors   (SoupServerMessage *msg);



#endif /* __SOUP_SERVER_MESSAGE_H__ */
