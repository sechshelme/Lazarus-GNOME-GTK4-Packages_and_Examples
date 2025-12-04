/*
 * Copyright (C) 2021-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>
#include "adap-window.h"



#define ADAP_TYPE_ABOUT_WINDOW (adap_about_window_get_type())

//G_DECLARE_FINAL_TYPE (AdapAboutWindow, adap_about_window, ADAP, ABOUT_WINDOW, AdapWindow)

extern
GtkWidget *adap_about_window_new (void) ;

extern
GtkWidget *adap_about_window_new_from_appdata (const char *resource_path,
                                              const char *release_notes_version) ;

extern
const char *adap_about_window_get_application_name (AdapAboutWindow *self);
extern
void        adap_about_window_set_application_name (AdapAboutWindow *self,
                                                   const char     *application_name);

extern
const char *adap_about_window_get_application_icon (AdapAboutWindow *self);
extern
void        adap_about_window_set_application_icon (AdapAboutWindow *self,
                                                   const char     *application_icon);

extern
const char *adap_about_window_get_developer_name (AdapAboutWindow *self);
extern
void        adap_about_window_set_developer_name (AdapAboutWindow *self,
                                                 const char     *developer_name);

extern
const char *adap_about_window_get_version (AdapAboutWindow *self);
extern
void        adap_about_window_set_version (AdapAboutWindow *self,
                                          const char     *version);

extern
const char *adap_about_window_get_release_notes_version (AdapAboutWindow *self);
extern
void        adap_about_window_set_release_notes_version (AdapAboutWindow *self,
                                                        const char     *version);

extern
const char *adap_about_window_get_release_notes (AdapAboutWindow *self);
extern
void        adap_about_window_set_release_notes (AdapAboutWindow *self,
                                                const char     *release_notes);

extern
const char *adap_about_window_get_comments (AdapAboutWindow *self);
extern
void        adap_about_window_set_comments (AdapAboutWindow *self,
                                           const char     *comments);

extern
const char *adap_about_window_get_website (AdapAboutWindow *self);
extern
void        adap_about_window_set_website (AdapAboutWindow *self,
                                          const char     *website);

extern
const char *adap_about_window_get_support_url (AdapAboutWindow *self);
extern
void        adap_about_window_set_support_url (AdapAboutWindow *self,
                                              const char     *support_url);

extern
const char *adap_about_window_get_issue_url (AdapAboutWindow *self);
extern
void        adap_about_window_set_issue_url (AdapAboutWindow *self,
                                            const char     *issue_url);

extern
void adap_about_window_add_link (AdapAboutWindow *self,
                                const char     *title,
                                const char     *url);

extern
const char *adap_about_window_get_debug_info (AdapAboutWindow *self);
extern
void        adap_about_window_set_debug_info (AdapAboutWindow *self,
                                             const char     *debug_info);

extern
const char *adap_about_window_get_debug_info_filename (AdapAboutWindow *self);
extern
void        adap_about_window_set_debug_info_filename (AdapAboutWindow *self,
                                                      const char     *filename);

extern
const char * const *adap_about_window_get_developers (AdapAboutWindow *self);
extern
void                adap_about_window_set_developers (AdapAboutWindow  *self,
                                                     const char     **developers);

extern
const char * const *adap_about_window_get_designers (AdapAboutWindow *self);
extern
void                adap_about_window_set_designers (AdapAboutWindow  *self,
                                                    const char     **designers);

extern
const char * const *adap_about_window_get_artists (AdapAboutWindow *self);
extern
void                adap_about_window_set_artists (AdapAboutWindow  *self,
                                                  const char     **artists);

extern
const char * const *adap_about_window_get_documenters (AdapAboutWindow *self);
extern
void                adap_about_window_set_documenters (AdapAboutWindow  *self,
                                                      const char     **documenters);

extern
const char *adap_about_window_get_translator_credits (AdapAboutWindow *self);
extern
void        adap_about_window_set_translator_credits (AdapAboutWindow *self,
                                                     const char     *translator_credits);

extern
void adap_about_window_add_credit_section (AdapAboutWindow  *self,
                                          const char      *name,
                                          const char     **people);

extern
void adap_about_window_add_acknowledgement_section (AdapAboutWindow  *self,
                                                   const char      *name,
                                                   const char     **people);

extern
const char *adap_about_window_get_copyright (AdapAboutWindow *self);
extern
void        adap_about_window_set_copyright (AdapAboutWindow *self,
                                            const char     *copyright);

extern
GtkLicense adap_about_window_get_license_type (AdapAboutWindow *self);
extern
void       adap_about_window_set_license_type (AdapAboutWindow *self,
                                              GtkLicense      license_type);

extern
const char *adap_about_window_get_license (AdapAboutWindow *self);
extern
void        adap_about_window_set_license (AdapAboutWindow *self,
                                          const char     *license);

extern
void adap_about_window_add_legal_section (AdapAboutWindow *self,
                                         const char     *title,
                                         const char     *copyright,
                                         GtkLicense      license_type,
                                         const char     *license);

extern
void adap_show_about_window (GtkWindow  *parent,
                            const char *first_property_name,
                            ...) ;

extern
void adap_show_about_window_from_appdata (GtkWindow  *parent,
                                         const char *resource_path,
                                         const char *release_notes_version,
                                         const char *first_property_name,
                                         ...) ;


