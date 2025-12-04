/*
 * Copyright (C) 2019 Purism SPC
 * Copyright (C) 2023 GNOME Foundation Inc
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>
#include "adap-dialog.h"
#include "adap-navigation-view.h"
#include "adap-preferences-page.h"
#include "adap-toast.h"



#define ADAP_TYPE_PREFERENCES_DIALOG (adap_preferences_dialog_get_type())

//////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesDialog, adap_preferences_dialog, ADAP, PREFERENCES_DIALOG, AdapDialog)

/**
 * AdapPreferencesDialogClass
 * @parent_class: The parent class
 */
struct _AdapPreferencesDialogClass
{
  AdapDialogClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
AdapDialog *adap_preferences_dialog_new (void) ;

extern
void adap_preferences_dialog_add    (AdapPreferencesDialog *self,
                                    AdapPreferencesPage   *page);
extern
void adap_preferences_dialog_remove (AdapPreferencesDialog *self,
                                    AdapPreferencesPage   *page);

extern
AdapPreferencesPage *adap_preferences_dialog_get_visible_page (AdapPreferencesDialog *self);
extern
void                adap_preferences_dialog_set_visible_page (AdapPreferencesDialog *self,
                                                             AdapPreferencesPage   *page);

extern
const char *adap_preferences_dialog_get_visible_page_name (AdapPreferencesDialog *self);
extern
void        adap_preferences_dialog_set_visible_page_name (AdapPreferencesDialog *self,
                                                          const char           *name);

extern
gboolean adap_preferences_dialog_get_search_enabled (AdapPreferencesDialog *self);
extern
void     adap_preferences_dialog_set_search_enabled (AdapPreferencesDialog *self,
                                                    gboolean              search_enabled);

extern
void     adap_preferences_dialog_push_subpage (AdapPreferencesDialog *self,
                                              AdapNavigationPage    *page);
extern
gboolean adap_preferences_dialog_pop_subpage  (AdapPreferencesDialog *self);

extern
void adap_preferences_dialog_add_toast (AdapPreferencesDialog *self,
                                       AdapToast             *toast);


