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
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 */

#pragma once

#include <gtk/gtk.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_COMPLETION (gtk_source_completion_get_type())

extern
G_DECLARE_FINAL_TYPE (GtkSourceCompletion, gtk_source_completion, GTK_SOURCE, COMPLETION, GObject)

extern
GtkSourceView   *gtk_source_completion_get_view            (GtkSourceCompletion         *self);
extern
GtkSourceBuffer *gtk_source_completion_get_buffer          (GtkSourceCompletion         *self);
extern
void             gtk_source_completion_show                (GtkSourceCompletion         *self);
extern
void             gtk_source_completion_hide                (GtkSourceCompletion         *self);
extern
void             gtk_source_completion_add_provider        (GtkSourceCompletion         *self,
                                                            GtkSourceCompletionProvider *provider);
extern
void             gtk_source_completion_remove_provider     (GtkSourceCompletion         *self,
                                                            GtkSourceCompletionProvider *provider);
extern
void             gtk_source_completion_block_interactive   (GtkSourceCompletion         *self);
extern
void             gtk_source_completion_unblock_interactive (GtkSourceCompletion         *self);
extern
guint            gtk_source_completion_get_page_size       (GtkSourceCompletion         *self);
extern
void             gtk_source_completion_set_page_size       (GtkSourceCompletion         *self,
                                                            guint                        page_size);
extern
gboolean         gtk_source_completion_fuzzy_match         (const char                  *haystack,
                                                            const char                  *casefold_needle,
                                                            guint                       *priority);
extern
PangoAttrList   *gtk_source_completion_fuzzy_highlight     (const char                  *haystack,
                                                            const char                  *casefold_query);


