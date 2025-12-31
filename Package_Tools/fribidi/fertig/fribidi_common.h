/* FriBidi
 * fribidi-common.h - common include for library headers
 *
 * Author:
 *   Behdad Esfahbod, 2004
 *
 * Copyright (C) 2004 Sharif FarsiWeb, Inc.
 * 
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library, in a file named COPYING; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA
 * 
 * For licensing issues, contact <fribidi.license@gmail.com>.
 */
#ifndef _FRIBIDI_COMMON_H
#define _FRIBIDI_COMMON_H

#ifdef DONT_HAVE_FRIBIDI_CONFIG_H
# define FRIBIDI "fribidi"
# define FRIBIDI_NAME "fribidi"
# define FRIBIDI_VERSION "unknown"
# define FRIBIDI_BUGREPORT "unknown"
# define FRIBIDI_INTERFACE_VERSION_STRING "unknown"
#else /* !DONT_HAVE_FRIBIDI_CONFIG_H */
# include "fribidi-config.h"
#endif /* !DONT_HAVE_FRIBIDI_CONFIG_H */






/* fribidi_debug_status - get current debug state
 *
 */
 int fribidi_debug_status (
  void
);

/* fribidi_set_debug - set debug state
 *
 */
 int
fribidi_set_debug (
  int state		/* new state to set */
);











#endif /* !_FRIBIDI_COMMON_H */
/* Editor directions:
 * vim:textwidth=78:tabstop=8:shiftwidth=2:autoindent:cindent
 */
