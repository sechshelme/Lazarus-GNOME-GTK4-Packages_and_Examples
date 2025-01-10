/*
 * Copyright (C) 2018-2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-length-unit.h"



#define ADW_TYPE_CLAMP_LAYOUT (adw_clamp_layout_get_type())

//G_DECLARE_FINAL_TYPE (AdwClampLayout, adw_clamp_layout, ADW, CLAMP_LAYOUT, GtkLayoutManager)

extern
GtkLayoutManager *adw_clamp_layout_new (void) ;

extern
int  adw_clamp_layout_get_maximum_size (AdwClampLayout *self);
extern
void adw_clamp_layout_set_maximum_size (AdwClampLayout *self,
                                        int             maximum_size);

extern
int  adw_clamp_layout_get_tightening_threshold (AdwClampLayout *self);
extern
void adw_clamp_layout_set_tightening_threshold (AdwClampLayout *self,
                                                int             tightening_threshold);

extern
AdwLengthUnit adw_clamp_layout_get_unit (AdwClampLayout *self);
extern
void          adw_clamp_layout_set_unit (AdwClampLayout *self,
                                         AdwLengthUnit   unit);


