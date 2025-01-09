/*
 * Copyright (C) 2021-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1+
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-tab-view.h"



#define ADW_TYPE_TAB_OVERVIEW (adw_tab_overview_get_type())


//G_DECLARE_FINAL_TYPE (AdwTabOverview, adw_tab_overview, ADW, TAB_OVERVIEW, GtkWidget)


GtkWidget *adw_tab_overview_new (void) ;


AdwTabView *adw_tab_overview_get_view (AdwTabOverview *self);

void        adw_tab_overview_set_view (AdwTabOverview *self,
                                       AdwTabView     *view);


GtkWidget *adw_tab_overview_get_child (AdwTabOverview *self);

void       adw_tab_overview_set_child (AdwTabOverview *self,
                                       GtkWidget      *child);


gboolean adw_tab_overview_get_open  (AdwTabOverview *self);

void     adw_tab_overview_set_open (AdwTabOverview *self,
                                    gboolean        open);


gboolean adw_tab_overview_get_inverted (AdwTabOverview *self);

void     adw_tab_overview_set_inverted (AdwTabOverview *self,
                                        gboolean        inverted);


gboolean adw_tab_overview_get_enable_search (AdwTabOverview *self);

void     adw_tab_overview_set_enable_search (AdwTabOverview *self,
                                             gboolean        enable_search);


gboolean adw_tab_overview_get_search_active (AdwTabOverview *self);


gboolean adw_tab_overview_get_enable_new_tab (AdwTabOverview *self);

void     adw_tab_overview_set_enable_new_tab (AdwTabOverview *self,
                                              gboolean        enable_new_tab);


GMenuModel *adw_tab_overview_get_secondary_menu (AdwTabOverview *self);

void        adw_tab_overview_set_secondary_menu (AdwTabOverview *self,
                                                 GMenuModel     *secondary_menu);


gboolean adw_tab_overview_get_show_start_title_buttons (AdwTabOverview *self);

void     adw_tab_overview_set_show_start_title_buttons (AdwTabOverview *self,
                                                        gboolean        show_start_title_buttons);


gboolean adw_tab_overview_get_show_end_title_buttons (AdwTabOverview *self);

void     adw_tab_overview_set_show_end_title_buttons (AdwTabOverview *self,
                                                      gboolean        show_end_title_buttons);


void adw_tab_overview_setup_extra_drop_target (AdwTabOverview *self,
                                               GdkDragAction   actions,
                                               GType          *types,
                                               gsize           n_types);

extern
GdkDragAction adw_tab_overview_get_extra_drag_preferred_action (AdwTabOverview *self);


gboolean adw_tab_overview_get_extra_drag_preload (AdwTabOverview *self);

void     adw_tab_overview_set_extra_drag_preload (AdwTabOverview *self,
                                                  gboolean        preload);


