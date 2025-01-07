/*
 * Copyright (C) 2018 Purism SPC
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



#define ADW_TYPE_CLAMP (adw_clamp_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwClamp, adw_clamp, ADW, CLAMP, GtkWidget)

extern
GtkWidget *adw_clamp_new (void) ;

extern
GtkWidget *adw_clamp_get_child (AdwClamp  *self);
extern
void       adw_clamp_set_child (AdwClamp  *self,
                                GtkWidget *child);

extern
int  adw_clamp_get_maximum_size (AdwClamp *self);
extern
void adw_clamp_set_maximum_size (AdwClamp *self,
                                 int       maximum_size);

extern
int  adw_clamp_get_tightening_threshold (AdwClamp *self);
extern
void adw_clamp_set_tightening_threshold (AdwClamp *self,
                                         int       tightening_threshold);

extern
AdwLengthUnit adw_clamp_get_unit (AdwClamp      *self);
extern
void          adw_clamp_set_unit (AdwClamp      *self,
                                  AdwLengthUnit  unit);


