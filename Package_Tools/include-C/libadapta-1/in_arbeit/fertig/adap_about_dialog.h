/*
 * Copyright (C) 2021-2022 Purism SPC
 * Copyright (C) 2024 GNOME Foundation Inc.
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



#define ADAP_TYPE_ABOUT_DIALOG (adap_about_dialog_get_type())

//G_DECLARE_FINAL_TYPE (AdapAboutDialog, adap_about_dialog, ADAP, ABOUT_DIALOG, AdapDialog)

extern
AdapDialog *adap_about_dialog_new (void) ;

extern
AdapDialog *adap_about_dialog_new_from_appdata (const char *resource_path,
                                              const char *release_notes_version) ;

extern
const char *adap_about_dialog_get_application_name (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_application_name (AdapAboutDialog *self,
                                                   const char     *application_name);

extern
const char *adap_about_dialog_get_application_icon (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_application_icon (AdapAboutDialog *self,
                                                   const char     *application_icon);

extern
const char *adap_about_dialog_get_developer_name (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_developer_name (AdapAboutDialog *self,
                                                 const char     *developer_name);

extern
const char *adap_about_dialog_get_version (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_version (AdapAboutDialog *self,
                                          const char     *version);

extern
const char *adap_about_dialog_get_release_notes_version (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_release_notes_version (AdapAboutDialog *self,
                                                        const char     *version);

extern
const char *adap_about_dialog_get_release_notes (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_release_notes (AdapAboutDialog *self,
                                                const char     *release_notes);

extern
const char *adap_about_dialog_get_comments (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_comments (AdapAboutDialog *self,
                                           const char     *comments);

extern
const char *adap_about_dialog_get_website (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_website (AdapAboutDialog *self,
                                          const char     *website);

extern
const char *adap_about_dialog_get_support_url (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_support_url (AdapAboutDialog *self,
                                              const char     *support_url);

extern
const char *adap_about_dialog_get_issue_url (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_issue_url (AdapAboutDialog *self,
                                            const char     *issue_url);

extern
void adap_about_dialog_add_link (AdapAboutDialog *self,
                                const char     *title,
                                const char     *url);

extern
const char *adap_about_dialog_get_debug_info (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_debug_info (AdapAboutDialog *self,
                                             const char     *debug_info);

extern
const char *adap_about_dialog_get_debug_info_filename (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_debug_info_filename (AdapAboutDialog *self,
                                                      const char     *filename);

extern
const char * const *adap_about_dialog_get_developers (AdapAboutDialog *self);
extern
void                adap_about_dialog_set_developers (AdapAboutDialog  *self,
                                                     const char     **developers);

extern
const char * const *adap_about_dialog_get_designers (AdapAboutDialog *self);
extern
void                adap_about_dialog_set_designers (AdapAboutDialog  *self,
                                                    const char     **designers);

extern
const char * const *adap_about_dialog_get_artists (AdapAboutDialog *self);
extern
void                adap_about_dialog_set_artists (AdapAboutDialog  *self,
                                                  const char     **artists);

extern
const char * const *adap_about_dialog_get_documenters (AdapAboutDialog *self);
extern
void                adap_about_dialog_set_documenters (AdapAboutDialog  *self,
                                                      const char     **documenters);

extern
const char *adap_about_dialog_get_translator_credits (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_translator_credits (AdapAboutDialog *self,
                                                     const char     *translator_credits);

extern
void adap_about_dialog_add_credit_section (AdapAboutDialog  *self,
                                          const char      *name,
                                          const char     **people);

extern
void adap_about_dialog_add_acknowledgement_section (AdapAboutDialog  *self,
                                                   const char      *name,
                                                   const char     **people);

extern
const char *adap_about_dialog_get_copyright (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_copyright (AdapAboutDialog *self,
                                            const char     *copyright);

extern
GtkLicense adap_about_dialog_get_license_type (AdapAboutDialog *self);
extern
void       adap_about_dialog_set_license_type (AdapAboutDialog *self,
                                              GtkLicense      license_type);

extern
const char *adap_about_dialog_get_license (AdapAboutDialog *self);
extern
void        adap_about_dialog_set_license (AdapAboutDialog *self,
                                          const char     *license);

extern
void adap_about_dialog_add_legal_section (AdapAboutDialog *self,
                                         const char     *title,
                                         const char     *copyright,
                                         GtkLicense      license_type,
                                         const char     *license);

extern
void adap_show_about_dialog (GtkWidget  *parent,
                            const char *first_property_name,
                            ...) ;

extern
void adap_show_about_dialog_from_appdata (GtkWidget  *parent,
                                         const char *resource_path,
                                         const char *release_notes_version,
                                         const char *first_property_name,
                                         ...) ;


