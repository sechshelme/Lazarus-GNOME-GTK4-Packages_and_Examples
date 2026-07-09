/* gtktreestore.h
 * Copyright (C) 2000  Red Hat, Inc.,  Jonathan Blandford <jrb@redhat.com>
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

#include <gdk/gdk.h>
#include <gtk/deprecated/gtktreemodel.h>
#include <gtk/deprecated/gtktreesortable.h>
#include <stdarg.h>





#define GTK_TYPE_TREE_STORE			(gtk_tree_store_get_type ())
#define GTK_TREE_STORE(obj)			(G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_TREE_STORE, GtkTreeStore))
#define GTK_TREE_STORE_CLASS(klass)		(G_TYPE_CHECK_CLASS_CAST ((klass), GTK_TYPE_TREE_STORE, GtkTreeStoreClass))
#define GTK_IS_TREE_STORE(obj)			(G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_TREE_STORE))
#define GTK_IS_TREE_STORE_CLASS(klass)		(G_TYPE_CHECK_CLASS_TYPE ((klass), GTK_TYPE_TREE_STORE))
#define GTK_TREE_STORE_GET_CLASS(obj)		(G_TYPE_INSTANCE_GET_CLASS ((obj), GTK_TYPE_TREE_STORE, GtkTreeStoreClass))

typedef struct _GtkTreeStore        GtkTreeStore;
typedef struct _GtkTreeStoreClass   GtkTreeStoreClass;
typedef struct _GtkTreeStorePrivate GtkTreeStorePrivate;

struct _GtkTreeStore
{
  GObject parent;

  GtkTreeStorePrivate *priv;
};

struct _GtkTreeStoreClass
{
  GObjectClass parent_class;

  /*< private >*/
  gpointer padding[8];
};


extern
GType         gtk_tree_store_get_type         (void) ;
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
GtkTreeStore *gtk_tree_store_new              (int           n_columns,
					       ...);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
GtkTreeStore *gtk_tree_store_newv             (int           n_columns,
					       GType        *types);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_set_column_types (GtkTreeStore *tree_store,
					       int           n_columns,
					       GType        *types);

/* NOTE: use gtk_tree_model_get to get values from a GtkTreeStore */

extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_set_value        (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       int           column,
					       GValue       *value);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_set              (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       ...);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_set_valuesv      (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       int          *columns,
					       GValue       *values,
					       int           n_values);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_set_valist       (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       va_list       var_args);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
gboolean      gtk_tree_store_remove           (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_insert           (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       GtkTreeIter  *parent,
					       int           position);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_insert_before    (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       GtkTreeIter  *parent,
					       GtkTreeIter  *sibling);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_insert_after     (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       GtkTreeIter  *parent,
					       GtkTreeIter  *sibling);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_insert_with_values (GtkTreeStore *tree_store,
						 GtkTreeIter  *iter,
						 GtkTreeIter  *parent,
						 int           position,
						 ...);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_insert_with_valuesv (GtkTreeStore *tree_store,
						  GtkTreeIter  *iter,
						  GtkTreeIter  *parent,
						  int           position,
						  int          *columns,
						  GValue       *values,
						  int           n_values);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_prepend          (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       GtkTreeIter  *parent);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_append           (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       GtkTreeIter  *parent);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
gboolean      gtk_tree_store_is_ancestor      (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter,
					       GtkTreeIter  *descendant);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
int           gtk_tree_store_iter_depth       (GtkTreeStore *tree_store,
					       GtkTreeIter  *iter);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_clear            (GtkTreeStore *tree_store);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
gboolean      gtk_tree_store_iter_is_valid    (GtkTreeStore *tree_store,
                                               GtkTreeIter  *iter);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_reorder          (GtkTreeStore *tree_store,
                                               GtkTreeIter  *parent,
                                               int          *new_order);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_swap             (GtkTreeStore *tree_store,
                                               GtkTreeIter  *a,
                                               GtkTreeIter  *b);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_move_before      (GtkTreeStore *tree_store,
                                               GtkTreeIter  *iter,
                                               GtkTreeIter  *position);
extern //xxxxxGLIB_DEPRECATED_IN_4_10_FOR(GtkTreeListModel)
void          gtk_tree_store_move_after       (GtkTreeStore *tree_store,
                                               GtkTreeIter  *iter,
                                               GtkTreeIter  *position);

//////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTreeStore, g_object_unref)




