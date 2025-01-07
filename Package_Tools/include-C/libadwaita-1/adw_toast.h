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

#include <gtk/gtk.h>
#include "adw-enums.h"



typedef enum {
  ADW_TOAST_PRIORITY_NORMAL,
  ADW_TOAST_PRIORITY_HIGH,
} AdwToastPriority;

#define ADW_TYPE_TOAST (adw_toast_get_type())

extern
G_DECLARE_FINAL_TYPE (AdwToast, adw_toast, ADW, TOAST, GObject)

extern
AdwToast *adw_toast_new        (const char *title) ;
ADW_AVAILABLE_IN_1_2
AdwToast *adw_toast_new_format (const char *format,
                                ...) G_GNUC_PRINTF (1, 2) ;

extern
const char *adw_toast_get_title (AdwToast   *self);
extern
void        adw_toast_set_title (AdwToast   *self,
                                 const char *title);

extern
const char *adw_toast_get_button_label (AdwToast   *self);
extern
void        adw_toast_set_button_label (AdwToast   *self,
                                        const char *button_label);

extern
const char *adw_toast_get_action_name (AdwToast   *self);
extern
void        adw_toast_set_action_name (AdwToast   *self,
                                       const char *action_name);

extern
GVariant *adw_toast_get_action_target_value  (AdwToast   *self);
extern
void      adw_toast_set_action_target_value  (AdwToast   *self,
                                              GVariant   *action_target);
extern
void      adw_toast_set_action_target        (AdwToast   *self,
                                              const char *format_string,
                                              ...);
extern
void      adw_toast_set_detailed_action_name (AdwToast   *self,
                                              const char *detailed_action_name);

extern
AdwToastPriority adw_toast_get_priority (AdwToast         *self);
extern
void             adw_toast_set_priority (AdwToast         *self,
                                         AdwToastPriority  priority);

extern
guint adw_toast_get_timeout (AdwToast *self);
extern
void  adw_toast_set_timeout (AdwToast *self,
                             guint     timeout);

ADW_AVAILABLE_IN_1_2
GtkWidget *adw_toast_get_custom_title (AdwToast *self);
ADW_AVAILABLE_IN_1_2
void       adw_toast_set_custom_title (AdwToast  *self,
                                       GtkWidget *widget);

extern
gboolean adw_toast_get_use_markup (AdwToast *self);
extern
void     adw_toast_set_use_markup (AdwToast *self,
                                   gboolean  use_markup);

extern
void adw_toast_dismiss (AdwToast *self);


