/*
 * This file is part of GtkSourceView
 *
 * Copyright 2005, 2007 Paolo Maggi
 * Copyright 2007 Steve Frécinaux
 * Copyright 2008 Jesse van den Kieboom
 * Copyright 2014 Sébastien Wilmet
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 */


#include <gtk/gtk.h>

#include "gtksourcetypes.h"
#include "gtksourcefile.h"



#define GTK_SOURCE_TYPE_FILE_SAVER  (gtk_source_file_saver_get_type())
#define GTK_SOURCE_FILE_SAVER_ERROR (gtk_source_file_saver_error_quark())

/**
 * GtkSourceFileSaverError:
 * @GTK_SOURCE_FILE_SAVER_ERROR_INVALID_CHARS: The buffer contains invalid
 *   characters.
 * @GTK_SOURCE_FILE_SAVER_ERROR_EXTERNALLY_MODIFIED: The file is externally
 *   modified.
 *
 * An error code used with the %GTK_SOURCE_FILE_SAVER_ERROR domain.
 */
typedef enum _GtkSourceFileSaverError
{
	GTK_SOURCE_FILE_SAVER_ERROR_INVALID_CHARS,
	GTK_SOURCE_FILE_SAVER_ERROR_EXTERNALLY_MODIFIED
} GtkSourceFileSaverError;

/**
 * GtkSourceFileSaverFlags:
 * @GTK_SOURCE_FILE_SAVER_FLAGS_NONE: No flags.
 * @GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_INVALID_CHARS: Ignore invalid characters.
 * @GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_MODIFICATION_TIME: Save file despite external modifications.
 * @GTK_SOURCE_FILE_SAVER_FLAGS_CREATE_BACKUP: Create a backup before saving the file.
 *
 * Flags to define the behavior of a [flags@FileSaverFlags].
 */
typedef enum _GtkSourceFileSaverFlags
{
	GTK_SOURCE_FILE_SAVER_FLAGS_NONE                     = 0,
	GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_INVALID_CHARS     = 1 << 0,
	GTK_SOURCE_FILE_SAVER_FLAGS_IGNORE_MODIFICATION_TIME = 1 << 1,
	GTK_SOURCE_FILE_SAVER_FLAGS_CREATE_BACKUP            = 1 << 2
} GtkSourceFileSaverFlags;

//G_DECLARE_FINAL_TYPE (GtkSourceFileSaver, gtk_source_file_saver, GTK_SOURCE, FILE_SAVER, GObject)

extern
GQuark                    gtk_source_file_saver_error_quark          (void);
extern
GtkSourceFileSaver       *gtk_source_file_saver_new                  (GtkSourceBuffer           *buffer,
                                                                      GtkSourceFile             *file);
extern
GtkSourceFileSaver       *gtk_source_file_saver_new_with_target      (GtkSourceBuffer           *buffer,
                                                                      GtkSourceFile             *file,
                                                                      GFile                     *target_location);
extern
GtkSourceBuffer          *gtk_source_file_saver_get_buffer           (GtkSourceFileSaver        *saver);
extern
GtkSourceFile            *gtk_source_file_saver_get_file             (GtkSourceFileSaver        *saver);
extern
GFile                    *gtk_source_file_saver_get_location         (GtkSourceFileSaver        *saver);
extern
void                      gtk_source_file_saver_set_encoding         (GtkSourceFileSaver        *saver,
                                                                      const GtkSourceEncoding   *encoding);
extern
const GtkSourceEncoding  *gtk_source_file_saver_get_encoding         (GtkSourceFileSaver        *saver);
extern
void                      gtk_source_file_saver_set_newline_type     (GtkSourceFileSaver        *saver,
                                                                      GtkSourceNewlineType       newline_type);
extern
GtkSourceNewlineType      gtk_source_file_saver_get_newline_type     (GtkSourceFileSaver        *saver);
extern
void                      gtk_source_file_saver_set_compression_type (GtkSourceFileSaver        *saver,
                                                                      GtkSourceCompressionType   compression_type);
extern
GtkSourceCompressionType  gtk_source_file_saver_get_compression_type (GtkSourceFileSaver        *saver);
extern
void                      gtk_source_file_saver_set_flags            (GtkSourceFileSaver        *saver,
                                                                      GtkSourceFileSaverFlags    flags);
extern
GtkSourceFileSaverFlags   gtk_source_file_saver_get_flags            (GtkSourceFileSaver        *saver);
extern
void                      gtk_source_file_saver_save_async           (GtkSourceFileSaver        *saver,
                                                                      gint                       io_priority,
                                                                      GCancellable              *cancellable,
                                                                      GFileProgressCallback      progress_callback,
                                                                      gpointer                   progress_callback_data,
                                                                      GDestroyNotify             progress_callback_notify,
                                                                      GAsyncReadyCallback        callback,
                                                                      gpointer                   user_data);
extern
gboolean                  gtk_source_file_saver_save_finish          (GtkSourceFileSaver        *saver,
                                                                      GAsyncResult              *result,
                                                                      GError                   **error);


