/*
 * Copyright (C) 2019 Purism SPC
 * Copyright (C) 2023 GNOME Foundation Inc
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-dialog.h"
#include "adw-navigation-view.h"
#include "adw-preferences-page.h"
#include "adw-toast.h"



#define ADW_TYPE_PREFERENCES_DIALOG (adw_preferences_dialog_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwPreferencesDialog, adw_preferences_dialog, ADW, PREFERENCES_DIALOG, AdwDialog)

/**
 * AdwPreferencesDialogClass
 * @parent_class: The parent class
 */
struct _AdwPreferencesDialogClass
{
  AdwDialogClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
AdwDialog *adw_preferences_dialog_new (void) ;

extern
void adw_preferences_dialog_add    (AdwPreferencesDialog *self,
                                    AdwPreferencesPage   *page);
extern
void adw_preferences_dialog_remove (AdwPreferencesDialog *self,
                                    AdwPreferencesPage   *page);

extern
AdwPreferencesPage *adw_preferences_dialog_get_visible_page (AdwPreferencesDialog *self);
extern
void                adw_preferences_dialog_set_visible_page (AdwPreferencesDialog *self,
                                                             AdwPreferencesPage   *page);

extern
const char *adw_preferences_dialog_get_visible_page_name (AdwPreferencesDialog *self);
extern
void        adw_preferences_dialog_set_visible_page_name (AdwPreferencesDialog *self,
                                                          const char           *name);

extern
gboolean adw_preferences_dialog_get_search_enabled (AdwPreferencesDialog *self);
extern
void     adw_preferences_dialog_set_search_enabled (AdwPreferencesDialog *self,
                                                    gboolean              search_enabled);

extern
void     adw_preferences_dialog_push_subpage (AdwPreferencesDialog *self,
                                              AdwNavigationPage    *page);
extern
gboolean adw_preferences_dialog_pop_subpage  (AdwPreferencesDialog *self);

extern
void adw_preferences_dialog_add_toast (AdwPreferencesDialog *self,
                                       AdwToast             *toast);


