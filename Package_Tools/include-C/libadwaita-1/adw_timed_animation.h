/*
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-animation.h"
#include "adw-easing.h"



#define ADW_TYPE_TIMED_ANIMATION (adw_timed_animation_get_type())

extern
GDK_DECLARE_INTERNAL_TYPE (AdwTimedAnimation, adw_timed_animation, ADW, TIMED_ANIMATION, AdwAnimation)

extern
AdwAnimation *adw_timed_animation_new (GtkWidget          *widget,
                                       double              from,
                                       double              to,
                                       guint               duration,
                                       AdwAnimationTarget *target) ;

extern
double adw_timed_animation_get_value_from (AdwTimedAnimation *self);
extern
void   adw_timed_animation_set_value_from (AdwTimedAnimation *self,
                                           double             value);

extern
double adw_timed_animation_get_value_to (AdwTimedAnimation *self);
extern
void   adw_timed_animation_set_value_to (AdwTimedAnimation *self,
                                         double             value);

extern
guint adw_timed_animation_get_duration (AdwTimedAnimation *self);
extern
void  adw_timed_animation_set_duration (AdwTimedAnimation *self,
                                        guint              duration);

extern
AdwEasing adw_timed_animation_get_easing (AdwTimedAnimation *self);
extern
void      adw_timed_animation_set_easing (AdwTimedAnimation *self,
                                          AdwEasing          easing);

extern
guint adw_timed_animation_get_repeat_count (AdwTimedAnimation *self);
extern
void  adw_timed_animation_set_repeat_count (AdwTimedAnimation *self,
                                            guint              repeat_count);

extern
gboolean adw_timed_animation_get_reverse (AdwTimedAnimation *self);
extern
void     adw_timed_animation_set_reverse (AdwTimedAnimation *self,
                                          gboolean           reverse);

extern
gboolean adw_timed_animation_get_alternate (AdwTimedAnimation *self);
extern
void     adw_timed_animation_set_alternate (AdwTimedAnimation *self,
                                            gboolean           alternate);


