/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2000-2003, Ximian, Inc.
 */

#pragma once

#include "soup-types.h"
#include "soup-message.h"
#include "soup-websocket-connection.h"



#define SOUP_TYPE_SESSION soup_session_get_type ()
//G_DECLARE_DERIVABLE_TYPE (SoupSession, soup_session, SOUP, SESSION, GObject)

struct _SoupSessionClass {
        GObjectClass parent_class;

        void (* request_queued)   (SoupSession *session,
                                   SoupMessage *msg);
        void (* request_unqueued) (SoupSession *session,
                                   SoupMessage *msg);

        void (*_soup_reserved1) (void);
        void (*_soup_reserved2) (void);
        void (*_soup_reserved3) (void);
        void (*_soup_reserved4) (void);
        void (*_soup_reserved5) (void);
        void (*_soup_reserved6) (void);
        void (*_soup_reserved7) (void);
        void (*_soup_reserved8) (void);
};

/**
 * soup_session_error_quark:
 * Registers error quark for SoupSession if needed.
 *
 * Returns: Error quark for SoupSession.
 */
extern
GQuark soup_session_error_quark (void);
#define SOUP_SESSION_ERROR soup_session_error_quark ()

typedef enum {
	SOUP_SESSION_ERROR_PARSING,
	SOUP_SESSION_ERROR_ENCODING,
	SOUP_SESSION_ERROR_TOO_MANY_REDIRECTS,
	SOUP_SESSION_ERROR_TOO_MANY_RESTARTS,
	SOUP_SESSION_ERROR_REDIRECT_NO_LOCATION,
	SOUP_SESSION_ERROR_REDIRECT_BAD_URI,
        SOUP_SESSION_ERROR_MESSAGE_ALREADY_IN_QUEUE,
} SoupSessionError;

extern
SoupSession        *soup_session_new                      (void);

extern
SoupSession        *soup_session_new_with_options         (const char      *optname1,
							   ...) ;

extern
GInetSocketAddress *soup_session_get_local_address        (SoupSession     *session);

extern
guint               soup_session_get_max_conns            (SoupSession     *session);

extern
guint               soup_session_get_max_conns_per_host   (SoupSession     *session);

extern
void                soup_session_set_proxy_resolver       (SoupSession     *session,
							   GProxyResolver  *proxy_resolver);

extern
GProxyResolver     *soup_session_get_proxy_resolver       (SoupSession     *session);

extern
void                soup_session_set_tls_database         (SoupSession     *session,
							   GTlsDatabase    *tls_database);

extern
GTlsDatabase       *soup_session_get_tls_database         (SoupSession     *session);

extern
void                soup_session_set_tls_interaction      (SoupSession     *session,
							   GTlsInteraction *tls_interaction);

extern
GTlsInteraction    *soup_session_get_tls_interaction      (SoupSession     *session);

extern
void                soup_session_set_timeout              (SoupSession     *session,
							   guint            timeout);

extern
guint               soup_session_get_timeout              (SoupSession     *session);

extern
void                soup_session_set_idle_timeout         (SoupSession     *session,
							   guint            timeout);

extern
guint               soup_session_get_idle_timeout         (SoupSession     *session);

extern
void                soup_session_set_user_agent           (SoupSession     *session,
							   const char      *user_agent);

extern
const char         *soup_session_get_user_agent           (SoupSession     *session);

extern
void                soup_session_set_accept_language      (SoupSession     *session,
							   const char      *accept_language);

extern
const char         *soup_session_get_accept_language      (SoupSession     *session);

extern
void                soup_session_set_accept_language_auto (SoupSession     *session,
							   gboolean         accept_language_auto);

extern
gboolean            soup_session_get_accept_language_auto (SoupSession     *session);

extern
GSocketConnectable *soup_session_get_remote_connectable   (SoupSession     *session);

extern
void            soup_session_abort               (SoupSession           *session);

extern
void            soup_session_send_async          (SoupSession           *session,
						  SoupMessage           *msg,
						  int                    io_priority,
						  GCancellable          *cancellable,
						  GAsyncReadyCallback    callback,
						  gpointer               user_data);
extern
GInputStream   *soup_session_send_finish         (SoupSession           *session,
						  GAsyncResult          *result,
						  GError               **error);
extern
GInputStream   *soup_session_send                (SoupSession           *session,
						  SoupMessage           *msg,
						  GCancellable          *cancellable,
						  GError               **error);
extern
void            soup_session_send_and_read_async (SoupSession           *session,
						  SoupMessage           *msg,
						  int                    io_priority,
						  GCancellable          *cancellable,
						  GAsyncReadyCallback    callback,
						  gpointer               user_data);

extern
GBytes         *soup_session_send_and_read_finish (SoupSession          *session,
						   GAsyncResult         *result,
						   GError              **error);

extern
GBytes         *soup_session_send_and_read        (SoupSession          *session,
						   SoupMessage          *msg,
						   GCancellable         *cancellable,
						   GError              **error);

void            soup_session_send_and_splice_async(SoupSession          *session,
                                                   SoupMessage          *msg,
                                                   GOutputStream        *out_stream,
                                                   GOutputStreamSpliceFlags flags,
                                                   int                   io_priority,
                                                   GCancellable         *cancellable,
                                                   GAsyncReadyCallback   callback,
                                                   gpointer              user_data);
gssize          soup_session_send_and_splice_finish(SoupSession         *session,
                                                    GAsyncResult        *result,
                                                    GError             **error);

gssize          soup_session_send_and_splice      (SoupSession         *session,
                                                   SoupMessage         *msg,
                                                   GOutputStream       *out_stream,
                                                   GOutputStreamSpliceFlags flags,
                                                   GCancellable        *cancellable,
                                                   GError             **error);

extern
SoupMessage    *soup_session_get_async_result_message (SoupSession  *session,
						       GAsyncResult *result);

extern
void                soup_session_add_feature            (SoupSession        *session,
							 SoupSessionFeature *feature);
extern
void                soup_session_add_feature_by_type    (SoupSession        *session,
							 GType               feature_type);
extern
void                soup_session_remove_feature         (SoupSession        *session,
							 SoupSessionFeature *feature);
extern
void                soup_session_remove_feature_by_type (SoupSession        *session,
							 GType               feature_type);
extern
gboolean            soup_session_has_feature            (SoupSession        *session,
							 GType               feature_type);
extern
SoupSessionFeature *soup_session_get_feature            (SoupSession        *session,
							 GType               feature_type);
extern
SoupSessionFeature *soup_session_get_feature_for_message(SoupSession        *session,
							 GType               feature_type,
							 SoupMessage        *msg);

extern
void                     soup_session_websocket_connect_async  (SoupSession          *session,
								SoupMessage          *msg,
								const char           *origin,
								char                **protocols,
								int                   io_priority,
								GCancellable         *cancellable,
								GAsyncReadyCallback   callback,
								gpointer              user_data);

extern
SoupWebsocketConnection *soup_session_websocket_connect_finish (SoupSession          *session,
								GAsyncResult         *result,
								GError              **error);


extern
void       soup_session_preconnect_async  (SoupSession        *session,
					   SoupMessage        *msg,
					   int                 io_priority,
					   GCancellable       *cancellable,
					   GAsyncReadyCallback callback,
					   gpointer            user_data);
extern
gboolean   soup_session_preconnect_finish (SoupSession        *session,
					   GAsyncResult       *result,
					   GError            **error);



