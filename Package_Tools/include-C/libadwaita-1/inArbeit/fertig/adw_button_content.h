/*
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_BUTTON_CONTENT (adw_button_content_get_type())

//G_DECLARE_FINAL_TYPE (AdwButtonContent, adw_button_content, ADW, BUTTON_CONTENT, GtkWidget)

extern
GtkWidget *adw_button_content_new (void) ;

extern
const char *adw_button_content_get_label (AdwButtonContent  *self);
extern
void        adw_button_content_set_label (AdwButtonContent *self,
                                          const char       *label);

extern
const char *adw_button_content_get_icon_name (AdwButtonContent  *self);
extern
void        adw_button_content_set_icon_name (AdwButtonContent *self,
                                              const char       *icon_name);

extern
gboolean adw_button_content_get_use_underline (AdwButtonContent *self);
extern
void     adw_button_content_set_use_underline (AdwButtonContent *self,
                                               gboolean          use_underline);

extern
gboolean adw_button_content_get_can_shrink (AdwButtonContent *self);
extern
void     adw_button_content_set_can_shrink (AdwButtonContent *self,
                                            gboolean          can_shrink);


