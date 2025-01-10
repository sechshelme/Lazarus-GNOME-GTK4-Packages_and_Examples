/*
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"
#include "adw-toast.h"

#include <gtk/gtk.h>



#define ADW_TYPE_TOAST_OVERLAY (adw_toast_overlay_get_type())

//G_DECLARE_FINAL_TYPE (AdwToastOverlay, adw_toast_overlay, ADW, TOAST_OVERLAY, GtkWidget)

extern
GtkWidget *adw_toast_overlay_new (void) ;

extern
GtkWidget *adw_toast_overlay_get_child (AdwToastOverlay *self);
extern
void       adw_toast_overlay_set_child (AdwToastOverlay *self,
                                        GtkWidget       *child);

extern
void adw_toast_overlay_add_toast (AdwToastOverlay *self,
                                  AdwToast        *toast);


