/* GTK - The GIMP Toolkit
 * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDonald
 *
 * GTK Calendar Widget
 * Copyright (C) 1998 Cesar Miquel and Shawn T. Amundson
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 */

/*
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
 */

#pragma once


#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtkwidget.h>




#define GTK_TYPE_CALENDAR                  (gtk_calendar_get_type ())
#define GTK_CALENDAR(obj)                  (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_CALENDAR, GtkCalendar))
#define GTK_IS_CALENDAR(obj)               (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_CALENDAR))


typedef struct _GtkCalendar	       GtkCalendar;

extern
GType	   gtk_calendar_get_type	(void) ;
extern
GtkWidget* gtk_calendar_new		(void);

extern //xxxxxGLIB_DEPRECATED_IN_4_20_FOR (gtk_calendar_set_date)
void          gtk_calendar_select_day                  (GtkCalendar *self,
                                                        GDateTime   *date);

extern
void       gtk_calendar_mark_day	(GtkCalendar *calendar,
					 guint	      day);
extern
void       gtk_calendar_unmark_day	(GtkCalendar *calendar,
					 guint	      day);
extern
void	   gtk_calendar_clear_marks	(GtkCalendar *calendar);

extern
void          gtk_calendar_set_show_week_numbers       (GtkCalendar *self,
                                                        gboolean     value);
extern
gboolean      gtk_calendar_get_show_week_numbers       (GtkCalendar *self);
extern
void          gtk_calendar_set_show_heading            (GtkCalendar *self,
                                                        gboolean     value);
extern
gboolean      gtk_calendar_get_show_heading            (GtkCalendar *self);
extern
void          gtk_calendar_set_show_day_names          (GtkCalendar *self,
                                                        gboolean     value);
extern
gboolean      gtk_calendar_get_show_day_names          (GtkCalendar *self);

extern
void          gtk_calendar_set_day                     (GtkCalendar *self,
                                                        int          day);

extern
int           gtk_calendar_get_day                     (GtkCalendar *self);

extern
void          gtk_calendar_set_month                   (GtkCalendar *self,
                                                        int          month);

extern
int           gtk_calendar_get_month                   (GtkCalendar *self);

extern
void          gtk_calendar_set_year                    (GtkCalendar *self,
                                                        int          year);

extern
int           gtk_calendar_get_year                    (GtkCalendar *self);

extern
void          gtk_calendar_set_date                    (GtkCalendar *self,
                                                        GDateTime   *date);
extern
GDateTime *   gtk_calendar_get_date                    (GtkCalendar *self);

extern
gboolean   gtk_calendar_get_day_is_marked      (GtkCalendar    *calendar,
                                                guint           day);

////G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GtkCalendar, g_object_unref)



