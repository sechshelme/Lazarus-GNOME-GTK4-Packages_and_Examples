/*
 * Copyright (C) 2022 Purism SPC
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

#include "adw-alert-dialog.h"



#define ADW_TYPE_MESSAGE_DIALOG (adw_message_dialog_get_type())


//G_DECLARE_DERIVABLE_TYPE (AdwMessageDialog, adw_message_dialog, ADW, MESSAGE_DIALOG, GtkWindow)

struct _AdwMessageDialogClass
{
  GtkWindowClass parent_class;

  void (* response) (AdwMessageDialog *self,
                     const char       *response);

  /*< private >*/
  gpointer padding[4];
};


GtkWidget *adw_message_dialog_new (GtkWindow  *parent,
                                   const char *heading,
                                   const char *body);


const char *adw_message_dialog_get_heading (AdwMessageDialog *self);

void        adw_message_dialog_set_heading (AdwMessageDialog *self,
                                            const char       *heading);


gboolean adw_message_dialog_get_heading_use_markup (AdwMessageDialog *self);

void     adw_message_dialog_set_heading_use_markup (AdwMessageDialog *self,
                                                    gboolean          use_markup);


void adw_message_dialog_format_heading (AdwMessageDialog *self,
                                        const char       *format,
                                        ...);


void adw_message_dialog_format_heading_markup (AdwMessageDialog *self,
                                               const char       *format,
                                               ...) ;


const char *adw_message_dialog_get_body (AdwMessageDialog *self);

void        adw_message_dialog_set_body (AdwMessageDialog *self,
                                         const char       *body);


gboolean adw_message_dialog_get_body_use_markup (AdwMessageDialog *self);

void     adw_message_dialog_set_body_use_markup (AdwMessageDialog *self,
                                                 gboolean          use_markup);


void adw_message_dialog_format_body (AdwMessageDialog *self,
                                     const char       *format,
                                     ...) ;


void adw_message_dialog_format_body_markup (AdwMessageDialog *self,
                                            const char       *format,
                                            ...) ;


GtkWidget *adw_message_dialog_get_extra_child (AdwMessageDialog *self);

void       adw_message_dialog_set_extra_child (AdwMessageDialog *self,
                                               GtkWidget        *child);


void adw_message_dialog_add_response (AdwMessageDialog *self,
                                      const char       *id,
                                      const char       *label);

extern
void adw_message_dialog_remove_response (AdwMessageDialog *self,
                                         const char       *id);


void adw_message_dialog_add_responses (AdwMessageDialog *self,
                                       const char       *first_id,
                                       ...) ;


const char *adw_message_dialog_get_response_label (AdwMessageDialog *self,
                                                   const char       *response);

void        adw_message_dialog_set_response_label (AdwMessageDialog *self,
                                                   const char       *response,
                                                   const char       *label);


AdwResponseAppearance adw_message_dialog_get_response_appearance (AdwMessageDialog      *self,
                                                                  const char            *response);

void                  adw_message_dialog_set_response_appearance (AdwMessageDialog      *self,
                                                                  const char            *response,
                                                                  AdwResponseAppearance  appearance);


gboolean adw_message_dialog_get_response_enabled (AdwMessageDialog *self,
                                                  const char       *response);

void     adw_message_dialog_set_response_enabled (AdwMessageDialog *self,
                                                  const char       *response,
                                                  gboolean          enabled);


const char *adw_message_dialog_get_default_response (AdwMessageDialog *self);

void        adw_message_dialog_set_default_response (AdwMessageDialog *self,
                                                     const char       *response);


const char *adw_message_dialog_get_close_response (AdwMessageDialog *self);

void        adw_message_dialog_set_close_response (AdwMessageDialog *self,
                                                   const char       *response);


void adw_message_dialog_response (AdwMessageDialog *self,
                                  const char       *response);


gboolean adw_message_dialog_has_response (AdwMessageDialog *self,
                                          const char       *response);

void        adw_message_dialog_choose        (AdwMessageDialog    *self,
                                              GCancellable        *cancellable,
                                              GAsyncReadyCallback  callback,
                                              gpointer             user_data);

const char *adw_message_dialog_choose_finish (AdwMessageDialog    *self,
                                              GAsyncResult        *result);


