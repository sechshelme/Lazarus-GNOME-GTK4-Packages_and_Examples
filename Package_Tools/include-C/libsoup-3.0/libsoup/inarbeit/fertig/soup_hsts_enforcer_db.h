/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2016, 2017, 2018 Igalia S.L.
 * Copyright (C) 2017, 2018 Metrological Group B.V.
 */

#pragma once

#include "soup-hsts-enforcer.h"



#define SOUP_TYPE_HSTS_ENFORCER_DB (soup_hsts_enforcer_db_get_type ())
//G_DECLARE_FINAL_TYPE (SoupHSTSEnforcerDB, soup_hsts_enforcer_db, SOUP, HSTS_ENFORCER_DB, SoupHSTSEnforcer)

extern
SoupHSTSEnforcer *soup_hsts_enforcer_db_new (const char *filename);


