/*
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_BIN (adw_bin_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwBin, adw_bin, ADW, BIN, GtkWidget)

struct _AdwBinClass
{
  GtkWidgetClass parent_class;
};

extern
GtkWidget *adw_bin_new (void) ;

extern
GtkWidget *adw_bin_get_child (AdwBin    *self);
extern
void       adw_bin_set_child (AdwBin    *self,
                              GtkWidget *child);


