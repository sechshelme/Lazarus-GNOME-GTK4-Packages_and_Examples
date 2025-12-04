/*
 * Copyright (C) 2020 Alice Mikhaylenko <alicem@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-breakpoint.h"
#include "adap-dialog.h"



#define ADAP_TYPE_WINDOW (adap_window_get_type())

//////////G_DECLARE_DERIVABLE_TYPE (AdapWindow, adap_window, ADAP, WINDOW, GtkWindow)

struct _AdapWindowClass
{
  GtkWindowClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_window_new (void) ;

extern
GtkWidget *adap_window_get_content (AdapWindow *self);
extern
void       adap_window_set_content (AdapWindow *self,
                                   GtkWidget *content);

extern
void adap_window_add_breakpoint (AdapWindow     *self,
                                AdapBreakpoint *breakpoint);

extern
AdapBreakpoint *adap_window_get_current_breakpoint (AdapWindow *self);

extern
GListModel *adap_window_get_dialogs (AdapWindow *self);

extern
AdapDialog *adap_window_get_visible_dialog (AdapWindow *self);


