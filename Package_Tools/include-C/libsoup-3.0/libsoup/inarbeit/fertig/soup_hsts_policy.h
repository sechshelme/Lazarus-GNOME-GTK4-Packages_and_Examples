/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2016, 2017, 2018 Igalia S.L.
 * Copyright (C) 2017, 2018 Metrological Group B.V.
 */

#pragma once

#include "soup-types.h"



typedef struct _SoupHSTSPolicy SoupHSTSPolicy;

extern
GType		 soup_hsts_policy_get_type (void);
#define SOUP_TYPE_HSTS_POLICY (soup_hsts_policy_get_type())

/**
 * SOUP_HSTS_POLICY_MAX_AGE_PAST:
 *
 * An expiration date that is always in the past.
 */
#define SOUP_HSTS_POLICY_MAX_AGE_PAST (0)

extern
SoupHSTSPolicy  *soup_hsts_policy_new			(const char	*domain,
							 unsigned long	 max_age,
							 gboolean	 include_subdomains);
extern
SoupHSTSPolicy  *soup_hsts_policy_new_full		(const char	*domain,
							 unsigned long	 max_age,
							 GDateTime	*expires,
							 gboolean	 include_subdomains);
extern
SoupHSTSPolicy  *soup_hsts_policy_new_session_policy	(const char	*domain,
							 gboolean	 include_subdomains);
extern
SoupHSTSPolicy  *soup_hsts_policy_new_from_response	(SoupMessage	*msg);

extern
SoupHSTSPolicy  *soup_hsts_policy_copy			(SoupHSTSPolicy *policy);
extern
gboolean	 soup_hsts_policy_equal			(SoupHSTSPolicy *policy1,
							 SoupHSTSPolicy *policy2);
extern
const char	*soup_hsts_policy_get_domain		(SoupHSTSPolicy *policy);
extern
gboolean	 soup_hsts_policy_is_expired		(SoupHSTSPolicy *policy);
extern
gboolean	 soup_hsts_policy_includes_subdomains 	(SoupHSTSPolicy *policy);
extern
gboolean	 soup_hsts_policy_is_session_policy	(SoupHSTSPolicy *policy);

extern
void		 soup_hsts_policy_free			(SoupHSTSPolicy *policy);

extern
GDateTime       *soup_hsts_policy_get_expires           (SoupHSTSPolicy *policy);

extern
gulong           soup_hsts_policy_get_max_age           (SoupHSTSPolicy *policy);



