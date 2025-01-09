/*
 * Copyright (C) 2021-2022 Purism SPC
 * Copyright (C) 2024 GNOME Foundation Inc.
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



#define ADW_TYPE_ABOUT_DIALOG (adw_about_dialog_get_type())

//G_DECLARE_FINAL_TYPE (AdwAboutDialog, adw_about_dialog, ADW, ABOUT_DIALOG, AdwDialog)

extern
AdwDialog *adw_about_dialog_new (void) ;

extern
AdwDialog *adw_about_dialog_new_from_appdata (const char *resource_path,
                                              const char *release_notes_version) ;

extern
const char *adw_about_dialog_get_application_name (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_application_name (AdwAboutDialog *self,
                                                   const char     *application_name);

extern
const char *adw_about_dialog_get_application_icon (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_application_icon (AdwAboutDialog *self,
                                                   const char     *application_icon);

extern
const char *adw_about_dialog_get_developer_name (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_developer_name (AdwAboutDialog *self,
                                                 const char     *developer_name);

extern
const char *adw_about_dialog_get_version (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_version (AdwAboutDialog *self,
                                          const char     *version);

extern
const char *adw_about_dialog_get_release_notes_version (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_release_notes_version (AdwAboutDialog *self,
                                                        const char     *version);

extern
const char *adw_about_dialog_get_release_notes (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_release_notes (AdwAboutDialog *self,
                                                const char     *release_notes);

extern
const char *adw_about_dialog_get_comments (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_comments (AdwAboutDialog *self,
                                           const char     *comments);

extern
const char *adw_about_dialog_get_website (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_website (AdwAboutDialog *self,
                                          const char     *website);

extern
const char *adw_about_dialog_get_support_url (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_support_url (AdwAboutDialog *self,
                                              const char     *support_url);

extern
const char *adw_about_dialog_get_issue_url (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_issue_url (AdwAboutDialog *self,
                                            const char     *issue_url);

extern
void adw_about_dialog_add_link (AdwAboutDialog *self,
                                const char     *title,
                                const char     *url);

extern
const char *adw_about_dialog_get_debug_info (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_debug_info (AdwAboutDialog *self,
                                             const char     *debug_info);

extern
const char *adw_about_dialog_get_debug_info_filename (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_debug_info_filename (AdwAboutDialog *self,
                                                      const char     *filename);

extern
const char * const *adw_about_dialog_get_developers (AdwAboutDialog *self);
extern
void                adw_about_dialog_set_developers (AdwAboutDialog  *self,
                                                     const char     **developers);

extern
const char * const *adw_about_dialog_get_designers (AdwAboutDialog *self);
extern
void                adw_about_dialog_set_designers (AdwAboutDialog  *self,
                                                    const char     **designers);

extern
const char * const *adw_about_dialog_get_artists (AdwAboutDialog *self);
extern
void                adw_about_dialog_set_artists (AdwAboutDialog  *self,
                                                  const char     **artists);

extern
const char * const *adw_about_dialog_get_documenters (AdwAboutDialog *self);
extern
void                adw_about_dialog_set_documenters (AdwAboutDialog  *self,
                                                      const char     **documenters);

extern
const char *adw_about_dialog_get_translator_credits (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_translator_credits (AdwAboutDialog *self,
                                                     const char     *translator_credits);

extern
void adw_about_dialog_add_credit_section (AdwAboutDialog  *self,
                                          const char      *name,
                                          const char     **people);

extern
void adw_about_dialog_add_acknowledgement_section (AdwAboutDialog  *self,
                                                   const char      *name,
                                                   const char     **people);

extern
const char *adw_about_dialog_get_copyright (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_copyright (AdwAboutDialog *self,
                                            const char     *copyright);

extern
GtkLicense adw_about_dialog_get_license_type (AdwAboutDialog *self);
extern
void       adw_about_dialog_set_license_type (AdwAboutDialog *self,
                                              GtkLicense      license_type);

extern
const char *adw_about_dialog_get_license (AdwAboutDialog *self);
extern
void        adw_about_dialog_set_license (AdwAboutDialog *self,
                                          const char     *license);

extern
void adw_about_dialog_add_legal_section (AdwAboutDialog *self,
                                         const char     *title,
                                         const char     *copyright,
                                         GtkLicense      license_type,
                                         const char     *license);

extern
void adw_show_about_dialog (GtkWidget  *parent,
                            const char *first_property_name,
                            ...) ;

extern
void adw_show_about_dialog_from_appdata (GtkWidget  *parent,
                                         const char *resource_path,
                                         const char *release_notes_version,
                                         const char *first_property_name,
                                         ...) ;


