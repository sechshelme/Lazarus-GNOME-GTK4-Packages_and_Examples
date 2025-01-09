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
#include "adw-navigation-view.h"
#include "adw-preferences-page.h"
#include "adw-toast.h"
#include "adw-window.h"



#define ADW_TYPE_PREFERENCES_WINDOW (adw_preferences_window_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwPreferencesWindow, adw_preferences_window, ADW, PREFERENCES_WINDOW, AdwWindow)

/**
 * AdwPreferencesWindowClass
 * @parent_class: The parent class
 */
struct _AdwPreferencesWindowClass
{
  AdwWindowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_preferences_window_new (void) ;

extern
void adw_preferences_window_add    (AdwPreferencesWindow *self,
                                    AdwPreferencesPage   *page);
extern
void adw_preferences_window_remove (AdwPreferencesWindow *self,
                                    AdwPreferencesPage   *page);

extern
AdwPreferencesPage *adw_preferences_window_get_visible_page (AdwPreferencesWindow *self);
extern
void                adw_preferences_window_set_visible_page (AdwPreferencesWindow *self,
                                                             AdwPreferencesPage   *page);

extern
const char *adw_preferences_window_get_visible_page_name (AdwPreferencesWindow *self);
extern
void        adw_preferences_window_set_visible_page_name (AdwPreferencesWindow *self,
                                                          const char           *name);

extern
gboolean adw_preferences_window_get_search_enabled (AdwPreferencesWindow *self);
extern
void     adw_preferences_window_set_search_enabled (AdwPreferencesWindow *self,
                                                    gboolean              search_enabled);

gboolean adw_preferences_window_get_can_navigate_back (AdwPreferencesWindow *self);
void     adw_preferences_window_set_can_navigate_back (AdwPreferencesWindow *self,
                                                       gboolean              can_navigate_back);

void adw_preferences_window_present_subpage (AdwPreferencesWindow *self,
                                             GtkWidget            *subpage);
void adw_preferences_window_close_subpage   (AdwPreferencesWindow *self);

extern
void     adw_preferences_window_push_subpage (AdwPreferencesWindow *self,
                                              AdwNavigationPage    *page);
extern
gboolean adw_preferences_window_pop_subpage  (AdwPreferencesWindow *self);

extern
void adw_preferences_window_add_toast (AdwPreferencesWindow *self,
                                       AdwToast             *toast);


