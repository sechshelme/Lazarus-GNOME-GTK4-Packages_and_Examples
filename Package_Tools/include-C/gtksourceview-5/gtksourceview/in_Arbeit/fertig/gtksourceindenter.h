/*
 * This file is part of GtkSourceView
 *
 * Copyright 2015-2021 Christian Hergert <chergert@redhat.com>
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



#define GTK_SOURCE_TYPE_INDENTER (gtk_source_indenter_get_type())

//G_DECLARE_INTERFACE (GtkSourceIndenter, gtk_source_indenter, GTK_SOURCE, INDENTER, GObject)

struct _GtkSourceIndenterInterface
{
	GTypeInterface parent_iface;

	gboolean (*is_trigger) (GtkSourceIndenter *self,
	                        GtkSourceView     *view,
	                        const GtkTextIter *location,
	                        GdkModifierType    state,
	                        guint              keyval);
	void     (*indent)     (GtkSourceIndenter  *self,
	                        GtkSourceView     *view,
	                        GtkTextIter       *iter);
};

extern
gboolean gtk_source_indenter_is_trigger (GtkSourceIndenter *self,
                                         GtkSourceView     *view,
                                         const GtkTextIter *location,
                                         GdkModifierType    state,
                                         guint              keyval);
extern
void     gtk_source_indenter_indent     (GtkSourceIndenter *self,
                                         GtkSourceView     *view,
                                         GtkTextIter       *iter);


