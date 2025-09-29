/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2007 Red Hat, Inc.
 */

#pragma once

#include "soup-types.h"
#include "soup-auth.h"



#define SOUP_TYPE_AUTH_MANAGER (soup_auth_manager_get_type ())
//G_DECLARE_FINAL_TYPE (SoupAuthManager, soup_auth_manager, SOUP, AUTH_MANAGER, GObject)

extern
void  soup_auth_manager_use_auth (SoupAuthManager *manager,
				  GUri            *uri,
				  SoupAuth        *auth);

extern
void soup_auth_manager_clear_cached_credentials (SoupAuthManager *manager);


