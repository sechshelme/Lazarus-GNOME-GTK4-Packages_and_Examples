/** \file gphoto2-port-log.h
 *
 * Copyright 2001 Lutz Mueller <lutz@users.sf.net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
 */

#ifndef LIBGPHOTO2_GPHOTO2_PORT_LOG_H
#define LIBGPHOTO2_GPHOTO2_PORT_LOG_H

#include <stdarg.h>

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/**
 * \brief Logging level
 * Specifies the logging severity level.
 */
typedef enum {
	GP_LOG_ERROR = 0,	/**< \brief Log message is an error information. */
	GP_LOG_VERBOSE = 1,	/**< \brief Log message is an verbose debug information. */
	GP_LOG_DEBUG = 2,	/**< \brief Log message is an debug information. */
	GP_LOG_DATA = 3		/**< \brief Log message is a data hex dump. */
} GPLogLevel;

/**
 * GP_LOG_ALL:
 *
 * Used by frontends if they want to be sure their
 * callback function receives all messages. Defined
 * as the highest debug level. Can make frontend code
 * more understandable and extension of log levels
 * easier.
 **/
#define GP_LOG_ALL GP_LOG_DATA

/**
 * \brief Logging function hook
 *
 * This is the function frontends can use to receive logging information
 * from the libgphoto2 framework. It is set using gp_log_add_func() and
 * removed using gp_log_remove_func() and will then receive the logging
 * messages of the level specified.
 *
 * \param level the log level of the passed message, as set by the camera driver or libgphoto2
 * \param domain the logging domain as set by the camera driver, or libgphoto2 function
 * \param str the logmessage, without linefeed
 * \param data the caller private data that was passed to gp_log_add_func()
 */
typedef void (* GPLogFunc) (GPLogLevel level, const char *domain, const char *str, void *data);

#ifndef DISABLE_DEBUGGING

int  gp_log_add_func    (GPLogLevel level, GPLogFunc func, void *data);
int  gp_log_remove_func (int id);

/* Logging */
void gp_log      (GPLogLevel level, const char *domain,
		  const char *format, ...)
;
void gp_log_with_source_location(
		  GPLogLevel level, const char *file, int line, const char *func,
		  const char *format, ...)
;
void gp_logv     (GPLogLevel level, const char *domain, const char *format,
		  va_list args)
;
void gp_log_data (const char *domain, const char *data, unsigned int size,
		  const char *format, ...)
;


#ifdef _GPHOTO2_INTERNAL_CODE

  typedef struct StringFlagItem {
    char *str;
    unsigned int flag;
  } StringFlagItem;

  typedef void (*string_item_func) (const char *str, void *data);

  const char *
  gpi_enum_to_string(const unsigned int _enum,
		     const StringFlagItem *map);

  int
  gpi_string_to_enum(const char *str,
		     unsigned int *result,
		     const StringFlagItem *map);

  void
  gpi_flags_to_string_list(const unsigned int flags,
			   const StringFlagItem *map,
			   string_item_func func, void *data);

  int
  gpi_string_or_to_flags(const char *str,
			 unsigned int *flags,
			 const StringFlagItem *map);

  unsigned int
  gpi_string_to_flag(const char *str,
		     const StringFlagItem *map);

  unsigned int
  gpi_string_list_to_flags(const char *str[],
			   const StringFlagItem *map);

  /* Allocates a sufficiently large buffer and interpolates the format
   * string with the proveded va_list args. The returned memory has to
   * be freed by the caller. */
  char*
  gpi_vsnprintf (const char* format, va_list args);


#endif /* _GPHOTO2_INTERNAL_CODE */
#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* !defined(LIBGPHOTO2_GPHOTO2_PORT_LOG_H) */
