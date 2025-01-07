/*
 * Copyright (C) 2023-2024 GNOME Foundation Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alicem@gnome.org>
 */

#pragma once

#if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)
#error "Only <adwaita.h> can be included directly."
#endif

#include "adw-version.h"

#include <gtk/gtk.h>

#include "adw-breakpoint.h"
#include "adw-enums.h"



typedef enum {
  ADW_DIALOG_AUTO,
  ADW_DIALOG_FLOATING,
  ADW_DIALOG_BOTTOM_SHEET,
} AdwDialogPresentationMode;

#define ADW_TYPE_DIALOG (adw_dialog_get_type())

//G_DECLARE_DERIVABLE_TYPE (AdwDialog, adw_dialog, ADW, DIALOG, GtkWidget)

struct _AdwDialogClass
{
  GtkWidgetClass parent_class;

  void (* close_attempt) (AdwDialog *dialog);
  void (* closed)        (AdwDialog *dialog);

  /*< private >*/
  gpointer padding[4];
};

extern
AdwDialog *adw_dialog_new (void) ;

extern
GtkWidget *adw_dialog_get_child (AdwDialog *self);
extern
void       adw_dialog_set_child (AdwDialog *self,
                                 GtkWidget *child);

extern
const char *adw_dialog_get_title (AdwDialog  *self);
extern
void        adw_dialog_set_title (AdwDialog  *self,
                                  const char *title);

extern
gboolean adw_dialog_get_can_close (AdwDialog  *self);
extern
void     adw_dialog_set_can_close (AdwDialog *self,
                                   gboolean   can_close);

extern
int  adw_dialog_get_content_width (AdwDialog  *self);
extern
void adw_dialog_set_content_width (AdwDialog *self,
                                   int        content_width);

extern
int  adw_dialog_get_content_height (AdwDialog  *self);
extern
void adw_dialog_set_content_height (AdwDialog *self,
                                    int        content_height);

extern
gboolean adw_dialog_get_follows_content_size (AdwDialog *self);
extern
void     adw_dialog_set_follows_content_size (AdwDialog *self,
                                              gboolean   follows_content_size);

extern
AdwDialogPresentationMode adw_dialog_get_presentation_mode (AdwDialog                 *self);
extern
void                      adw_dialog_set_presentation_mode (AdwDialog                 *self,
                                                            AdwDialogPresentationMode  presentation_mode);

extern
GtkWidget *adw_dialog_get_focus (AdwDialog *self);
extern
void       adw_dialog_set_focus (AdwDialog *self,
                                 GtkWidget *focus);

extern
GtkWidget *adw_dialog_get_default_widget (AdwDialog *self);
extern
void       adw_dialog_set_default_widget (AdwDialog *self,
                                          GtkWidget *default_widget);

extern
gboolean adw_dialog_close (AdwDialog *self);

extern
void adw_dialog_force_close (AdwDialog *self);

extern
void adw_dialog_add_breakpoint (AdwDialog     *self,
                                AdwBreakpoint *breakpoint);

extern
AdwBreakpoint *adw_dialog_get_current_breakpoint (AdwDialog *self);

extern
void adw_dialog_present (AdwDialog *self,
                         GtkWidget *parent);


