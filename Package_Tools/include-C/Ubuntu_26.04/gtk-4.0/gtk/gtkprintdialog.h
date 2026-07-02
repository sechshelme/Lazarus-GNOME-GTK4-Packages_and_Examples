/* GTK - The GIMP Toolkit
 *
 * Copyright (C) 2022 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gdk/gdk.h>
#include <gtk/gtkwindow.h>
#include <gtk/print/gtkprintsettings.h>
#include <gtk/print/gtkpagesetup.h>



typedef struct _GtkPrintSetup GtkPrintSetup;

#define GTK_TYPE_PRINT_SETUP (gtk_print_setup_get_type ())

extern
GType           gtk_print_setup_get_type                (void) ;

extern
GtkPrintSetup  *gtk_print_setup_ref                     (GtkPrintSetup        *setup);

extern
void            gtk_print_setup_unref                   (GtkPrintSetup        *setup);

extern
GtkPrintSettings *
                gtk_print_setup_get_print_settings      (GtkPrintSetup        *setup);

extern
GtkPageSetup *  gtk_print_setup_get_page_setup          (GtkPrintSetup        *setup);


#define GTK_TYPE_PRINT_DIALOG (gtk_print_dialog_get_type ())

extern
G_DECLARE_FINAL_TYPE (GtkPrintDialog, gtk_print_dialog, GTK, PRINT_DIALOG, GObject)

extern
GtkPrintDialog *gtk_print_dialog_new                    (void);

extern
const char *    gtk_print_dialog_get_title              (GtkPrintDialog       *self);

extern
void            gtk_print_dialog_set_title              (GtkPrintDialog       *self,
                                                         const char           *title);

extern
const char *    gtk_print_dialog_get_accept_label       (GtkPrintDialog       *self);

extern
void            gtk_print_dialog_set_accept_label       (GtkPrintDialog       *self,
                                                         const char           *accept_label);

extern
gboolean        gtk_print_dialog_get_modal              (GtkPrintDialog       *self);

extern
void            gtk_print_dialog_set_modal              (GtkPrintDialog       *self,
                                                         gboolean              modal);

extern
GtkPageSetup *  gtk_print_dialog_get_page_setup         (GtkPrintDialog       *self);

extern
void            gtk_print_dialog_set_page_setup         (GtkPrintDialog       *self,
                                                         GtkPageSetup         *page_setup);

extern
GtkPrintSettings * gtk_print_dialog_get_print_settings  (GtkPrintDialog       *self);

extern
void               gtk_print_dialog_set_print_settings  (GtkPrintDialog       *self,
                                                         GtkPrintSettings     *print_settings);

extern
void            gtk_print_dialog_setup                  (GtkPrintDialog       *self,
                                                         GtkWindow            *parent,
                                                         GCancellable         *cancellable,
                                                         GAsyncReadyCallback   callback,
                                                         gpointer              user_data);

extern
GtkPrintSetup  *gtk_print_dialog_setup_finish           (GtkPrintDialog       *self,
                                                         GAsyncResult         *result,
                                                         GError              **error);

extern
void            gtk_print_dialog_print                  (GtkPrintDialog       *self,
                                                         GtkWindow            *parent,
                                                         GtkPrintSetup        *setup,
                                                         GCancellable         *cancellable,
                                                         GAsyncReadyCallback   callback,
                                                         gpointer              user_data);

extern
GOutputStream * gtk_print_dialog_print_finish           (GtkPrintDialog       *self,
                                                         GAsyncResult         *result,
                                                         GError              **error);

extern
void            gtk_print_dialog_print_file             (GtkPrintDialog       *self,
                                                         GtkWindow            *parent,
                                                         GtkPrintSetup        *setup,
                                                         GFile                *file,
                                                         GCancellable         *cancellable,
                                                         GAsyncReadyCallback   callback,
                                                         gpointer              user_data);

extern
gboolean        gtk_print_dialog_print_file_finish      (GtkPrintDialog       *self,
                                                         GAsyncResult         *result,
                                                         GError              **error);


