/*
 * Copyright (C) 2019 Zander Brown <zbrown@gnome.org>
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-view-switcher.h"



#define ADAP_TYPE_VIEW_SWITCHER_BAR (adap_view_switcher_bar_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapViewSwitcherBar, adap_view_switcher_bar, ADAP, VIEW_SWITCHER_BAR, GtkWidget)

extern
GtkWidget *adap_view_switcher_bar_new (void) ;

extern
AdapViewStack *adap_view_switcher_bar_get_stack (AdapViewSwitcherBar *self);
extern
void          adap_view_switcher_bar_set_stack (AdapViewSwitcherBar *self,
                                               AdapViewStack       *stack);

extern
gboolean adap_view_switcher_bar_get_reveal (AdapViewSwitcherBar *self);
extern
void     adap_view_switcher_bar_set_reveal (AdapViewSwitcherBar *self,
                                           gboolean            reveal);


