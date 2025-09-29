/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2007 Novell, Inc.
 */

#pragma once

#include "soup-auth-domain.h"



#define SOUP_TYPE_AUTH_DOMAIN_BASIC (soup_auth_domain_basic_get_type ())
//G_DECLARE_FINAL_TYPE (SoupAuthDomainBasic, soup_auth_domain_basic, SOUP, AUTH_DOMAIN_BASIC, SoupAuthDomain)

extern
SoupAuthDomain *soup_auth_domain_basic_new (const char *optname1,
					    ...);

typedef	gboolean (*SoupAuthDomainBasicAuthCallback) (SoupAuthDomain    *domain,
						     SoupServerMessage *msg,
						     const char        *username,
						     const char        *password,
						     gpointer           user_data);

extern
void      soup_auth_domain_basic_set_auth_callback  (SoupAuthDomain *domain,
						     SoupAuthDomainBasicAuthCallback callback,
						     gpointer        user_data,
						     GDestroyNotify  dnotify);


