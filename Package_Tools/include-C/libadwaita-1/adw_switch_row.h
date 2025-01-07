/*
 * Copyright (C) 2023 Joshua Lee <lee.son.wai@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly"
#endif

#include "adw-version.h"

#include "adw-action-row.h"



#define ADW_TYPE_SWITCH_ROW (adw_switch_row_get_type ())

extern
G_DECLARE_FINAL_TYPE (AdwSwitchRow, adw_switch_row, ADW, SWITCH_ROW, AdwActionRow)

extern
GtkWidget *adw_switch_row_new (void) ;

extern
gboolean adw_switch_row_get_active (AdwSwitchRow *self);
extern
void     adw_switch_row_set_active (AdwSwitchRow *self,
                                    gboolean      is_active);


