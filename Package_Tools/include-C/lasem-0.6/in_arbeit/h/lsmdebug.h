/* Lasem
 *
 * Copyright © 2010-2012 Emmanuel Pacaud
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
 */

#ifndef LSM_DEBUG_H
#define LSM_DEBUG_H

#include <glib.h>



typedef enum {
	LSM_DEBUG_LEVEL_NONE,
	LSM_DEBUG_LEVEL_WARNING,
	LSM_DEBUG_LEVEL_DEBUG,
	LSM_DEBUG_LEVEL_LOG,
	LSM_DEBUG_LEVEL_COUNT
} LsmDebugLevel;

typedef struct _LsmDebugCategory LsmDebugCategory;

extern LsmDebugCategory lsm_debug_category_dom;
extern LsmDebugCategory lsm_debug_category_measure;
extern LsmDebugCategory lsm_debug_category_update;
extern LsmDebugCategory lsm_debug_category_render;
extern LsmDebugCategory lsm_debug_category_viewport;



void 		lsm_warning 			(LsmDebugCategory *category, const char *format, ...);
void 		lsm_debug 			(LsmDebugCategory *category, const char *format, ...);
void 		lsm_log 			(LsmDebugCategory *category, const char *format, ...);

gboolean	lsm_debug_check			(LsmDebugCategory *category, LsmDebugLevel level);

void		lsm_debug_enable		(const char *category_selection);



#endif
