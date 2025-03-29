/*
 * This file is part of GtkSourceView
 *
 * Copyright 2010 - Jesse van den Kieboom
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


#include "gtksourcetypes.h"
#include "gtksourcegutterrenderer.h"



#define GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT (gtk_source_gutter_renderer_text_get_type())

struct _GtkSourceGutterRendererTextClass
{
	GtkSourceGutterRendererClass parent_class;

	/*< private >*/
	gpointer _reserved[10];
};

//G_DECLARE_DERIVABLE_TYPE (GtkSourceGutterRendererText, gtk_source_gutter_renderer_text, GTK_SOURCE, GUTTER_RENDERER_TEXT, GtkSourceGutterRenderer)

extern
GtkSourceGutterRenderer *gtk_source_gutter_renderer_text_new            (void);
extern
void                     gtk_source_gutter_renderer_text_set_markup     (GtkSourceGutterRendererText *renderer,
                                                                         const gchar                 *markup,
                                                                         gint                         length);
extern
void                     gtk_source_gutter_renderer_text_set_text       (GtkSourceGutterRendererText *renderer,
                                                                         const gchar                 *text,
                                                                         gint                         length);
extern
void                     gtk_source_gutter_renderer_text_measure        (GtkSourceGutterRendererText *renderer,
                                                                         const gchar                 *text,
                                                                         gint                        *width,
                                                                         gint                        *height);
extern
void                     gtk_source_gutter_renderer_text_measure_markup (GtkSourceGutterRendererText *renderer,
                                                                         const gchar                 *markup,
                                                                         gint                        *width,
                                                                         gint                        *height);


