/*
 * Copyright (C) 2020 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-breakpoint.h"
#include "adw-dialog.h"



#define ADW_TYPE_WINDOW (adw_window_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwWindow, adw_window, ADW, WINDOW, GtkWindow)

struct _AdwWindowClass
{
  GtkWindowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_window_new (void) ;

extern
GtkWidget *adw_window_get_content (AdwWindow *self);
extern
void       adw_window_set_content (AdwWindow *self,
                                   GtkWidget *content);

extern
void adw_window_add_breakpoint (AdwWindow     *self,
                                AdwBreakpoint *breakpoint);

extern
AdwBreakpoint *adw_window_get_current_breakpoint (AdwWindow *self);

extern
GListModel *adw_window_get_dialogs (AdwWindow *self);

extern
AdwDialog *adw_window_get_visible_dialog (AdwWindow *self);


