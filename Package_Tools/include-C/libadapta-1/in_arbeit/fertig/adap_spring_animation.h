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
#include "adap-spring-params.h"



#define ADAP_TYPE_SPRING_ANIMATION (adap_spring_animation_get_type())

//GDK_DECLARE_INTERNAL_TYPE (AdapSpringAnimation, adap_spring_animation, ADAP, SPRING_ANIMATION, AdapAnimation)

extern
AdapAnimation *adap_spring_animation_new (GtkWidget          *widget,
                                        double              from,
                                        double              to,
                                        AdapSpringParams    *spring_params,
                                        AdapAnimationTarget *target) ;

extern
double adap_spring_animation_get_value_from (AdapSpringAnimation *self);
extern
void   adap_spring_animation_set_value_from (AdapSpringAnimation *self,
                                            double             value);

extern
double adap_spring_animation_get_value_to (AdapSpringAnimation *self);
extern
void   adap_spring_animation_set_value_to (AdapSpringAnimation *self,
                                          double             value);

extern
AdapSpringParams *adap_spring_animation_get_spring_params (AdapSpringAnimation *self);
extern
void             adap_spring_animation_set_spring_params (AdapSpringAnimation *self,
                                                         AdapSpringParams    *spring_params);

extern
double adap_spring_animation_get_initial_velocity (AdapSpringAnimation *self);
extern
void   adap_spring_animation_set_initial_velocity (AdapSpringAnimation *self,
                                                  double              velocity);

extern
double adap_spring_animation_get_epsilon (AdapSpringAnimation *self);
extern
void   adap_spring_animation_set_epsilon (AdapSpringAnimation *self,
                                         double              epsilon);

extern
gboolean adap_spring_animation_get_clamp (AdapSpringAnimation *self);
extern
void     adap_spring_animation_set_clamp (AdapSpringAnimation *self,
                                         gboolean            clamp);

extern
guint adap_spring_animation_get_estimated_duration (AdapSpringAnimation *self);

extern
double adap_spring_animation_get_velocity (AdapSpringAnimation *self);

extern
double adap_spring_animation_calculate_value    (AdapSpringAnimation *self,
                                                guint              time);
extern
double adap_spring_animation_calculate_velocity (AdapSpringAnimation *self,
                                                guint              time);


