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
#include "adw-spring-params.h"



#define ADW_TYPE_SPRING_ANIMATION (adw_spring_animation_get_type())

//GDK_DECLARE_INTERNAL_TYPE (AdwSpringAnimation, adw_spring_animation, ADW, SPRING_ANIMATION, AdwAnimation)

extern
AdwAnimation *adw_spring_animation_new (GtkWidget          *widget,
                                        double              from,
                                        double              to,
                                        AdwSpringParams    *spring_params,
                                        AdwAnimationTarget *target) ;

extern
double adw_spring_animation_get_value_from (AdwSpringAnimation *self);
extern
void   adw_spring_animation_set_value_from (AdwSpringAnimation *self,
                                            double             value);

extern
double adw_spring_animation_get_value_to (AdwSpringAnimation *self);
extern
void   adw_spring_animation_set_value_to (AdwSpringAnimation *self,
                                          double             value);

extern
AdwSpringParams *adw_spring_animation_get_spring_params (AdwSpringAnimation *self);
extern
void             adw_spring_animation_set_spring_params (AdwSpringAnimation *self,
                                                         AdwSpringParams    *spring_params);

extern
double adw_spring_animation_get_initial_velocity (AdwSpringAnimation *self);
extern
void   adw_spring_animation_set_initial_velocity (AdwSpringAnimation *self,
                                                  double              velocity);

extern
double adw_spring_animation_get_epsilon (AdwSpringAnimation *self);
extern
void   adw_spring_animation_set_epsilon (AdwSpringAnimation *self,
                                         double              epsilon);

extern
gboolean adw_spring_animation_get_clamp (AdwSpringAnimation *self);
extern
void     adw_spring_animation_set_clamp (AdwSpringAnimation *self,
                                         gboolean            clamp);

extern
guint adw_spring_animation_get_estimated_duration (AdwSpringAnimation *self);

extern
double adw_spring_animation_get_velocity (AdwSpringAnimation *self);

double adw_spring_animation_calculate_value    (AdwSpringAnimation *self,
                                                guint              time);
double adw_spring_animation_calculate_velocity (AdwSpringAnimation *self,
                                                guint              time);


