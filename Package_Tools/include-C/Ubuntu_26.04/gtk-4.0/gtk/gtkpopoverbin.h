/* gtkpopoverbin.h: A single-child container with a popover
 *
 * SPDX-FileCopyrightText: 2025  Emmanuele Bassi
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>
#include <gtk/gtkpopover.h>



#define GTK_TYPE_POPOVER_BIN (gtk_popover_bin_get_type())

extern
G_DECLARE_FINAL_TYPE (GtkPopoverBin, gtk_popover_bin, GTK, POPOVER_BIN, GtkWidget)

extern
GtkWidget *     gtk_popover_bin_new             (void);

extern
void            gtk_popover_bin_set_child       (GtkPopoverBin *self,
                                                 GtkWidget     *child);
extern
GtkWidget *     gtk_popover_bin_get_child       (GtkPopoverBin *self);

extern
void            gtk_popover_bin_set_menu_model  (GtkPopoverBin *self,
                                                 GMenuModel    *model);
extern
GMenuModel *    gtk_popover_bin_get_menu_model  (GtkPopoverBin *self);
extern
void            gtk_popover_bin_set_popover     (GtkPopoverBin *self,
                                                 GtkWidget     *popover);
extern
GtkWidget *     gtk_popover_bin_get_popover     (GtkPopoverBin *self);
extern
void            gtk_popover_bin_popup           (GtkPopoverBin *self);
extern
void            gtk_popover_bin_popdown         (GtkPopoverBin *self);

extern
void            gtk_popover_bin_set_handle_input (GtkPopoverBin *self,
                                                  gboolean       handle_input);
extern
gboolean        gtk_popover_bin_get_handle_input (GtkPopoverBin *self);


