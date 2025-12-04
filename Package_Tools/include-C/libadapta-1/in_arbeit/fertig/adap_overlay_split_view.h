/*
 * Copyright (C) 2020 Felix Häcker <haeckerfelix@gnome.org>
 * Copyright (C) 2023 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-length-unit.h"



#define ADAP_TYPE_OVERLAY_SPLIT_VIEW (adap_overlay_split_view_get_type ())

//G_DECLARE_FINAL_TYPE (AdapOverlaySplitView, adap_overlay_split_view, ADAP, OVERLAY_SPLIT_VIEW, GtkWidget)

extern
GtkWidget *adap_overlay_split_view_new (void) ;

extern
GtkWidget *adap_overlay_split_view_get_sidebar (AdapOverlaySplitView *self);
extern
void       adap_overlay_split_view_set_sidebar (AdapOverlaySplitView *self,
                                               GtkWidget           *sidebar);

extern
GtkWidget *adap_overlay_split_view_get_content (AdapOverlaySplitView *self);
extern
void       adap_overlay_split_view_set_content (AdapOverlaySplitView *self,
                                               GtkWidget           *content);

extern
gboolean adap_overlay_split_view_get_collapsed (AdapOverlaySplitView *self);
extern
void     adap_overlay_split_view_set_collapsed (AdapOverlaySplitView *self,
                                               gboolean             collapsed);

extern
GtkPackType adap_overlay_split_view_get_sidebar_position (AdapOverlaySplitView *self);
extern
void        adap_overlay_split_view_set_sidebar_position (AdapOverlaySplitView *self,
                                                         GtkPackType          position);

extern
gboolean adap_overlay_split_view_get_show_sidebar (AdapOverlaySplitView *self);
extern
void     adap_overlay_split_view_set_show_sidebar (AdapOverlaySplitView *self,
                                                  gboolean             show_sidebar);

extern
gboolean adap_overlay_split_view_get_pin_sidebar (AdapOverlaySplitView *self);
extern
void     adap_overlay_split_view_set_pin_sidebar (AdapOverlaySplitView *self,
                                                 gboolean             pin_sidebar);

extern
gboolean adap_overlay_split_view_get_enable_show_gesture (AdapOverlaySplitView *self);
extern
void     adap_overlay_split_view_set_enable_show_gesture (AdapOverlaySplitView *self,
                                                         gboolean             enable_show_gesture);

extern
gboolean adap_overlay_split_view_get_enable_hide_gesture (AdapOverlaySplitView *self);
extern
void     adap_overlay_split_view_set_enable_hide_gesture (AdapOverlaySplitView *self,
                                                         gboolean             enable_hide_gesture);

extern
double adap_overlay_split_view_get_min_sidebar_width (AdapOverlaySplitView *self);
extern
void   adap_overlay_split_view_set_min_sidebar_width (AdapOverlaySplitView *self,
                                                     double               width);

extern
double adap_overlay_split_view_get_max_sidebar_width (AdapOverlaySplitView *self);
extern
void   adap_overlay_split_view_set_max_sidebar_width (AdapOverlaySplitView *self,
                                                     double               width);

extern
double adap_overlay_split_view_get_sidebar_width_fraction (AdapOverlaySplitView *self);
extern
void   adap_overlay_split_view_set_sidebar_width_fraction (AdapOverlaySplitView *self,
                                                          double               fraction);

extern
AdapLengthUnit adap_overlay_split_view_get_sidebar_width_unit (AdapOverlaySplitView *self);
extern
void          adap_overlay_split_view_set_sidebar_width_unit (AdapOverlaySplitView *self,
                                                             AdapLengthUnit        unit);


