/*
 * Copyright (C) 2022 Purism SPC
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

#include "adap-alert-dialog.h"



#define ADAP_TYPE_MESSAGE_DIALOG (adap_message_dialog_get_type())

//////////G_DECLARE_DERIVABLE_TYPE (AdapMessageDialog, adap_message_dialog, ADAP, MESSAGE_DIALOG, GtkWindow)

struct _AdapMessageDialogClass
{
  GtkWindowClass parent_class;

  void (* response) (AdapMessageDialog *self,
                     const char       *response);

  /*< private >*/
  gpointer padding[4];
};

extern
GtkWidget *adap_message_dialog_new (GtkWindow  *parent,
                                   const char *heading,
                                   const char *body);

extern
const char *adap_message_dialog_get_heading (AdapMessageDialog *self);
extern
void        adap_message_dialog_set_heading (AdapMessageDialog *self,
                                            const char       *heading);

extern
gboolean adap_message_dialog_get_heading_use_markup (AdapMessageDialog *self);
extern
void     adap_message_dialog_set_heading_use_markup (AdapMessageDialog *self,
                                                    gboolean          use_markup);

extern
void adap_message_dialog_format_heading (AdapMessageDialog *self,
                                        const char       *format,
                                        ...);

extern
void adap_message_dialog_format_heading_markup (AdapMessageDialog *self,
                                               const char       *format,
                                               ...) ;

extern
const char *adap_message_dialog_get_body (AdapMessageDialog *self);
extern
void        adap_message_dialog_set_body (AdapMessageDialog *self,
                                         const char       *body);

extern
gboolean adap_message_dialog_get_body_use_markup (AdapMessageDialog *self);
extern
void     adap_message_dialog_set_body_use_markup (AdapMessageDialog *self,
                                                 gboolean          use_markup);

extern
void adap_message_dialog_format_body (AdapMessageDialog *self,
                                     const char       *format,
                                     ...);

extern
void adap_message_dialog_format_body_markup (AdapMessageDialog *self,
                                            const char       *format,
                                            ...);

extern
GtkWidget *adap_message_dialog_get_extra_child (AdapMessageDialog *self);
extern
void       adap_message_dialog_set_extra_child (AdapMessageDialog *self,
                                               GtkWidget        *child);

extern
void adap_message_dialog_add_response (AdapMessageDialog *self,
                                      const char       *id,
                                      const char       *label);

extern
void adap_message_dialog_remove_response (AdapMessageDialog *self,
                                         const char       *id);

extern
void adap_message_dialog_add_responses (AdapMessageDialog *self,
                                       const char       *first_id,
                                       ...) ;

extern
const char *adap_message_dialog_get_response_label (AdapMessageDialog *self,
                                                   const char       *response);
extern
void        adap_message_dialog_set_response_label (AdapMessageDialog *self,
                                                   const char       *response,
                                                   const char       *label);

extern
AdapResponseAppearance adap_message_dialog_get_response_appearance (AdapMessageDialog      *self,
                                                                  const char            *response);
extern
void                  adap_message_dialog_set_response_appearance (AdapMessageDialog      *self,
                                                                  const char            *response,
                                                                  AdapResponseAppearance  appearance);

extern
gboolean adap_message_dialog_get_response_enabled (AdapMessageDialog *self,
                                                  const char       *response);
extern
void     adap_message_dialog_set_response_enabled (AdapMessageDialog *self,
                                                  const char       *response,
                                                  gboolean          enabled);

extern
const char *adap_message_dialog_get_default_response (AdapMessageDialog *self);
extern
void        adap_message_dialog_set_default_response (AdapMessageDialog *self,
                                                     const char       *response);

extern
const char *adap_message_dialog_get_close_response (AdapMessageDialog *self);
extern
void        adap_message_dialog_set_close_response (AdapMessageDialog *self,
                                                   const char       *response);

extern
void adap_message_dialog_response (AdapMessageDialog *self,
                                  const char       *response);

extern
gboolean adap_message_dialog_has_response (AdapMessageDialog *self,
                                          const char       *response);

extern
void        adap_message_dialog_choose        (AdapMessageDialog    *self,
                                              GCancellable        *cancellable,
                                              GAsyncReadyCallback  callback,
                                              gpointer             user_data);

extern
const char *adap_message_dialog_choose_finish (AdapMessageDialog    *self,
                                              GAsyncResult        *result);


