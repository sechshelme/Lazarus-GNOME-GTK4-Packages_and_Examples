/*
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1+
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>



#define ADAP_TYPE_SPLIT_BUTTON (adap_split_button_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapSplitButton, adap_split_button, ADAP, SPLIT_BUTTON, GtkWidget)

extern
GtkWidget *adap_split_button_new (void) ;

extern
const char *adap_split_button_get_label (AdapSplitButton *self);
extern
void        adap_split_button_set_label (AdapSplitButton *self,
                                        const char     *label);

extern
gboolean adap_split_button_get_use_underline (AdapSplitButton *self);
extern
void     adap_split_button_set_use_underline (AdapSplitButton *self,
                                             gboolean        use_underline);

extern
const char *adap_split_button_get_icon_name (AdapSplitButton *self);
extern
void        adap_split_button_set_icon_name (AdapSplitButton *self,
                                            const char     *icon_name);

extern
GtkWidget *adap_split_button_get_child (AdapSplitButton *self);
extern
void       adap_split_button_set_child (AdapSplitButton *self,
                                       GtkWidget      *child);

extern
gboolean adap_split_button_get_can_shrink (AdapSplitButton *self);
extern
void     adap_split_button_set_can_shrink (AdapSplitButton *self,
                                          gboolean        can_shrink);

extern
GMenuModel *adap_split_button_get_menu_model (AdapSplitButton *self);
extern
void        adap_split_button_set_menu_model (AdapSplitButton *self,
                                             GMenuModel     *menu_model);

extern
GtkPopover *adap_split_button_get_popover (AdapSplitButton *self);
extern
void        adap_split_button_set_popover (AdapSplitButton *self,
                                          GtkPopover     *popover);

extern
GtkArrowType adap_split_button_get_direction (AdapSplitButton *self);
extern
void         adap_split_button_set_direction (AdapSplitButton *self,
                                             GtkArrowType    direction);

extern
const char *adap_split_button_get_dropdown_tooltip (AdapSplitButton *self);
extern
void        adap_split_button_set_dropdown_tooltip (AdapSplitButton *self,
                                                   const char     *tooltip);

extern
void adap_split_button_popup (AdapSplitButton *self);
extern
void adap_split_button_popdown (AdapSplitButton *self);


