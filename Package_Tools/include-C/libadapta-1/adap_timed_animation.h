/*
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-animation.h"
#include "adap-easing.h"



#define ADAP_TYPE_TIMED_ANIMATION (adap_timed_animation_get_type())

extern
GDK_DECLARE_INTERNAL_TYPE (AdapTimedAnimation, adap_timed_animation, ADAP, TIMED_ANIMATION, AdapAnimation)

extern
AdapAnimation *adap_timed_animation_new (GtkWidget          *widget,
                                       double              from,
                                       double              to,
                                       guint               duration,
                                       AdapAnimationTarget *target) ;

extern
double adap_timed_animation_get_value_from (AdapTimedAnimation *self);
extern
void   adap_timed_animation_set_value_from (AdapTimedAnimation *self,
                                           double             value);

extern
double adap_timed_animation_get_value_to (AdapTimedAnimation *self);
extern
void   adap_timed_animation_set_value_to (AdapTimedAnimation *self,
                                         double             value);

extern
guint adap_timed_animation_get_duration (AdapTimedAnimation *self);
extern
void  adap_timed_animation_set_duration (AdapTimedAnimation *self,
                                        guint              duration);

extern
AdapEasing adap_timed_animation_get_easing (AdapTimedAnimation *self);
extern
void      adap_timed_animation_set_easing (AdapTimedAnimation *self,
                                          AdapEasing          easing);

extern
guint adap_timed_animation_get_repeat_count (AdapTimedAnimation *self);
extern
void  adap_timed_animation_set_repeat_count (AdapTimedAnimation *self,
                                            guint              repeat_count);

extern
gboolean adap_timed_animation_get_reverse (AdapTimedAnimation *self);
extern
void     adap_timed_animation_set_reverse (AdapTimedAnimation *self,
                                          gboolean           reverse);

extern
gboolean adap_timed_animation_get_alternate (AdapTimedAnimation *self);
extern
void     adap_timed_animation_set_alternate (AdapTimedAnimation *self,
                                            gboolean           alternate);


