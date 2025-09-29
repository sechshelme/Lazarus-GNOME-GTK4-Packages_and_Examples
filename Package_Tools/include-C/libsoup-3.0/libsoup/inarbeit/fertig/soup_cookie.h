/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/* 
 * Copyright 2007, 2008 Red Hat, Inc.
 */

#pragma once

#include "soup-types.h"



/**
 * SoupSameSitePolicy:
 * @SOUP_SAME_SITE_POLICY_NONE: The cookie is exposed with both cross-site and same-site requests
 * @SOUP_SAME_SITE_POLICY_LAX: The cookie is withheld on cross-site requests but exposed on cross-site navigations
 * @SOUP_SAME_SITE_POLICY_STRICT: The cookie is only exposed for same-site requests
 *
 * Represents the same-site policies of a cookie.
 */
typedef enum {
	SOUP_SAME_SITE_POLICY_NONE,
	SOUP_SAME_SITE_POLICY_LAX,
	SOUP_SAME_SITE_POLICY_STRICT,
} SoupSameSitePolicy;

typedef struct _SoupCookie SoupCookie;

extern
GType soup_cookie_get_type (void);
#define SOUP_TYPE_COOKIE (soup_cookie_get_type())

/* xxxxxxxxxx
#define SOUP_COOKIE_MAX_AGE_ONE_HOUR (60 * 60)
#define SOUP_COOKIE_MAX_AGE_ONE_DAY  (SOUP_COOKIE_MAX_AGE_ONE_HOUR * 24)
#define SOUP_COOKIE_MAX_AGE_ONE_WEEK (SOUP_COOKIE_MAX_AGE_ONE_DAY * 7)
#define SOUP_COOKIE_MAX_AGE_ONE_YEAR (SOUP_COOKIE_MAX_AGE_ONE_DAY * 365.2422)
*/

extern
SoupCookie *soup_cookie_new                     (const char  *name,
						 const char  *value,
						 const char  *domain,
						 const char  *path,
						 int          max_age);
extern
SoupCookie *soup_cookie_parse                   (const char  *header,
						 GUri        *origin);
extern
SoupCookie *soup_cookie_copy                    (SoupCookie  *cookie);

extern
const char *soup_cookie_get_name                (SoupCookie  *cookie);
extern
void        soup_cookie_set_name                (SoupCookie  *cookie,
						 const char  *name);
extern
const char *soup_cookie_get_value               (SoupCookie  *cookie);
extern
void        soup_cookie_set_value               (SoupCookie  *cookie,
						 const char  *value);
extern
const char *soup_cookie_get_domain              (SoupCookie  *cookie);
extern
void        soup_cookie_set_domain              (SoupCookie  *cookie,
						 const char  *domain);
extern
const char *soup_cookie_get_path                (SoupCookie  *cookie);
extern
void        soup_cookie_set_path                (SoupCookie  *cookie,
						 const char  *path);
extern
void        soup_cookie_set_max_age             (SoupCookie  *cookie,
						 int          max_age);
extern
GDateTime   *soup_cookie_get_expires            (SoupCookie  *cookie);
extern
void        soup_cookie_set_expires             (SoupCookie  *cookie,
						 GDateTime    *expires);
extern
gboolean    soup_cookie_get_secure              (SoupCookie  *cookie);
extern
void        soup_cookie_set_secure              (SoupCookie  *cookie,
						 gboolean     secure);
extern
gboolean    soup_cookie_get_http_only           (SoupCookie  *cookie);
extern
void        soup_cookie_set_http_only           (SoupCookie  *cookie,
						 gboolean     http_only);

extern
void        soup_cookie_set_same_site_policy    (SoupCookie         *cookie,
                                                 SoupSameSitePolicy  policy);
extern
SoupSameSitePolicy soup_cookie_get_same_site_policy (SoupCookie     *cookie);

extern
char       *soup_cookie_to_set_cookie_header    (SoupCookie  *cookie);
extern
char       *soup_cookie_to_cookie_header        (SoupCookie  *cookie);

extern
gboolean    soup_cookie_applies_to_uri          (SoupCookie  *cookie,
						 GUri        *uri);
extern
gboolean    soup_cookie_equal                   (SoupCookie  *cookie1,
						 SoupCookie  *cookie2);

extern
void        soup_cookie_free                    (SoupCookie  *cookie);

extern
GSList     *soup_cookies_from_response          (SoupMessage *msg);
extern
GSList     *soup_cookies_from_request           (SoupMessage *msg);

extern
void        soup_cookies_to_response            (GSList      *cookies,
						 SoupMessage *msg);
extern
void        soup_cookies_to_request             (GSList      *cookies,
						 SoupMessage *msg);

extern
void        soup_cookies_free                   (GSList      *cookies);

extern
char       *soup_cookies_to_cookie_header       (GSList      *cookies);

extern
gboolean    soup_cookie_domain_matches          (SoupCookie  *cookie,
						 const char  *host);



