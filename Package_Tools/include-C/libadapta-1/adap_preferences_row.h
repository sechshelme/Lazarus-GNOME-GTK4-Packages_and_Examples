/*
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_PREFERENCES_ROW (adap_preferences_row_get_type())

extern
//////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesRow, adap_preferences_row, ADAP, PREFERENCES_ROW, GtkListBoxRow)

/**
 * AdapPreferencesRowClass
 * @parent_class: The parent class
 */
struct _AdapPreferencesRowClass
{
  GtkListBoxRowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_preferences_row_new (void) ;

extern
const char *adap_preferences_row_get_title (AdapPreferencesRow *self);
extern
void        adap_preferences_row_set_title (AdapPreferencesRow *self,
                                           const char        *title);

extern
gboolean adap_preferences_row_get_use_underline (AdapPreferencesRow *self);
extern
void     adap_preferences_row_set_use_underline (AdapPreferencesRow *self,
                                                gboolean           use_underline);

extern
gboolean adap_preferences_row_get_title_selectable (AdapPreferencesRow *self);
extern
void     adap_preferences_row_set_title_selectable (AdapPreferencesRow *self,
                                                   gboolean           title_selectable);


extern
gboolean adap_preferences_row_get_use_markup (AdapPreferencesRow *self);
extern
void     adap_preferences_row_set_use_markup (AdapPreferencesRow *self,
                                             gboolean           use_markup);


