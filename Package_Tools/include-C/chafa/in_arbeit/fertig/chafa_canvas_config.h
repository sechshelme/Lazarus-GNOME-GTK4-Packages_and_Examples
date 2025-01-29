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

#ifndef __CHAFA_CANVAS_CONFIG_H__
#define __CHAFA_CANVAS_CONFIG_H__

#if !defined (__CHAFA_H_INSIDE__) && !defined (CHAFA_COMPILATION)
# error "Only <chafa.h> can be included directly."
#endif

#include <chafa-symbol-map.h>



/* Color extractor */

typedef enum
{
    CHAFA_COLOR_EXTRACTOR_AVERAGE,
    CHAFA_COLOR_EXTRACTOR_MEDIAN,

    CHAFA_COLOR_EXTRACTOR_MAX
}
ChafaColorExtractor;

/* Color spaces */

typedef enum
{
    CHAFA_COLOR_SPACE_RGB,
    CHAFA_COLOR_SPACE_DIN99D,

    CHAFA_COLOR_SPACE_MAX
}
ChafaColorSpace;

/* Canvas modes */

typedef enum
{
    CHAFA_CANVAS_MODE_TRUECOLOR,
    CHAFA_CANVAS_MODE_INDEXED_256,
    CHAFA_CANVAS_MODE_INDEXED_240,
    CHAFA_CANVAS_MODE_INDEXED_16,
    CHAFA_CANVAS_MODE_FGBG_BGFG,
    CHAFA_CANVAS_MODE_FGBG,
    CHAFA_CANVAS_MODE_INDEXED_8,
    CHAFA_CANVAS_MODE_INDEXED_16_8,

    CHAFA_CANVAS_MODE_MAX
}
ChafaCanvasMode;

/* Dither modes */

typedef enum
{
    CHAFA_DITHER_MODE_NONE,
    CHAFA_DITHER_MODE_ORDERED,
    CHAFA_DITHER_MODE_DIFFUSION,

    CHAFA_DITHER_MODE_MAX
}
ChafaDitherMode;

/* Pixel modes */

typedef enum
{
    CHAFA_PIXEL_MODE_SYMBOLS,
    CHAFA_PIXEL_MODE_SIXELS,
    CHAFA_PIXEL_MODE_KITTY,
    CHAFA_PIXEL_MODE_ITERM2,

    CHAFA_PIXEL_MODE_MAX
}
ChafaPixelMode;

/* Sequence optimization flags. When enabled, these may produce more compact
 * output at the cost of reduced compatibility and increased CPU use. Output
 * quality is unaffected. */

typedef enum
{
    CHAFA_OPTIMIZATION_REUSE_ATTRIBUTES = (1 << 0),
    CHAFA_OPTIMIZATION_SKIP_CELLS = (1 << 1),
    CHAFA_OPTIMIZATION_REPEAT_CELLS = (1 << 2),

    CHAFA_OPTIMIZATION_NONE = 0,
    CHAFA_OPTIMIZATION_ALL = 0x7fffffff
}
ChafaOptimizations;

/* Passthrough modes */

typedef enum
{
    CHAFA_PASSTHROUGH_NONE,
    CHAFA_PASSTHROUGH_SCREEN,
    CHAFA_PASSTHROUGH_TMUX,

    CHAFA_PASSTHROUGH_MAX
}
ChafaPassthrough;

/* Canvas config */

typedef struct ChafaCanvasConfig ChafaCanvasConfig;

extern
ChafaCanvasConfig *chafa_canvas_config_new (void);
extern
ChafaCanvasConfig *chafa_canvas_config_copy (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_ref (ChafaCanvasConfig *config);
extern
void chafa_canvas_config_unref (ChafaCanvasConfig *config);

extern
void chafa_canvas_config_get_geometry (const ChafaCanvasConfig *config, gint *width_out, gint *height_out);
extern
void chafa_canvas_config_set_geometry (ChafaCanvasConfig *config, gint width, gint height);

extern
void chafa_canvas_config_get_cell_geometry (const ChafaCanvasConfig *config, gint *cell_width_out, gint *cell_height_out);
extern
void chafa_canvas_config_set_cell_geometry (ChafaCanvasConfig *config, gint cell_width, gint cell_height);

extern
ChafaCanvasMode chafa_canvas_config_get_canvas_mode (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_canvas_mode (ChafaCanvasConfig *config, ChafaCanvasMode mode);

extern
ChafaColorExtractor chafa_canvas_config_get_color_extractor (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_color_extractor (ChafaCanvasConfig *config, ChafaColorExtractor color_extractor);

extern
ChafaColorSpace chafa_canvas_config_get_color_space (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_color_space (ChafaCanvasConfig *config, ChafaColorSpace color_space);

extern
const ChafaSymbolMap *chafa_canvas_config_peek_symbol_map (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_symbol_map (ChafaCanvasConfig *config, const ChafaSymbolMap *symbol_map);

extern
const ChafaSymbolMap *chafa_canvas_config_peek_fill_symbol_map (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_fill_symbol_map (ChafaCanvasConfig *config, const ChafaSymbolMap *fill_symbol_map);

extern
gfloat chafa_canvas_config_get_transparency_threshold (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_transparency_threshold (ChafaCanvasConfig *config, gfloat alpha_threshold);

extern
guint32 chafa_canvas_config_get_fg_color (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_fg_color (ChafaCanvasConfig *config, guint32 fg_color_packed_rgb);

extern
guint32 chafa_canvas_config_get_bg_color (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_bg_color (ChafaCanvasConfig *config, guint32 bg_color_packed_rgb);

extern
gfloat chafa_canvas_config_get_work_factor (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_work_factor (ChafaCanvasConfig *config, gfloat work_factor);

extern
gboolean chafa_canvas_config_get_preprocessing_enabled (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_preprocessing_enabled (ChafaCanvasConfig *config, gboolean preprocessing_enabled);

extern
ChafaDitherMode chafa_canvas_config_get_dither_mode (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_dither_mode (ChafaCanvasConfig *config, ChafaDitherMode dither_mode);

extern
void chafa_canvas_config_get_dither_grain_size (const ChafaCanvasConfig *config, gint *width_out, gint *height_out);
extern
void chafa_canvas_config_set_dither_grain_size (ChafaCanvasConfig *config, gint width, gint height);

extern
gfloat chafa_canvas_config_get_dither_intensity (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_dither_intensity (ChafaCanvasConfig *config, gfloat intensity);

extern
ChafaPixelMode chafa_canvas_config_get_pixel_mode (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_pixel_mode (ChafaCanvasConfig *config, ChafaPixelMode pixel_mode);

extern
ChafaOptimizations chafa_canvas_config_get_optimizations (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_optimizations (ChafaCanvasConfig *config, ChafaOptimizations optimizations);

extern
gboolean chafa_canvas_config_get_fg_only_enabled (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_fg_only_enabled (ChafaCanvasConfig *config, gboolean fg_only_enabled);

extern
ChafaPassthrough chafa_canvas_config_get_passthrough (const ChafaCanvasConfig *config);
extern
void chafa_canvas_config_set_passthrough (ChafaCanvasConfig *config, ChafaPassthrough passthrough);



#endif /* __CHAFA_CANVAS_CONFIG_H__ */
