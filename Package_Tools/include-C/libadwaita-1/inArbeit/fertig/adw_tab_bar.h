/*
 * Copyright (C) 2020 Purism SPC
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
#include "adw-enums.h"
#include "adw-tab-view.h"



#define ADW_TYPE_TAB_BAR (adw_tab_bar_get_type())

//G_DECLARE_FINAL_TYPE (AdwTabBar, adw_tab_bar, ADW, TAB_BAR, GtkWidget)

extern
AdwTabBar *adw_tab_bar_new (void) ;

extern
AdwTabView *adw_tab_bar_get_view (AdwTabBar  *self);
extern
void        adw_tab_bar_set_view (AdwTabBar  *self,
                                  AdwTabView *view);

extern
GtkWidget *adw_tab_bar_get_start_action_widget (AdwTabBar *self);
extern
void       adw_tab_bar_set_start_action_widget (AdwTabBar *self,
                                                GtkWidget *widget);

extern
GtkWidget *adw_tab_bar_get_end_action_widget (AdwTabBar *self);
extern
void       adw_tab_bar_set_end_action_widget (AdwTabBar *self,
                                              GtkWidget *widget);

extern
gboolean adw_tab_bar_get_autohide (AdwTabBar *self);
extern
void     adw_tab_bar_set_autohide (AdwTabBar *self,
                                   gboolean   autohide);

extern
gboolean adw_tab_bar_get_tabs_revealed (AdwTabBar *self);

extern
gboolean adw_tab_bar_get_expand_tabs (AdwTabBar *self);
extern
void     adw_tab_bar_set_expand_tabs (AdwTabBar *self,
                                      gboolean   expand_tabs);

extern
gboolean adw_tab_bar_get_inverted (AdwTabBar *self);
extern
void     adw_tab_bar_set_inverted (AdwTabBar *self,
                                   gboolean   inverted);

extern
void adw_tab_bar_setup_extra_drop_target (AdwTabBar     *self,
                                          GdkDragAction  actions,
                                          GType         *types,
                                          gsize          n_types);

extern
GdkDragAction adw_tab_bar_get_extra_drag_preferred_action (AdwTabBar *self);

gboolean adw_tab_bar_get_extra_drag_preload (AdwTabBar *self);
void     adw_tab_bar_set_extra_drag_preload (AdwTabBar *self,
                                             gboolean   preload);

extern
gboolean adw_tab_bar_get_is_overflowing (AdwTabBar *self);


