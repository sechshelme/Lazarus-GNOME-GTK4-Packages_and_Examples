/*
 * Copyright (C) 2021-2022 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-window.h"



#define ADW_TYPE_ABOUT_WINDOW (adw_about_window_get_type())


//G_DECLARE_FINAL_TYPE (AdwAboutWindow, adw_about_window, ADW, ABOUT_WINDOW, AdwWindow)


GtkWidget *adw_about_window_new (void) ;

extern
GtkWidget *adw_about_window_new_from_appdata (const char *resource_path,
                                              const char *release_notes_version) ;


const char *adw_about_window_get_application_name (AdwAboutWindow *self);

void        adw_about_window_set_application_name (AdwAboutWindow *self,
                                                   const char     *application_name);


const char *adw_about_window_get_application_icon (AdwAboutWindow *self);

void        adw_about_window_set_application_icon (AdwAboutWindow *self,
                                                   const char     *application_icon);


const char *adw_about_window_get_developer_name (AdwAboutWindow *self);

void        adw_about_window_set_developer_name (AdwAboutWindow *self,
                                                 const char     *developer_name);


const char *adw_about_window_get_version (AdwAboutWindow *self);

void        adw_about_window_set_version (AdwAboutWindow *self,
                                          const char     *version);


const char *adw_about_window_get_release_notes_version (AdwAboutWindow *self);

void        adw_about_window_set_release_notes_version (AdwAboutWindow *self,
                                                        const char     *version);


const char *adw_about_window_get_release_notes (AdwAboutWindow *self);

void        adw_about_window_set_release_notes (AdwAboutWindow *self,
                                                const char     *release_notes);


const char *adw_about_window_get_comments (AdwAboutWindow *self);

void        adw_about_window_set_comments (AdwAboutWindow *self,
                                           const char     *comments);


const char *adw_about_window_get_website (AdwAboutWindow *self);

void        adw_about_window_set_website (AdwAboutWindow *self,
                                          const char     *website);


const char *adw_about_window_get_support_url (AdwAboutWindow *self);

void        adw_about_window_set_support_url (AdwAboutWindow *self,
                                              const char     *support_url);


const char *adw_about_window_get_issue_url (AdwAboutWindow *self);

void        adw_about_window_set_issue_url (AdwAboutWindow *self,
                                            const char     *issue_url);


void adw_about_window_add_link (AdwAboutWindow *self,
                                const char     *title,
                                const char     *url);


const char *adw_about_window_get_debug_info (AdwAboutWindow *self);

void        adw_about_window_set_debug_info (AdwAboutWindow *self,
                                             const char     *debug_info);


const char *adw_about_window_get_debug_info_filename (AdwAboutWindow *self);

void        adw_about_window_set_debug_info_filename (AdwAboutWindow *self,
                                                      const char     *filename);


const char * const *adw_about_window_get_developers (AdwAboutWindow *self);

void                adw_about_window_set_developers (AdwAboutWindow  *self,
                                                     const char     **developers);


const char * const *adw_about_window_get_designers (AdwAboutWindow *self);

void                adw_about_window_set_designers (AdwAboutWindow  *self,
                                                    const char     **designers);


const char * const *adw_about_window_get_artists (AdwAboutWindow *self);

void                adw_about_window_set_artists (AdwAboutWindow  *self,
                                                  const char     **artists);


const char * const *adw_about_window_get_documenters (AdwAboutWindow *self);

void                adw_about_window_set_documenters (AdwAboutWindow  *self,
                                                      const char     **documenters);


const char *adw_about_window_get_translator_credits (AdwAboutWindow *self);

void        adw_about_window_set_translator_credits (AdwAboutWindow *self,
                                                     const char     *translator_credits);


void adw_about_window_add_credit_section (AdwAboutWindow  *self,
                                          const char      *name,
                                          const char     **people);


void adw_about_window_add_acknowledgement_section (AdwAboutWindow  *self,
                                                   const char      *name,
                                                   const char     **people);


const char *adw_about_window_get_copyright (AdwAboutWindow *self);

void        adw_about_window_set_copyright (AdwAboutWindow *self,
                                            const char     *copyright);


GtkLicense adw_about_window_get_license_type (AdwAboutWindow *self);

void       adw_about_window_set_license_type (AdwAboutWindow *self,
                                              GtkLicense      license_type);


const char *adw_about_window_get_license (AdwAboutWindow *self);

void        adw_about_window_set_license (AdwAboutWindow *self,
                                          const char     *license);


void adw_about_window_add_legal_section (AdwAboutWindow *self,
                                         const char     *title,
                                         const char     *copyright,
                                         GtkLicense      license_type,
                                         const char     *license);


void adw_show_about_window (GtkWindow  *parent,
                            const char *first_property_name,
                            ...) ;

extern
void adw_show_about_window_from_appdata (GtkWindow  *parent,
                                         const char *resource_path,
                                         const char *release_notes_version,
                                         const char *first_property_name,
                                         ...) ;


