/*
 * Copyright (C) 2019 Zander Brown <zbrown@gnome.org>
 * Copyright (C) 2019 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>

#include "adap-view-stack.h"



#define ADAP_TYPE_VIEW_SWITCHER (adap_view_switcher_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapViewSwitcher, adap_view_switcher, ADAP, VIEW_SWITCHER, GtkWidget)

typedef enum {
  ADAP_VIEW_SWITCHER_POLICY_NARROW,
  ADAP_VIEW_SWITCHER_POLICY_WIDE,
} AdapViewSwitcherPolicy;

extern
GtkWidget *adap_view_switcher_new (void) ;

extern
AdapViewSwitcherPolicy adap_view_switcher_get_policy (AdapViewSwitcher       *self);
extern
void                  adap_view_switcher_set_policy (AdapViewSwitcher       *self,
                                                    AdapViewSwitcherPolicy  policy);

extern
AdapViewStack *adap_view_switcher_get_stack (AdapViewSwitcher *self);
extern
void          adap_view_switcher_set_stack (AdapViewSwitcher *self,
                                           AdapViewStack    *stack);


