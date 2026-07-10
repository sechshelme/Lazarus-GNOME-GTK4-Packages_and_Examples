/* GStreamer
 * Copyright (C) 2013 Collabora Ltd.
 *   Author: Sebastian Dröge <sebastian.droege@collabora.co.uk>
 * Copyright (C) 2013 Sebastian Dröge <slomo@circular-chaos.org>
 *
 * gstcontext.h: Header for GstContext subsystem
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

#ifndef __GST_CONTEXT_H__
#define __GST_CONTEXT_H__

#include <glib.h>



typedef struct _GstContext GstContext;

#include <gst/gstminiobject.h>
#include <gst/gststructure.h>

extern GType _gst_context_type;

#define GST_TYPE_CONTEXT                         (_gst_context_type)
#define GST_IS_CONTEXT(obj)                      (GST_IS_MINI_OBJECT_TYPE (obj, GST_TYPE_CONTEXT))
#define GST_CONTEXT_CAST(obj)                    ((GstContext*)(obj))
#define GST_CONTEXT(obj)                         (GST_CONTEXT_CAST(obj))



extern
GType           gst_context_get_type            (void);

extern
GstContext * gst_context_ref    (GstContext * context);

extern
void         gst_context_unref  (GstContext * context);

extern
void         gst_clear_context  (GstContext ** context_ptr);

extern
GstContext * gst_context_copy   (const GstContext * context) ;

extern
GstContext * gst_context_make_writable (GstContext * context) ;
extern
gboolean     gst_context_is_writable   (const GstContext * context);

extern
gboolean     gst_context_replace                  (GstContext ** old_context,
                                                   GstContext * new_context);

extern
GstContext *          gst_context_new                      (const gchar * context_type,
                                                            gboolean persistent)  ;
extern
const gchar *         gst_context_get_context_type         (const GstContext * context);

extern
gboolean              gst_context_has_context_type         (const GstContext * context, const gchar * context_type);

extern
const GstStructure *  gst_context_get_structure            (const GstContext * context);

extern
GstStructure *        gst_context_writable_structure       (GstContext * context);

extern
gboolean              gst_context_is_persistent            (const GstContext * context);

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstContext, gst_context_unref)



#endif /* __GST_CONTEXT_H__ */
