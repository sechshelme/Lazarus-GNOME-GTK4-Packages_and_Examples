/* GStreamer
 * Copyright (C) 2007 Stefan Kost <ensonic@users.sf.net>
 *
 * gstdebugutils.h: debugging and analysis utilities
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

#ifndef __GSTDEBUGUTILS_H__
#define __GSTDEBUGUTILS_H__

#include <glib.h>
#include <glib-object.h>
#include <gst/gstconfig.h>
#include <gst/gstbin.h>



/**
 * GstDebugGraphDetails:
 * @GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE: show caps-name on edges
 * @GST_DEBUG_GRAPH_SHOW_CAPS_DETAILS: show caps-details on edges
 * @GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS: show modified parameters on
 *                                           elements
 * @GST_DEBUG_GRAPH_SHOW_STATES: show element states
 * @GST_DEBUG_GRAPH_SHOW_FULL_PARAMS: show full element parameter values even
 *                                    if they are very long
 * @GST_DEBUG_GRAPH_SHOW_ALL: show all the typical details that one might want
 * @GST_DEBUG_GRAPH_SHOW_VERBOSE: show all details regardless of how large or
 *                                verbose they make the resulting output
 *
 * Available details for pipeline graphs produced by GST_DEBUG_BIN_TO_DOT_FILE()
 * and GST_DEBUG_BIN_TO_DOT_FILE_WITH_TS().
 */
/* FIXME: For GST_DEBUG_GRAPH_SHOW_VERBOSE ~0 -> 0xffffffff see
 * https://bugzilla.gnome.org/show_bug.cgi?id=732633
*/
typedef enum {
  GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE         = (1<<0),
  GST_DEBUG_GRAPH_SHOW_CAPS_DETAILS       = (1<<1),
  GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS = (1<<2),
  GST_DEBUG_GRAPH_SHOW_STATES             = (1<<3),
  GST_DEBUG_GRAPH_SHOW_FULL_PARAMS        = (1<<4),
  GST_DEBUG_GRAPH_SHOW_ALL                = ((1<<4)-1),
  GST_DEBUG_GRAPH_SHOW_VERBOSE            = (gint) (0xffffffff)
} GstDebugGraphDetails;


/********** pipeline graphs **********/

extern
gchar * gst_debug_bin_to_dot_data (GstBin *bin, GstDebugGraphDetails details);

extern
void gst_debug_bin_to_dot_file (GstBin *bin, GstDebugGraphDetails details, const gchar *file_name);

extern
void gst_debug_bin_to_dot_file_with_ts (GstBin *bin, GstDebugGraphDetails details, const gchar *file_name);


#endif /* __GSTDEBUGUTILS_H__ */

