/* GStreamer
 * Copyright (C) 2009-2010 Edward Hervey <bilboed@bilboed.com>
 *           (C) 2011 Wim Taymans <wim.taymans@gmail.com>
 *
 * gstatomicqueue.h:
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

#include <glib.h>
#include <glib-object.h>
#include <gst/gstconfig.h>

#ifndef __GST_ATOMIC_QUEUE_H__
#define __GST_ATOMIC_QUEUE_H__



#define GST_TYPE_ATOMIC_QUEUE (gst_atomic_queue_get_type())

/**
 * GstAtomicQueue:
 *
 * Opaque atomic data queue.
 *
 * Use the accessor functions to get the stored values.
 */
typedef struct _GstAtomicQueue GstAtomicQueue;


extern
GType              gst_atomic_queue_get_type    (void);

extern
GstAtomicQueue *   gst_atomic_queue_new         (guint initial_size)  ;

extern
void               gst_atomic_queue_ref         (GstAtomicQueue * queue);

extern
void               gst_atomic_queue_unref       (GstAtomicQueue * queue);

extern
void               gst_atomic_queue_push        (GstAtomicQueue* queue, gpointer data);

extern
gpointer           gst_atomic_queue_pop         (GstAtomicQueue* queue) ;

extern
gpointer           gst_atomic_queue_peek        (GstAtomicQueue* queue);

extern
guint              gst_atomic_queue_length      (GstAtomicQueue * queue);

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstAtomicQueue, gst_atomic_queue_unref)



#endif /* __GST_ATOMIC_QUEUE_H__ */
