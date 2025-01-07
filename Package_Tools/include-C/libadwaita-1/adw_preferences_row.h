/*
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_PREFERENCES_ROW (adw_preferences_row_get_type())

extern
G_DECLARE_DERIVABLE_TYPE (AdwPreferencesRow, adw_preferences_row, ADW, PREFERENCES_ROW, GtkListBoxRow)

/**
 * AdwPreferencesRowClass
 * @parent_class: The parent class
 */
struct _AdwPreferencesRowClass
{
  GtkListBoxRowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_preferences_row_new (void) ;

extern
const char *adw_preferences_row_get_title (AdwPreferencesRow *self);
extern
void        adw_preferences_row_set_title (AdwPreferencesRow *self,
                                           const char        *title);

extern
gboolean adw_preferences_row_get_use_underline (AdwPreferencesRow *self);
extern
void     adw_preferences_row_set_use_underline (AdwPreferencesRow *self,
                                                gboolean           use_underline);

ADW_AVAILABLE_IN_1_1
gboolean adw_preferences_row_get_title_selectable (AdwPreferencesRow *self);
ADW_AVAILABLE_IN_1_1
void     adw_preferences_row_set_title_selectable (AdwPreferencesRow *self,
                                                   gboolean           title_selectable);


ADW_AVAILABLE_IN_1_2
gboolean adw_preferences_row_get_use_markup (AdwPreferencesRow *self);
ADW_AVAILABLE_IN_1_2
void     adw_preferences_row_set_use_markup (AdwPreferencesRow *self,
                                             gboolean           use_markup);


