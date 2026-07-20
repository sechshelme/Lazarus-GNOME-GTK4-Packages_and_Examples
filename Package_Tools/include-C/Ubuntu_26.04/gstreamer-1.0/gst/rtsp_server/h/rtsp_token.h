/* GStreamer
 * Copyright (C) 2010 Wim Taymans <wim.taymans at gmail.com>
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

#include <gst/gst.h>

#ifndef __GST_RTSP_TOKEN_H__
#define __GST_RTSP_TOKEN_H__

typedef struct _GstRTSPToken GstRTSPToken;

#include "rtsp-auth.h"



extern
GType gst_rtsp_token_get_type(void);

#define GST_TYPE_RTSP_TOKEN        (gst_rtsp_token_get_type())
#define GST_IS_RTSP_TOKEN(obj)     (GST_IS_MINI_OBJECT_TYPE (obj, GST_TYPE_RTSP_TOKEN))
#define GST_RTSP_TOKEN_CAST(obj)   ((GstRTSPToken*)(obj))
#define GST_RTSP_TOKEN(obj)        (GST_RTSP_TOKEN_CAST(obj))

/**
 * GstRTSPToken:
 *
 * An opaque object used for checking authorisations.
 * It is generated after successful authentication.
 */
struct _GstRTSPToken {
  GstMiniObject mini_object;
};

/**cccccccc
static inline GstRTSPToken *
gst_rtsp_token_ref (GstRTSPToken * token)
{
  return (GstRTSPToken *) gst_mini_object_ref (GST_MINI_OBJECT_CAST (token));
}

static inline void
gst_rtsp_token_unref (GstRTSPToken * token)
{
  gst_mini_object_unref (GST_MINI_OBJECT_CAST (token));
}
 */


extern
GstRTSPToken *       gst_rtsp_token_new_empty          (void) ;

extern
GstRTSPToken *       gst_rtsp_token_new                (const gchar * firstfield, ...) ;

extern
GstRTSPToken *       gst_rtsp_token_new_valist         (const gchar * firstfield, va_list var_args) ;

extern
const GstStructure * gst_rtsp_token_get_structure      (GstRTSPToken *token);

extern
GstStructure *       gst_rtsp_token_writable_structure (GstRTSPToken *token);

extern
void                 gst_rtsp_token_set_string         (GstRTSPToken * token,
                                                        const gchar  * field,
                                                        const gchar  * string_value);
extern
const gchar *        gst_rtsp_token_get_string         (GstRTSPToken *token,
                                                        const gchar *field);
extern
void                 gst_rtsp_token_set_bool           (GstRTSPToken * token,
                                                        const gchar  * field,
                                                        gboolean       bool_value);
extern
gboolean             gst_rtsp_token_is_allowed         (GstRTSPToken *token,
                                                        const gchar *field);

#ifdef //////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           
//////////////////////G_DEFINE_AUTOPTR_CLEANUP_FUNC           (GstRTSPToken, gst_rtsp_token_unref)
#endif



#endif /* __GST_RTSP_TOKEN_H__ */
