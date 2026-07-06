/* gtktooltip.h
 *
 * Copyright (C) 2006-2007 Imendio AB
 * Contact: Kristian Rietveld <kris@imendio.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwindow.h>



#define GTK_TYPE_TOOLTIP                 (gtk_tooltip_get_type ())
#define GTK_TOOLTIP(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_TOOLTIP, GtkTooltip))
#define GTK_IS_TOOLTIP(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_TOOLTIP))

extern
GType gtk_tooltip_get_type (void);

extern
void gtk_tooltip_set_markup              (GtkTooltip         *tooltip,
                                          const char         *markup);
extern
void gtk_tooltip_set_text                (GtkTooltip         *tooltip,
                                          const char         *text);
extern
void gtk_tooltip_set_icon                (GtkTooltip         *tooltip,
                                          GdkPaintable       *paintable);
extern
void gtk_tooltip_set_icon_from_icon_name (GtkTooltip         *tooltip,
				          const char         *icon_name);
extern
void gtk_tooltip_set_icon_from_gicon     (GtkTooltip         *tooltip,
					  GIcon              *gicon);
extern
void gtk_tooltip_set_custom	         (GtkTooltip         *tooltip,
                                          GtkWidget          *custom_widget);

extern
void gtk_tooltip_set_tip_area            (GtkTooltip         *tooltip,
                                          const GdkRectangle *rect);

//////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTooltip, g_object_unref)



