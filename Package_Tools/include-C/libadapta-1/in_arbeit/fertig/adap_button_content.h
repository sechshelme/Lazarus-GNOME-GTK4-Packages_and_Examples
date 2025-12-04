/*
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_BUTTON_CONTENT (adap_button_content_get_type())

//G_DECLARE_FINAL_TYPE (AdapButtonContent, adap_button_content, ADAP, BUTTON_CONTENT, GtkWidget)

extern
GtkWidget *adap_button_content_new (void) ;

extern
const char *adap_button_content_get_label (AdapButtonContent  *self);
extern
void        adap_button_content_set_label (AdapButtonContent *self,
                                          const char       *label);

extern
const char *adap_button_content_get_icon_name (AdapButtonContent  *self);
extern
void        adap_button_content_set_icon_name (AdapButtonContent *self,
                                              const char       *icon_name);

extern
gboolean adap_button_content_get_use_underline (AdapButtonContent *self);
extern
void     adap_button_content_set_use_underline (AdapButtonContent *self,
                                               gboolean          use_underline);

extern
gboolean adap_button_content_get_can_shrink (AdapButtonContent *self);
extern
void     adap_button_content_set_can_shrink (AdapButtonContent *self,
                                            gboolean          can_shrink);


