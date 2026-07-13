/*
 *  gstbitwriter.h - bitstream writer
 *
 *  Copyright (C) 2013 Intel Corporation
 *  Copyright (C) 2018 Igalia, S. L.
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 *  Boston, MA 02110-1301 USA
 */

#ifndef GST_BIT_WRITER_H
#define GST_BIT_WRITER_H

#include <gst/gst.h>
#include <gst/base/base-prelude.h>

#include <string.h>



#define GST_BIT_WRITER_DATA(writer)     ((writer)->data)
#define GST_BIT_WRITER_BIT_SIZE(writer) ((writer)->bit_size)
#define GST_BIT_WRITER(writer)          ((GstBitWriter *) (writer))

typedef struct _GstBitWriter GstBitWriter;

/**
 * GstBitWriter:
 * @data: Allocated @data for bit writer to write
 * @bit_size: Size of written @data in bits
 *
 * A bit writer instance.
 *
 * Since: 1.16
 */
struct _GstBitWriter
{
  guint8 *data;
  guint bit_size;

  /*< private >*/
  guint bit_capacity; /* Capacity of the allocated data */
  gboolean auto_grow; /* Whether space can auto grow */
  gboolean owned;
  gpointer _gst_reserved[GST_PADDING];
};

extern
GstBitWriter *  gst_bit_writer_new              (void) ;

extern
GstBitWriter *  gst_bit_writer_new_with_size    (guint32 size, gboolean fixed) ;

extern
GstBitWriter *  gst_bit_writer_new_with_data    (guint8 *data, guint size,
						 gboolean initialized) ;

extern
void            gst_bit_writer_free             (GstBitWriter *bitwriter);

extern
guint8 *        gst_bit_writer_free_and_get_data (GstBitWriter *bitwriter) ;

extern
GstBuffer *     gst_bit_writer_free_and_get_buffer (GstBitWriter *bitwriter) ;

extern
void            gst_bit_writer_init             (GstBitWriter *bitwriter);

extern
void            gst_bit_writer_init_with_size   (GstBitWriter *bitwriter,
						 guint32 size, gboolean fixed);

extern
void            gst_bit_writer_init_with_data   (GstBitWriter *bitwriter,  guint8 *data,
						 guint size, gboolean initialized);

extern
void            gst_bit_writer_reset            (GstBitWriter *bitwriter);

extern
guint8 *        gst_bit_writer_reset_and_get_data (GstBitWriter *bitwriter) ;

extern
GstBuffer *     gst_bit_writer_reset_and_get_buffer (GstBitWriter *bitwriter) ;

extern
guint           gst_bit_writer_get_size         (const GstBitWriter *bitwriter);

extern
guint8 *        gst_bit_writer_get_data         (const GstBitWriter *bitwriter);

extern
gboolean        gst_bit_writer_set_pos          (GstBitWriter *bitwriter, guint pos);

extern
guint           gst_bit_writer_get_remaining    (const GstBitWriter *bitwriter);

extern
gboolean        gst_bit_writer_put_bits_uint8   (GstBitWriter *bitwriter, guint8 value,
						 guint nbits);

extern
gboolean        gst_bit_writer_put_bits_uint16  (GstBitWriter *bitwriter, guint16 value,
						 guint nbits);

extern
gboolean        gst_bit_writer_put_bits_uint32  (GstBitWriter *bitwriter, guint32 value,
						 guint nbits);

extern
gboolean        gst_bit_writer_put_bits_uint64  (GstBitWriter *bitwriter, guint64 value,
						 guint nbits);

extern
gboolean        gst_bit_writer_put_bytes        (GstBitWriter *bitwriter, const guint8 *data,
						 guint nbytes);

extern
gboolean        gst_bit_writer_align_bytes      (GstBitWriter *bitwriter, guint8 trailing_bit);


