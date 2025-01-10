/*
 * Copyright (C) 2019 Zander Brown <zbrown@gnome.org>
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-view-switcher.h"



#define ADW_TYPE_VIEW_SWITCHER_BAR (adw_view_switcher_bar_get_type())

//G_DECLARE_FINAL_TYPE (AdwViewSwitcherBar, adw_view_switcher_bar, ADW, VIEW_SWITCHER_BAR, GtkWidget)

extern
GtkWidget *adw_view_switcher_bar_new (void) ;

extern
AdwViewStack *adw_view_switcher_bar_get_stack (AdwViewSwitcherBar *self);
extern
void          adw_view_switcher_bar_set_stack (AdwViewSwitcherBar *self,
                                               AdwViewStack       *stack);

extern
gboolean adw_view_switcher_bar_get_reveal (AdwViewSwitcherBar *self);
extern
void     adw_view_switcher_bar_set_reveal (AdwViewSwitcherBar *self,
                                           gboolean            reveal);


