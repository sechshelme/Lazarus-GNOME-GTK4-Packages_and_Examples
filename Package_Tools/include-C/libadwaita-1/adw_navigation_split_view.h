/*
 * Copyright (C) 2022-2023 Purism SPC
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

#include "adw-length-unit.h"
#include "adw-navigation-view.h"



#define ADW_TYPE_NAVIGATION_SPLIT_VIEW (adw_navigation_split_view_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwNavigationSplitView, adw_navigation_split_view, ADW, NAVIGATION_SPLIT_VIEW, GtkWidget)

extern
GtkWidget *adw_navigation_split_view_new (void) ;

extern
AdwNavigationPage *adw_navigation_split_view_get_sidebar (AdwNavigationSplitView *self);
extern
void               adw_navigation_split_view_set_sidebar (AdwNavigationSplitView *self,
                                                          AdwNavigationPage      *sidebar);

extern
AdwNavigationPage *adw_navigation_split_view_get_content (AdwNavigationSplitView *self);
extern
void               adw_navigation_split_view_set_content (AdwNavigationSplitView *self,
                                                          AdwNavigationPage      *content);

extern
gboolean adw_navigation_split_view_get_collapsed (AdwNavigationSplitView *self);
extern
void     adw_navigation_split_view_set_collapsed (AdwNavigationSplitView *self,
                                                  gboolean                collapsed);

extern
gboolean adw_navigation_split_view_get_show_content (AdwNavigationSplitView *self);
extern
void     adw_navigation_split_view_set_show_content (AdwNavigationSplitView *self,
                                                     gboolean                show_content);

extern
double adw_navigation_split_view_get_min_sidebar_width (AdwNavigationSplitView *self);
extern
void   adw_navigation_split_view_set_min_sidebar_width (AdwNavigationSplitView *self,
                                                        double                  width);

extern
double adw_navigation_split_view_get_max_sidebar_width (AdwNavigationSplitView *self);
extern
void   adw_navigation_split_view_set_max_sidebar_width (AdwNavigationSplitView *self,
                                                        double                  width);

extern
double adw_navigation_split_view_get_sidebar_width_fraction (AdwNavigationSplitView *self);
extern
void   adw_navigation_split_view_set_sidebar_width_fraction (AdwNavigationSplitView *self,
                                                             double                  fraction);

extern
AdwLengthUnit adw_navigation_split_view_get_sidebar_width_unit (AdwNavigationSplitView *self);
extern
void          adw_navigation_split_view_set_sidebar_width_unit (AdwNavigationSplitView *self,
                                                                AdwLengthUnit           unit);


