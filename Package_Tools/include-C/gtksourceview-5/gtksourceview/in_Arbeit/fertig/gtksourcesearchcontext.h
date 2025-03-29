/*
 * This file is part of GtkSourceView
 *
 * Copyright 2013, 2016 - Sébastien Wilmet <swilmet@gnome.org>
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



#define GTK_SOURCE_TYPE_SEARCH_CONTEXT (gtk_source_search_context_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceSearchContext, gtk_source_search_context, GTK_SOURCE, SEARCH_CONTEXT, GObject)

extern
GtkSourceSearchContext  *gtk_source_search_context_new                     (GtkSourceBuffer          *buffer,
                                                                            GtkSourceSearchSettings  *settings);
extern
GtkSourceBuffer         *gtk_source_search_context_get_buffer              (GtkSourceSearchContext   *search);
extern
GtkSourceSearchSettings *gtk_source_search_context_get_settings            (GtkSourceSearchContext   *search);
extern
gboolean                 gtk_source_search_context_get_highlight           (GtkSourceSearchContext   *search);
extern
void                     gtk_source_search_context_set_highlight           (GtkSourceSearchContext   *search,
                                                                            gboolean                  highlight);
extern
GtkSourceStyle          *gtk_source_search_context_get_match_style         (GtkSourceSearchContext   *search);
extern
void                     gtk_source_search_context_set_match_style         (GtkSourceSearchContext   *search,
                                                                            GtkSourceStyle           *match_style);
extern
GError                  *gtk_source_search_context_get_regex_error         (GtkSourceSearchContext   *search);
extern
gint                     gtk_source_search_context_get_occurrences_count   (GtkSourceSearchContext   *search);
extern
gint                     gtk_source_search_context_get_occurrence_position (GtkSourceSearchContext   *search,
                                                                            const GtkTextIter        *match_start,
                                                                            const GtkTextIter        *match_end);
extern
gboolean                 gtk_source_search_context_forward                 (GtkSourceSearchContext   *search,
                                                                            const GtkTextIter        *iter,
                                                                            GtkTextIter              *match_start,
                                                                            GtkTextIter              *match_end,
                                                                            gboolean                 *has_wrapped_around);
extern
void                     gtk_source_search_context_forward_async           (GtkSourceSearchContext   *search,
                                                                            const GtkTextIter        *iter,
                                                                            GCancellable             *cancellable,
                                                                            GAsyncReadyCallback       callback,
                                                                            gpointer                  user_data);
extern
gboolean                 gtk_source_search_context_forward_finish          (GtkSourceSearchContext   *search,
                                                                            GAsyncResult             *result,
                                                                            GtkTextIter              *match_start,
                                                                            GtkTextIter              *match_end,
                                                                            gboolean                 *has_wrapped_around,
                                                                            GError                  **error);
extern
gboolean                 gtk_source_search_context_backward                (GtkSourceSearchContext   *search,
                                                                            const GtkTextIter        *iter,
                                                                            GtkTextIter              *match_start,
                                                                            GtkTextIter              *match_end,
                                                                            gboolean                 *has_wrapped_around);
extern
void                     gtk_source_search_context_backward_async          (GtkSourceSearchContext   *search,
                                                                            const GtkTextIter        *iter,
                                                                            GCancellable             *cancellable,
                                                                            GAsyncReadyCallback       callback,
                                                                            gpointer                  user_data);
extern
gboolean                 gtk_source_search_context_backward_finish         (GtkSourceSearchContext   *search,
                                                                            GAsyncResult             *result,
                                                                            GtkTextIter              *match_start,
                                                                            GtkTextIter              *match_end,
                                                                            gboolean                 *has_wrapped_around,
                                                                            GError                  **error);
extern
gboolean                 gtk_source_search_context_replace                 (GtkSourceSearchContext   *search,
                                                                            GtkTextIter              *match_start,
                                                                            GtkTextIter              *match_end,
                                                                            const gchar              *replace,
                                                                            gint                      replace_length,
                                                                            GError                  **error);
extern
guint                    gtk_source_search_context_replace_all             (GtkSourceSearchContext   *search,
                                                                            const gchar              *replace,
                                                                            gint                      replace_length,
                                                                            GError                  **error);


