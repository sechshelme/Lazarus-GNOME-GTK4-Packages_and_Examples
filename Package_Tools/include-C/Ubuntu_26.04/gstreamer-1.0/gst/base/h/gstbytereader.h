/* GStreamer byte reader
 *
 * Copyright (C) 2008 Sebastian Dröge <sebastian.droege@collabora.co.uk>.
 * Copyright (C) 2009 Tim-Philipp Müller <tim centricular net>
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

#ifndef __GST_BYTE_READER_H__
#define __GST_BYTE_READER_H__

#include <gst/gst.h>
#include <gst/base/base-prelude.h>



#define GST_BYTE_READER(reader) ((GstByteReader *) (reader))

/**
 * GstByteReader:
 * @data: (array length=size): Data from which the bit reader will
 *   read
 * @size: Size of @data in bytes
 * @byte: Current byte position
 *
 * A byte reader instance.
 */
typedef struct {
  const guint8 *data;
  guint size;

  guint byte;  /* Byte position */

  /* < private > */
  gpointer _gst_reserved[GST_PADDING];
} GstByteReader;

extern
GstByteReader * gst_byte_reader_new             (const guint8 *data, guint size) ;

extern
void            gst_byte_reader_free            (GstByteReader *reader);

extern
void            gst_byte_reader_init            (GstByteReader *reader, const guint8 *data, guint size);

extern
gboolean        gst_byte_reader_peek_sub_reader (GstByteReader * reader,
                                                 GstByteReader * sub_reader,
                                                 guint           size);
extern
gboolean        gst_byte_reader_get_sub_reader  (GstByteReader * reader,
                                                 GstByteReader * sub_reader,
                                                 guint           size);
extern
gboolean        gst_byte_reader_set_pos         (GstByteReader *reader, guint pos);

extern
guint           gst_byte_reader_get_pos         (const GstByteReader *reader);

extern
guint           gst_byte_reader_get_remaining   (const GstByteReader *reader);

extern
guint           gst_byte_reader_get_size        (const GstByteReader *reader);

extern
gboolean        gst_byte_reader_skip            (GstByteReader *reader, guint nbytes);

extern
gboolean        gst_byte_reader_get_uint8       (GstByteReader *reader, guint8 *val);

extern
gboolean        gst_byte_reader_get_int8        (GstByteReader *reader, gint8 *val);

extern
gboolean        gst_byte_reader_get_uint16_le   (GstByteReader *reader, guint16 *val);

extern
gboolean        gst_byte_reader_get_int16_le    (GstByteReader *reader, gint16 *val);

extern
gboolean        gst_byte_reader_get_uint16_be   (GstByteReader *reader, guint16 *val);

extern
gboolean        gst_byte_reader_get_int16_be    (GstByteReader *reader, gint16 *val);

extern
gboolean        gst_byte_reader_get_uint24_le   (GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_get_int24_le    (GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_get_uint24_be   (GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_get_int24_be    (GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_get_uint32_le   (GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_get_int32_le    (GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_get_uint32_be   (GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_get_int32_be    (GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_get_uint64_le   (GstByteReader *reader, guint64 *val);

extern
gboolean        gst_byte_reader_get_int64_le    (GstByteReader *reader, gint64 *val);

extern
gboolean        gst_byte_reader_get_uint64_be   (GstByteReader *reader, guint64 *val);

extern
gboolean        gst_byte_reader_get_int64_be    (GstByteReader *reader, gint64 *val);

extern
gboolean        gst_byte_reader_peek_uint8      (const GstByteReader *reader, guint8 *val);

extern
gboolean        gst_byte_reader_peek_int8       (const GstByteReader *reader, gint8 *val);

extern
gboolean        gst_byte_reader_peek_uint16_le  (const GstByteReader *reader, guint16 *val);

extern
gboolean        gst_byte_reader_peek_int16_le   (const GstByteReader *reader, gint16 *val);

extern
gboolean        gst_byte_reader_peek_uint16_be  (const GstByteReader *reader, guint16 *val);

extern
gboolean        gst_byte_reader_peek_int16_be   (const GstByteReader *reader, gint16 *val);

extern
gboolean        gst_byte_reader_peek_uint24_le  (const GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_peek_int24_le   (const GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_peek_uint24_be  (const GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_peek_int24_be   (const GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_peek_uint32_le  (const GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_peek_int32_le   (const GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_peek_uint32_be  (const GstByteReader *reader, guint32 *val);

extern
gboolean        gst_byte_reader_peek_int32_be   (const GstByteReader *reader, gint32 *val);

extern
gboolean        gst_byte_reader_peek_uint64_le  (const GstByteReader *reader, guint64 *val);

extern
gboolean        gst_byte_reader_peek_int64_le   (const GstByteReader *reader, gint64 *val);

extern
gboolean        gst_byte_reader_peek_uint64_be  (const GstByteReader *reader, guint64 *val);

extern
gboolean        gst_byte_reader_peek_int64_be   (const GstByteReader *reader, gint64 *val);

extern
gboolean        gst_byte_reader_get_float32_le  (GstByteReader *reader, gfloat *val);

extern
gboolean        gst_byte_reader_get_float32_be  (GstByteReader *reader, gfloat *val);

extern
gboolean        gst_byte_reader_get_float64_le  (GstByteReader *reader, gdouble *val);

extern
gboolean        gst_byte_reader_get_float64_be  (GstByteReader *reader, gdouble *val);

extern
gboolean        gst_byte_reader_peek_float32_le (const GstByteReader *reader, gfloat *val);

extern
gboolean        gst_byte_reader_peek_float32_be (const GstByteReader *reader, gfloat *val);

extern
gboolean        gst_byte_reader_peek_float64_le (const GstByteReader *reader, gdouble *val);

extern
gboolean        gst_byte_reader_peek_float64_be (const GstByteReader *reader, gdouble *val);

extern
gboolean        gst_byte_reader_dup_data        (GstByteReader * reader, guint size, guint8       ** val);

extern
gboolean        gst_byte_reader_get_data        (GstByteReader * reader, guint size, const guint8 ** val);

extern
gboolean        gst_byte_reader_peek_data       (const GstByteReader * reader, guint size, const guint8 ** val);


extern
gboolean        gst_byte_reader_dup_string_utf8  (GstByteReader * reader, gchar   ** str);

extern
gboolean        gst_byte_reader_dup_string_utf16 (GstByteReader * reader, guint16 ** str);

extern
gboolean        gst_byte_reader_dup_string_utf32 (GstByteReader * reader, guint32 ** str);


extern
gboolean        gst_byte_reader_skip_string_utf8  (GstByteReader * reader);

extern
gboolean        gst_byte_reader_skip_string_utf16 (GstByteReader * reader);

extern
gboolean        gst_byte_reader_skip_string_utf32 (GstByteReader * reader);

extern
gboolean        gst_byte_reader_get_string_utf8    (GstByteReader * reader, const gchar ** str);

extern
gboolean        gst_byte_reader_peek_string_utf8   (const GstByteReader * reader, const gchar ** str);

extern
guint           gst_byte_reader_masked_scan_uint32 (const GstByteReader * reader,
                                                    guint32               mask,
                                                    guint32               pattern,
                                                    guint                 offset,
                                                    guint                 size);
extern
guint           gst_byte_reader_masked_scan_uint32_peek (const GstByteReader * reader,
                                                         guint32 mask,
                                                         guint32 pattern,
                                                         guint offset,
                                                         guint size,
                                                         guint32 * value);

// xxxxxxx#define GST_BYTE_READER_INIT(data, size) {data, size, 0}


