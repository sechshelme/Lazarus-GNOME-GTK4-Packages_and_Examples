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
#include "adap-preferences-group.h"



#define ADAP_TYPE_PREFERENCES_PAGE (adap_preferences_page_get_type())

//////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesPage, adap_preferences_page, ADAP, PREFERENCES_PAGE, GtkWidget)

/**
 * AdapPreferencesPageClass
 * @parent_class: The parent class
 */
struct _AdapPreferencesPageClass
{
  GtkWidgetClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_preferences_page_new (void) ;

extern
void adap_preferences_page_add    (AdapPreferencesPage  *self,
                                  AdapPreferencesGroup *group);
extern
void adap_preferences_page_remove (AdapPreferencesPage  *self,
                                  AdapPreferencesGroup *group);

extern
const char *adap_preferences_page_get_icon_name (AdapPreferencesPage *self);
extern
void        adap_preferences_page_set_icon_name (AdapPreferencesPage *self,
                                                const char         *icon_name);

extern
const char *adap_preferences_page_get_title (AdapPreferencesPage *self);
extern
void        adap_preferences_page_set_title (AdapPreferencesPage *self,
                                            const char         *title);

extern
const char *adap_preferences_page_get_description (AdapPreferencesPage *self);
extern
void        adap_preferences_page_set_description (AdapPreferencesPage *self,
                                                  const char         *description);

extern
const char *adap_preferences_page_get_name (AdapPreferencesPage *self);
extern
void        adap_preferences_page_set_name (AdapPreferencesPage *self,
                                           const char         *name);

extern
gboolean adap_preferences_page_get_use_underline (AdapPreferencesPage *self);
extern
void     adap_preferences_page_set_use_underline (AdapPreferencesPage *self,
                                                 gboolean            use_underline);

extern
void adap_preferences_page_scroll_to_top (AdapPreferencesPage *self);


