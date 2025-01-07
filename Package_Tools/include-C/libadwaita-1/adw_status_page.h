/*
 * Copyright (C) 2020 Andrei Lișiță <andreii.lisita@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_STATUS_PAGE (adw_status_page_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwStatusPage, adw_status_page, ADW, STATUS_PAGE, GtkWidget)

extern
GtkWidget *adw_status_page_new (void) ;

extern
const char *adw_status_page_get_icon_name (AdwStatusPage *self);
extern
void        adw_status_page_set_icon_name (AdwStatusPage *self,
                                           const char    *icon_name);

extern
GdkPaintable *adw_status_page_get_paintable (AdwStatusPage *self);
extern
void          adw_status_page_set_paintable (AdwStatusPage *self,
                                             GdkPaintable  *paintable);

extern
const char *adw_status_page_get_title (AdwStatusPage *self);
extern
void        adw_status_page_set_title (AdwStatusPage *self,
                                       const char    *title);

extern
const char      *adw_status_page_get_description (AdwStatusPage *self);
extern
void             adw_status_page_set_description (AdwStatusPage *self,
                                                  const char    *description);

extern
GtkWidget *adw_status_page_get_child (AdwStatusPage *self);
extern
void       adw_status_page_set_child (AdwStatusPage *self,
                                      GtkWidget     *child);


