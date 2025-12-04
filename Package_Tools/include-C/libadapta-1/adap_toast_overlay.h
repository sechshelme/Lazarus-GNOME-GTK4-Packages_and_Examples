/*
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"
#include "adap-toast.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_TOAST_OVERLAY (adap_toast_overlay_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapToastOverlay, adap_toast_overlay, ADAP, TOAST_OVERLAY, GtkWidget)

extern
GtkWidget *adap_toast_overlay_new (void) ;

extern
GtkWidget *adap_toast_overlay_get_child (AdapToastOverlay *self);
extern
void       adap_toast_overlay_set_child (AdapToastOverlay *self,
                                        GtkWidget       *child);

extern
void adap_toast_overlay_add_toast (AdapToastOverlay *self,
                                  AdapToast        *toast);


