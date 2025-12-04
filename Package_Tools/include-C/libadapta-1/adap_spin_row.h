/*
 * Copyright 2022 Christopher Davis <christopherdavis@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-action-row.h"



#define ADAP_TYPE_SPIN_ROW (adap_spin_row_get_type ())

extern
G_DECLARE_FINAL_TYPE (AdapSpinRow, adap_spin_row, ADAP, SPIN_ROW, AdapActionRow)

extern
GtkWidget *adap_spin_row_new            (GtkAdjustment *adjustment,
                                        double         climb_rate,
                                        guint          digits) ;
extern
GtkWidget *adap_spin_row_new_with_range (double         min,
                                        double         max,
                                        double         step) ;
extern
void       adap_spin_row_configure      (AdapSpinRow    *self,
                                        GtkAdjustment *adjustment,
                                        double         climb_rate,
                                        guint          digits);

extern
GtkAdjustment *adap_spin_row_get_adjustment (AdapSpinRow    *self);
extern
void           adap_spin_row_set_adjustment (AdapSpinRow    *self,
                                            GtkAdjustment *adjustment);

extern
double adap_spin_row_get_climb_rate (AdapSpinRow *self);
extern
void   adap_spin_row_set_climb_rate (AdapSpinRow *self,
                                    double      climb_rate);

extern
guint adap_spin_row_get_digits (AdapSpinRow *self);
extern
void  adap_spin_row_set_digits (AdapSpinRow *self,
                               guint       digits);

extern
gboolean adap_spin_row_get_numeric (AdapSpinRow *self);
extern
void     adap_spin_row_set_numeric (AdapSpinRow *self,
                                   gboolean    numeric);

extern
gboolean adap_spin_row_get_snap_to_ticks (AdapSpinRow *self);
extern
void     adap_spin_row_set_snap_to_ticks (AdapSpinRow *self,
                                         gboolean    snap_to_ticks);

extern
GtkSpinButtonUpdatePolicy adap_spin_row_get_update_policy (AdapSpinRow                *self);
extern
void                      adap_spin_row_set_update_policy (AdapSpinRow                *self,
                                                          GtkSpinButtonUpdatePolicy  policy);

extern
double adap_spin_row_get_value (AdapSpinRow *self);
extern
void   adap_spin_row_set_value (AdapSpinRow *self,
                               double      value);

extern
gboolean adap_spin_row_get_wrap (AdapSpinRow *self);
extern
void     adap_spin_row_set_wrap (AdapSpinRow *self,
                                gboolean    wrap);

extern
void adap_spin_row_update (AdapSpinRow *self);

extern
void adap_spin_row_set_range (AdapSpinRow *self,
                             double      min,
                             double      max);


