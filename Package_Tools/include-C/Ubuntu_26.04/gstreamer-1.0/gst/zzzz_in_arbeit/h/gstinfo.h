/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *                    2000 Wim Taymans <wtay@chello.be>
 *                    2003 Benjamin Otte <in7y118@public.uni-hamburg.de>
 *
 * gstinfo.h: debugging functions
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

#ifndef __GSTINFO_H__
#define __GSTINFO_H__

#include "gstclock.h"
#include <glib.h>
#include <glib-object.h>
#include <gst/gstconfig.h>
#include <gst/gstsegment.h>



typedef enum {
  GST_LEVEL_NONE = 0,
  GST_LEVEL_ERROR = 1,
  GST_LEVEL_WARNING = 2,
  GST_LEVEL_FIXME = 3,
  GST_LEVEL_INFO = 4,
  GST_LEVEL_DEBUG = 5,
  GST_LEVEL_LOG = 6,
  GST_LEVEL_TRACE = 7,
  /* add more */
  GST_LEVEL_MEMDUMP = 9,
  /* add more */
  GST_LEVEL_COUNT
} GstDebugLevel;

typedef enum { /*< flags >*/
  /* colors */
  GST_DEBUG_FG_BLACK		= 0x0000,
  GST_DEBUG_FG_RED		= 0x0001,
  GST_DEBUG_FG_GREEN		= 0x0002,
  GST_DEBUG_FG_YELLOW		= 0x0003,
  GST_DEBUG_FG_BLUE		= 0x0004,
  GST_DEBUG_FG_MAGENTA		= 0x0005,
  GST_DEBUG_FG_CYAN		= 0x0006,
  GST_DEBUG_FG_WHITE		= 0x0007,
  /* background colors */
  GST_DEBUG_BG_BLACK		= 0x0000,
  GST_DEBUG_BG_RED		= 0x0010,
  GST_DEBUG_BG_GREEN		= 0x0020,
  GST_DEBUG_BG_YELLOW		= 0x0030,
  GST_DEBUG_BG_BLUE		= 0x0040,
  GST_DEBUG_BG_MAGENTA		= 0x0050,
  GST_DEBUG_BG_CYAN		= 0x0060,
  GST_DEBUG_BG_WHITE		= 0x0070,
  /* other formats */
  GST_DEBUG_BOLD		= 0x0100,
  GST_DEBUG_UNDERLINE		= 0x0200
} GstDebugColorFlags;

typedef enum {
    GST_STACK_TRACE_SHOW_NONE = 0,
    GST_STACK_TRACE_SHOW_FULL = 1 << 0
} GstStackTraceFlags;

typedef enum {
  GST_DEBUG_COLOR_MODE_OFF  = 0,
  GST_DEBUG_COLOR_MODE_ON   = 1,
  GST_DEBUG_COLOR_MODE_UNIX = 2
} GstDebugColorMode;


#define GST_DEBUG_FG_MASK	(0x000F)
#define GST_DEBUG_BG_MASK	(0x00F0)
#define GST_DEBUG_FORMAT_MASK	(0xFF00)

typedef struct _GstDebugCategory GstDebugCategory;
/**
 * GstDebugCategory:
 *
 * This is the struct that describes the categories. Once initialized with
 * #GST_DEBUG_CATEGORY_INIT, its values can't be changed anymore.
 */
struct _GstDebugCategory {
  /*< private >*/
  gint                  threshold;
  guint			color;		/* see defines above */

  const gchar *		name;
  const gchar *		description;
};

/********** some convenience macros for debugging **********/

#define GST_PTR_FORMAT     "p\aA"

/**
 * GST_SEGMENT_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer segments. You can use this in
 * combination with GStreamer's debug logging system as well as the functions
 * gst_info_vasprintf(), gst_info_strdup_vprintf() and gst_info_strdup_printf()
 * to pretty-print #GstSegment structures.
 * This can only be used on pointers to GstSegment structures.
 */
#define GST_SEGMENT_FORMAT "p\aB"

/**
 * GST_TIMEP_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer ClockTime pointers. You can use
 * this in combination with GStreamer's debug logging system as well as the
 * functions gst_info_vasprintf(), gst_info_strdup_vprintf() and
 * gst_info_strdup_printf() to pretty-print #GstClockTime pointers. This can
 * only be used on pointers to GstClockTime values.
 *
 * Since: 1.18
 */
#define GST_TIMEP_FORMAT "p\aT"

/**
 * GST_STIMEP_FORMAT: (skip):
 *
 * printf format type used to debug GStreamer signed time value pointers. You
 * can use this in combination with GStreamer's debug logging system as well as
 * the functions gst_info_vasprintf(), gst_info_strdup_vprintf() and
 * gst_info_strdup_printf() to pretty-print signed time (pointers to
 * #GstClockTimeDiff or #gint64).
 *
 * Since: 1.18
 */
#define GST_STIMEP_FORMAT "p\aS"

typedef struct _GstDebugMessage GstDebugMessage;

/**
 * GstLogFunction:
 * @category: a #GstDebugCategory
 * @level: a #GstDebugLevel
 * @file: file name
 * @function: function name
 * @line: line number
 * @object: a #GObject
 * @message: the message
 * @user_data: user data for the log function
 *
 * Function prototype for a logging function that can be registered with
 * gst_debug_add_log_function().
 * Use  on that function.
 */
typedef void (*GstLogFunction)  (GstDebugCategory * category,
                                 GstDebugLevel      level,
                                 const gchar      * file,
                                 const gchar      * function,
                                 gint               line,
                                 GObject          * object,
                                 GstDebugMessage  * message,
                                 gpointer           user_data);

extern
void		    gst_debug_log            (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint               line,
                                          GObject          * object,
                                          const gchar      * format,
                                          ...) ;// (7, 8) ;
extern
void            gst_debug_log_valist     (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint	             line,
                                          GObject          * object,
                                          const gchar      * format,
                                          va_list            args) ;

extern
void            gst_debug_log_literal    (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint	             line,
                                          GObject          * object,
                                          const gchar      * message_string) ;

extern
void		gst_debug_log_id          (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint               line,
					  const gchar      * id,
                                          const gchar      * format,
                                          ...) ;// (7, 8) ;
extern
void            gst_debug_log_id_valist  (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint	             line,
                                          const gchar      * id,
                                          const gchar      * format,
                                          va_list            args) ;

extern
void            gst_debug_log_id_literal (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint	             line,
                                          const gchar      * id,
                                          const gchar      * message_string) ;

/* do not use this function, use the GST_DEBUG_CATEGORY_INIT macro */

extern
GstDebugCategory *_gst_debug_category_new (const gchar * name,
                                           guint         color,
                                           const gchar * description);

/* do not use this function, use the GST_DEBUG_CATEGORY_GET macro */

extern
GstDebugCategory *_gst_debug_get_category (const gchar *name);


/* do not use these functions, use the GST_CAT_MEMDUMP_* macros */

extern
void _gst_debug_dump_mem (GstDebugCategory * cat, const gchar * file,
    const gchar * func, gint line, GObject * obj, const gchar * msg,
    const guint8 * data, guint length);

extern
void _gst_debug_dump_mem_id (GstDebugCategory * cat, const gchar * file,
    const gchar * func, gint line, const gchar *object_id, const gchar * msg,
    const guint8 * data, guint length);

/**
 * GstDebugFuncPtr: (attributes doc.skip=true)
 * we define this to avoid a compiler warning regarding a cast from a function
 * pointer to a void pointer
 * (see https://bugzilla.gnome.org/show_bug.cgi?id=309253)
 */
typedef	void (* GstDebugFuncPtr)	(void);

/* do no use these functions, use the GST_DEBUG*_FUNCPTR macros */

extern
void	_gst_debug_register_funcptr	(GstDebugFuncPtr	func,
					 const gchar *		ptrname);
extern
const gchar *
	_gst_debug_nameof_funcptr	(GstDebugFuncPtr	func) ;


extern
const gchar   * gst_debug_message_get    (GstDebugMessage  * message);

extern
const gchar   * gst_debug_message_get_id (GstDebugMessage  * message);

extern
gchar         * gst_debug_log_get_line    (GstDebugCategory * category,
                                           GstDebugLevel      level,
                                           const gchar      * file,
                                           const gchar      * function,
                                           gint               line,
                                           GObject          * object,
                                           GstDebugMessage  * message) ;

extern
void            gst_debug_log_default    (GstDebugCategory * category,
                                          GstDebugLevel      level,
                                          const gchar      * file,
                                          const gchar      * function,
                                          gint               line,
                                          GObject          * object,
                                          GstDebugMessage  * message,
                                          gpointer           user_data) ;

extern
const gchar *   gst_debug_level_get_name (GstDebugLevel level);

extern
void            gst_debug_add_log_function            (GstLogFunction func,
                                                       gpointer       user_data,
                                                       GDestroyNotify notify);
extern
guint           gst_debug_remove_log_function         (GstLogFunction func);

extern
guint           gst_debug_remove_log_function_by_data (gpointer       data);

extern
void            gst_debug_set_active  (gboolean active);

extern
gboolean        gst_debug_is_active   (void);

extern
void            gst_debug_set_colored (gboolean colored);

extern
void            gst_debug_set_color_mode   (GstDebugColorMode mode);

extern
void            gst_debug_set_color_mode_from_string (const gchar * mode);

extern
gboolean        gst_debug_is_colored  (void);

extern
GstDebugColorMode gst_debug_get_color_mode (void);

extern
void            gst_debug_set_default_threshold      (GstDebugLevel level);

extern
GstDebugLevel   gst_debug_get_default_threshold      (void);

extern
void            gst_debug_set_threshold_for_name     (const gchar * name,
                                                      GstDebugLevel level);
extern
void            gst_debug_set_threshold_from_string  (const gchar * list, gboolean reset);

extern
void            gst_debug_unset_threshold_for_name   (const gchar * name);

//xxxxxxxxxxxGST_DEPRECATED
void            gst_debug_category_free              (GstDebugCategory *	category);

extern
void            gst_debug_category_set_threshold     (GstDebugCategory *	category,
                                                      GstDebugLevel		level);

extern
void            gst_debug_category_reset_threshold   (GstDebugCategory *	category);

extern
GstDebugLevel   gst_debug_category_get_threshold     (GstDebugCategory *	category);

extern
const gchar *   gst_debug_category_get_name          (GstDebugCategory *	category);

extern
guint           gst_debug_category_get_color         (GstDebugCategory *	category);

extern
const gchar *   gst_debug_category_get_description   (GstDebugCategory *	category);

extern
GSList *        gst_debug_get_all_categories	(void);


extern
gchar * gst_debug_print_object  (gconstpointer ptr);

extern
gchar * gst_debug_print_segment (const GstSegment *segment);

extern
gchar * gst_debug_construct_term_color (guint colorinfo);

extern
gint    gst_debug_construct_win_color  (guint colorinfo);

extern
gint    gst_info_vasprintf              (gchar ** result,
                                         const gchar * format,
                                         va_list args) ;// (2, 0);
extern
gchar * gst_info_strdup_vprintf         (const gchar *format, va_list args) ;// (1, 0);

extern
gchar * gst_info_strdup_printf          (const gchar *format, ...) ;// (1, 2);

extern
void    gst_print                       (const gchar * format, ...) ;// (1, 2);

extern
void    gst_println                     (const gchar * format, ...) ;// (1, 2);

extern
void    gst_printerr                    (const gchar * format, ...) ;// (1, 2);

extern
void    gst_printerrln                  (const gchar * format, ...) ;// (1, 2);



extern GstDebugCategory *	GST_CAT_DEFAULT;
/* this symbol may not be used */

extern gboolean                 _gst_debug_enabled;

/* the min debug level, used for quickly discarding debug
 * messages that fall under the threshold. */

extern GstDebugLevel            _gst_debug_min;




extern
void gst_debug_print_stack_trace (void);

extern
gchar * gst_debug_get_stack_trace (GstStackTraceFlags flags);

extern
void                  gst_debug_add_ring_buffer_logger      (guint max_size_per_thread, guint thread_timeout);
extern
void                  gst_debug_remove_ring_buffer_logger   (void);
extern
gchar **              gst_debug_ring_buffer_logger_get_logs (void);

/**
 * GstLogContextHashFlags:
 * @GST_LOG_CONTEXT_DEFAULT: Default behavior for logging context
 *                          (uses object, format, file but not line number or string args)
 * @GST_LOG_CONTEXT_IGNORE_OBJECT: Ignore object pointer or object ID when calculating message hash
 * @GST_LOG_CONTEXT_IGNORE_FORMAT: Ignore the "format" part of the debug
 * log message
 * @GST_LOG_CONTEXT_IGNORE_FILE: Ignore file name when calculating message hash
 * @GST_LOG_CONTEXT_USE_LINE_NUMBER: Use line number when calculating message hash (not used by default)
 * @GST_LOG_CONTEXT_USE_STRING_ARGS: Use the arguments part of the string message (not used by default)
 *
 * Flags to control how the message hash is calculated in a #GstLogContext.
 * The message hash is used to determine if a message is a duplicate of a previously
 * logged message.
 *
 * Since: 1.28
 */
typedef enum {
  GST_LOG_CONTEXT_DEFAULT            = 0,
  GST_LOG_CONTEXT_IGNORE_OBJECT      = (1 << 0),
  GST_LOG_CONTEXT_IGNORE_FORMAT      = (1 << 1),
  GST_LOG_CONTEXT_IGNORE_FILE        = (1 << 2),
  GST_LOG_CONTEXT_USE_LINE_NUMBER    = (1 << 3),
  GST_LOG_CONTEXT_USE_STRING_ARGS    = (1 << 4),
} GstLogContextHashFlags;

/**
 * GstLogContextFlags:
 * @GST_LOG_CONTEXT_FLAG_NONE: No special behavior (empty flags)
 * @GST_LOG_CONTEXT_FLAG_THROTTLE: Enable message throttling/deduplication. This
 *  makes the context track which messages have been logged already based on
 *  their message hash, and only log them once (or periodically if an
 *  interval is set). Without this flag, all messages will be logged regardless
 *  of whether they've been logged before.
 *
 * Flags to control the behavior of a #GstLogContext.
 *
 * Since: 1.28
 */
typedef enum {
  GST_LOG_CONTEXT_FLAG_NONE          = 0,
  GST_LOG_CONTEXT_FLAG_THROTTLE      = (1 << 0),
} GstLogContextFlags;

/**
 * GstLogContext:
 *
 * A context for controlling logging behavior, for example to handle
 * logging once or periodic logging, avoiding to
 * spam the terminal with the same log message multiple times.
 *
 * ## Simple log context using static macros
 *
 * ``` c
 * // At global/file scope:
 * GST_LOG_CONTEXT_STATIC_DEFINE(my_context, GST_LOG_CONTEXT_FLAG_THROTTLE, );
 * #define MY_CONTEXT GST_LOG_CONTEXT_LAZY_INIT(my_context)
 *
 * // Then in code:
 * GST_CTX_INFO(MY_CONTEXT, "This will only appear once per file/line");
 * ```
 *
 * ## Periodic logging
 *
 * For messages that should be logged periodically (e.g., maximum once per minute):
 *
 * ``` c
 * // At global/file scope:
 * GST_LOG_CONTEXT_STATIC_DEFINE(my_periodic_context, GST_LOG_CONTEXT_FLAG_THROTTLE,
 *   GST_LOG_CONTEXT_BUILDER_SET_INTERVAL(60 * GST_SECOND);
 * );
 * #define MY_PERIODIC_CONTEXT GST_LOG_CONTEXT_LAZY_INIT(my_periodic_context)
 *
 * // Then in code:
 * GST_CTX_INFO(MY_PERIODIC_CONTEXT, "This appears once per minute");
 * ```
 *
 * ## Customizing Message hash with custom flags and category
 *
 * By default, a message's hash is determined by the file name, object pointer,
 * and format string. You can customize this with builder operations:
 *
 * ``` c
 * // Ignore the object pointer when determining message hash (with throttling)
 * GST_LOG_CONTEXT_STATIC_DEFINE(obj_independent_ctx, GST_LOG_CONTEXT_FLAG_THROTTLE,
 *   GST_LOG_CONTEXT_BUILDER_SET_HASH_FLAGS(GST_LOG_CONTEXT_IGNORE_OBJECT);
 * );
 *
 * // Use a custom category (without throttling)
 * GST_LOG_CONTEXT_STATIC_DEFINE(custom_cat_ctx, GST_LOG_CONTEXT_FLAG_NONE,
 *   GST_LOG_CONTEXT_BUILDER_SET_CATEGORY(my_category);
 * );
 * ```
 *
 * Since: 1.28
 */
typedef struct _GstLogContext GstLogContext;

/**
 * GstLogContextBuilder:
 *
 * A builder for creating a #GstLogContext. This provides a flexible way to
 * configure a log context with various options while maintaining immutability
 * of the resulting context.
 *
 * Since: 1.28
 */
typedef struct _GstLogContextBuilder GstLogContextBuilder;

extern
GstDebugCategory *gst_log_context_get_category  (GstLogContext *context);
extern
void gst_log_context_reset                      (GstLogContext *ctx);
extern
void gst_log_context_free                       (GstLogContext *ctx);

extern
void gst_debug_log_with_context                 (GstLogContext *ctx,
                                                 GstDebugLevel level,
                                                 const gchar *file,
                                                 const gchar *function,
                                                 gint line,
                                                 GObject *object,
                                                 const gchar *format,
                                                 ...) ;//(7, 8);

extern
void gst_debug_log_with_context_valist          (GstLogContext *ctx,
                                                 GstDebugLevel level,
                                                 const gchar *file,
                                                 const gchar *function,
                                                 gint line,
                                                 GObject *object,
                                                 const gchar *format,
                                                 va_list args)  ;// (7, 0) ;

extern
void gst_debug_log_literal_with_context         (GstLogContext *ctx,
                                                 GstDebugLevel level,
                                                 const gchar *file,
                                                 const gchar *function,
                                                 gint line,
                                                 GObject *object,
                                                 const gchar *message);

extern
void gst_debug_log_id_with_context              (GstLogContext *ctx,
                                                 GstDebugLevel level,
                                                 const gchar *file,
                                                 const gchar *function,
                                                 gint line,
                                                 const gchar *id,
                                                 const gchar *format,
                                                 ...) ;//(7, 8);

extern
void gst_debug_log_id_with_context_valist       (GstLogContext *ctx,
                                                 GstDebugLevel level,
                                                 const gchar *file,
                                                 const gchar *function,
                                                 gint line,
                                                 const gchar *id,
                                                 const gchar *format,
                                                 va_list args) ;//(7, 0);

extern
void gst_debug_log_id_literal_with_context      (GstLogContext *ctx,
                                                 GstDebugLevel level,
                                                 const gchar *file,
                                                 const gchar *function,
                                                 gint line,
                                                 const gchar *id,
                                                 const gchar *message);

extern
void _gst_debug_log_once                        (GstDebugCategory * category,
                                                 GstDebugLevel level,
                                                 const gchar * file,
                                                 const gchar * function,
                                                 gint line,
                                                 GObject * object,
                                                 const gchar * format, ...) ;//(7, 8);

extern
void _gst_debug_log_once_id                     (GstDebugCategory * category,
                                                 GstDebugLevel level,
                                                 const gchar * file,
                                                 const gchar * function,
                                                 gint line,
                                                 const gchar * id,
                                                 const gchar * format, ...) ;//(7, 8);

/* Builder pattern API */
extern
GstLogContextBuilder* gst_log_context_builder_new           (GstDebugCategory *category,
                                                             GstLogContextFlags flags) ;

extern
GstLogContextBuilder* gst_log_context_builder_set_hash_flags (GstLogContextBuilder* builder,
                                                             GstLogContextHashFlags flags) ;

extern
GstLogContextBuilder* gst_log_context_builder_set_category  (GstLogContextBuilder* builder,
                                                             GstDebugCategory* category) ;

extern
GstLogContextBuilder* gst_log_context_builder_set_interval  (GstLogContextBuilder* builder,
                                                             GstClockTime interval) ;

extern
GstLogContext*        gst_log_context_builder_build         (GstLogContextBuilder* builder) ;


