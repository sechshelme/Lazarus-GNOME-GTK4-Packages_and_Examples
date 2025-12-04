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



#define ADAP_TYPE_PREFERENCES_GROUP (adap_preferences_group_get_type())

extern
//////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesGroup, adap_preferences_group, ADAP, PREFERENCES_GROUP, GtkWidget)

/**
 * AdapPreferencesGroupClass
 * @parent_class: The parent class
 */
struct _AdapPreferencesGroupClass
{
  GtkWidgetClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_preferences_group_new (void) ;

extern
void adap_preferences_group_add    (AdapPreferencesGroup *self,
                                   GtkWidget           *child);
extern
void adap_preferences_group_remove (AdapPreferencesGroup *self,
                                   GtkWidget           *child);

extern
const char *adap_preferences_group_get_title (AdapPreferencesGroup *self);
extern
void        adap_preferences_group_set_title (AdapPreferencesGroup *self,
                                             const char          *title);

extern
const char *adap_preferences_group_get_description (AdapPreferencesGroup *self);
extern
void        adap_preferences_group_set_description (AdapPreferencesGroup *self,
                                                   const char          *description);

extern
GtkWidget *adap_preferences_group_get_header_suffix (AdapPreferencesGroup *self);
extern
void       adap_preferences_group_set_header_suffix (AdapPreferencesGroup *self,
                                                    GtkWidget           *suffix);


