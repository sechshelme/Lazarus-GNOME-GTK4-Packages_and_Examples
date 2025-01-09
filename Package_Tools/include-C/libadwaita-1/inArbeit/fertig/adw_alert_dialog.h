/*
 * Copyright (C) 2022 Purism SPC
 * Copyright (C) 2024 GNOME Foundation Inc.
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

#include "adw-dialog.h"
#include "adw-enums.h"



typedef enum {
  ADW_RESPONSE_DEFAULT,
  ADW_RESPONSE_SUGGESTED,
  ADW_RESPONSE_DESTRUCTIVE,
} AdwResponseAppearance;

#define ADW_TYPE_ALERT_DIALOG (adw_alert_dialog_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwAlertDialog, adw_alert_dialog, ADW, ALERT_DIALOG, AdwDialog)

struct _AdwAlertDialogClass
{
  AdwDialogClass parent_class;

  void (* response) (AdwAlertDialog *self,
                     const char     *response);

  /*< private >*/
  gpointer padding[4];
};

extern
AdwDialog *adw_alert_dialog_new (const char *heading,
                                 const char *body);

extern
const char *adw_alert_dialog_get_heading (AdwAlertDialog *self);
extern
void        adw_alert_dialog_set_heading (AdwAlertDialog *self,
                                          const char     *heading);

extern
gboolean adw_alert_dialog_get_heading_use_markup (AdwAlertDialog *self);
extern
void     adw_alert_dialog_set_heading_use_markup (AdwAlertDialog *self,
                                                  gboolean        use_markup);

extern
void adw_alert_dialog_format_heading (AdwAlertDialog *self,
                                      const char     *format,
                                      ...) ;

extern
void adw_alert_dialog_format_heading_markup (AdwAlertDialog *self,
                                             const char     *format,
                                             ...) ;

extern
const char *adw_alert_dialog_get_body (AdwAlertDialog *self);
extern
void        adw_alert_dialog_set_body (AdwAlertDialog *self,
                                       const char     *body);

extern
gboolean adw_alert_dialog_get_body_use_markup (AdwAlertDialog *self);
extern
void     adw_alert_dialog_set_body_use_markup (AdwAlertDialog *self,
                                               gboolean        use_markup);

extern
void adw_alert_dialog_format_body (AdwAlertDialog *self,
                                   const char     *format,
                                   ...) ;

extern
void adw_alert_dialog_format_body_markup (AdwAlertDialog *self,
                                          const char     *format,
                                          ...) ;

extern
GtkWidget *adw_alert_dialog_get_extra_child (AdwAlertDialog *self);
extern
void       adw_alert_dialog_set_extra_child (AdwAlertDialog *self,
                                             GtkWidget      *child);

extern
void adw_alert_dialog_add_response (AdwAlertDialog *self,
                                    const char     *id,
                                    const char     *label);

extern
void adw_alert_dialog_add_responses (AdwAlertDialog *self,
                                     const char     *first_id,
                                     ...) ;

extern
void adw_alert_dialog_remove_response (AdwAlertDialog *self,
                                       const char     *id);

extern
const char *adw_alert_dialog_get_response_label (AdwAlertDialog *self,
                                                 const char     *response);
extern
void        adw_alert_dialog_set_response_label (AdwAlertDialog *self,
                                                 const char     *response,
                                                 const char     *label);

extern
AdwResponseAppearance adw_alert_dialog_get_response_appearance (AdwAlertDialog        *self,
                                                                const char            *response);
extern
void                  adw_alert_dialog_set_response_appearance (AdwAlertDialog        *self,
                                                                const char            *response,
                                                                AdwResponseAppearance  appearance);

extern
gboolean adw_alert_dialog_get_response_enabled (AdwAlertDialog *self,
                                                const char     *response);
extern
void     adw_alert_dialog_set_response_enabled (AdwAlertDialog *self,
                                                const char     *response,
                                                gboolean        enabled);

extern
const char *adw_alert_dialog_get_default_response (AdwAlertDialog *self);
extern
void        adw_alert_dialog_set_default_response (AdwAlertDialog *self,
                                                   const char     *response);

extern
const char *adw_alert_dialog_get_close_response (AdwAlertDialog *self);
extern
void        adw_alert_dialog_set_close_response (AdwAlertDialog *self,
                                                 const char     *response);

extern
gboolean adw_alert_dialog_has_response (AdwAlertDialog *self,
                                        const char     *response);

extern
void        adw_alert_dialog_choose        (AdwAlertDialog      *self,
                                            GtkWidget           *parent,
                                            GCancellable        *cancellable,
                                            GAsyncReadyCallback  callback,
                                            gpointer             user_data);
extern
const char *adw_alert_dialog_choose_finish (AdwAlertDialog   *self,
                                            GAsyncResult     *result);


