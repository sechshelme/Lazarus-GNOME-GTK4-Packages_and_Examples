/* GStreamer
 * Copyright (C) 2009 Axis Communications <dev-gstreamer at axis dot com>
 * @author Jonas Holmberg <jonas dot holmberg at axis dot com>
 *
 * gstbufferlist.h: Header for GstBufferList object
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
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

#ifndef __GST_BUFFER_LIST_H__
#define __GST_BUFFER_LIST_H__

#include <gst/gstbuffer.h>



extern GType _gst_buffer_list_type;

#define GST_TYPE_BUFFER_LIST      (_gst_buffer_list_type)
#define GST_IS_BUFFER_LIST(obj)   (GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_BUFFER_LIST))
#define GST_BUFFER_LIST_CAST(obj) ((GstBufferList *)obj)
#define GST_BUFFER_LIST(obj)      (GST_BUFFER_LIST_CAST(obj))

typedef struct _GstBufferList GstBufferList;

/**
 * GstBufferListFunc:
 * @buffer: (inout) (nullable): pointer to the buffer
 * @idx: the index of @buffer
 * @user_data: user data passed to gst_buffer_list_foreach()
 *
 * A function that will be called from gst_buffer_list_foreach(). The @buffer
 * field will point to a the reference of the buffer at @idx.
 *
 * When this function returns %TRUE, the next buffer will be
 * returned. When %FALSE is returned, gst_buffer_list_foreach() will return.
 *
 * When @buffer is set to %NULL, the item will be removed from the bufferlist.
 * When @buffer has been made writable, the new buffer reference can be assigned
 * to @buffer. This function is responsible for unreffing the old buffer when
 * removing or modifying.
 *
 * Returns: %FALSE when gst_buffer_list_foreach() should stop
 */
typedef gboolean   (*GstBufferListFunc)   (GstBuffer **buffer, guint idx,
                                           gpointer user_data);

extern
GstBufferList * gst_buffer_list_ref     (GstBufferList * list);

extern
void            gst_buffer_list_unref   (GstBufferList * list);

extern
void            gst_clear_buffer_list   (GstBufferList ** list_ptr);

extern
GstBufferList * gst_buffer_list_copy    (const GstBufferList * list) ;

extern
gboolean        gst_buffer_list_replace (GstBufferList ** old_list,
                                         GstBufferList * new_list);

extern
gboolean        gst_buffer_list_take    (GstBufferList ** old_list,
                                         GstBufferList * new_list);

extern
GstBufferList *gst_buffer_list_steal    (GstBufferList **old_list);

extern
GstBufferList * gst_buffer_list_make_writable (GstBufferList * list) ;
extern
gboolean        gst_buffer_list_is_writable   (const GstBufferList * list);

extern
GType                    gst_buffer_list_get_type              (void);

/* allocation */

extern
GstBufferList *          gst_buffer_list_new                   (void)  ;

extern
GstBufferList *          gst_buffer_list_new_sized             (guint size)  ;

extern
guint                    gst_buffer_list_length                (GstBufferList *list);

extern
GstBuffer *              gst_buffer_list_get                   (GstBufferList *list, guint idx);

extern
GstBuffer *              gst_buffer_list_get_writable          (GstBufferList *list, guint idx);

extern
void                     gst_buffer_list_insert                (GstBufferList *list, gint idx, GstBuffer *buffer);

extern
void                     gst_buffer_list_remove                (GstBufferList *list, guint idx, guint length);

extern
gboolean                 gst_buffer_list_foreach               (GstBufferList *list,
                                                                GstBufferListFunc func,
								gpointer user_data);
extern
GstBufferList *          gst_buffer_list_copy_deep             (const GstBufferList * list) ;

extern
gsize                    gst_buffer_list_calculate_size        (GstBufferList * list);

//xxxxxxxx #define gst_buffer_list_add(l,b) gst_buffer_list_insert((l),-1,(b));




#endif /* __GST_BUFFER_LIST_H__ */
