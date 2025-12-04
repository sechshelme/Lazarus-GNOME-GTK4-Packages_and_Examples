/*
 * Copyright (C) 2022 Jamie Murphy <hello@itsjamie.dev>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>
#include "adap-enums.h"



#define ADAP_TYPE_BANNER (adap_banner_get_type())

//G_DECLARE_FINAL_TYPE (AdapBanner, adap_banner, ADAP, BANNER, GtkWidget)

extern
GtkWidget *adap_banner_new (const char *title) ;

extern
const char  *adap_banner_get_title (AdapBanner *self);
extern
void         adap_banner_set_title (AdapBanner  *self,
                                   const char *title);

extern
const char  *adap_banner_get_button_label (AdapBanner *self);
extern
void         adap_banner_set_button_label (AdapBanner  *self,
                                          const char *label);

extern
gboolean adap_banner_get_revealed (AdapBanner *self);
extern
void     adap_banner_set_revealed (AdapBanner *self,
                                  gboolean   revealed);

extern
gboolean adap_banner_get_use_markup (AdapBanner *self);
extern
void     adap_banner_set_use_markup (AdapBanner *self,
                                    gboolean   use_markup);


