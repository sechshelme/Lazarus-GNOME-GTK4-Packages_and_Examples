

#ifndef __G_MESSAGES_H__
#define __G_MESSAGES_H__

#if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)
#error "Only <glib.h> can be included directly."
#endif

#include <stdarg.h>
#include <glib/gatomic.h>
#include <glib/gtypes.h>
#include <glib/gmacros.h>
#include <glib/gvariant.h>



/* calculate a string size, guaranteed to fit format + args.
 */
extern
gsize	g_printf_string_upper_bound (const gchar* format,
				     va_list	  args) ;

/* Log level shift offset for user defined
 * log levels (0-7 are used by GLib).
 */
#define G_LOG_LEVEL_USER_SHIFT  (8)

/* Glib log levels and flags.
 */
typedef enum
{
  /* log flags */
  G_LOG_FLAG_RECURSION          = 1 << 0,
  G_LOG_FLAG_FATAL              = 1 << 1,

  /* GLib log levels */
  G_LOG_LEVEL_ERROR             = 1 << 2,       /* always fatal */
  G_LOG_LEVEL_CRITICAL          = 1 << 3,
  G_LOG_LEVEL_WARNING           = 1 << 4,
  G_LOG_LEVEL_MESSAGE           = 1 << 5,
  G_LOG_LEVEL_INFO              = 1 << 6,
  G_LOG_LEVEL_DEBUG             = 1 << 7,

  G_LOG_LEVEL_MASK              = ~(G_LOG_FLAG_RECURSION | G_LOG_FLAG_FATAL)
}  GLogLevelFlags;

/* GLib log levels that are considered fatal by default */

/*xxxxxxxxxxxx
Makros und inline entfernt
*/

#define G_LOG_FATAL_MASK        (G_LOG_FLAG_RECURSION | G_LOG_LEVEL_ERROR)

typedef void            (*GLogFunc)             (const gchar   *log_domain,
                                                 GLogLevelFlags log_level,
                                                 const gchar   *message,
                                                 gpointer       user_data);

/* Logging mechanism
 */
extern
guint           g_log_set_handler       (const gchar    *log_domain,
                                         GLogLevelFlags  log_levels,
                                         GLogFunc        log_func,
                                         gpointer        user_data);
extern
guint           g_log_set_handler_full  (const gchar    *log_domain,
                                         GLogLevelFlags  log_levels,
                                         GLogFunc        log_func,
                                         gpointer        user_data,
                                         GDestroyNotify  destroy);
extern
void            g_log_remove_handler    (const gchar    *log_domain,
                                         guint           handler_id);
extern
void            g_log_default_handler   (const gchar    *log_domain,
                                         GLogLevelFlags  log_level,
                                         const gchar    *message,
                                         gpointer        unused_data);
extern
GLogFunc        g_log_set_default_handler (GLogFunc      log_func,
					   gpointer      user_data);
extern
void            g_log                   (const gchar    *log_domain,
                                         GLogLevelFlags  log_level,
                                         const gchar    *format,
                                         ...) ; 
extern
void            g_logv                  (const gchar    *log_domain,
                                         GLogLevelFlags  log_level,
                                         const gchar    *format,
                                         va_list         args) ;
extern
GLogLevelFlags  g_log_set_fatal_mask    (const gchar    *log_domain,
                                         GLogLevelFlags  fatal_mask);
extern
GLogLevelFlags  g_log_set_always_fatal  (GLogLevelFlags  fatal_mask);

extern
GLogLevelFlags  g_log_get_always_fatal  (void);

/* Structured logging mechanism. */

/**
 * GLogWriterOutput:
 * @G_LOG_WRITER_HANDLED: Log writer has handled the log entry.
 * @G_LOG_WRITER_UNHANDLED: Log writer could not handle the log entry.
 *
 * Return values from #GLogWriterFuncs to indicate whether the given log entry
 * was successfully handled by the writer, or whether there was an error in
 * handling it (and hence a fallback writer should be used).
 *
 * If a #GLogWriterFunc ignores a log entry, it should return
 * %G_LOG_WRITER_HANDLED.
 *
 * Since: 2.50
 */
typedef enum
{
  G_LOG_WRITER_HANDLED = 1,
  G_LOG_WRITER_UNHANDLED = 0,
} GLogWriterOutput;

/**
 * GLogField:
 * @key: field name (UTF-8 string)
 * @value: field value (arbitrary bytes)
 * @length: length of @value, in bytes, or -1 if it is nul-terminated
 *
 * Structure representing a single field in a structured log entry. See
 * g_log_structured() for details.
 *
 * Log fields may contain arbitrary values, including binary with embedded nul
 * bytes. If the field contains a string, the string must be UTF-8 encoded and
 * have a trailing nul byte. Otherwise, @length must be set to a non-negative
 * value.
 *
 * Since: 2.50
 */
typedef struct _GLogField GLogField;
struct _GLogField
{
  const gchar *key;
  gconstpointer value;
  gssize length;
};

/**
 * GLogWriterFunc:
 * @log_level: log level of the message
 * @fields: (array length=n_fields): fields forming the message
 * @n_fields: number of @fields
 * @user_data: user data passed to g_log_set_writer_func()
 *
 * Writer function for log entries. A log entry is a collection of one or more
 * #GLogFields, using the standard [field names from journal
 * specification](https://www.freedesktop.org/software/systemd/man/systemd.journal-fields.html).
 * See g_log_structured() for more information.
 *
 * Writer functions must ignore fields which they do not recognise, unless they
 * can write arbitrary binary output, as field values may be arbitrary binary.
 *
 * @log_level is guaranteed to be included in @fields as the `PRIORITY` field,
 * but is provided separately for convenience of deciding whether or where to
 * output the log entry.
 *
 * Writer functions should return %G_LOG_WRITER_HANDLED if they handled the log
 * message successfully or if they deliberately ignored it. If there was an
 * error handling the message (for example, if the writer function is meant to
 * send messages to a remote logging server and there is a network error), it
 * should return %G_LOG_WRITER_UNHANDLED. This allows writer functions to be
 * chained and fall back to simpler handlers in case of failure.
 *
 * Returns: %G_LOG_WRITER_HANDLED if the log entry was handled successfully;
 *   %G_LOG_WRITER_UNHANDLED otherwise
 *
 * Since: 2.50
 */
typedef GLogWriterOutput (*GLogWriterFunc)     (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);

extern
void             g_log_structured              (const gchar     *log_domain,
                                                GLogLevelFlags   log_level,
                                                ...);
extern
void             g_log_structured_array        (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields);

extern
void             g_log_variant                 (const gchar     *log_domain,
                                                GLogLevelFlags   log_level,
                                                GVariant        *fields);

extern
void             g_log_set_writer_func         (GLogWriterFunc   func,
                                                gpointer         user_data,
                                                GDestroyNotify   user_data_free);

extern
gboolean         g_log_writer_supports_color   (gint             output_fd);
extern
gboolean         g_log_writer_is_journald      (gint             output_fd);

extern
gchar           *g_log_writer_format_fields    (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gboolean         use_color);

extern
GLogWriterOutput g_log_writer_syslog           (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);
extern
GLogWriterOutput g_log_writer_journald         (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);
extern
GLogWriterOutput g_log_writer_standard_streams (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);
extern
GLogWriterOutput g_log_writer_default          (GLogLevelFlags   log_level,
                                                const GLogField *fields,
                                                gsize            n_fields,
                                                gpointer         user_data);

extern
void            g_log_writer_default_set_use_stderr (gboolean use_stderr);
extern
gboolean        g_log_writer_default_would_drop (GLogLevelFlags  log_level,
                                                 const char     *log_domain);
extern
void            g_log_writer_default_set_debug_domains (const gchar * const *domains);


/* G_MESSAGES_DEBUG enablement */
extern
gboolean         g_log_get_debug_enabled       (void);
extern
void             g_log_set_debug_enabled       (gboolean         enabled);

/**
 * G_DEBUG_HERE:
 *
 * A convenience form of g_log_structured(), recommended to be added to
 * functions when debugging. It prints the current monotonic time and the code
 * location using %G_STRLOC.
 *
 * Since: 2.50
 */

/* internal */
void	_g_log_fallback_handler	(const gchar   *log_domain,
						 GLogLevelFlags log_level,
						 const gchar   *message,
						 gpointer       unused_data);

/* Internal functions, used to implement the following macros */
extern
void g_return_if_fail_warning (const char *log_domain,
			       const char *pretty_function,
			       const char *expression);
extern
void g_warn_message           (const char     *domain,
                               const char     *file,
                               int             line,
                               const char     *func,
                               const char     *warnexpr) ;

// xxxxxxxxx GLIB_DEPRECATED
void g_assert_warning         (const char *log_domain,
			       const char *file,
			       const int   line,
		               const char *pretty_function,
		               const char *expression);

extern
void g_log_structured_standard (const gchar    *log_domain,
                                GLogLevelFlags  log_level,
                                const gchar    *file,
                                const gchar    *line,
                                const gchar    *func,
                                const gchar    *message_format,
                                ...) ; 

#ifndef G_LOG_DOMAIN
#define G_LOG_DOMAIN    ((gchar*) 0)
#endif  /* G_LOG_DOMAIN */


/**
 * GPrintFunc:
 * @string: the message to output
 *
 * Specifies the type of the print handler functions.
 * These are called with the complete formatted string to output.
 */
typedef void    (*GPrintFunc)           (const gchar    *string);
extern
void            g_print                 (const gchar    *format,
                                         ...) ;
extern
GPrintFunc      g_set_print_handler     (GPrintFunc      func);
extern
void            g_printerr              (const gchar    *format,
                                         ...) ;
extern
GPrintFunc      g_set_printerr_handler  (GPrintFunc      func);

/**
 * g_warn_if_reached:
 *
 * Logs a warning.
 *
 * Since: 2.16
 */

