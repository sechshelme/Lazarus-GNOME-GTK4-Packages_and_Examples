/*
 * Copyright (C) 2018 Richard Hughes <richard@hughsie.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
 */

#pragma once

#include "xb-compile.h"



void
xb_string_append_union(GString *xpath, const gchar *fmt, ...) 
    ;
gchar *
xb_string_escape(const gchar *str) ;


