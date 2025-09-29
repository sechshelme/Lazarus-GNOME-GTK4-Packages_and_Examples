/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2001-2003, Ximian, Inc.
 */

#pragma once

#include "soup-types.h"
#include "soup-headers.h"



#define SOUP_TYPE_AUTH (soup_auth_get_type())
//G_DECLARE_DERIVABLE_TYPE (SoupAuth, soup_auth, SOUP, AUTH, GObject)

struct _SoupAuthClass {
	GObjectClass parent_class;

	const char  *scheme_name;
	guint        strength;

	gboolean     (*update)               (SoupAuth      *auth,
					      SoupMessage   *msg,
					      GHashTable    *auth_header);

	GSList *     (*get_protection_space) (SoupAuth      *auth,
					      GUri          *source_uri);

	void         (*authenticate)         (SoupAuth      *auth,
					      const char    *username,
					      const char    *password);
	gboolean     (*is_authenticated)     (SoupAuth      *auth);

	char *       (*get_authorization)    (SoupAuth      *auth,
					      SoupMessage   *msg);

	gboolean     (*is_ready)             (SoupAuth      *auth,
					      SoupMessage   *msg);

	gboolean     (*can_authenticate)     (SoupAuth      *auth);

	gpointer padding[6];
};

extern
SoupAuth   *soup_auth_new                   (GType          type,
					     SoupMessage   *msg,
					     const char    *auth_header);
extern
gboolean    soup_auth_update                (SoupAuth      *auth,
					     SoupMessage   *msg,
					     const char    *auth_header);

extern
gboolean    soup_auth_is_for_proxy          (SoupAuth      *auth);
extern
const char *soup_auth_get_scheme_name       (SoupAuth      *auth);
extern
const char *soup_auth_get_authority         (SoupAuth      *auth);
extern
const char *soup_auth_get_realm             (SoupAuth      *auth);
extern
char       *soup_auth_get_info              (SoupAuth      *auth);

extern
void        soup_auth_authenticate          (SoupAuth      *auth,
					     const char    *username,
					     const char    *password);

extern
void        soup_auth_cancel                (SoupAuth      *auth);

extern
gboolean    soup_auth_is_authenticated      (SoupAuth      *auth);

extern
gboolean    soup_auth_is_cancelled          (SoupAuth      *auth);

extern
gboolean    soup_auth_is_ready              (SoupAuth      *auth,
					     SoupMessage   *msg);
extern
gboolean    soup_auth_can_authenticate      (SoupAuth      *auth);

extern
char       *soup_auth_get_authorization     (SoupAuth      *auth, 
					     SoupMessage   *msg);

extern
GSList     *soup_auth_get_protection_space  (SoupAuth      *auth,
					     GUri          *source_uri);
extern
void        soup_auth_free_protection_space (SoupAuth      *auth,
					     GSList        *space);

extern
gboolean    soup_auth_negotiate_supported   (void);

#define SOUP_TYPE_AUTH_BASIC (soup_auth_basic_get_type ())
extern
GType soup_auth_basic_get_type (void);

#define SOUP_TYPE_AUTH_DIGEST (soup_auth_digest_get_type ())
extern
GType soup_auth_digest_get_type (void);

#define SOUP_TYPE_AUTH_NTLM (soup_auth_ntlm_get_type ())
extern
GType soup_auth_ntlm_get_type (void);

#define SOUP_TYPE_AUTH_NEGOTIATE (soup_auth_negotiate_get_type ())
extern
GType soup_auth_negotiate_get_type (void);



