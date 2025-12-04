/*
 * Copyright (C) 2020 Purism SPC
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



#define ADAP_TYPE_CLAMP_SCROLLABLE (adap_clamp_scrollable_get_type())

//G_DECLARE_FINAL_TYPE (AdapClampScrollable, adap_clamp_scrollable, ADAP, CLAMP_SCROLLABLE, GtkWidget)

extern
GtkWidget *adap_clamp_scrollable_new (void) ;

extern
GtkWidget *adap_clamp_scrollable_get_child (AdapClampScrollable *self);
extern
void       adap_clamp_scrollable_set_child (AdapClampScrollable *self,
                                           GtkWidget          *child);

extern
int  adap_clamp_scrollable_get_maximum_size (AdapClampScrollable *self);
extern
void adap_clamp_scrollable_set_maximum_size (AdapClampScrollable *self,
                                            int                 maximum_size);

extern
int  adap_clamp_scrollable_get_tightening_threshold (AdapClampScrollable *self);
extern
void adap_clamp_scrollable_set_tightening_threshold (AdapClampScrollable *self,
                                                    int                 tightening_threshold);

extern
AdapLengthUnit adap_clamp_scrollable_get_unit (AdapClampScrollable *self);
extern
void          adap_clamp_scrollable_set_unit (AdapClampScrollable *self,
                                             AdapLengthUnit       unit);


