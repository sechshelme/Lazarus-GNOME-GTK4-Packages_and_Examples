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
#include <gtk/gtkfilefilter.h>



#define GTK_TYPE_FILE_DIALOG (gtk_file_dialog_get_type ())

//G_DECLARE_FINAL_TYPE (GtkFileDialog, gtk_file_dialog, GTK, FILE_DIALOG, GObject)

extern
GtkFileDialog * gtk_file_dialog_new                  (void);

extern
const char *    gtk_file_dialog_get_title            (GtkFileDialog        *self);

extern
void            gtk_file_dialog_set_title            (GtkFileDialog        *self,
                                                      const char           *title);

extern
gboolean        gtk_file_dialog_get_modal            (GtkFileDialog        *self);

extern
void            gtk_file_dialog_set_modal            (GtkFileDialog        *self,
                                                      gboolean              modal);

extern
GListModel *     gtk_file_dialog_get_filters         (GtkFileDialog        *self);

extern
void             gtk_file_dialog_set_filters         (GtkFileDialog        *self,
                                                      GListModel           *filters);

extern
GtkFileFilter *  gtk_file_dialog_get_default_filter  (GtkFileDialog        *self);

extern
void             gtk_file_dialog_set_default_filter  (GtkFileDialog        *self,
                                                      GtkFileFilter        *filter);

extern
GFile *          gtk_file_dialog_get_initial_folder  (GtkFileDialog        *self);

extern
void             gtk_file_dialog_set_initial_folder  (GtkFileDialog        *self,
                                                      GFile                *folder);

extern
const char *     gtk_file_dialog_get_initial_name    (GtkFileDialog        *self);

extern
void             gtk_file_dialog_set_initial_name    (GtkFileDialog        *self,
                                                      const char           *name);

extern
GFile *          gtk_file_dialog_get_initial_file    (GtkFileDialog        *self);

extern
void             gtk_file_dialog_set_initial_file    (GtkFileDialog        *self,
                                                      GFile                *file);

extern
const char *    gtk_file_dialog_get_accept_label     (GtkFileDialog        *self);

extern
void             gtk_file_dialog_set_accept_label    (GtkFileDialog        *self,
                                                      const char           *accept_label);

extern
void             gtk_file_dialog_open                (GtkFileDialog        *self,
                                                      GtkWindow            *parent,
                                                      GCancellable         *cancellable,
                                                      GAsyncReadyCallback   callback,
                                                      gpointer              user_data);

extern
GFile *          gtk_file_dialog_open_finish         (GtkFileDialog        *self,
                                                      GAsyncResult         *result,
                                                      GError              **error);

extern
void             gtk_file_dialog_select_folder       (GtkFileDialog        *self,
                                                      GtkWindow            *parent,
                                                      GCancellable         *cancellable,
                                                      GAsyncReadyCallback   callback,
                                                      gpointer              user_data);

extern
GFile *          gtk_file_dialog_select_folder_finish
                                                     (GtkFileDialog        *self,
                                                      GAsyncResult         *result,
                                                      GError              **error);

extern
void             gtk_file_dialog_save                (GtkFileDialog        *self,
                                                      GtkWindow            *parent,
                                                      GCancellable         *cancellable,
                                                      GAsyncReadyCallback   callback,
                                                      gpointer              user_data);

extern
GFile *          gtk_file_dialog_save_finish         (GtkFileDialog        *self,
                                                      GAsyncResult         *result,
                                                      GError               **error);

extern
void             gtk_file_dialog_open_multiple       (GtkFileDialog        *self,
                                                      GtkWindow            *parent,
                                                      GCancellable         *cancellable,
                                                      GAsyncReadyCallback   callback,
                                                      gpointer              user_data);

extern
GListModel *     gtk_file_dialog_open_multiple_finish
                                                     (GtkFileDialog        *self,
                                                      GAsyncResult         *result,
                                                      GError              **error);

extern
void             gtk_file_dialog_select_multiple_folders
                                                     (GtkFileDialog        *self,
                                                      GtkWindow            *parent,
                                                      GCancellable         *cancellable,
                                                      GAsyncReadyCallback   callback,
                                                      gpointer              user_data);

extern
GListModel *     gtk_file_dialog_select_multiple_folders_finish
                                                     (GtkFileDialog        *self,
                                                      GAsyncResult         *result,
                                                      GError              **error);

extern
void             gtk_file_dialog_open_text_file      (GtkFileDialog        *self,
                                                      GtkWindow            *parent,
                                                      GCancellable         *cancellable,
                                                      GAsyncReadyCallback   callback,
                                                      gpointer              user_data);

extern
GFile *          gtk_file_dialog_open_text_file_finish (GtkFileDialog        *self,
                                                        GAsyncResult         *result,
                                                        const char          **encoding,
                                                        GError              **error);

extern
void             gtk_file_dialog_open_multiple_text_files
                                                     (GtkFileDialog        *self,
                                                      GtkWindow            *parent,
                                                      GCancellable         *cancellable,
                                                      GAsyncReadyCallback   callback,
                                                      gpointer              user_data);

extern
GListModel *     gtk_file_dialog_open_multiple_text_files_finish
                                                     (GtkFileDialog        *self,
                                                      GAsyncResult         *result,
                                                      const char          **encoding,
                                                      GError              **error);


extern
void             gtk_file_dialog_save_text_file      (GtkFileDialog        *self,
                                                      GtkWindow            *parent,
                                                      GCancellable         *cancellable,
                                                      GAsyncReadyCallback   callback,
                                                      gpointer              user_data);

extern
GFile *          gtk_file_dialog_save_text_file_finish (GtkFileDialog        *self,
                                                        GAsyncResult         *result,
                                                        const char          **encoding,
                                                        const char          **line_ending,
                                                        GError              **error);


