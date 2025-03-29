/*
 * This file is part of GtkSourceView
 *
 * Copyright 2019 - Christian Hergert <chergert@redhat.com>
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
#include "gtksourcegutterrenderer.h"



#define GTK_SOURCE_TYPE_GUTTER_LINES (gtk_source_gutter_lines_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceGutterLines, gtk_source_gutter_lines, GTK_SOURCE, GUTTER_LINES, GObject)

extern
guint          gtk_source_gutter_lines_get_first        (GtkSourceGutterLines                 *lines);
extern
guint          gtk_source_gutter_lines_get_last         (GtkSourceGutterLines                 *lines);
extern
void           gtk_source_gutter_lines_get_iter_at_line (GtkSourceGutterLines                 *lines,
                                                         GtkTextIter                          *iter,
                                                         guint                                 line);
extern
GtkTextView   *gtk_source_gutter_lines_get_view         (GtkSourceGutterLines                 *lines);
extern
GtkTextBuffer *gtk_source_gutter_lines_get_buffer       (GtkSourceGutterLines                 *lines);
extern
void           gtk_source_gutter_lines_add_qclass       (GtkSourceGutterLines                 *lines,
                                                         guint                                 line,
                                                         GQuark                                qname);
extern
void           gtk_source_gutter_lines_add_class        (GtkSourceGutterLines                 *lines,
                                                         guint                                 line,
                                                         const gchar                          *name);
extern
void           gtk_source_gutter_lines_remove_class     (GtkSourceGutterLines                 *lines,
                                                         guint                                 line,
                                                         const gchar                          *name);
extern
void           gtk_source_gutter_lines_remove_qclass    (GtkSourceGutterLines                 *lines,
                                                         guint                                 line,
                                                         GQuark                                qname);
extern
gboolean       gtk_source_gutter_lines_has_class        (GtkSourceGutterLines                 *lines,
                                                         guint                                 line,
                                                         const gchar                          *name);
extern
gboolean       gtk_source_gutter_lines_has_qclass       (GtkSourceGutterLines                 *lines,
                                                         guint                                 line,
                                                         GQuark                                qname);
extern
gboolean       gtk_source_gutter_lines_is_cursor        (GtkSourceGutterLines                 *lines,
                                                         guint                                 line);
extern
gboolean       gtk_source_gutter_lines_is_prelit        (GtkSourceGutterLines                 *lines,
                                                         guint                                 line);
extern
gboolean       gtk_source_gutter_lines_is_selected      (GtkSourceGutterLines                 *lines,
                                                         guint                                 line);
extern
void           gtk_source_gutter_lines_get_line_yrange  (GtkSourceGutterLines                 *lines,
                                                         guint                                 line,
                                                         GtkSourceGutterRendererAlignmentMode  mode,
                                                         gint                                 *y,
                                                         gint                                 *height);
gboolean       gtk_source_gutter_lines_has_any_class    (GtkSourceGutterLines                 *lines,
                                                         guint                                 line);


