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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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

#ifndef __G_ARRAY_H__
#define __G_ARRAY_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <glib/gtypes.h>



typedef struct _GBytes          GBytes;
typedef struct _GArray		GArray;
typedef struct _GByteArray	GByteArray;
typedef struct _GPtrArray	GPtrArray;

struct _GArray
{
  gchar *data;
  guint len;
};

struct _GByteArray
{
  guint8 *data;
  guint	  len;
};

struct _GPtrArray
{
  gpointer *pdata;
  guint	    len;
};

/* Resizable arrays. remove fills any cleared spot and shortens the
 * array, while preserving the order. remove_fast will distort the
 * order by moving the last element to the position of the removed.
xxxxxxxx
#define g_array_append_val(a,v)	  g_array_append_vals (a, &(v), 1)
#define g_array_prepend_val(a,v)  g_array_prepend_vals (a, &(v), 1)
#define g_array_insert_val(a,i,v) g_array_insert_vals (a, i, &(v), 1)
#define g_array_index(a,t,i)      (((t*) (void *) (a)->data) [(i)])
 */

extern
GArray* g_array_new               (gboolean          zero_terminated,
				   gboolean          clear_,
				   guint             element_size);
extern
GArray* g_array_new_take          (gpointer          data,
                                   gsize             len,
                                   gboolean          clear,
                                   gsize             element_size);
extern
GArray* g_array_new_take_zero_terminated (gpointer  data,
                                          gboolean  clear,
                                          gsize     element_size);
extern
gpointer g_array_steal            (GArray           *array,
                                   gsize            *len);
extern
GArray* g_array_sized_new         (gboolean          zero_terminated,
				   gboolean          clear_,
				   guint             element_size,
				   guint             reserved_size);
extern
GArray* g_array_copy              (GArray           *array);
extern
gchar*  g_array_free              (GArray           *array,
				   gboolean          free_segment);
extern
GArray *g_array_ref               (GArray           *array);
extern
void    g_array_unref             (GArray           *array);
extern
guint   g_array_get_element_size  (GArray           *array);
extern
GArray* g_array_append_vals       (GArray           *array,
				   gconstpointer     data,
				   guint             len);
extern
GArray* g_array_prepend_vals      (GArray           *array,
				   gconstpointer     data,
				   guint             len);
extern
GArray* g_array_insert_vals       (GArray           *array,
				   guint             index_,
				   gconstpointer     data,
				   guint             len);
extern
GArray* g_array_set_size          (GArray           *array,
				   guint             length);
extern
GArray* g_array_remove_index      (GArray           *array,
				   guint             index_);
extern
GArray* g_array_remove_index_fast (GArray           *array,
				   guint             index_);
extern
GArray* g_array_remove_range      (GArray           *array,
				   guint             index_,
				   guint             length);
extern
void    g_array_sort              (GArray           *array,
				   GCompareFunc      compare_func);
extern
void    g_array_sort_with_data    (GArray           *array,
				   GCompareDataFunc  compare_func,
				   gpointer          user_data);
extern
gboolean g_array_binary_search    (GArray           *array,
                                   gconstpointer     target,
                                   GCompareFunc      compare_func,
                                   guint            *out_match_index);
extern
void    g_array_set_clear_func    (GArray           *array,
                                   GDestroyNotify    clear_func);

/* Resizable pointer array.  This interface is much less complicated
 * than the above.  Add appends a pointer.  Remove fills any cleared 
 * spot and shortens the array. remove_fast will again distort order.  
 */
//xxxxxxxxxxxxxxxx#define    g_ptr_array_index(array,index_) ((array)->pdata)[index_]
extern
GPtrArray* g_ptr_array_new                (void);
extern
GPtrArray* g_ptr_array_new_with_free_func (GDestroyNotify    element_free_func);
extern
GPtrArray* g_ptr_array_new_take           (gpointer         *data,
                                           gsize             len,
                                           GDestroyNotify    element_free_func);
extern
GPtrArray* g_ptr_array_new_from_array     (gpointer         *data,
                                           gsize             len,
                                           GCopyFunc         copy_func,
                                           gpointer          copy_func_user_data,
                                           GDestroyNotify    element_free_func);
extern
gpointer*   g_ptr_array_steal              (GPtrArray        *array,
                                            gsize            *len);
extern
GPtrArray *g_ptr_array_copy               (GPtrArray        *array,
                                           GCopyFunc         func,
                                           gpointer          user_data);
extern
GPtrArray* g_ptr_array_sized_new          (guint             reserved_size);
extern
GPtrArray* g_ptr_array_new_full           (guint             reserved_size,
					   GDestroyNotify    element_free_func);
extern
GPtrArray* g_ptr_array_new_null_terminated (guint          reserved_size,
                                            GDestroyNotify element_free_func,
                                            gboolean       null_terminated);
extern
GPtrArray* g_ptr_array_new_take_null_terminated  (gpointer       *data,
                                                  GDestroyNotify  element_free_func);
extern
GPtrArray* g_ptr_array_new_from_null_terminated_array (gpointer       *data,
                                                       GCopyFunc       copy_func,
                                                       gpointer        copy_func_user_data,
                                                       GDestroyNotify  element_free_func);
extern
gpointer*  g_ptr_array_free               (GPtrArray        *array,
					   gboolean          free_segment);
extern
GPtrArray* g_ptr_array_ref                (GPtrArray        *array);
extern
void       g_ptr_array_unref              (GPtrArray        *array);
extern
void       g_ptr_array_set_free_func      (GPtrArray        *array,
                                           GDestroyNotify    element_free_func);
extern
void       g_ptr_array_set_size           (GPtrArray        *array,
					   gint              length);
extern
gpointer   g_ptr_array_remove_index       (GPtrArray        *array,
					   guint             index_);
extern
gpointer   g_ptr_array_remove_index_fast  (GPtrArray        *array,
					   guint             index_);
extern
gpointer   g_ptr_array_steal_index        (GPtrArray        *array,
                                           guint             index_);
extern
gpointer   g_ptr_array_steal_index_fast   (GPtrArray        *array,
                                           guint             index_);
extern
gboolean   g_ptr_array_remove             (GPtrArray        *array,
					   gpointer          data);
extern
gboolean   g_ptr_array_remove_fast        (GPtrArray        *array,
					   gpointer          data);
extern
GPtrArray *g_ptr_array_remove_range       (GPtrArray        *array,
					   guint             index_,
					   guint             length);
extern
void       g_ptr_array_add                (GPtrArray        *array,
					   gpointer          data);
extern
void g_ptr_array_extend                   (GPtrArray        *array_to_extend,
                                           GPtrArray        *array,
                                           GCopyFunc         func,
                                           gpointer          user_data);
extern
void g_ptr_array_extend_and_steal         (GPtrArray        *array_to_extend,
                                           GPtrArray        *array);
extern
void       g_ptr_array_insert             (GPtrArray        *array,
                                           gint              index_,
                                           gpointer          data);
extern
void       g_ptr_array_sort               (GPtrArray        *array,
					   GCompareFunc      compare_func);
extern
void       g_ptr_array_sort_with_data     (GPtrArray        *array,
					   GCompareDataFunc  compare_func,
					   gpointer          user_data);
extern
void       g_ptr_array_sort_values        (GPtrArray        *array,
                                           GCompareFunc      compare_func);
extern
void       g_ptr_array_sort_values_with_data (GPtrArray        *array,
                                              GCompareDataFunc  compare_func,
                                              gpointer          user_data);
extern
void       g_ptr_array_foreach            (GPtrArray        *array,
					   GFunc             func,
					   gpointer          user_data);
extern
gboolean   g_ptr_array_find               (GPtrArray        *haystack,
                                           gconstpointer     needle,
                                           guint            *index_);
extern
gboolean   g_ptr_array_find_with_equal_func (GPtrArray     *haystack,
                                             gconstpointer  needle,
                                             GEqualFunc     equal_func,
                                             guint         *index_);

extern
gboolean   g_ptr_array_is_null_terminated (GPtrArray *array);

/* Byte arrays, an array of guint8.  Implemented as a GArray,
 * but type-safe.
 */

extern
GByteArray* g_byte_array_new               (void);
extern
GByteArray* g_byte_array_new_take          (guint8           *data,
                                            gsize             len);
extern
guint8*     g_byte_array_steal             (GByteArray       *array,
                                            gsize            *len);
extern
GByteArray* g_byte_array_sized_new         (guint             reserved_size);
extern
guint8*     g_byte_array_free              (GByteArray       *array,
					    gboolean          free_segment);
extern
GBytes*     g_byte_array_free_to_bytes     (GByteArray       *array);
extern
GByteArray *g_byte_array_ref               (GByteArray       *array);
extern
void        g_byte_array_unref             (GByteArray       *array);
extern
GByteArray* g_byte_array_append            (GByteArray       *array,
					    const guint8     *data,
					    guint             len);
extern
GByteArray* g_byte_array_prepend           (GByteArray       *array,
					    const guint8     *data,
					    guint             len);
extern
GByteArray* g_byte_array_set_size          (GByteArray       *array,
					    guint             length);
extern
GByteArray* g_byte_array_remove_index      (GByteArray       *array,
					    guint             index_);
extern
GByteArray* g_byte_array_remove_index_fast (GByteArray       *array,
					    guint             index_);
extern
GByteArray* g_byte_array_remove_range      (GByteArray       *array,
					    guint             index_,
					    guint             length);
extern
void        g_byte_array_sort              (GByteArray       *array,
					    GCompareFunc      compare_func);
extern
void        g_byte_array_sort_with_data    (GByteArray       *array,
					    GCompareDataFunc  compare_func,
					    gpointer          user_data);



#endif /* __G_ARRAY_H__ */
