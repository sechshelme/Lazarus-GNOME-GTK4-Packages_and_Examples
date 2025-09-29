/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2008 Red Hat, Inc.
 */

#pragma once

#include "soup-cookie-jar.h"



#define SOUP_TYPE_COOKIE_JAR_TEXT (soup_cookie_jar_text_get_type ())
//G_DECLARE_FINAL_TYPE (SoupCookieJarText, soup_cookie_jar_text, SOUP, COOKIE_JAR_TEXT, SoupCookieJar)

extern
SoupCookieJar *soup_cookie_jar_text_new (const char *filename,
					 gboolean    read_only);



