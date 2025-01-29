/* -*- Mode: C; tab-width: 4; indent-tabs-mode: nil; c-basic-offset: 4 -*- */

/* Copyright (C) 2018-2023 Hans Petter Jansson
 *
 * This file is part of Chafa, a program that shows pictures on text terminals.
 *
 * Chafa is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chafa is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Chafa.  If not, see <http://www.gnu.org/licenses/>. */

#ifndef __CHAFA_CANVAS_H__
#define __CHAFA_CANVAS_H__

#if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)
# error "Only <chafa.h> can be included directly."
#endif

#include <chafa-term-info.h>



typedef struct ChafaCanvas ChafaCanvas;

extern
ChafaCanvas *chafa_canvas_new (const ChafaCanvasConfig *config);
extern
ChafaCanvas *chafa_canvas_new_similar (ChafaCanvas *orig);
extern
void chafa_canvas_ref (ChafaCanvas *canvas);
extern
void chafa_canvas_unref (ChafaCanvas *canvas);

extern
const ChafaCanvasConfig *chafa_canvas_peek_config (ChafaCanvas *canvas);

extern
void chafa_canvas_set_placement (ChafaCanvas *canvas, ChafaPlacement *placement);

extern
void chafa_canvas_draw_all_pixels (ChafaCanvas *canvas, ChafaPixelType src_pixel_type,
                                   const guint8 *src_pixels,
                                   gint src_width, gint src_height, gint src_rowstride);
extern
GString *chafa_canvas_print (ChafaCanvas *canvas, ChafaTermInfo *term_info);
extern
void chafa_canvas_print_rows (ChafaCanvas *canvas, ChafaTermInfo *term_info,
                              GString ***array_out, gint *array_len_out);
extern
gchar **chafa_canvas_print_rows_strv (ChafaCanvas *canvas, ChafaTermInfo *term_info);

extern
gunichar chafa_canvas_get_char_at (ChafaCanvas *canvas, gint x, gint y);
extern
gint chafa_canvas_set_char_at (ChafaCanvas *canvas, gint x, gint y, gunichar c);

extern
void chafa_canvas_get_colors_at (ChafaCanvas *canvas, gint x, gint y,
                                 gint *fg_out, gint *bg_out);
extern
void chafa_canvas_set_colors_at (ChafaCanvas *canvas, gint x, gint y,
                                 gint fg, gint bg);

extern
void chafa_canvas_get_raw_colors_at (ChafaCanvas *canvas, gint x, gint y,
                                     gint *fg_out, gint *bg_out);
extern
void chafa_canvas_set_raw_colors_at (ChafaCanvas *canvas, gint x, gint y,
                                     gint fg, gint bg);

CHAFA_DEPRECATED_IN_1_2
void chafa_canvas_set_contents_rgba8 (ChafaCanvas *canvas, const guint8 *src_pixels,
                                     gint src_width, gint src_height, gint src_rowstride);
CHAFA_DEPRECATED_IN_1_6
GString *chafa_canvas_build_ansi (ChafaCanvas *canvas);



#endif /* __CHAFA_CANVAS_H__ */
