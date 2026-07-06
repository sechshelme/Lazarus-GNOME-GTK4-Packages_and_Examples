/* GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * Copyright (C) 2004-2006 Christian Hammond
 * Copyright (C) 2008 Cody Russell
 * Copyright (C) 2008 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once


#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkeditable.h>
#include <gtk/gtkentrybuffer.h>




#define GTK_TYPE_TEXT                  (gtk_text_get_type ())
#define GTK_TEXT(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_TEXT, GtkText))
#define GTK_IS_TEXT(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_TEXT))

typedef struct _GtkText              GtkText;

struct _GtkText
{
  /*< private >*/
  GtkWidget  parent_instance;
};

extern
GType           gtk_text_get_type                       (void) ;

extern
GtkWidget *     gtk_text_new                            (void);
extern
GtkWidget *     gtk_text_new_with_buffer                (GtkEntryBuffer  *buffer);

extern
GtkEntryBuffer *gtk_text_get_buffer                     (GtkText         *self);
extern
void            gtk_text_set_buffer                     (GtkText         *self,
                                                         GtkEntryBuffer  *buffer);

extern
void            gtk_text_set_visibility                 (GtkText         *self,
                                                         gboolean         visible);
extern
gboolean        gtk_text_get_visibility                 (GtkText         *self);

extern
void            gtk_text_set_invisible_char             (GtkText         *self,
                                                         gunichar         ch);
extern
gunichar        gtk_text_get_invisible_char             (GtkText         *self);
extern
void            gtk_text_unset_invisible_char           (GtkText         *self);

extern
void            gtk_text_set_overwrite_mode             (GtkText         *self,
                                                         gboolean         overwrite);
extern
gboolean        gtk_text_get_overwrite_mode             (GtkText         *self);

extern
void            gtk_text_set_max_length                 (GtkText         *self,
                                                         int              length);
extern
int             gtk_text_get_max_length                 (GtkText         *self);
extern
guint16         gtk_text_get_text_length                (GtkText         *self);

extern
void            gtk_text_set_activates_default          (GtkText         *self,
                                                         gboolean         activates);
extern
gboolean        gtk_text_get_activates_default          (GtkText         *self);

extern
const char *    gtk_text_get_placeholder_text           (GtkText         *self);
extern
void            gtk_text_set_placeholder_text           (GtkText         *self,
                                                         const char      *text);

extern
void            gtk_text_set_input_purpose              (GtkText         *self,
                                                         GtkInputPurpose  purpose);
extern
GtkInputPurpose gtk_text_get_input_purpose              (GtkText         *self);

extern
void            gtk_text_set_input_hints                (GtkText         *self,
                                                         GtkInputHints    hints);
extern
GtkInputHints   gtk_text_get_input_hints                (GtkText         *self);

extern
void            gtk_text_set_attributes                 (GtkText         *self,
                                                         PangoAttrList   *attrs);
extern
PangoAttrList * gtk_text_get_attributes                 (GtkText         *self);

extern
void            gtk_text_set_tabs                       (GtkText         *self,
                                                         PangoTabArray   *tabs);

extern
PangoTabArray * gtk_text_get_tabs                       (GtkText         *self);

extern
gboolean        gtk_text_grab_focus_without_selecting   (GtkText         *self);

extern
void            gtk_text_set_extra_menu                 (GtkText         *self,
                                                         GMenuModel      *model);
extern
GMenuModel *    gtk_text_get_extra_menu                 (GtkText         *self);

extern
void            gtk_text_set_enable_emoji_completion    (GtkText         *self,
                                                         gboolean         enable_emoji_completion);
extern
gboolean        gtk_text_get_enable_emoji_completion    (GtkText         *self);


extern
void            gtk_text_set_propagate_text_width       (GtkText         *self,
                                                         gboolean         propagate_text_width);
extern
gboolean        gtk_text_get_propagate_text_width       (GtkText         *self);

extern
void            gtk_text_set_truncate_multiline         (GtkText         *self,
                                                         gboolean         truncate_multiline);
extern
gboolean        gtk_text_get_truncate_multiline         (GtkText         *self);

extern
void            gtk_text_compute_cursor_extents         (GtkText         *self,
                                                         gsize            position,
                                                         graphene_rect_t *strong,
                                                         graphene_rect_t *weak);




