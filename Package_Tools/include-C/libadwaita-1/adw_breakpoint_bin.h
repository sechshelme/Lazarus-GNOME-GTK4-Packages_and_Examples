/*
 * Copyright (C) 2023 Purism SPC
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

#include "adw-breakpoint.h"



#define ADW_TYPE_BREAKPOINT_BIN (adw_breakpoint_bin_get_type())

extern
G_DECLARE_DERIVABLE_TYPE (AdwBreakpointBin, adw_breakpoint_bin, ADW, BREAKPOINT_BIN, GtkWidget)

struct _AdwBreakpointBinClass
{
  GtkWidgetClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adw_breakpoint_bin_new (void) ;

extern
GtkWidget *adw_breakpoint_bin_get_child (AdwBreakpointBin *self);
extern
void       adw_breakpoint_bin_set_child (AdwBreakpointBin *self,
                                         GtkWidget        *child);

extern
void adw_breakpoint_bin_add_breakpoint (AdwBreakpointBin *self,
                                        AdwBreakpoint    *breakpoint);

extern
void adw_breakpoint_bin_remove_breakpoint (AdwBreakpointBin *self,
                                           AdwBreakpoint    *breakpoint);

extern
AdwBreakpoint *adw_breakpoint_bin_get_current_breakpoint (AdwBreakpointBin *self);


