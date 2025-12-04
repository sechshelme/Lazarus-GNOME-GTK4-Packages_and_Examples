/*
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-spring-params.h"



#define ADAP_TYPE_CAROUSEL (adap_carousel_get_type())

//G_DECLARE_FINAL_TYPE (AdapCarousel, adap_carousel, ADAP, CAROUSEL, GtkWidget)

extern
GtkWidget *adap_carousel_new (void) ;

extern
void adap_carousel_prepend (AdapCarousel *self,
                           GtkWidget   *child);
extern
void adap_carousel_append  (AdapCarousel *self,
                           GtkWidget   *child);
extern
void adap_carousel_insert  (AdapCarousel *self,
                           GtkWidget   *child,
                           int          position);

extern
void adap_carousel_reorder (AdapCarousel *self,
                           GtkWidget   *child,
                           int          position);

extern
void adap_carousel_remove (AdapCarousel *self,
                          GtkWidget   *child);

extern
void adap_carousel_scroll_to (AdapCarousel *self,
                             GtkWidget   *widget,
                             gboolean     animate);

extern
GtkWidget *adap_carousel_get_nth_page (AdapCarousel *self,
                                      guint        n);
extern
guint      adap_carousel_get_n_pages  (AdapCarousel *self);
extern
double     adap_carousel_get_position (AdapCarousel *self);

extern
gboolean adap_carousel_get_interactive (AdapCarousel *self);
extern
void     adap_carousel_set_interactive (AdapCarousel *self,
                                       gboolean     interactive);

extern
guint adap_carousel_get_spacing (AdapCarousel *self);
extern
void  adap_carousel_set_spacing (AdapCarousel *self,
                                guint        spacing);

extern
AdapSpringParams *adap_carousel_get_scroll_params (AdapCarousel     *self);
extern
void             adap_carousel_set_scroll_params (AdapCarousel     *self,
                                                 AdapSpringParams *params);

extern
gboolean adap_carousel_get_allow_mouse_drag (AdapCarousel *self);
extern
void     adap_carousel_set_allow_mouse_drag (AdapCarousel *self,
                                            gboolean     allow_mouse_drag);

extern
gboolean adap_carousel_get_allow_scroll_wheel (AdapCarousel *self);
extern
void     adap_carousel_set_allow_scroll_wheel (AdapCarousel *self,
                                              gboolean     allow_scroll_wheel);

extern
gboolean adap_carousel_get_allow_long_swipes (AdapCarousel *self);
extern
void     adap_carousel_set_allow_long_swipes (AdapCarousel *self,
                                             gboolean     allow_long_swipes);

extern
guint adap_carousel_get_reveal_duration (AdapCarousel *self);
extern
void  adap_carousel_set_reveal_duration (AdapCarousel *self,
                                        guint        reveal_duration);

