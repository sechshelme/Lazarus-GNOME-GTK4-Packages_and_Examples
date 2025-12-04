/*
 * Copyright (C) 2020 Andrei Lișiță <andreii.lisita@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_STATUS_PAGE (adap_status_page_get_type())

//G_DECLARE_FINAL_TYPE (AdapStatusPage, adap_status_page, ADAP, STATUS_PAGE, GtkWidget)

extern
GtkWidget *adap_status_page_new (void) ;

extern
const char *adap_status_page_get_icon_name (AdapStatusPage *self);
extern
void        adap_status_page_set_icon_name (AdapStatusPage *self,
                                           const char    *icon_name);

extern
GdkPaintable *adap_status_page_get_paintable (AdapStatusPage *self);
extern
void          adap_status_page_set_paintable (AdapStatusPage *self,
                                             GdkPaintable  *paintable);

extern
const char *adap_status_page_get_title (AdapStatusPage *self);
extern
void        adap_status_page_set_title (AdapStatusPage *self,
                                       const char    *title);

extern
const char      *adap_status_page_get_description (AdapStatusPage *self);
extern
void             adap_status_page_set_description (AdapStatusPage *self,
                                                  const char    *description);

extern
GtkWidget *adap_status_page_get_child (AdapStatusPage *self);
extern
void       adap_status_page_set_child (AdapStatusPage *self,
                                      GtkWidget     *child);


