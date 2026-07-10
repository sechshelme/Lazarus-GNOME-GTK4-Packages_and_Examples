/* GStreamer
 * Copyright (C) 2010 Thiago Santos <thiago.sousa.santos@collabora.co.uk>
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

#ifndef __GST_DATE_TIME_H__
#define __GST_DATE_TIME_H__

#include <gst/gstconfig.h>

#include <time.h>
#include <glib.h>
#include <glib-object.h>



/**
 * GstDateTime:
 *
 * Opaque, immutable, refcounted struct that stores date, time and timezone
 * information. It currently supports ranges from `0001-01-01` to
 * `9999-12-31` in the Gregorian proleptic calendar.
 *
 * Use the accessor functions to get the stored values.
 */
typedef struct _GstDateTime GstDateTime;

extern GType _gst_date_time_type;

/**
 * GST_TYPE_DATE_TIME:
 *
 * a boxed #GValue type for #GstDateTime that represents a date and time.
 *
 * Returns: the #GType of GstDateTime
 */

#define GST_TYPE_DATE_TIME (_gst_date_time_type)

extern
GType           gst_date_time_get_type (void);

/* query which fields are set */

extern
gboolean        gst_date_time_has_year                (const GstDateTime * datetime);

extern
gboolean        gst_date_time_has_month               (const GstDateTime * datetime);

extern
gboolean        gst_date_time_has_day                 (const GstDateTime * datetime);

extern
gboolean        gst_date_time_has_time                (const GstDateTime * datetime);

extern
gboolean        gst_date_time_has_second              (const GstDateTime * datetime);

/* field getters */

extern
gint            gst_date_time_get_year                (const GstDateTime * datetime);

extern
gint            gst_date_time_get_month               (const GstDateTime * datetime);

extern
gint            gst_date_time_get_day                 (const GstDateTime * datetime);

extern
gint            gst_date_time_get_hour                (const GstDateTime * datetime);

extern
gint            gst_date_time_get_minute              (const GstDateTime * datetime);

extern
gint            gst_date_time_get_second              (const GstDateTime * datetime);

extern
gint            gst_date_time_get_microsecond         (const GstDateTime * datetime);

extern
gfloat          gst_date_time_get_time_zone_offset    (const GstDateTime * datetime);

/* constructors */

extern
GstDateTime *   gst_date_time_new_from_unix_epoch_local_time (gint64 secs)  ;

extern
GstDateTime *   gst_date_time_new_from_unix_epoch_utc   (gint64 secs)  ;

extern
GstDateTime *   gst_date_time_new_from_unix_epoch_local_time_usecs (gint64 usecs)  ;

extern
GstDateTime *   gst_date_time_new_from_unix_epoch_utc_usecs (gint64 usecs)  ;

extern
GstDateTime *   gst_date_time_new_local_time            (gint year,
                                                         gint month,
                                                         gint day,
                                                         gint hour,
                                                         gint minute,
                                                         gdouble seconds)  ;
extern
GstDateTime *   gst_date_time_new_y                     (gint year)  ;

extern
GstDateTime *   gst_date_time_new_ym                    (gint year,
                                                         gint month)  ;
extern
GstDateTime *   gst_date_time_new_ymd                   (gint year,
                                                         gint month,
                                                         gint day)  ;
extern
GstDateTime *   gst_date_time_new                       (gfloat tzoffset,
                                                         gint year, gint month,
                                                         gint day, gint hour,
                                                         gint minute,
                                                         gdouble seconds)  ;
extern
GstDateTime *   gst_date_time_new_now_local_time (void)  ;

extern
GstDateTime *   gst_date_time_new_now_utc        (void)  ;

extern
gchar *         gst_date_time_to_iso8601_string  (GstDateTime * datetime)  ;

extern
GstDateTime *   gst_date_time_new_from_iso8601_string  (const gchar * string)  ;

extern
GDateTime *     gst_date_time_to_g_date_time       (GstDateTime * datetime) ;

extern
GstDateTime *   gst_date_time_new_from_g_date_time (GDateTime * dt) ;

/* refcounting */

extern
GstDateTime *   gst_date_time_ref                (GstDateTime * datetime);

extern
void            gst_date_time_unref              (GstDateTime * datetime);

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstDateTime, gst_date_time_unref)



#endif /* __GST_DATE_TIME_H__ */
