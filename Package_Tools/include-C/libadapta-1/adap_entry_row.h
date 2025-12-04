/*
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@protonmail.com>
 * Copyright (C) 2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include "adap-preferences-row.h"



#define ADAP_TYPE_ENTRY_ROW (adap_entry_row_get_type())

extern
//////////G_DECLARE_DERIVABLE_TYPE (AdapEntryRow, adap_entry_row, ADAP, ENTRY_ROW, AdapPreferencesRow)

/**
 * AdapEntryRowClass
 * @parent_class: The parent class
 */
struct _AdapEntryRowClass
{
  AdapPreferencesRowClass parent_class;
};

extern
GtkWidget *adap_entry_row_new (void) ;

extern
void adap_entry_row_add_prefix (AdapEntryRow *self,
                               GtkWidget   *widget);
extern
void adap_entry_row_add_suffix (AdapEntryRow *self,
                               GtkWidget   *widget);
extern
void adap_entry_row_remove     (AdapEntryRow *self,
                               GtkWidget   *widget);

extern
gboolean adap_entry_row_get_show_apply_button (AdapEntryRow *self);
extern
void     adap_entry_row_set_show_apply_button (AdapEntryRow *self,
                                              gboolean     show_apply_button);

extern
GtkInputHints adap_entry_row_get_input_hints (AdapEntryRow  *self);
extern
void          adap_entry_row_set_input_hints (AdapEntryRow  *self,
                                             GtkInputHints hints);

extern
GtkInputPurpose adap_entry_row_get_input_purpose (AdapEntryRow    *self);
extern
void            adap_entry_row_set_input_purpose (AdapEntryRow    *self,
                                                 GtkInputPurpose purpose);

extern
gboolean adap_entry_row_get_enable_emoji_completion (AdapEntryRow *self);
extern
void     adap_entry_row_set_enable_emoji_completion (AdapEntryRow *self,
                                                    gboolean     enable_emoji_completion);

extern
PangoAttrList *adap_entry_row_get_attributes (AdapEntryRow   *self);
extern
void           adap_entry_row_set_attributes (AdapEntryRow   *self,
                                             PangoAttrList *attributes);

extern
gboolean adap_entry_row_get_activates_default (AdapEntryRow *self);
extern
void     adap_entry_row_set_activates_default (AdapEntryRow *self,
                                              gboolean     activates);

extern
guint adap_entry_row_get_text_length (AdapEntryRow *self);

extern
gboolean adap_entry_row_grab_focus_without_selecting (AdapEntryRow *self);


