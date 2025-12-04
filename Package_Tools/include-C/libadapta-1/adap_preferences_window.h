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
#include "adap-navigation-view.h"
#include "adap-preferences-page.h"
#include "adap-toast.h"
#include "adap-window.h"



#define ADAP_TYPE_PREFERENCES_WINDOW (adap_preferences_window_get_type())

extern
//////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesWindow, adap_preferences_window, ADAP, PREFERENCES_WINDOW, AdapWindow)

/**
 * AdapPreferencesWindowClass
 * @parent_class: The parent class
 */
struct _AdapPreferencesWindowClass
{
  AdapWindowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_preferences_window_new (void) ;

extern
void adap_preferences_window_add    (AdapPreferencesWindow *self,
                                    AdapPreferencesPage   *page);
extern
void adap_preferences_window_remove (AdapPreferencesWindow *self,
                                    AdapPreferencesPage   *page);

extern
AdapPreferencesPage *adap_preferences_window_get_visible_page (AdapPreferencesWindow *self);
extern
void                adap_preferences_window_set_visible_page (AdapPreferencesWindow *self,
                                                             AdapPreferencesPage   *page);

extern
const char *adap_preferences_window_get_visible_page_name (AdapPreferencesWindow *self);
extern
void        adap_preferences_window_set_visible_page_name (AdapPreferencesWindow *self,
                                                          const char           *name);

extern
gboolean adap_preferences_window_get_search_enabled (AdapPreferencesWindow *self);
extern
void     adap_preferences_window_set_search_enabled (AdapPreferencesWindow *self,
                                                    gboolean              search_enabled);

ADAP_DEPRECATED_IN_1_4_FOR (adap_navigation_page_get_can_pop)
gboolean adap_preferences_window_get_can_navigate_back (AdapPreferencesWindow *self);
ADAP_DEPRECATED_IN_1_4_FOR (adap_navigation_page_set_can_pop)
void     adap_preferences_window_set_can_navigate_back (AdapPreferencesWindow *self,
                                                       gboolean              can_navigate_back);

ADAP_DEPRECATED_IN_1_4_FOR (adap_preferences_window_push_subpage)
void adap_preferences_window_present_subpage (AdapPreferencesWindow *self,
                                             GtkWidget            *subpage);
ADAP_DEPRECATED_IN_1_4_FOR (adap_preferences_window_pop_subpage)
void adap_preferences_window_close_subpage   (AdapPreferencesWindow *self);

extern
void     adap_preferences_window_push_subpage (AdapPreferencesWindow *self,
                                              AdapNavigationPage    *page);
extern
gboolean adap_preferences_window_pop_subpage  (AdapPreferencesWindow *self);

extern
void adap_preferences_window_add_toast (AdapPreferencesWindow *self,
                                       AdapToast             *toast);


