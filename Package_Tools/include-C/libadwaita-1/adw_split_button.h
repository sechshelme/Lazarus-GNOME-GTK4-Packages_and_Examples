/*
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1+
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>



#define ADW_TYPE_SPLIT_BUTTON (adw_split_button_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwSplitButton, adw_split_button, ADW, SPLIT_BUTTON, GtkWidget)

extern
GtkWidget *adw_split_button_new (void) ;

extern
const char *adw_split_button_get_label (AdwSplitButton *self);
extern
void        adw_split_button_set_label (AdwSplitButton *self,
                                        const char     *label);

extern
gboolean adw_split_button_get_use_underline (AdwSplitButton *self);
extern
void     adw_split_button_set_use_underline (AdwSplitButton *self,
                                             gboolean        use_underline);

extern
const char *adw_split_button_get_icon_name (AdwSplitButton *self);
extern
void        adw_split_button_set_icon_name (AdwSplitButton *self,
                                            const char     *icon_name);

extern
GtkWidget *adw_split_button_get_child (AdwSplitButton *self);
extern
void       adw_split_button_set_child (AdwSplitButton *self,
                                       GtkWidget      *child);

extern
gboolean adw_split_button_get_can_shrink (AdwSplitButton *self);
extern
void     adw_split_button_set_can_shrink (AdwSplitButton *self,
                                          gboolean        can_shrink);

extern
GMenuModel *adw_split_button_get_menu_model (AdwSplitButton *self);
extern
void        adw_split_button_set_menu_model (AdwSplitButton *self,
                                             GMenuModel     *menu_model);

extern
GtkPopover *adw_split_button_get_popover (AdwSplitButton *self);
extern
void        adw_split_button_set_popover (AdwSplitButton *self,
                                          GtkPopover     *popover);

extern
GtkArrowType adw_split_button_get_direction (AdwSplitButton *self);
extern
void         adw_split_button_set_direction (AdwSplitButton *self,
                                             GtkArrowType    direction);

ADW_AVAILABLE_IN_1_2
const char *adw_split_button_get_dropdown_tooltip (AdwSplitButton *self);
ADW_AVAILABLE_IN_1_2
void        adw_split_button_set_dropdown_tooltip (AdwSplitButton *self,
                                                   const char     *tooltip);

extern
void adw_split_button_popup (AdwSplitButton *self);
extern
void adw_split_button_popdown (AdwSplitButton *self);


