/*
 * Copyright (C) 2021 Christopher Davis <christopherdavis@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_WINDOW_TITLE (adw_window_title_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwWindowTitle, adw_window_title, ADW, WINDOW_TITLE, GtkWidget)

extern
GtkWidget *adw_window_title_new (const char *title,
                                 const char *subtitle) ;

extern
const char *adw_window_title_get_title (AdwWindowTitle *self);
extern
void        adw_window_title_set_title (AdwWindowTitle *self,
                                        const char     *title);

extern
const char *adw_window_title_get_subtitle (AdwWindowTitle *self);
extern
void        adw_window_title_set_subtitle (AdwWindowTitle *self,
                                           const char     *subtitle);


