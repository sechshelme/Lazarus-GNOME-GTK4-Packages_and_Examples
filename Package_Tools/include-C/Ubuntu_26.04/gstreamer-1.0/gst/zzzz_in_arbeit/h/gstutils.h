/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2002 Thomas Vander Stichele <thomas@apestaart.org>
 *
 * gstutils.h: Header for various utility functions
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


#ifndef __GST_UTILS_H__
#define __GST_UTILS_H__

#include <glib.h>
#include <gst/gstconfig.h>
#include <gst/gstbin.h>
#include <gst/gstparse.h>



extern
void            gst_util_set_value_from_string  (GValue *value, const gchar *value_str);

extern
void            gst_util_set_object_arg         (GObject *object, const gchar *name, const gchar *value);

extern
gboolean        gst_util_set_object_array       (GObject * object, const gchar * name,
                                                 const GValueArray * array);
extern
gboolean        gst_util_get_object_array       (GObject * object, const gchar * name,
                                                 GValueArray ** array);
extern
void            gst_util_dump_mem               (const guchar *mem, guint size);

extern
void            gst_util_dump_buffer            (GstBuffer * buf);

extern
guint64         gst_util_gdouble_to_guint64     (gdouble value)  ;

extern
gdouble         gst_util_guint64_to_gdouble     (guint64 value)  ;


extern
guint64         gst_util_uint64_scale           (guint64 val, guint64 num, guint64 denom);

extern
guint64         gst_util_uint64_scale_round     (guint64 val, guint64 num, guint64 denom);

extern
guint64         gst_util_uint64_scale_ceil      (guint64 val, guint64 num, guint64 denom);

extern
guint64         gst_util_uint64_scale_int       (guint64 val, gint num, gint denom);

extern
guint64         gst_util_uint64_scale_int_round (guint64 val, gint num, gint denom);

extern
guint64         gst_util_uint64_scale_int_ceil  (guint64 val, gint num, gint denom);

/**
 * GST_SEQNUM_INVALID:
 *
 * A value which is guaranteed to never be returned by
 * gst_util_seqnum_next().
 *
 * Can be used as a default value in variables used to store seqnum.
 *
 * Since: 1.14
 */
#define GST_SEQNUM_INVALID (0)

extern
guint32         gst_util_seqnum_next            (void);

extern
gint32          gst_util_seqnum_compare         (guint32 s1, guint32 s2);

/**
 * GST_GROUP_ID_INVALID:
 *
 * A value which is guaranteed to never be returned by
 * gst_util_group_id_next().
 *
 * Can be used as a default value in variables used to store group_id.
 *
 * Since: 1.14
 */
#define GST_GROUP_ID_INVALID (0)

extern
guint           gst_util_group_id_next          (void);





extern
void                    gst_object_default_error        (GstObject    * source,
                                                         const GError * error,
                                                         const gchar  * debug);

/* element functions */

extern
void                    gst_element_create_all_pads     (GstElement *element);

extern
GstPad*                 gst_element_get_compatible_pad  (GstElement *element, GstPad *pad,
                                                         GstCaps *caps) ;
extern
GstPadTemplate*         gst_element_get_compatible_pad_template (GstElement *element, GstPadTemplate *compattempl);

extern //xxxxxGLIB_DEPRECATED_IN(gst_state_get_name)
const gchar*            gst_element_state_get_name      (GstState state);

extern //xxxxxGLIB_DEPRECATED_IN(gst_state_change_return_get_name)
const gchar *           gst_element_state_change_return_get_name (GstStateChangeReturn state_ret);

extern
const gchar*            gst_state_get_name               (GstState state);

extern
const gchar *           gst_state_change_return_get_name (GstStateChangeReturn state_ret);

extern
const gchar *           gst_state_change_get_name       (GstStateChange transition);

extern
gboolean                gst_element_link                (GstElement *src, GstElement *dest);

extern
gboolean                gst_element_link_many           (GstElement *element_1,
                                                         GstElement *element_2, ...) ;
extern
gboolean                gst_element_link_filtered       (GstElement * src,
                                                         GstElement * dest,
                                                         GstCaps *filter);
extern
void                    gst_element_unlink              (GstElement *src, GstElement *dest);

extern
void                    gst_element_unlink_many         (GstElement *element_1,
                                                         GstElement *element_2, ...) ;
extern
gboolean                gst_element_link_pads           (GstElement *src, const gchar *srcpadname,
                                                         GstElement *dest, const gchar *destpadname);
extern
gboolean                gst_element_link_pads_full      (GstElement *src, const gchar *srcpadname,
                                                         GstElement *dest, const gchar *destpadname,
                                                         GstPadLinkCheck flags);
extern
void                    gst_element_unlink_pads         (GstElement *src, const gchar *srcpadname,
                                                         GstElement *dest, const gchar *destpadname);
extern
gboolean                gst_element_link_pads_filtered  (GstElement * src, const gchar * srcpadname,
                                                         GstElement * dest, const gchar * destpadname,
                                                         GstCaps *filter);
extern
gboolean                gst_element_seek_simple         (GstElement   *element,
                                                         GstFormat     format,
                                                         GstSeekFlags  seek_flags,
                                                         gint64        seek_pos);

extern
gchar *                 gst_element_decorate_stream_id  (GstElement   *element,
                                                         const gchar  *stream_id) ;
extern
gchar *   gst_element_decorate_stream_id_printf_valist  (GstElement * element,
                                                         const gchar * format,
                                                         va_list var_args) ;// (2, 0)  ;
extern
gchar *          gst_element_decorate_stream_id_printf  (GstElement * element,
                                                         const gchar * format,
                                                         ...) ;// (2, 3)  ;
/* util elementfactory functions */

extern
gboolean gst_element_factory_can_sink_all_caps (GstElementFactory *factory, const GstCaps *caps);

extern
gboolean gst_element_factory_can_src_all_caps  (GstElementFactory *factory, const GstCaps *caps);

extern
gboolean gst_element_factory_can_sink_any_caps (GstElementFactory *factory, const GstCaps *caps);

extern
gboolean gst_element_factory_can_src_any_caps  (GstElementFactory *factory, const GstCaps *caps);

/* util query functions */

extern
gboolean                gst_element_query_position      (GstElement *element, GstFormat format, gint64 *cur);

extern
gboolean                gst_element_query_duration      (GstElement *element, GstFormat format, gint64 *duration);

extern
gboolean                gst_element_query_convert       (GstElement *element, GstFormat src_format, gint64 src_val,
                                                         GstFormat dest_format, gint64 *dest_val);

/* pad functions */

extern
void                    gst_pad_use_fixed_caps          (GstPad *pad);

extern
GstElement*             gst_pad_get_parent_element      (GstPad *pad) ;

/* util query functions */

extern
gboolean                gst_pad_proxy_query_accept_caps (GstPad *pad, GstQuery *query);

extern
gboolean                gst_pad_proxy_query_caps        (GstPad *pad, GstQuery *query);

extern
gboolean                gst_pad_query_position          (GstPad *pad, GstFormat format, gint64 *cur);

extern
gboolean                gst_pad_query_duration          (GstPad *pad, GstFormat format, gint64 *duration);

extern
gboolean                gst_pad_query_convert           (GstPad *pad, GstFormat src_format, gint64 src_val,
                                                         GstFormat dest_format, gint64 *dest_val);
extern
GstCaps *               gst_pad_query_caps              (GstPad *pad, GstCaps *filter) ;

extern
gboolean                gst_pad_query_accept_caps       (GstPad *pad, GstCaps *caps);

extern
gboolean                gst_pad_link_maybe_ghosting      (GstPad            *src,
                                                          GstPad            *sink);
extern
gboolean                gst_pad_link_maybe_ghosting_full (GstPad            *src,
                                                          GstPad            *sink,
                                                          GstPadLinkCheck   flags);
extern
gboolean                gst_pad_peer_query_position     (GstPad *pad, GstFormat format, gint64 *cur);

extern
gboolean                gst_pad_peer_query_duration     (GstPad *pad, GstFormat format, gint64 *duration);

extern
gboolean                gst_pad_peer_query_convert      (GstPad *pad, GstFormat src_format, gint64 src_val,
                                                         GstFormat dest_format, gint64 *dest_val);
extern
GstCaps *               gst_pad_peer_query_caps         (GstPad * pad, GstCaps *filter) ;

extern
gboolean                gst_pad_peer_query_accept_caps  (GstPad * pad, GstCaps *caps);

extern
gchar *                 gst_pad_create_stream_id               (GstPad * pad, GstElement * parent, const gchar *stream_id)  ;

extern
gchar *                 gst_pad_create_stream_id_printf        (GstPad * pad, GstElement * parent, const gchar *stream_id, ...) ;// (3, 4)  ;

extern
gchar *                 gst_pad_create_stream_id_printf_valist (GstPad * pad, GstElement * parent, const gchar *stream_id, va_list var_args) ;// (3, 0)  ;

extern
gchar *                 gst_pad_get_stream_id           (GstPad * pad) ;

extern
GstStream *             gst_pad_get_stream              (GstPad * pad) ;

/* bin functions */

extern
void                    gst_bin_add_many                (GstBin *bin, GstElement *element_1, ...) ;

extern
void                    gst_bin_remove_many             (GstBin *bin, GstElement *element_1, ...) ;

extern
GstPad *                gst_bin_find_unlinked_pad       (GstBin *bin, GstPadDirection direction) ;

extern
gboolean                gst_bin_sync_children_states    (GstBin *bin);

/* parse utility functions */

extern
GstElement *            gst_parse_bin_from_description      (const gchar     * bin_description,
                                                             gboolean          ghost_unlinked_pads,
                                                             GError         ** err);
extern
GstElement *            gst_parse_bin_from_description_full (const gchar     * bin_description,
                                                             gboolean          ghost_unlinked_pads,
                                                             GstParseContext * context,
                                                             GstParseFlags     flags,
                                                             GError         ** err);
extern
GstClockTime            gst_util_get_timestamp          (void);

/**
 * GstSearchMode:
 * @GST_SEARCH_MODE_EXACT : Only search for exact matches.
 * @GST_SEARCH_MODE_BEFORE: Search for an exact match or the element just before.
 * @GST_SEARCH_MODE_AFTER : Search for an exact match or the element just after.
 *
 * The different search modes.
 */
typedef enum {
  GST_SEARCH_MODE_EXACT = 0,
  GST_SEARCH_MODE_BEFORE,
  GST_SEARCH_MODE_AFTER
} GstSearchMode;

/**
 * GstPluginAPIFlags:
 * @GST_PLUGIN_API_FLAG_IGNORE_ENUM_MEMBERS: Ignore enum members when generating
 *   the plugins cache. This is useful if the members of the enum are generated
 *   dynamically, in order not to expose incorrect documentation to the end user.
 *
 * Since: 1.18
 */
typedef enum {
  GST_PLUGIN_API_FLAG_IGNORE_ENUM_MEMBERS = (1 << 0),
} GstPluginAPIFlags;

extern
gpointer      gst_util_array_binary_search      (gpointer array, guint num_elements,
                                                 gsize element_size, GCompareDataFunc search_func,
                                                 GstSearchMode mode, gconstpointer search_data,
                                                 gpointer user_data);

/* fraction operations */

extern
gint          gst_util_greatest_common_divisor  (gint a, gint b);

extern
gint64        gst_util_greatest_common_divisor_int64 (gint64 a, gint64 b);

extern
void          gst_util_simplify_fraction        (gint *numerator, gint *denominator,
                                                 guint n_terms, guint threshold);

extern
void          gst_util_fraction_to_double       (gint src_n, gint src_d, gdouble *dest);

extern
void          gst_util_double_to_fraction       (gdouble src, gint *dest_n, gint *dest_d);

extern
gboolean      gst_util_fraction_multiply        (gint a_n, gint a_d, gint b_n, gint b_d,
                                                 gint *res_n, gint *res_d);
extern
gboolean      gst_util_fraction_multiply_int64  (gint64 a_n, gint64 a_d, gint64 b_n, gint64 b_d,
                                                 gint64 *res_n, gint64 *res_d);
extern
gboolean      gst_util_fraction_add             (gint a_n, gint a_d, gint b_n, gint b_d,
                                                 gint *res_n, gint *res_d);
extern
gint          gst_util_fraction_compare         (gint a_n, gint a_d, gint b_n, gint b_d);

extern
gboolean      gst_calculate_linear_regression   (const GstClockTime * xy,
                                                 GstClockTime * temp, guint n,
                                                 GstClockTime * m_num, GstClockTime * m_denom,
                                                 GstClockTime * b, GstClockTime * xbase,
                                                 gdouble * r_squared);

extern
void          gst_type_mark_as_plugin_api       (GType type, GstPluginAPIFlags flags);

extern
gboolean      gst_type_is_plugin_api            (GType type, GstPluginAPIFlags *flags);

extern
guint         gst_util_ceil_log2                (guint32 v);

extern
guint         gst_util_floor_log2               (guint32 v);

extern
gint          gst_util_filename_compare        (const gchar *a, const gchar *b);

/**
 * GstCallAsyncFunc:
 * @user_data: Data passed in the function where that callback has been passed
 *
 * Callback prototype used in #gst_call_async
 *
 * Since: 1.28
 */
typedef void  (*GstCallAsyncFunc)               (gpointer user_data);

extern
void          gst_call_async                    (GstCallAsyncFunc func,
                                                 gpointer user_data);



#endif /* __GST_UTILS_H__ */
