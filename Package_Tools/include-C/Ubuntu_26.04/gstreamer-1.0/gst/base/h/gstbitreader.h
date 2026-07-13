/* GStreamer
 *
 * Copyright (C) 2008 Sebastian Dröge <sebastian.droege@collabora.co.uk>.
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

#ifndef __GST_BIT_READER_H__
#define __GST_BIT_READER_H__

#include <gst/gst.h>
#include <gst/base/base-prelude.h>

/* FIXME: inline functions */



#define GST_BIT_READER(reader) ((GstBitReader *) (reader))

/**
 * GstBitReader:
 * @data: (array length=size): Data from which the bit reader will
 *   read
 * @size: Size of @data in bytes
 * @byte: Current byte position
 * @bit: Bit position in the current byte
 *
 * A bit reader instance.
 */
typedef struct {
  const guint8 *data;
  guint size;

  guint byte;  /* Byte position */
  guint bit;   /* Bit position in the current byte */

  /* < private > */
  gpointer _gst_reserved[GST_PADDING];
} GstBitReader;

extern
GstBitReader *  gst_bit_reader_new              (const guint8 *data, guint size) ;

extern
void            gst_bit_reader_free             (GstBitReader *reader);

extern
void            gst_bit_reader_init             (GstBitReader *reader, const guint8 *data, guint size);

extern
gboolean        gst_bit_reader_set_pos          (GstBitReader *reader, guint pos);

extern
guint           gst_bit_reader_get_pos          (const GstBitReader *reader);

extern
guint           gst_bit_reader_get_remaining    (const GstBitReader *reader);

extern
guint           gst_bit_reader_get_size         (const GstBitReader *reader);

extern
gboolean        gst_bit_reader_skip             (GstBitReader *reader, guint nbits);

extern
gboolean        gst_bit_reader_skip_to_byte     (GstBitReader *reader);

extern
gboolean        gst_bit_reader_get_bits_uint8   (GstBitReader *reader, guint8 *val, guint nbits);

extern
gboolean        gst_bit_reader_get_bits_uint16  (GstBitReader *reader, guint16 *val, guint nbits);

extern
gboolean        gst_bit_reader_get_bits_uint32  (GstBitReader *reader, guint32 *val, guint nbits);

extern
gboolean        gst_bit_reader_get_bits_uint64  (GstBitReader *reader, guint64 *val, guint nbits);

extern
gboolean        gst_bit_reader_peek_bits_uint8  (const GstBitReader *reader, guint8 *val, guint nbits);

extern
gboolean        gst_bit_reader_peek_bits_uint16 (const GstBitReader *reader, guint16 *val, guint nbits);

extern
gboolean        gst_bit_reader_peek_bits_uint32 (const GstBitReader *reader, guint32 *val, guint nbits);

extern
gboolean        gst_bit_reader_peek_bits_uint64 (const GstBitReader *reader, guint64 *val, guint nbits);



