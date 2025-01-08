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



#define ADW_TYPE_APPLICATION_WINDOW (adw_application_window_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwApplicationWindow, adw_application_window, ADW, APPLICATION_WINDOW, GtkApplicationWindow)

struct _AdwApplicationWindowClass
{
  GtkApplicationWindowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_application_window_new (GtkApplication *app) ;

extern
void       adw_application_window_set_content (AdwApplicationWindow *self,
                                               GtkWidget            *content);
extern
GtkWidget *adw_application_window_get_content (AdwApplicationWindow *self);

void adw_application_window_add_breakpoint (AdwApplicationWindow *self,
                                            AdwBreakpoint        *breakpoint);

AdwBreakpoint *adw_application_window_get_current_breakpoint (AdwApplicationWindow *self);

GListModel *adw_application_window_get_dialogs (AdwApplicationWindow *self);

AdwDialog *adw_application_window_get_visible_dialog (AdwApplicationWindow *self);


