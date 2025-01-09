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



#define ADW_TYPE_PREFERENCES_GROUP (adw_preferences_group_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwPreferencesGroup, adw_preferences_group, ADW, PREFERENCES_GROUP, GtkWidget)

/**
 * AdwPreferencesGroupClass
 * @parent_class: The parent class
 */
struct _AdwPreferencesGroupClass
{
  GtkWidgetClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_preferences_group_new (void) ;

extern
void adw_preferences_group_add    (AdwPreferencesGroup *self,
                                   GtkWidget           *child);
extern
void adw_preferences_group_remove (AdwPreferencesGroup *self,
                                   GtkWidget           *child);

extern
const char *adw_preferences_group_get_title (AdwPreferencesGroup *self);
extern
void        adw_preferences_group_set_title (AdwPreferencesGroup *self,
                                             const char          *title);

extern
const char *adw_preferences_group_get_description (AdwPreferencesGroup *self);
extern
void        adw_preferences_group_set_description (AdwPreferencesGroup *self,
                                                   const char          *description);

GtkWidget *adw_preferences_group_get_header_suffix (AdwPreferencesGroup *self);
void       adw_preferences_group_set_header_suffix (AdwPreferencesGroup *self,
                                                    GtkWidget           *suffix);


