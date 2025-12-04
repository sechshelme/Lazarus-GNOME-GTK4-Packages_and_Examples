/*
 * Copyright (C) 2023 Purism SPC
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

#include "adap-breakpoint.h"



#define ADAP_TYPE_BREAKPOINT_BIN (adap_breakpoint_bin_get_type())

//////////G_DECLARE_DERIVABLE_TYPE (AdapBreakpointBin, adap_breakpoint_bin, ADAP, BREAKPOINT_BIN, GtkWidget)

struct _AdapBreakpointBinClass
{
  GtkWidgetClass parent_class;

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_breakpoint_bin_new (void) ;

extern
GtkWidget *adap_breakpoint_bin_get_child (AdapBreakpointBin *self);
extern
void       adap_breakpoint_bin_set_child (AdapBreakpointBin *self,
                                         GtkWidget        *child);

extern
void adap_breakpoint_bin_add_breakpoint (AdapBreakpointBin *self,
                                        AdapBreakpoint    *breakpoint);

extern
void adap_breakpoint_bin_remove_breakpoint (AdapBreakpointBin *self,
                                           AdapBreakpoint    *breakpoint);

extern
AdapBreakpoint *adap_breakpoint_bin_get_current_breakpoint (AdapBreakpointBin *self);


