/* Pango
 * pango-language.h: Language handling routines
 *
 * Copyright (C) 1999 Red Hat Software
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
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef __PANGO_LANGUAGE_H__
#define __PANGO_LANGUAGE_H__

#include <glib.h>
#include <glib-object.h>

#include <pango/pango-types.h>
#include <pango/pango-version-macros.h>
#include <pango/pango-script.h>



#define PANGO_TYPE_LANGUAGE (pango_language_get_type ())

extern
GType                   pango_language_get_type                 (void) ;

extern
PangoLanguage *         pango_language_get_default              (void) ;

extern
PangoLanguage **        pango_language_get_preferred            (void) ;

extern
PangoLanguage *         pango_language_from_string              (const char     *language);

extern
const char *            pango_language_to_string                (PangoLanguage  *language) ;

/* For back compat.  Will have to keep indefinitely. */
#define pango_language_to_string(language) ((const char *)language)

extern
const char *            pango_language_get_sample_string        (PangoLanguage  *language) ;

extern
gboolean                pango_language_matches                  (PangoLanguage  *language,
                                                                 const char     *range_list) ;

extern
gboolean                pango_language_includes_script          (PangoLanguage  *language,
                                                                 PangoScript     script) ;
extern
const PangoScript *     pango_language_get_scripts              (PangoLanguage  *language,
                                                                 int            *num_scripts);



#endif /* __PANGO_LANGUAGE_H__ */
