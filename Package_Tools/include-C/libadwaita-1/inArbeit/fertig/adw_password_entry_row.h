/*
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@protonmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-entry-row.h"



#define ADW_TYPE_PASSWORD_ENTRY_ROW (adw_password_entry_row_get_type())

//G_DECLARE_FINAL_TYPE (AdwPasswordEntryRow, adw_password_entry_row, ADW, PASSWORD_ENTRY_ROW, AdwEntryRow)

GtkWidget *adw_password_entry_row_new (void) ;


