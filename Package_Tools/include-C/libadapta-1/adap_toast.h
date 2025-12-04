/*
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)
#error "Only <adapta.h> can be included directly."
#endif

#include "adap-version.h"

#include <gtk/gtk.h>
#include "adap-enums.h"



typedef enum {
  ADAP_TOAST_PRIORITY_NORMAL,
  ADAP_TOAST_PRIORITY_HIGH,
} AdapToastPriority;

#define ADAP_TYPE_TOAST (adap_toast_get_type())

extern
G_DECLARE_FINAL_TYPE (AdapToast, adap_toast, ADAP, TOAST, GObject)

extern
AdapToast *adap_toast_new        (const char *title) ;
extern
AdapToast *adap_toast_new_format (const char *format,
                                ...) G_GNUC_PRINTF (1, 2) ;

extern
const char *adap_toast_get_title (AdapToast   *self);
extern
void        adap_toast_set_title (AdapToast   *self,
                                 const char *title);

extern
const char *adap_toast_get_button_label (AdapToast   *self);
extern
void        adap_toast_set_button_label (AdapToast   *self,
                                        const char *button_label);

extern
const char *adap_toast_get_action_name (AdapToast   *self);
extern
void        adap_toast_set_action_name (AdapToast   *self,
                                       const char *action_name);

extern
GVariant *adap_toast_get_action_target_value  (AdapToast   *self);
extern
void      adap_toast_set_action_target_value  (AdapToast   *self,
                                              GVariant   *action_target);
extern
void      adap_toast_set_action_target        (AdapToast   *self,
                                              const char *format_string,
                                              ...);
extern
void      adap_toast_set_detailed_action_name (AdapToast   *self,
                                              const char *detailed_action_name);

extern
AdapToastPriority adap_toast_get_priority (AdapToast         *self);
extern
void             adap_toast_set_priority (AdapToast         *self,
                                         AdapToastPriority  priority);

extern
guint adap_toast_get_timeout (AdapToast *self);
extern
void  adap_toast_set_timeout (AdapToast *self,
                             guint     timeout);

extern
GtkWidget *adap_toast_get_custom_title (AdapToast *self);
extern
void       adap_toast_set_custom_title (AdapToast  *self,
                                       GtkWidget *widget);

extern
gboolean adap_toast_get_use_markup (AdapToast *self);
extern
void     adap_toast_set_use_markup (AdapToast *self,
                                   gboolean  use_markup);

extern
void adap_toast_dismiss (AdapToast *self);


