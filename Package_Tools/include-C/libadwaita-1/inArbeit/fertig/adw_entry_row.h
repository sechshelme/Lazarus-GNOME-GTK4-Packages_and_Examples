/*
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@protonmail.com>
 * Copyright (C) 2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include "adw-preferences-row.h"



#define ADW_TYPE_ENTRY_ROW (adw_entry_row_get_type())


//G_DECLARE_DERIVABLE_TYPE (AdwEntryRow, adw_entry_row, ADW, ENTRY_ROW, AdwPreferencesRow)

/**
 * AdwEntryRowClass
 * @parent_class: The parent class
 */
struct _AdwEntryRowClass
{
  AdwPreferencesRowClass parent_class;
};


GtkWidget *adw_entry_row_new (void) ;


void adw_entry_row_add_prefix (AdwEntryRow *self,
                               GtkWidget   *widget);

void adw_entry_row_add_suffix (AdwEntryRow *self,
                               GtkWidget   *widget);

void adw_entry_row_remove     (AdwEntryRow *self,
                               GtkWidget   *widget);


gboolean adw_entry_row_get_show_apply_button (AdwEntryRow *self);

void     adw_entry_row_set_show_apply_button (AdwEntryRow *self,
                                              gboolean     show_apply_button);


GtkInputHints adw_entry_row_get_input_hints (AdwEntryRow  *self);

void          adw_entry_row_set_input_hints (AdwEntryRow  *self,
                                             GtkInputHints hints);


GtkInputPurpose adw_entry_row_get_input_purpose (AdwEntryRow    *self);

void            adw_entry_row_set_input_purpose (AdwEntryRow    *self,
                                                 GtkInputPurpose purpose);


gboolean adw_entry_row_get_enable_emoji_completion (AdwEntryRow *self);

void     adw_entry_row_set_enable_emoji_completion (AdwEntryRow *self,
                                                    gboolean     enable_emoji_completion);


PangoAttrList *adw_entry_row_get_attributes (AdwEntryRow   *self);

void           adw_entry_row_set_attributes (AdwEntryRow   *self,
                                             PangoAttrList *attributes);


gboolean adw_entry_row_get_activates_default (AdwEntryRow *self);

void     adw_entry_row_set_activates_default (AdwEntryRow *self,
                                              gboolean     activates);

extern
guint adw_entry_row_get_text_length (AdwEntryRow *self);

gboolean adw_entry_row_grab_focus_without_selecting (AdwEntryRow *self);


