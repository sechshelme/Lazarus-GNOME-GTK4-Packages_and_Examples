/*
 * Copyright © 2018 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
 */

#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtklistbase.h>



#define GTK_TYPE_LIST_VIEW         (gtk_list_view_get_type ())
#define GTK_LIST_VIEW(o)           (G_TYPE_CHECK_INSTANCE_CAST ((o), GTK_TYPE_LIST_VIEW, GtkListView))
#define GTK_LIST_VIEW_CLASS(k)     (G_TYPE_CHECK_CLASS_CAST ((k), GTK_TYPE_LIST_VIEW, GtkListViewClass))
#define GTK_IS_LIST_VIEW(o)        (G_TYPE_CHECK_INSTANCE_TYPE ((o), GTK_TYPE_LIST_VIEW))
#define GTK_IS_LIST_VIEW_CLASS(k)  (G_TYPE_CHECK_CLASS_TYPE ((k), GTK_TYPE_LIST_VIEW))
#define GTK_LIST_VIEW_GET_CLASS(o) (G_TYPE_INSTANCE_GET_CLASS ((o), GTK_TYPE_LIST_VIEW, GtkListViewClass))

typedef struct _GtkListView GtkListView;
typedef struct _GtkListViewClass GtkListViewClass;

extern
GType           gtk_list_view_get_type                          (void) ;

extern
GtkWidget *     gtk_list_view_new                               (GtkSelectionModel      *model,
                                                                 GtkListItemFactory     *factory);

extern
GtkSelectionModel *
                gtk_list_view_get_model                         (GtkListView            *self);
extern
void            gtk_list_view_set_model                         (GtkListView            *self,
                                                                 GtkSelectionModel      *model);
extern
void            gtk_list_view_set_factory                       (GtkListView            *self,
                                                                 GtkListItemFactory     *factory);
extern
GtkListItemFactory *
                gtk_list_view_get_factory                       (GtkListView            *self);

extern
void            gtk_list_view_set_header_factory                (GtkListView            *self,
                                                                 GtkListItemFactory     *factory);
extern
GtkListItemFactory *
                gtk_list_view_get_header_factory                (GtkListView            *self);

extern
void            gtk_list_view_set_show_separators               (GtkListView            *self,
                                                                 gboolean                show_separators);
extern
gboolean        gtk_list_view_get_show_separators               (GtkListView            *self);

extern
void            gtk_list_view_set_single_click_activate         (GtkListView            *self,
                                                                 gboolean                single_click_activate);
extern
gboolean        gtk_list_view_get_single_click_activate         (GtkListView            *self);

extern
void            gtk_list_view_set_enable_rubberband             (GtkListView            *self,
                                                                 gboolean                enable_rubberband);
extern
gboolean        gtk_list_view_get_enable_rubberband             (GtkListView            *self);

extern
void            gtk_list_view_set_tab_behavior                  (GtkListView            *self,
                                                                 GtkListTabBehavior      tab_behavior);
extern
GtkListTabBehavior
                gtk_list_view_get_tab_behavior                  (GtkListView            *self);

extern
void            gtk_list_view_scroll_to                         (GtkListView            *self,
                                                                 guint                   pos,
                                                                 GtkListScrollFlags      flags,
                                                                 GtkScrollInfo          *scroll);

//////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkListView, g_object_unref)



