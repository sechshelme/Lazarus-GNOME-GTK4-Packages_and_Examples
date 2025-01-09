/*
 * Copyright (C) 2019 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-spring-params.h"



#define ADW_TYPE_CAROUSEL (adw_carousel_get_type())

//G_DECLARE_FINAL_TYPE (AdwCarousel, adw_carousel, ADW, CAROUSEL, GtkWidget)

extern
GtkWidget *adw_carousel_new (void) ;

extern
void adw_carousel_prepend (AdwCarousel *self,
                           GtkWidget   *child);
extern
void adw_carousel_append  (AdwCarousel *self,
                           GtkWidget   *child);
extern
void adw_carousel_insert  (AdwCarousel *self,
                           GtkWidget   *child,
                           int          position);

extern
void adw_carousel_reorder (AdwCarousel *self,
                           GtkWidget   *child,
                           int          position);

extern
void adw_carousel_remove (AdwCarousel *self,
                          GtkWidget   *child);

extern
void adw_carousel_scroll_to (AdwCarousel *self,
                             GtkWidget   *widget,
                             gboolean     animate);

extern
GtkWidget *adw_carousel_get_nth_page (AdwCarousel *self,
                                      guint        n);
extern
guint      adw_carousel_get_n_pages  (AdwCarousel *self);
extern
double     adw_carousel_get_position (AdwCarousel *self);

extern
gboolean adw_carousel_get_interactive (AdwCarousel *self);
extern
void     adw_carousel_set_interactive (AdwCarousel *self,
                                       gboolean     interactive);

extern
guint adw_carousel_get_spacing (AdwCarousel *self);
extern
void  adw_carousel_set_spacing (AdwCarousel *self,
                                guint        spacing);

extern
AdwSpringParams *adw_carousel_get_scroll_params (AdwCarousel     *self);
extern
void             adw_carousel_set_scroll_params (AdwCarousel     *self,
                                                 AdwSpringParams *params);

extern
gboolean adw_carousel_get_allow_mouse_drag (AdwCarousel *self);
extern
void     adw_carousel_set_allow_mouse_drag (AdwCarousel *self,
                                            gboolean     allow_mouse_drag);

extern
gboolean adw_carousel_get_allow_scroll_wheel (AdwCarousel *self);
extern
void     adw_carousel_set_allow_scroll_wheel (AdwCarousel *self,
                                              gboolean     allow_scroll_wheel);

extern
gboolean adw_carousel_get_allow_long_swipes (AdwCarousel *self);
extern
void     adw_carousel_set_allow_long_swipes (AdwCarousel *self,
                                             gboolean     allow_long_swipes);

extern
guint adw_carousel_get_reveal_duration (AdwCarousel *self);
extern
void  adw_carousel_set_reveal_duration (AdwCarousel *self,
                                        guint        reveal_duration);

