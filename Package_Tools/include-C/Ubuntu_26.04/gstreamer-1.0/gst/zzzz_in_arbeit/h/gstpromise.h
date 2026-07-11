/* GStreamer
 * Copyright (C) 2017 Matthew Waters <matthew@centricular.com>
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

#ifndef __GST_PROMISE_H__
#define __GST_PROMISE_H__

#include <gst/gst.h>



extern
GType gst_promise_get_type(void);
#define GST_TYPE_PROMISE            (gst_promise_get_type())
#define GST_IS_PROMISE(obj)         (GST_IS_MINI_OBJECT_TYPE (obj, GST_TYPE_PROMISE))
#define GST_PROMISE(obj)            ((GstPromise *) obj)

typedef struct _GstPromise GstPromise;

/**
 * GstPromiseResult:
 * @GST_PROMISE_RESULT_PENDING: Initial state. Waiting for transition to any
 * 	other state.
 * @GST_PROMISE_RESULT_INTERRUPTED: Interrupted by the consumer as it doesn't
 * 	want the value anymore.
 * @GST_PROMISE_RESULT_REPLIED: A producer marked a reply
 * @GST_PROMISE_RESULT_EXPIRED: The promise expired (the carrying object
 * 	lost all refs) and the promise will never be fulfilled.
 *
 * The result of a #GstPromise
 *
 * Since: 1.14
 */
typedef enum
{
  GST_PROMISE_RESULT_PENDING,
  GST_PROMISE_RESULT_INTERRUPTED,
  GST_PROMISE_RESULT_REPLIED,
  GST_PROMISE_RESULT_EXPIRED,
} GstPromiseResult;

/**
 * GstPromiseChangeFunc:
 * @promise: a #GstPromise
 * @user_data: (closure): user data
 *
 * Since: 1.14
 */
typedef void (*GstPromiseChangeFunc) (GstPromise * promise, gpointer user_data);

/**
 * GstPromise:
 * @parent: parent #GstMiniObject
 *
 * Since: 1.14
 */
struct _GstPromise
{
  GstMiniObject         parent;
};

extern
GstPromise *            gst_promise_new                     (void) ;
extern
GstPromise *            gst_promise_new_with_change_func    (GstPromiseChangeFunc func,
                                                             gpointer user_data,
                                                             GDestroyNotify notify) ;

extern
GstPromiseResult        gst_promise_wait                    (GstPromise * promise);
extern
void                    gst_promise_reply                   (GstPromise * promise,
                                                             GstStructure * s);
extern
void                    gst_promise_interrupt               (GstPromise * promise);
extern
void                    gst_promise_expire                  (GstPromise * promise);

extern
const GstStructure *    gst_promise_get_reply               (GstPromise * promise);

extern
GstPromise *  gst_promise_ref (GstPromise * promise);

extern
void          gst_promise_unref (GstPromise * promise);

extern
void          gst_clear_promise (GstPromise ** promise_ptr);



#endif /* __GST_PROMISE_H__ */
