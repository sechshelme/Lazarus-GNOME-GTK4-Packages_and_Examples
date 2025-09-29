/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2007 Novell, Inc.
 */

#pragma once

#include "soup-auth-domain.h"



#define SOUP_TYPE_AUTH_DOMAIN_DIGEST (soup_auth_domain_digest_get_type ())
//G_DECLARE_FINAL_TYPE (SoupAuthDomainDigest, soup_auth_domain_digest, SOUP, AUTH_DOMAIN_DIGEST, SoupAuthDomain)

extern
SoupAuthDomain *soup_auth_domain_digest_new (const char *optname1,
					    ...) ;

typedef	char * (*SoupAuthDomainDigestAuthCallback) (SoupAuthDomain    *domain,
						    SoupServerMessage *msg,
						    const char        *username,
						    gpointer           user_data);

extern
void    soup_auth_domain_digest_set_auth_callback  (SoupAuthDomain *domain,
						    SoupAuthDomainDigestAuthCallback callback,
						    gpointer        user_data,
						    GDestroyNotify  dnotify);

extern
char   *soup_auth_domain_digest_encode_password    (const char     *username,
						    const char     *realm,
						    const char     *password);


