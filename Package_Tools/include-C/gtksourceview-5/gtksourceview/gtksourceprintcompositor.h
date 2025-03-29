/*
 * This file is part of GtkSourceView
 *
 * Copyright 2003  Gustavo Giráldez
 * Copyright 2007-2008  Paolo Maggi, Paolo Borelli and Yevgen Muntyan
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

#pragma once

#if !defined (GTK_SOURCE_H_INSIDE) && !defined (GTK_SOURCE_COMPILATION)
#error "Only <gtksourceview/gtksource.h> can be included directly."
#endif

#include <gtk/gtk.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_PRINT_COMPOSITOR (gtk_source_print_compositor_get_type())

extern
G_DECLARE_DERIVABLE_TYPE (GtkSourcePrintCompositor, gtk_source_print_compositor, GTK_SOURCE, PRINT_COMPOSITOR, GObject)

struct _GtkSourcePrintCompositorClass
{
	GObjectClass parent_class;

	/*< private >*/
	gpointer _reserved[10];
};

extern
GtkSourcePrintCompositor *gtk_source_print_compositor_new                        (GtkSourceBuffer          *buffer);
extern
GtkSourcePrintCompositor *gtk_source_print_compositor_new_from_view              (GtkSourceView            *view);
extern
GtkSourceBuffer          *gtk_source_print_compositor_get_buffer                 (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_tab_width              (GtkSourcePrintCompositor *compositor,
                                                                                  guint                     width);
extern
guint                     gtk_source_print_compositor_get_tab_width              (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_wrap_mode              (GtkSourcePrintCompositor *compositor,
                                                                                  GtkWrapMode               wrap_mode);
extern
GtkWrapMode               gtk_source_print_compositor_get_wrap_mode              (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_highlight_syntax       (GtkSourcePrintCompositor *compositor,
                                                                                  gboolean                  highlight);
extern
gboolean                  gtk_source_print_compositor_get_highlight_syntax       (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_print_line_numbers     (GtkSourcePrintCompositor *compositor,
                                                                                  guint                     interval);
extern
guint                     gtk_source_print_compositor_get_print_line_numbers     (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_body_font_name         (GtkSourcePrintCompositor *compositor,
                                                                                  const gchar              *font_name);
extern
gchar                    *gtk_source_print_compositor_get_body_font_name         (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_line_numbers_font_name (GtkSourcePrintCompositor *compositor,
                                                                                  const gchar              *font_name);
extern
gchar                    *gtk_source_print_compositor_get_line_numbers_font_name (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_header_font_name       (GtkSourcePrintCompositor *compositor,
                                                                                  const gchar              *font_name);
extern
gchar                    *gtk_source_print_compositor_get_header_font_name       (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_footer_font_name       (GtkSourcePrintCompositor *compositor,
                                                                                  const gchar              *font_name);
extern
gchar                    *gtk_source_print_compositor_get_footer_font_name       (GtkSourcePrintCompositor *compositor);
extern
gdouble                   gtk_source_print_compositor_get_top_margin             (GtkSourcePrintCompositor *compositor,
                                                                                  GtkUnit                   unit);
extern
void                      gtk_source_print_compositor_set_top_margin             (GtkSourcePrintCompositor *compositor,
                                                                                  gdouble                   margin,
                                                                                  GtkUnit                   unit);
extern
gdouble                   gtk_source_print_compositor_get_bottom_margin          (GtkSourcePrintCompositor *compositor,
                                                                                  GtkUnit                   unit);
extern
void                      gtk_source_print_compositor_set_bottom_margin          (GtkSourcePrintCompositor *compositor,
                                                                                  gdouble                   margin,
                                                                                  GtkUnit                   unit);
extern
gdouble                   gtk_source_print_compositor_get_left_margin            (GtkSourcePrintCompositor *compositor,
                                                                                  GtkUnit                   unit);
extern
void                      gtk_source_print_compositor_set_left_margin            (GtkSourcePrintCompositor *compositor,
                                                                                  gdouble                   margin,
                                                                                  GtkUnit                   unit);
extern
gdouble                   gtk_source_print_compositor_get_right_margin           (GtkSourcePrintCompositor *compositor,
                                                                                  GtkUnit                   unit);
extern
void                      gtk_source_print_compositor_set_right_margin           (GtkSourcePrintCompositor *compositor,
                                                                                  gdouble                   margin,
                                                                                  GtkUnit                   unit);
extern
void                      gtk_source_print_compositor_set_print_header           (GtkSourcePrintCompositor *compositor,
                                                                                  gboolean                  print);
extern
gboolean                  gtk_source_print_compositor_get_print_header           (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_print_footer           (GtkSourcePrintCompositor *compositor,
                                                                                  gboolean                  print);
extern
gboolean                  gtk_source_print_compositor_get_print_footer           (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_set_header_format          (GtkSourcePrintCompositor *compositor,
                                                                                  gboolean                  separator,
                                                                                  const gchar              *left,
                                                                                  const gchar              *center,
                                                                                  const gchar              *right);
extern
void                      gtk_source_print_compositor_set_footer_format          (GtkSourcePrintCompositor *compositor,
                                                                                  gboolean                  separator,
                                                                                  const gchar              *left,
                                                                                  const gchar              *center,
                                                                                  const gchar              *right);
extern
gint                      gtk_source_print_compositor_get_n_pages                (GtkSourcePrintCompositor *compositor);
extern
gboolean                  gtk_source_print_compositor_paginate                   (GtkSourcePrintCompositor *compositor,
                                                                                  GtkPrintContext          *context);
extern
gdouble                   gtk_source_print_compositor_get_pagination_progress    (GtkSourcePrintCompositor *compositor);
extern
void                      gtk_source_print_compositor_draw_page                  (GtkSourcePrintCompositor *compositor,
                                                                                  GtkPrintContext          *context,
                                                                                  gint                      page_nr);
GTK_SOURCE_AVAILABLE_IN_5_2
void                      gtk_source_print_compositor_ignore_tag                 (GtkSourcePrintCompositor *compositor,
                                                                                  GtkTextTag               *tag);


