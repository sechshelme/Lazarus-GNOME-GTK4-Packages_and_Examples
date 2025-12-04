/*
 * Copyright (C) 2023 Joshua Lee <lee.son.wai@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly"
#endif

#include "adap-version.h"

#include "adap-action-row.h"



#define ADAP_TYPE_SWITCH_ROW (adap_switch_row_get_type ())

extern
G_DECLARE_FINAL_TYPE (AdapSwitchRow, adap_switch_row, ADAP, SWITCH_ROW, AdapActionRow)

extern
GtkWidget *adap_switch_row_new (void) ;

extern
gboolean adap_switch_row_get_active (AdapSwitchRow *self);
extern
void     adap_switch_row_set_active (AdapSwitchRow *self,
                                    gboolean      is_active);


