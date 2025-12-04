/*
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
 */

#pragma once

#include "adap-version.h"

#include <glib-object.h>



#define ADAP_TYPE_SPRING_PARAMS (adap_spring_params_get_type())

typedef struct _AdapSpringParams AdapSpringParams;

extern
GType adap_spring_params_get_type (void) ;

extern
AdapSpringParams *adap_spring_params_new         (double damping_ratio,
                                                double mass,
                                                double stiffness) ;
extern
AdapSpringParams *adap_spring_params_new_full    (double damping,
                                                double mass,
                                                double stiffness) ;

extern
AdapSpringParams *adap_spring_params_ref   (AdapSpringParams *self);
extern
void             adap_spring_params_unref (AdapSpringParams *self);

extern
double adap_spring_params_get_damping       (AdapSpringParams *self);
extern
double adap_spring_params_get_damping_ratio (AdapSpringParams *self);
extern
double adap_spring_params_get_mass          (AdapSpringParams *self);
extern
double adap_spring_params_get_stiffness     (AdapSpringParams *self);



