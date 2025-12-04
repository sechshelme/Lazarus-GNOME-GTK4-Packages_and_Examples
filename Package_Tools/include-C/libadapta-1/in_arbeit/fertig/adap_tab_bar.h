/*
 * Copyright (C) 2020 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>
#include "adap-enums.h"
#include "adap-tab-view.h"



#define ADAP_TYPE_TAB_BAR (adap_tab_bar_get_type())

//G_DECLARE_FINAL_TYPE (AdapTabBar, adap_tab_bar, ADAP, TAB_BAR, GtkWidget)

extern
AdapTabBar *adap_tab_bar_new (void) ;

extern
AdapTabView *adap_tab_bar_get_view (AdapTabBar  *self);
extern
void        adap_tab_bar_set_view (AdapTabBar  *self,
                                  AdapTabView *view);

extern
GtkWidget *adap_tab_bar_get_start_action_widget (AdapTabBar *self);
extern
void       adap_tab_bar_set_start_action_widget (AdapTabBar *self,
                                                GtkWidget *widget);

extern
GtkWidget *adap_tab_bar_get_end_action_widget (AdapTabBar *self);
extern
void       adap_tab_bar_set_end_action_widget (AdapTabBar *self,
                                              GtkWidget *widget);

extern
gboolean adap_tab_bar_get_autohide (AdapTabBar *self);
extern
void     adap_tab_bar_set_autohide (AdapTabBar *self,
                                   gboolean   autohide);

extern
gboolean adap_tab_bar_get_tabs_revealed (AdapTabBar *self);

extern
gboolean adap_tab_bar_get_expand_tabs (AdapTabBar *self);
extern
void     adap_tab_bar_set_expand_tabs (AdapTabBar *self,
                                      gboolean   expand_tabs);

extern
gboolean adap_tab_bar_get_inverted (AdapTabBar *self);
extern
void     adap_tab_bar_set_inverted (AdapTabBar *self,
                                   gboolean   inverted);

extern
void adap_tab_bar_setup_extra_drop_target (AdapTabBar     *self,
                                          GdkDragAction  actions,
                                          GType         *types,
                                          gsize          n_types);

extern
GdkDragAction adap_tab_bar_get_extra_drag_preferred_action (AdapTabBar *self);

extern
gboolean adap_tab_bar_get_extra_drag_preload (AdapTabBar *self);
extern
void     adap_tab_bar_set_extra_drag_preload (AdapTabBar *self,
                                             gboolean   preload);

extern
gboolean adap_tab_bar_get_is_overflowing (AdapTabBar *self);


