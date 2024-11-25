/* Pango
 * pangofc-font.h: Base fontmap type for fontconfig-based backends
 *
 * Copyright (C) 2003 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef __PANGO_FC_FONT_H__
#define __PANGO_FC_FONT_H__

#include <pango/pango-glyph.h>
#include <pango/pango-font.h>
#include <pango/pango-glyph.h>

/* FreeType has undefined macros in its header */
#ifdef PANGO_COMPILATION
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wundef"
#endif

#include <ft2build.h>
#include FT_FREETYPE_H
#include <fontconfig/fontconfig.h>

#ifdef PANGO_COMPILATION
#pragma GCC diagnostic pop
#endif



#define PANGO_TYPE_FC_FONT              (pango_fc_font_get_type ())
#define PANGO_FC_FONT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_FC_FONT, PangoFcFont))
#define PANGO_IS_FC_FONT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_FC_FONT))

typedef struct _PangoFcFont      PangoFcFont;
typedef struct _PangoFcFontClass PangoFcFontClass;

#ifndef PANGO_DISABLE_DEPRECATED

/**
 * PangoFcFont:
 *
 * `PangoFcFont` is a base class for font implementations
 * using the Fontconfig and FreeType libraries.
 *
 * It is used in onjunction with [class@PangoFc.FontMap].
 * When deriving from this class, you need to implement all
 * of its virtual functions other than shutdown() along with
 * the get_glyph_extents() virtual function from `PangoFont`.
 */
struct _PangoFcFont
{
  PangoFont parent_instance;

  FcPattern *font_pattern;          /* fully resolved pattern */
  PangoFontMap *fontmap;            /* associated map */
  gpointer priv;                    /* used internally */
  PangoMatrix matrix;               /* unused */
  PangoFontDescription *description;

  GSList *metrics_by_lang;

  guint is_hinted : 1;
  guint is_transformed : 1;
};

#endif /* PANGO_DISABLE_DEPRECATED */

extern
GType      pango_fc_font_get_type (void) ;

extern
gboolean   pango_fc_font_has_char          (PangoFcFont      *font,
                                            gunichar          wc);
extern
guint      pango_fc_font_get_glyph         (PangoFcFont      *font,
                                            gunichar          wc);

extern
PangoLanguage **
           pango_fc_font_get_languages     (PangoFcFont      *font);

extern
FcPattern *pango_fc_font_get_pattern       (PangoFcFont      *font);

extern
PangoGlyph pango_fc_font_get_unknown_glyph (PangoFcFont      *font,
                                            gunichar          wc);
extern
void       pango_fc_font_kern_glyphs       (PangoFcFont      *font,
                                            PangoGlyphString *glyphs);

extern
FT_Face    pango_fc_font_lock_face         (PangoFcFont      *font);
extern
void       pango_fc_font_unlock_face       (PangoFcFont      *font);



#endif /* __PANGO_FC_FONT_H__ */
