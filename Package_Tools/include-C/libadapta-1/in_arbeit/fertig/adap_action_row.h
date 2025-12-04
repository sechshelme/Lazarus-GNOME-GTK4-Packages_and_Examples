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

#include "adap-preferences-row.h"



#define ADAP_TYPE_ACTION_ROW (adap_action_row_get_type())

//////////G_DECLARE_DERIVABLE_TYPE (AdapActionRow, adap_action_row, ADAP, ACTION_ROW, AdapPreferencesRow)

/**
 * AdapActionRowClass
 * @parent_class: The parent class
 * @activate: Activates the row to trigger its main action.
 */
struct _AdapActionRowClass
{
  AdapPreferencesRowClass parent_class;

  void (*activate) (AdapActionRow *self);

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_action_row_new (void) ;

extern
void adap_action_row_add_prefix (AdapActionRow *self,
                                GtkWidget    *widget);
extern
void adap_action_row_add_suffix (AdapActionRow *self,
                                GtkWidget    *widget);
extern
void adap_action_row_remove     (AdapActionRow *self,
                                GtkWidget    *widget);

extern
const char  *adap_action_row_get_subtitle (AdapActionRow *self);
extern
void         adap_action_row_set_subtitle (AdapActionRow *self,
                                          const char   *subtitle);

//xxxxxxxxADAP_DEPRECATED_IN_1_3_FOR (adap_action_row_add_prefix)
const char  *adap_action_row_get_icon_name (AdapActionRow *self);
//xxxxxxxxxxADAP_DEPRECATED_IN_1_3_FOR (adap_action_row_add_prefix)
void         adap_action_row_set_icon_name (AdapActionRow *self,
                                           const char   *icon_name);

extern
GtkWidget *adap_action_row_get_activatable_widget (AdapActionRow *self);
extern
void       adap_action_row_set_activatable_widget (AdapActionRow *self,
                                                  GtkWidget    *widget);

extern
int  adap_action_row_get_title_lines (AdapActionRow *self);
extern
void adap_action_row_set_title_lines (AdapActionRow *self,
                                     int           title_lines);

extern
int  adap_action_row_get_subtitle_lines (AdapActionRow *self);
extern
void adap_action_row_set_subtitle_lines (AdapActionRow *self,
                                        int           subtitle_lines);
extern
gboolean
adap_action_row_get_subtitle_selectable (AdapActionRow *self);
extern
void
adap_action_row_set_subtitle_selectable (AdapActionRow *self,
                                        gboolean      subtitle_selectable);

extern
void adap_action_row_activate (AdapActionRow *self);


