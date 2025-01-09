/*
 * Copyright (C) 2018 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-preferences-row.h"



#define ADW_TYPE_EXPANDER_ROW (adw_expander_row_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwExpanderRow, adw_expander_row, ADW, EXPANDER_ROW, AdwPreferencesRow)

/**
 * AdwExpanderRowClass
 * @parent_class: The parent class
 */
struct _AdwExpanderRowClass
{
  AdwPreferencesRowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_expander_row_new (void) ;

void adw_expander_row_add_action (AdwExpanderRow *self,
                                  GtkWidget      *widget);
extern
void adw_expander_row_add_prefix (AdwExpanderRow *self,
                                  GtkWidget      *widget);
extern
void adw_expander_row_add_suffix (AdwExpanderRow *self,
                                  GtkWidget      *widget);

extern
void adw_expander_row_add_row    (AdwExpanderRow *self,
                                  GtkWidget      *child);
extern
void adw_expander_row_remove (AdwExpanderRow *self,
                              GtkWidget      *child);

extern
const char *adw_expander_row_get_subtitle (AdwExpanderRow *self);
extern
void        adw_expander_row_set_subtitle (AdwExpanderRow *self,
                                           const char     *subtitle);

const char *adw_expander_row_get_icon_name (AdwExpanderRow *self);
void        adw_expander_row_set_icon_name (AdwExpanderRow *self,
                                            const char     *icon_name);

extern
gboolean adw_expander_row_get_expanded (AdwExpanderRow *self);
extern
void     adw_expander_row_set_expanded (AdwExpanderRow *self,
                                        gboolean        expanded);

extern
gboolean adw_expander_row_get_enable_expansion (AdwExpanderRow *self);
extern
void     adw_expander_row_set_enable_expansion (AdwExpanderRow *self,
                                                gboolean        enable_expansion);

extern
gboolean adw_expander_row_get_show_enable_switch (AdwExpanderRow *self);
extern
void     adw_expander_row_set_show_enable_switch (AdwExpanderRow *self,
                                                  gboolean        show_enable_switch);

gboolean adw_expander_row_get_title_lines (AdwExpanderRow *self);
void     adw_expander_row_set_title_lines (AdwExpanderRow *self,
                                           int             title_lines);

gboolean adw_expander_row_get_subtitle_lines (AdwExpanderRow *self);
void     adw_expander_row_set_subtitle_lines (AdwExpanderRow *self,
                                              int             subtitle_lines);


