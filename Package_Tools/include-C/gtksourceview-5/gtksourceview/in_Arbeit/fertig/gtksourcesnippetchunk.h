/*
 * This file is part of GtkSourceView
 *
 * Copyright 2020 Christian Hergert <chergert@redhat.com>
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



#define GTK_SOURCE_TYPE_SNIPPET_CHUNK (gtk_source_snippet_chunk_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceSnippetChunk, gtk_source_snippet_chunk, GTK_SOURCE, SNIPPET_CHUNK, GInitiallyUnowned)

extern
GtkSourceSnippetChunk   *gtk_source_snippet_chunk_new                (void);
extern
GtkSourceSnippetChunk   *gtk_source_snippet_chunk_copy               (GtkSourceSnippetChunk   *chunk);
extern
GtkSourceSnippetContext *gtk_source_snippet_chunk_get_context        (GtkSourceSnippetChunk   *chunk);
extern
void                     gtk_source_snippet_chunk_set_context        (GtkSourceSnippetChunk   *chunk,
                                                                      GtkSourceSnippetContext *context);
extern
const gchar             *gtk_source_snippet_chunk_get_spec           (GtkSourceSnippetChunk   *chunk);
extern
void                     gtk_source_snippet_chunk_set_spec           (GtkSourceSnippetChunk   *chunk,
                                                                      const gchar             *spec);
extern
gint                     gtk_source_snippet_chunk_get_focus_position (GtkSourceSnippetChunk   *chunk);
extern
void                     gtk_source_snippet_chunk_set_focus_position (GtkSourceSnippetChunk   *chunk,
                                                                      gint                     focus_position);
extern
const gchar             *gtk_source_snippet_chunk_get_text           (GtkSourceSnippetChunk   *chunk);
extern
void                     gtk_source_snippet_chunk_set_text           (GtkSourceSnippetChunk   *chunk,
                                                                      const gchar             *text);
extern
gboolean                 gtk_source_snippet_chunk_get_text_set       (GtkSourceSnippetChunk   *chunk);
extern
void                     gtk_source_snippet_chunk_set_text_set       (GtkSourceSnippetChunk   *chunk,
                                                                      gboolean                 text_set);
extern
const char              *gtk_source_snippet_chunk_get_tooltip_text   (GtkSourceSnippetChunk   *chunk);
extern
void                     gtk_source_snippet_chunk_set_tooltip_text   (GtkSourceSnippetChunk   *chunk,
                                                                      const char              *tooltip_text);


