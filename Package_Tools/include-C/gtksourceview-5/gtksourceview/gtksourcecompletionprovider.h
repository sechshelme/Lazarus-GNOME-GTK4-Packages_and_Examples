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

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_COMPLETION_PROVIDER (gtk_source_completion_provider_get_type())

extern
G_DECLARE_INTERFACE (GtkSourceCompletionProvider, gtk_source_completion_provider, GTK_SOURCE, COMPLETION_PROVIDER, GObject)

struct _GtkSourceCompletionProviderInterface
{
	GTypeInterface parent_iface;

	char         *(*get_title)            (GtkSourceCompletionProvider  *self);
	int           (*get_priority)         (GtkSourceCompletionProvider  *self,
	                                       GtkSourceCompletionContext   *context);
	gboolean      (*is_trigger)           (GtkSourceCompletionProvider  *self,
	                                       const GtkTextIter            *iter,
	                                       gunichar                      ch);
	gboolean      (*key_activates)        (GtkSourceCompletionProvider  *self,
	                                       GtkSourceCompletionContext   *context,
	                                       GtkSourceCompletionProposal  *proposal,
	                                       guint                         keyval,
	                                       GdkModifierType               state);
	GListModel   *(*populate)             (GtkSourceCompletionProvider  *self,
	                                       GtkSourceCompletionContext   *context,
	                                       GError                      **error);
	void          (*populate_async)       (GtkSourceCompletionProvider  *self,
	                                       GtkSourceCompletionContext   *context,
	                                       GCancellable                 *cancellable,
	                                       GAsyncReadyCallback           callback,
	                                       gpointer                      user_data);
	GListModel   *(*populate_finish)      (GtkSourceCompletionProvider  *self,
	                                       GAsyncResult                 *result,
	                                       GError                      **error);
	void          (*refilter)             (GtkSourceCompletionProvider  *self,
	                                       GtkSourceCompletionContext   *context,
	                                       GListModel                   *model);
	void          (*display)              (GtkSourceCompletionProvider  *self,
	                                       GtkSourceCompletionContext   *context,
	                                       GtkSourceCompletionProposal  *proposal,
	                                       GtkSourceCompletionCell      *cell);
	void          (*activate)             (GtkSourceCompletionProvider  *self,
	                                       GtkSourceCompletionContext   *context,
	                                       GtkSourceCompletionProposal  *proposal);
	GPtrArray    *(*list_alternates)      (GtkSourceCompletionProvider  *self,
	                                       GtkSourceCompletionContext   *context,
	                                       GtkSourceCompletionProposal  *proposal);
};

extern
char         *gtk_source_completion_provider_get_title         (GtkSourceCompletionProvider  *self);
extern
int           gtk_source_completion_provider_get_priority      (GtkSourceCompletionProvider  *self,
                                                                GtkSourceCompletionContext   *context);
extern
gboolean      gtk_source_completion_provider_is_trigger        (GtkSourceCompletionProvider  *self,
                                                                const GtkTextIter            *iter,
                                                                gunichar                      ch);
extern
gboolean      gtk_source_completion_provider_key_activates     (GtkSourceCompletionProvider  *self,
                                                                GtkSourceCompletionContext   *context,
                                                                GtkSourceCompletionProposal  *proposal,
                                                                guint                         keyval,
                                                                GdkModifierType               state);
extern
void          gtk_source_completion_provider_populate_async    (GtkSourceCompletionProvider  *self,
                                                                GtkSourceCompletionContext   *context,
                                                                GCancellable                 *cancellable,
                                                                GAsyncReadyCallback           callback,
                                                                gpointer                      user_data);
extern
GListModel   *gtk_source_completion_provider_populate_finish   (GtkSourceCompletionProvider  *self,
                                                                GAsyncResult                 *result,
                                                                GError                      **error);
extern
void          gtk_source_completion_provider_refilter          (GtkSourceCompletionProvider  *self,
                                                                GtkSourceCompletionContext   *context,
                                                                GListModel                   *model);
extern
void          gtk_source_completion_provider_display           (GtkSourceCompletionProvider  *self,
                                                                GtkSourceCompletionContext   *context,
                                                                GtkSourceCompletionProposal  *proposal,
                                                                GtkSourceCompletionCell      *cell);
extern
void          gtk_source_completion_provider_activate          (GtkSourceCompletionProvider  *self,
                                                                GtkSourceCompletionContext   *context,
                                                                GtkSourceCompletionProposal  *proposal);
extern
GPtrArray    *gtk_source_completion_provider_list_alternates   (GtkSourceCompletionProvider  *self,
                                                                GtkSourceCompletionContext   *context,
                                                                GtkSourceCompletionProposal  *proposal);


