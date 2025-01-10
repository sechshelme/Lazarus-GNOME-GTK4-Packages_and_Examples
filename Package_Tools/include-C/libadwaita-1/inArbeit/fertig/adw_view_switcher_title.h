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



#define ADW_TYPE_VIEW_SWITCHER_TITLE (adw_view_switcher_title_get_type())

//G_DECLARE_FINAL_TYPE (AdwViewSwitcherTitle, adw_view_switcher_title, ADW, VIEW_SWITCHER_TITLE, GtkWidget)

GtkWidget *adw_view_switcher_title_new (void) ;

AdwViewStack *adw_view_switcher_title_get_stack (AdwViewSwitcherTitle *self);
void          adw_view_switcher_title_set_stack (AdwViewSwitcherTitle *self,
                                                 AdwViewStack         *stack);

const char *adw_view_switcher_title_get_title (AdwViewSwitcherTitle *self);
void        adw_view_switcher_title_set_title (AdwViewSwitcherTitle *self,
                                               const char           *title);

const char *adw_view_switcher_title_get_subtitle (AdwViewSwitcherTitle *self);
void        adw_view_switcher_title_set_subtitle (AdwViewSwitcherTitle *self,
                                                  const char           *subtitle);

gboolean adw_view_switcher_title_get_view_switcher_enabled (AdwViewSwitcherTitle *self);
void     adw_view_switcher_title_set_view_switcher_enabled (AdwViewSwitcherTitle *self,
                                                            gboolean              enabled);

gboolean adw_view_switcher_title_get_title_visible (AdwViewSwitcherTitle *self);


