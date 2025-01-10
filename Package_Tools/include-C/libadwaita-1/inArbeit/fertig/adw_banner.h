/*
 * Copyright (C) 2022 Jamie Murphy <hello@itsjamie.dev>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>
#include "adw-enums.h"



#define ADW_TYPE_BANNER (adw_banner_get_type())

//G_DECLARE_FINAL_TYPE (AdwBanner, adw_banner, ADW, BANNER, GtkWidget)

GtkWidget *adw_banner_new (const char *title) ;

const char  *adw_banner_get_title (AdwBanner *self);
void         adw_banner_set_title (AdwBanner  *self,
                                   const char *title);

const char  *adw_banner_get_button_label (AdwBanner *self);
void         adw_banner_set_button_label (AdwBanner  *self,
                                          const char *label);

gboolean adw_banner_get_revealed (AdwBanner *self);
void     adw_banner_set_revealed (AdwBanner *self,
                                  gboolean   revealed);

gboolean adw_banner_get_use_markup (AdwBanner *self);
void     adw_banner_set_use_markup (AdwBanner *self,
                                    gboolean   use_markup);


