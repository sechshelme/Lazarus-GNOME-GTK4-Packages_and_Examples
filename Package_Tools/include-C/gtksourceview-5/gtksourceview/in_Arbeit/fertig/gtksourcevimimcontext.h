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



#define GTK_SOURCE_TYPE_VIM_IM_CONTEXT (gtk_source_vim_im_context_get_type())

//G_DECLARE_FINAL_TYPE (GtkSourceVimIMContext, gtk_source_vim_im_context, GTK_SOURCE, VIM_IM_CONTEXT, GtkIMContext)

extern
GtkIMContext     *gtk_source_vim_im_context_new                  (void);
extern
const char       *gtk_source_vim_im_context_get_command_text     (GtkSourceVimIMContext *self);
extern
const char       *gtk_source_vim_im_context_get_command_bar_text (GtkSourceVimIMContext *self);
extern
void              gtk_source_vim_im_context_execute_command      (GtkSourceVimIMContext *self,
                                                                  const char            *command);


