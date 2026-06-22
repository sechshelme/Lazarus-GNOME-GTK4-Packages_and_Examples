/* GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997  Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GLib Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GLib Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GLib at ftp://ftp.gtk.org/pub/gtk/.
 */

#ifndef __G_HASH_H__
#define __G_HASH_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>
#include <glib/garray.h>
#include <glib/glist.h>



typedef struct _GHashTable  GHashTable;

typedef gboolean  (*GHRFunc)  (gpointer  key,
                               gpointer  value,
                               gpointer  user_data);

typedef struct _GHashTableIter GHashTableIter;

struct _GHashTableIter
{
  /*< private >*/
  gpointer      dummy1;
  gpointer      dummy2;
  gpointer      dummy3;
  int           dummy4;
  gboolean      dummy5;
  gpointer      dummy6;
};

extern
GHashTable* g_hash_table_new               (GHashFunc       hash_func,
                                            GEqualFunc      key_equal_func);
extern
GHashTable* g_hash_table_new_full          (GHashFunc       hash_func,
                                            GEqualFunc      key_equal_func,
                                            GDestroyNotify  key_destroy_func,
                                            GDestroyNotify  value_destroy_func);
extern
GHashTable *g_hash_table_new_similar       (GHashTable     *other_hash_table);
extern
void        g_hash_table_destroy           (GHashTable     *hash_table);
extern
gboolean    g_hash_table_insert            (GHashTable     *hash_table,
                                            gpointer        key,
                                            gpointer        value);
extern
gboolean    g_hash_table_replace           (GHashTable     *hash_table,
                                            gpointer        key,
                                            gpointer        value);
extern
gboolean    g_hash_table_add               (GHashTable     *hash_table,
                                            gpointer        key);
extern
gboolean    g_hash_table_remove            (GHashTable     *hash_table,
                                            gconstpointer   key);
extern
void        g_hash_table_remove_all        (GHashTable     *hash_table);
extern
gboolean    g_hash_table_steal             (GHashTable     *hash_table,
                                            gconstpointer   key);
extern
gboolean    g_hash_table_steal_extended    (GHashTable     *hash_table,
                                            gconstpointer   lookup_key,
                                            gpointer       *stolen_key,
                                            gpointer       *stolen_value);
extern
void        g_hash_table_steal_all         (GHashTable     *hash_table);
extern
GPtrArray * g_hash_table_steal_all_keys    (GHashTable     *hash_table);
extern
GPtrArray * g_hash_table_steal_all_values  (GHashTable     *hash_table);
extern
gpointer    g_hash_table_lookup            (GHashTable     *hash_table,
                                            gconstpointer   key);
extern
gboolean    g_hash_table_contains          (GHashTable     *hash_table,
                                            gconstpointer   key);
extern
gboolean    g_hash_table_lookup_extended   (GHashTable     *hash_table,
                                            gconstpointer   lookup_key,
                                            gpointer       *orig_key,
                                            gpointer       *value);
extern
void        g_hash_table_foreach           (GHashTable     *hash_table,
                                            GHFunc          func,
                                            gpointer        user_data);
extern
gpointer    g_hash_table_find              (GHashTable     *hash_table,
                                            GHRFunc         predicate,
                                            gpointer        user_data);
extern
guint       g_hash_table_foreach_remove    (GHashTable     *hash_table,
                                            GHRFunc         func,
                                            gpointer        user_data);
extern
guint       g_hash_table_foreach_steal     (GHashTable     *hash_table,
                                            GHRFunc         func,
                                            gpointer        user_data);
extern
guint       g_hash_table_size              (GHashTable     *hash_table);
extern
GList *     g_hash_table_get_keys          (GHashTable     *hash_table);
extern
GList *     g_hash_table_get_values        (GHashTable     *hash_table);
extern
gpointer *  g_hash_table_get_keys_as_array (GHashTable     *hash_table,
                                            guint          *length);
extern
GPtrArray * g_hash_table_get_keys_as_ptr_array (GHashTable *hash_table);

extern
GPtrArray * g_hash_table_get_values_as_ptr_array (GHashTable *hash_table);

extern
void        g_hash_table_iter_init         (GHashTableIter *iter,
                                            GHashTable     *hash_table);
extern
gboolean    g_hash_table_iter_next         (GHashTableIter *iter,
                                            gpointer       *key,
                                            gpointer       *value);
extern
GHashTable* g_hash_table_iter_get_hash_table (GHashTableIter *iter);
extern
void        g_hash_table_iter_remove       (GHashTableIter *iter);
extern
void        g_hash_table_iter_replace      (GHashTableIter *iter,
                                            gpointer        value);
extern
void        g_hash_table_iter_steal        (GHashTableIter *iter);

extern
GHashTable* g_hash_table_ref               (GHashTable     *hash_table);
extern
void        g_hash_table_unref             (GHashTable     *hash_table);


/* Hash Functions
 */
extern
gboolean g_str_equal    (gconstpointer  v1,
                         gconstpointer  v2);


extern
guint    g_str_hash     (gconstpointer  v);

extern
gboolean g_int_equal    (gconstpointer  v1,
                         gconstpointer  v2);
extern
guint    g_int_hash     (gconstpointer  v);

extern
gboolean g_int64_equal  (gconstpointer  v1,
                         gconstpointer  v2);
extern
guint    g_int64_hash   (gconstpointer  v);

extern
gboolean g_double_equal (gconstpointer  v1,
                         gconstpointer  v2);
extern
guint    g_double_hash  (gconstpointer  v);

extern
guint    g_direct_hash  (gconstpointer  v) ;
extern
gboolean g_direct_equal (gconstpointer  v1,
                         gconstpointer  v2) ;



#endif /* __G_HASH_H__ */
