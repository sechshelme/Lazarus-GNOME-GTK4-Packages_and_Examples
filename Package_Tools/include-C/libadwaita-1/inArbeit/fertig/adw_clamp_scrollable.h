/*
 * Copyright (C) 2020 Purism SPC
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



#define ADW_TYPE_CLAMP_SCROLLABLE (adw_clamp_scrollable_get_type())

//G_DECLARE_FINAL_TYPE (AdwClampScrollable, adw_clamp_scrollable, ADW, CLAMP_SCROLLABLE, GtkWidget)

extern
GtkWidget *adw_clamp_scrollable_new (void) ;

extern
GtkWidget *adw_clamp_scrollable_get_child (AdwClampScrollable *self);
extern
void       adw_clamp_scrollable_set_child (AdwClampScrollable *self,
                                           GtkWidget          *child);

extern
int  adw_clamp_scrollable_get_maximum_size (AdwClampScrollable *self);
extern
void adw_clamp_scrollable_set_maximum_size (AdwClampScrollable *self,
                                            int                 maximum_size);

extern
int  adw_clamp_scrollable_get_tightening_threshold (AdwClampScrollable *self);
extern
void adw_clamp_scrollable_set_tightening_threshold (AdwClampScrollable *self,
                                                    int                 tightening_threshold);

extern
AdwLengthUnit adw_clamp_scrollable_get_unit (AdwClampScrollable *self);
extern
void          adw_clamp_scrollable_set_unit (AdwClampScrollable *self,
                                             AdwLengthUnit       unit);


