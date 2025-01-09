/*
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
 */

#pragma once

#include "adw-version.h"

#include <glib-object.h>



#define ADW_TYPE_SPRING_PARAMS (adw_spring_params_get_type())

typedef struct _AdwSpringParams AdwSpringParams;

extern
GType adw_spring_params_get_type (void) ;

extern
AdwSpringParams *adw_spring_params_new         (double damping_ratio,
                                                double mass,
                                                double stiffness) ;
extern
AdwSpringParams *adw_spring_params_new_full    (double damping,
                                                double mass,
                                                double stiffness) ;

extern
AdwSpringParams *adw_spring_params_ref   (AdwSpringParams *self);
extern
void             adw_spring_params_unref (AdwSpringParams *self);

extern
double adw_spring_params_get_damping       (AdwSpringParams *self);
extern
double adw_spring_params_get_damping_ratio (AdwSpringParams *self);
extern
double adw_spring_params_get_mass          (AdwSpringParams *self);
extern
double adw_spring_params_get_stiffness     (AdwSpringParams *self);

//G_DEFINE_AUTOPTR_CLEANUP_FUNC (AdwSpringParams, adw_spring_params_unref)


