/*
 * Copyright (C) 2022-2023 Purism SPC
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

#include "adap-length-unit.h"
#include "adap-navigation-view.h"



#define ADAP_TYPE_NAVIGATION_SPLIT_VIEW (adap_navigation_split_view_get_type())

//G_DECLARE_FINAL_TYPE (AdapNavigationSplitView, adap_navigation_split_view, ADAP, NAVIGATION_SPLIT_VIEW, GtkWidget)

extern
GtkWidget *adap_navigation_split_view_new (void) ;

extern
AdapNavigationPage *adap_navigation_split_view_get_sidebar (AdapNavigationSplitView *self);
extern
void               adap_navigation_split_view_set_sidebar (AdapNavigationSplitView *self,
                                                          AdapNavigationPage      *sidebar);

extern
AdapNavigationPage *adap_navigation_split_view_get_content (AdapNavigationSplitView *self);
extern
void               adap_navigation_split_view_set_content (AdapNavigationSplitView *self,
                                                          AdapNavigationPage      *content);

extern
gboolean adap_navigation_split_view_get_collapsed (AdapNavigationSplitView *self);
extern
void     adap_navigation_split_view_set_collapsed (AdapNavigationSplitView *self,
                                                  gboolean                collapsed);

extern
gboolean adap_navigation_split_view_get_show_content (AdapNavigationSplitView *self);
extern
void     adap_navigation_split_view_set_show_content (AdapNavigationSplitView *self,
                                                     gboolean                show_content);

extern
double adap_navigation_split_view_get_min_sidebar_width (AdapNavigationSplitView *self);
extern
void   adap_navigation_split_view_set_min_sidebar_width (AdapNavigationSplitView *self,
                                                        double                  width);

extern
double adap_navigation_split_view_get_max_sidebar_width (AdapNavigationSplitView *self);
extern
void   adap_navigation_split_view_set_max_sidebar_width (AdapNavigationSplitView *self,
                                                        double                  width);

extern
double adap_navigation_split_view_get_sidebar_width_fraction (AdapNavigationSplitView *self);
extern
void   adap_navigation_split_view_set_sidebar_width_fraction (AdapNavigationSplitView *self,
                                                             double                  fraction);

extern
AdapLengthUnit adap_navigation_split_view_get_sidebar_width_unit (AdapNavigationSplitView *self);
extern
void          adap_navigation_split_view_set_sidebar_width_unit (AdapNavigationSplitView *self,
                                                                AdapLengthUnit           unit);


