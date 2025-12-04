/*
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@protonmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-entry-row.h"



#define ADAP_TYPE_PASSWORD_ENTRY_ROW (adap_password_entry_row_get_type())

//G_DECLARE_FINAL_TYPE (AdapPasswordEntryRow, adap_password_entry_row, ADAP, PASSWORD_ENTRY_ROW, AdapEntryRow)

extern
GtkWidget *adap_password_entry_row_new (void) ;


