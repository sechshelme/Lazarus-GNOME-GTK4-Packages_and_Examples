/* Pango
 * pango-context.h: Rendering contexts
 *
 * Copyright (C) 2000 Red Hat Software
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

#ifndef __PANGO_CONTEXT_H__
#define __PANGO_CONTEXT_H__

#include <pango/pango-types.h>
#include <pango/pango-font.h>
#include <pango/pango-fontmap.h>
#include <pango/pango-attributes.h>
#include <pango/pango-direction.h>



typedef struct _PangoContextClass PangoContextClass;

#define PANGO_TYPE_CONTEXT              (pango_context_get_type ())
#define PANGO_CONTEXT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_CONTEXT, PangoContext))
#define PANGO_CONTEXT_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_CONTEXT, PangoContextClass))
#define PANGO_IS_CONTEXT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_CONTEXT))
#define PANGO_IS_CONTEXT_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_CONTEXT))
#define PANGO_CONTEXT_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_CONTEXT, PangoContextClass))


extern
GType                   pango_context_get_type                  (void) ;

extern
PangoContext *          pango_context_new                       (void);
extern
void                    pango_context_changed                   (PangoContext                 *context);
extern
void                    pango_context_set_font_map              (PangoContext                 *context,
                                                                 PangoFontMap                 *font_map);
extern
PangoFontMap *          pango_context_get_font_map              (PangoContext                 *context);
extern
guint                   pango_context_get_serial                (PangoContext                 *context);
extern
void                    pango_context_list_families             (PangoContext                 *context,
                                                                 PangoFontFamily            ***families,
                                                                 int                          *n_families);
extern
PangoFont *             pango_context_load_font                 (PangoContext                 *context,
                                                                 const PangoFontDescription   *desc);
extern
PangoFontset *          pango_context_load_fontset              (PangoContext                 *context,
                                                                 const PangoFontDescription   *desc,
                                                                 PangoLanguage                *language);

extern
PangoFontMetrics *      pango_context_get_metrics               (PangoContext                 *context,
                                                                 const PangoFontDescription   *desc,
                                                                 PangoLanguage                *language);

extern
void                    pango_context_set_font_description      (PangoContext                 *context,
                                                                 const PangoFontDescription   *desc);
extern
PangoFontDescription *  pango_context_get_font_description      (PangoContext                 *context);
extern
PangoLanguage *         pango_context_get_language              (PangoContext                 *context);
extern
void                    pango_context_set_language              (PangoContext                 *context,
                                                                 PangoLanguage                *language);
extern
void                    pango_context_set_base_dir              (PangoContext                 *context,
                                                                 PangoDirection                direction);
extern
PangoDirection          pango_context_get_base_dir              (PangoContext                 *context);
extern
void                    pango_context_set_base_gravity          (PangoContext                 *context,
                                                                 PangoGravity                  gravity);
extern
PangoGravity            pango_context_get_base_gravity          (PangoContext                 *context);
extern
PangoGravity            pango_context_get_gravity               (PangoContext                 *context);
extern
void                    pango_context_set_gravity_hint          (PangoContext                 *context,
                                                                 PangoGravityHint              hint);
extern
PangoGravityHint        pango_context_get_gravity_hint          (PangoContext                 *context);

extern
void                    pango_context_set_matrix                (PangoContext                 *context,
                                                                 const PangoMatrix            *matrix);
extern
const PangoMatrix *     pango_context_get_matrix                (PangoContext                 *context);

extern
void                    pango_context_set_round_glyph_positions (PangoContext                 *context,
                                                                 gboolean                      round_positions);
extern
gboolean                pango_context_get_round_glyph_positions (PangoContext                 *context);



#endif /* __PANGO_CONTEXT_H__ */
