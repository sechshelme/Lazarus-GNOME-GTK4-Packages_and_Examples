/*
 * Copyright 2022 Christopher Davis <christopherdavis@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-action-row.h"



#define ADW_TYPE_SPIN_ROW (adw_spin_row_get_type ())

//G_DECLARE_FINAL_TYPE (AdwSpinRow, adw_spin_row, ADW, SPIN_ROW, AdwActionRow)

extern
GtkWidget *adw_spin_row_new            (GtkAdjustment *adjustment,
                                        double         climb_rate,
                                        guint          digits) ;
extern
GtkWidget *adw_spin_row_new_with_range (double         min,
                                        double         max,
                                        double         step) ;
extern
void       adw_spin_row_configure      (AdwSpinRow    *self,
                                        GtkAdjustment *adjustment,
                                        double         climb_rate,
                                        guint          digits);

extern
GtkAdjustment *adw_spin_row_get_adjustment (AdwSpinRow    *self);
extern
void           adw_spin_row_set_adjustment (AdwSpinRow    *self,
                                            GtkAdjustment *adjustment);

extern
double adw_spin_row_get_climb_rate (AdwSpinRow *self);
extern
void   adw_spin_row_set_climb_rate (AdwSpinRow *self,
                                    double      climb_rate);

extern
guint adw_spin_row_get_digits (AdwSpinRow *self);
extern
void  adw_spin_row_set_digits (AdwSpinRow *self,
                               guint       digits);

extern
gboolean adw_spin_row_get_numeric (AdwSpinRow *self);
extern
void     adw_spin_row_set_numeric (AdwSpinRow *self,
                                   gboolean    numeric);

extern
gboolean adw_spin_row_get_snap_to_ticks (AdwSpinRow *self);
extern
void     adw_spin_row_set_snap_to_ticks (AdwSpinRow *self,
                                         gboolean    snap_to_ticks);

extern
GtkSpinButtonUpdatePolicy adw_spin_row_get_update_policy (AdwSpinRow                *self);
extern
void                      adw_spin_row_set_update_policy (AdwSpinRow                *self,
                                                          GtkSpinButtonUpdatePolicy  policy);

extern
double adw_spin_row_get_value (AdwSpinRow *self);
extern
void   adw_spin_row_set_value (AdwSpinRow *self,
                               double      value);

extern
gboolean adw_spin_row_get_wrap (AdwSpinRow *self);
extern
void     adw_spin_row_set_wrap (AdwSpinRow *self,
                                gboolean    wrap);

extern
void adw_spin_row_update (AdwSpinRow *self);

extern
void adw_spin_row_set_range (AdwSpinRow *self,
                             double      min,
                             double      max);


