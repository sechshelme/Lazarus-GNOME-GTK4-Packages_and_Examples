/*
 * This file is part of GtkSourceView
 *
 * Copyright 2021 Christian Hergert <chergert@redhat.com>
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

#include <gtk/gtk.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_HOVER_DISPLAY (gtk_source_hover_display_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceHoverDisplay, gtk_source_hover_display, GTK_SOURCE, HOVER_DISPLAY, GtkWidget)

extern
void gtk_source_hover_display_append       (GtkSourceHoverDisplay *self,
                                            GtkWidget             *child);
extern
void gtk_source_hover_display_prepend      (GtkSourceHoverDisplay *self,
                                            GtkWidget             *child);
extern
void gtk_source_hover_display_insert_after (GtkSourceHoverDisplay *self,
                                            GtkWidget             *child,
                                            GtkWidget             *sibling);
extern
void gtk_source_hover_display_remove       (GtkSourceHoverDisplay *self,
                                            GtkWidget             *child);


