/*
 * Copyright (C) 2021-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1+
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>
#include "adap-tab-view.h"



#define ADAP_TYPE_TAB_OVERVIEW (adap_tab_overview_get_type())

//G_DECLARE_FINAL_TYPE (AdapTabOverview, adap_tab_overview, ADAP, TAB_OVERVIEW, GtkWidget)

extern
GtkWidget *adap_tab_overview_new (void) ;

extern
AdapTabView *adap_tab_overview_get_view (AdapTabOverview *self);
extern
void        adap_tab_overview_set_view (AdapTabOverview *self,
                                       AdapTabView     *view);

extern
GtkWidget *adap_tab_overview_get_child (AdapTabOverview *self);
extern
void       adap_tab_overview_set_child (AdapTabOverview *self,
                                       GtkWidget      *child);

extern
gboolean adap_tab_overview_get_open  (AdapTabOverview *self);
extern
void     adap_tab_overview_set_open (AdapTabOverview *self,
                                    gboolean        open);

extern
gboolean adap_tab_overview_get_inverted (AdapTabOverview *self);
extern
void     adap_tab_overview_set_inverted (AdapTabOverview *self,
                                        gboolean        inverted);

extern
gboolean adap_tab_overview_get_enable_search (AdapTabOverview *self);
extern
void     adap_tab_overview_set_enable_search (AdapTabOverview *self,
                                             gboolean        enable_search);

extern
gboolean adap_tab_overview_get_search_active (AdapTabOverview *self);

extern
gboolean adap_tab_overview_get_enable_new_tab (AdapTabOverview *self);
extern
void     adap_tab_overview_set_enable_new_tab (AdapTabOverview *self,
                                              gboolean        enable_new_tab);

extern
GMenuModel *adap_tab_overview_get_secondary_menu (AdapTabOverview *self);
extern
void        adap_tab_overview_set_secondary_menu (AdapTabOverview *self,
                                                 GMenuModel     *secondary_menu);

extern
gboolean adap_tab_overview_get_show_start_title_buttons (AdapTabOverview *self);
extern
void     adap_tab_overview_set_show_start_title_buttons (AdapTabOverview *self,
                                                        gboolean        show_start_title_buttons);

extern
gboolean adap_tab_overview_get_show_end_title_buttons (AdapTabOverview *self);
extern
void     adap_tab_overview_set_show_end_title_buttons (AdapTabOverview *self,
                                                      gboolean        show_end_title_buttons);

extern
void adap_tab_overview_setup_extra_drop_target (AdapTabOverview *self,
                                               GdkDragAction   actions,
                                               GType          *types,
                                               gsize           n_types);

extern
GdkDragAction adap_tab_overview_get_extra_drag_preferred_action (AdapTabOverview *self);

extern
gboolean adap_tab_overview_get_extra_drag_preload (AdapTabOverview *self);
extern
void     adap_tab_overview_set_extra_drag_preload (AdapTabOverview *self,
                                                  gboolean        preload);


