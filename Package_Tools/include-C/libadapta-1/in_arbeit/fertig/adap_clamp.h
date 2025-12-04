/*
 * Copyright (C) 2018 Purism SPC
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



#define ADAP_TYPE_CLAMP (adap_clamp_get_type())

//G_DECLARE_FINAL_TYPE (AdapClamp, adap_clamp, ADAP, CLAMP, GtkWidget)

extern
GtkWidget *adap_clamp_new (void) ;

extern
GtkWidget *adap_clamp_get_child (AdapClamp  *self);
extern
void       adap_clamp_set_child (AdapClamp  *self,
                                GtkWidget *child);

extern
int  adap_clamp_get_maximum_size (AdapClamp *self);
extern
void adap_clamp_set_maximum_size (AdapClamp *self,
                                 int       maximum_size);

extern
int  adap_clamp_get_tightening_threshold (AdapClamp *self);
extern
void adap_clamp_set_tightening_threshold (AdapClamp *self,
                                         int       tightening_threshold);

extern
AdapLengthUnit adap_clamp_get_unit (AdapClamp      *self);
extern
void          adap_clamp_set_unit (AdapClamp      *self,
                                  AdapLengthUnit  unit);


