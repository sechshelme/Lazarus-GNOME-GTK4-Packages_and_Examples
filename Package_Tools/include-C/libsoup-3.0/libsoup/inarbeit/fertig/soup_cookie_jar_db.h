/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2008 Diego Escalante Urrelo
 */

#pragma once

#include "soup-cookie-jar.h"



#define SOUP_TYPE_COOKIE_JAR_DB (soup_cookie_jar_db_get_type ())
//G_DECLARE_FINAL_TYPE (SoupCookieJarDB, soup_cookie_jar_db, SOUP, COOKIE_JAR_DB, SoupCookieJar)

extern
SoupCookieJar *soup_cookie_jar_db_new (const char *filename,
				       gboolean    read_only);


