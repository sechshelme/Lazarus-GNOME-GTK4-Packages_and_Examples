/* Pango
 * pango-layout.h: High-level layout driver
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef __PANGO_LAYOUT_H__
#define __PANGO_LAYOUT_H__

#include <pango/pango-attributes.h>
#include <pango/pango-context.h>
#include <pango/pango-glyph-item.h>
#include <pango/pango-tabs.h>



typedef struct _PangoLayout      PangoLayout;
typedef struct _PangoLayoutClass PangoLayoutClass;
typedef struct _PangoLayoutLine  PangoLayoutLine;

/**
 * PangoLayoutRun:
 *
 * A `PangoLayoutRun` represents a single run within a `PangoLayoutLine`.
 *
 * It is simply an alternate name for [struct@Pango.GlyphItem].
 * See the [struct@Pango.GlyphItem] docs for details on the fields.
 */
typedef PangoGlyphItem PangoLayoutRun;

/**
 * PangoAlignment:
 * @PANGO_ALIGN_LEFT: Put all available space on the right
 * @PANGO_ALIGN_CENTER: Center the line within the available space
 * @PANGO_ALIGN_RIGHT: Put all available space on the left
 *
 * `PangoAlignment` describes how to align the lines of a `PangoLayout`
 * within the available space.
 *
 * If the `PangoLayout` is set to justify using [method@Pango.Layout.set_justify],
 * this only affects partial lines.
 *
 * See [method@Pango.Layout.set_auto_dir] for how text direction affects
 * the interpretation of `PangoAlignment` values.
 */
typedef enum {
  PANGO_ALIGN_LEFT,
  PANGO_ALIGN_CENTER,
  PANGO_ALIGN_RIGHT
} PangoAlignment;

/**
 * PangoWrapMode:
 * @PANGO_WRAP_WORD: wrap lines at word boundaries.
 * @PANGO_WRAP_CHAR: wrap lines at character boundaries.
 * @PANGO_WRAP_WORD_CHAR: wrap lines at word boundaries, but fall back to
 *   character boundaries if there is not enough space for a full word.
 *
 * `PangoWrapMode` describes how to wrap the lines of a `PangoLayout`
 * to the desired width.
 *
 * For @PANGO_WRAP_WORD, Pango uses break opportunities that are determined
 * by the Unicode line breaking algorithm. For @PANGO_WRAP_CHAR, Pango allows
 * breaking at grapheme boundaries that are determined by the Unicode text
 * segmentation algorithm.
 */
typedef enum {
  PANGO_WRAP_WORD,
  PANGO_WRAP_CHAR,
  PANGO_WRAP_WORD_CHAR
} PangoWrapMode;

/**
 * PangoEllipsizeMode:
 * @PANGO_ELLIPSIZE_NONE: No ellipsization
 * @PANGO_ELLIPSIZE_START: Omit characters at the start of the text
 * @PANGO_ELLIPSIZE_MIDDLE: Omit characters in the middle of the text
 * @PANGO_ELLIPSIZE_END: Omit characters at the end of the text
 *
 * `PangoEllipsizeMode` describes what sort of ellipsization
 * should be applied to text.
 *
 * In the ellipsization process characters are removed from the
 * text in order to make it fit to a given width and replaced
 * with an ellipsis.
 */
typedef enum {
  PANGO_ELLIPSIZE_NONE,
  PANGO_ELLIPSIZE_START,
  PANGO_ELLIPSIZE_MIDDLE,
  PANGO_ELLIPSIZE_END
} PangoEllipsizeMode;

/**
 * PangoLayoutLine:
 * @layout: (nullable): the layout this line belongs to, might be %NULL
 * @start_index: start of line as byte index into layout->text
 * @length: length of line in bytes
 * @runs: (nullable) (element-type Pango.LayoutRun): list of runs in the
 *   line, from left to right
 * @is_paragraph_start: #TRUE if this is the first line of the paragraph
 * @resolved_dir: #Resolved PangoDirection of line
 *
 * A `PangoLayoutLine` represents one of the lines resulting from laying
 * out a paragraph via `PangoLayout`.
 *
 * `PangoLayoutLine` structures are obtained by calling
 * [method@Pango.Layout.get_line] and are only valid until the text,
 * attributes, or settings of the parent `PangoLayout` are modified.
 */
struct _PangoLayoutLine
{
  PangoLayout *layout;
  gint         start_index;     /* start of line as byte index into layout->text */
  gint         length;		/* length of line in bytes */
  GSList      *runs;
  guint        is_paragraph_start : 1;  /* TRUE if this is the first line of the paragraph */
  guint        resolved_dir : 3;  /* Resolved PangoDirection of line */
};

#define PANGO_TYPE_LAYOUT              (pango_layout_get_type ())
#define PANGO_LAYOUT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_LAYOUT, PangoLayout))
#define PANGO_LAYOUT_CLASS(klass)      (G_TYPE_CHECK_CLASS_CAST ((klass), PANGO_TYPE_LAYOUT, PangoLayoutClass))
#define PANGO_IS_LAYOUT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_LAYOUT))
#define PANGO_IS_LAYOUT_CLASS(klass)   (G_TYPE_CHECK_CLASS_TYPE ((klass), PANGO_TYPE_LAYOUT))
#define PANGO_LAYOUT_GET_CLASS(obj)    (G_TYPE_INSTANCE_GET_CLASS ((obj), PANGO_TYPE_LAYOUT, PangoLayoutClass))

/* The PangoLayout and PangoLayoutClass structs are private; if you
 * need to create a subclass of these, file a bug.
 */

extern
GType        pango_layout_get_type       (void) ;
extern
PangoLayout *pango_layout_new            (PangoContext   *context);
extern
PangoLayout *pango_layout_copy           (PangoLayout    *src);

extern
PangoContext  *pango_layout_get_context    (PangoLayout    *layout);

extern
void           pango_layout_set_attributes (PangoLayout    *layout,
					    PangoAttrList  *attrs);
extern
PangoAttrList *pango_layout_get_attributes (PangoLayout    *layout);

extern
void           pango_layout_set_text       (PangoLayout    *layout,
					    const char     *text,
					    int             length);
extern
const char    *pango_layout_get_text       (PangoLayout    *layout);

extern
gint           pango_layout_get_character_count (PangoLayout *layout);

extern
void           pango_layout_set_markup     (PangoLayout    *layout,
					    const char     *markup,
					    int             length);

extern
void           pango_layout_set_markup_with_accel (PangoLayout    *layout,
						   const char     *markup,
						   int             length,
						   gunichar        accel_marker,
						   gunichar       *accel_char);

extern
void           pango_layout_set_font_description (PangoLayout                *layout,
						  const PangoFontDescription *desc);

extern
const PangoFontDescription *pango_layout_get_font_description (PangoLayout *layout);

extern
void           pango_layout_set_width            (PangoLayout                *layout,
						  int                         width);
extern
int            pango_layout_get_width            (PangoLayout                *layout);
extern
void           pango_layout_set_height           (PangoLayout                *layout,
						  int                         height);
extern
int            pango_layout_get_height           (PangoLayout                *layout);
extern
void           pango_layout_set_wrap             (PangoLayout                *layout,
						  PangoWrapMode               wrap);
extern
PangoWrapMode  pango_layout_get_wrap             (PangoLayout                *layout);
extern
gboolean       pango_layout_is_wrapped           (PangoLayout                *layout);
extern
void           pango_layout_set_indent           (PangoLayout                *layout,
						  int                         indent);
extern
int            pango_layout_get_indent           (PangoLayout                *layout);
extern
void           pango_layout_set_spacing          (PangoLayout                *layout,
						  int                         spacing);
extern
int            pango_layout_get_spacing          (PangoLayout                *layout);
extern
void           pango_layout_set_line_spacing     (PangoLayout                *layout,
                                                  float                       factor);
extern
float          pango_layout_get_line_spacing     (PangoLayout                *layout);
extern
void           pango_layout_set_justify          (PangoLayout                *layout,
                                                  gboolean                    justify);
extern
gboolean       pango_layout_get_justify          (PangoLayout                *layout);
extern
void           pango_layout_set_justify_last_line (PangoLayout                *layout,
                                                   gboolean                    justify);
extern
gboolean       pango_layout_get_justify_last_line (PangoLayout                *layout);
extern
void           pango_layout_set_auto_dir         (PangoLayout                *layout,
						  gboolean                    auto_dir);
extern
gboolean       pango_layout_get_auto_dir         (PangoLayout                *layout);
extern
void           pango_layout_set_alignment        (PangoLayout                *layout,
						  PangoAlignment              alignment);
extern
PangoAlignment pango_layout_get_alignment        (PangoLayout                *layout);

extern
void           pango_layout_set_tabs             (PangoLayout                *layout,
						  PangoTabArray              *tabs);
extern
PangoTabArray* pango_layout_get_tabs             (PangoLayout                *layout);

extern
void           pango_layout_set_single_paragraph_mode (PangoLayout                *layout,
						       gboolean                    setting);
extern
gboolean       pango_layout_get_single_paragraph_mode (PangoLayout                *layout);

extern
void               pango_layout_set_ellipsize (PangoLayout        *layout,
					       PangoEllipsizeMode  ellipsize);
extern
PangoEllipsizeMode pango_layout_get_ellipsize (PangoLayout        *layout);
extern
gboolean           pango_layout_is_ellipsized (PangoLayout        *layout);

extern
int      pango_layout_get_unknown_glyphs_count (PangoLayout    *layout);

extern
PangoDirection pango_layout_get_direction (PangoLayout *layout,
                                           int          index);

extern
void     pango_layout_context_changed (PangoLayout    *layout);
extern
guint    pango_layout_get_serial      (PangoLayout    *layout);

extern
void     pango_layout_get_log_attrs (PangoLayout    *layout,
				     PangoLogAttr  **attrs,
				     gint           *n_attrs);

extern
const PangoLogAttr *pango_layout_get_log_attrs_readonly (PangoLayout *layout,
							 gint        *n_attrs);

extern
void     pango_layout_index_to_pos         (PangoLayout    *layout,
					    int             index_,
					    PangoRectangle *pos);
extern
void     pango_layout_index_to_line_x      (PangoLayout    *layout,
					    int             index_,
					    gboolean        trailing,
					    int            *line,
					    int            *x_pos);
extern
void     pango_layout_get_cursor_pos       (PangoLayout    *layout,
					    int             index_,
					    PangoRectangle *strong_pos,
					    PangoRectangle *weak_pos);

extern
void     pango_layout_get_caret_pos        (PangoLayout    *layout,
                                            int             index_,
                                            PangoRectangle *strong_pos,
                                            PangoRectangle *weak_pos);

extern
void     pango_layout_move_cursor_visually (PangoLayout    *layout,
					    gboolean        strong,
					    int             old_index,
					    int             old_trailing,
					    int             direction,
					    int            *new_index,
					    int            *new_trailing);
extern
gboolean pango_layout_xy_to_index          (PangoLayout    *layout,
					    int             x,
					    int             y,
					    int            *index_,
					    int            *trailing);
extern
void     pango_layout_get_extents          (PangoLayout    *layout,
					    PangoRectangle *ink_rect,
					    PangoRectangle *logical_rect);
extern
void     pango_layout_get_pixel_extents    (PangoLayout    *layout,
					    PangoRectangle *ink_rect,
					    PangoRectangle *logical_rect);
extern
void     pango_layout_get_size             (PangoLayout    *layout,
					    int            *width,
					    int            *height);
extern
void     pango_layout_get_pixel_size       (PangoLayout    *layout,
					    int            *width,
					    int            *height);
extern
int      pango_layout_get_baseline         (PangoLayout    *layout);

extern
int              pango_layout_get_line_count       (PangoLayout    *layout);
extern
PangoLayoutLine *pango_layout_get_line             (PangoLayout    *layout,
						    int             line);
extern
PangoLayoutLine *pango_layout_get_line_readonly    (PangoLayout    *layout,
						    int             line);
extern
GSList *         pango_layout_get_lines            (PangoLayout    *layout);
extern
GSList *         pango_layout_get_lines_readonly   (PangoLayout    *layout);

/**
 * PangoLayoutSerializeFlags:
 * @PANGO_LAYOUT_SERIALIZE_DEFAULT: Default behavior
 * @PANGO_LAYOUT_SERIALIZE_CONTEXT: Include context information
 * @PANGO_LAYOUT_SERIALIZE_OUTPUT: Include information about the formatted output
 *
 * Flags that influence the behavior of [method@Pango.Layout.serialize].
 *
 * New members may be added to this enumeration over time.
 *
 * Since: 1.50
 */
typedef enum {
  PANGO_LAYOUT_SERIALIZE_DEFAULT = 0,
  PANGO_LAYOUT_SERIALIZE_CONTEXT = 1 << 0,
  PANGO_LAYOUT_SERIALIZE_OUTPUT = 1 << 1,
} PangoLayoutSerializeFlags;

extern
GBytes *        pango_layout_serialize             (PangoLayout                *layout,
                                                    PangoLayoutSerializeFlags   flags);

extern
gboolean        pango_layout_write_to_file         (PangoLayout                 *layout,
                                                    PangoLayoutSerializeFlags   flags,

                                                    const char                  *filename,
                                                    GError                     **error);

#define PANGO_LAYOUT_DESERIALIZE_ERROR (pango_layout_deserialize_error_quark ())

/**
 * PangoLayoutDeserializeError:
 * @PANGO_LAYOUT_DESERIALIZE_INVALID: Unspecified error
 * @PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE: A JSon value could not be
 *   interpreted
 * @PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE: A required JSon member was
 *   not found
 *
 * Errors that can be returned by [func@Pango.Layout.deserialize].
 *
 * Since: 1.50
 */
typedef enum {
  PANGO_LAYOUT_DESERIALIZE_INVALID,
  PANGO_LAYOUT_DESERIALIZE_INVALID_VALUE,
  PANGO_LAYOUT_DESERIALIZE_MISSING_VALUE,
} PangoLayoutDeserializeError;

extern
GQuark          pango_layout_deserialize_error_quark (void);

/**
 * PangoLayoutDeserializeFlags:
 * @PANGO_LAYOUT_DESERIALIZE_DEFAULT: Default behavior
 * @PANGO_LAYOUT_DESERIALIZE_CONTEXT: Apply context information
 *   from the serialization to the `PangoContext`
 *
 * Flags that influence the behavior of [func@Pango.Layout.deserialize].
 *
 * New members may be added to this enumeration over time.
 *
 * Since: 1.50
 */
typedef enum {
  PANGO_LAYOUT_DESERIALIZE_DEFAULT = 0,
  PANGO_LAYOUT_DESERIALIZE_CONTEXT = 1 << 0,
} PangoLayoutDeserializeFlags;

extern
PangoLayout *   pango_layout_deserialize           (PangoContext                 *context,
                                                    GBytes                       *bytes,
                                                    PangoLayoutDeserializeFlags   flags,
                                                    GError                      **error);


#define PANGO_TYPE_LAYOUT_LINE (pango_layout_line_get_type ())

extern
GType    pango_layout_line_get_type     (void) ;

extern
PangoLayoutLine *pango_layout_line_ref   (PangoLayoutLine *line);
extern
void             pango_layout_line_unref (PangoLayoutLine *line);

extern
int      pango_layout_line_get_start_index (PangoLayoutLine *line);
extern
int      pango_layout_line_get_length      (PangoLayoutLine *line);
extern
gboolean pango_layout_line_is_paragraph_start (PangoLayoutLine *line);
extern
PangoDirection pango_layout_line_get_resolved_direction (PangoLayoutLine *line);

extern
gboolean pango_layout_line_x_to_index   (PangoLayoutLine  *line,
					 int               x_pos,
					 int              *index_,
					 int              *trailing);
extern
void     pango_layout_line_index_to_x   (PangoLayoutLine  *line,
					 int               index_,
					 gboolean          trailing,
					 int              *x_pos);
extern
void     pango_layout_line_get_x_ranges (PangoLayoutLine  *line,
					 int               start_index,
					 int               end_index,
					 int             **ranges,
					 int              *n_ranges);
extern
void     pango_layout_line_get_extents  (PangoLayoutLine  *line,
					 PangoRectangle   *ink_rect,
					 PangoRectangle   *logical_rect);
extern
void     pango_layout_line_get_height   (PangoLayoutLine  *line,
					 int              *height);

extern
void     pango_layout_line_get_pixel_extents (PangoLayoutLine *layout_line,
					      PangoRectangle  *ink_rect,
					      PangoRectangle  *logical_rect);

typedef struct _PangoLayoutIter PangoLayoutIter;

#define PANGO_TYPE_LAYOUT_ITER         (pango_layout_iter_get_type ())

extern
GType            pango_layout_iter_get_type (void) ;

extern
PangoLayoutIter *pango_layout_get_iter  (PangoLayout     *layout);
extern
PangoLayoutIter *pango_layout_iter_copy (PangoLayoutIter *iter);
extern
void             pango_layout_iter_free (PangoLayoutIter *iter);

extern
int              pango_layout_iter_get_index  (PangoLayoutIter *iter);
extern
PangoLayoutRun  *pango_layout_iter_get_run    (PangoLayoutIter *iter);
extern
PangoLayoutRun  *pango_layout_iter_get_run_readonly   (PangoLayoutIter *iter);
extern
PangoLayoutLine *pango_layout_iter_get_line   (PangoLayoutIter *iter);
extern
PangoLayoutLine *pango_layout_iter_get_line_readonly  (PangoLayoutIter *iter);
extern
gboolean         pango_layout_iter_at_last_line (PangoLayoutIter *iter);
extern
PangoLayout     *pango_layout_iter_get_layout (PangoLayoutIter *iter);

extern
gboolean pango_layout_iter_next_char    (PangoLayoutIter *iter);
extern
gboolean pango_layout_iter_next_cluster (PangoLayoutIter *iter);
extern
gboolean pango_layout_iter_next_run     (PangoLayoutIter *iter);
extern
gboolean pango_layout_iter_next_line    (PangoLayoutIter *iter);

extern
void pango_layout_iter_get_char_extents    (PangoLayoutIter *iter,
					    PangoRectangle  *logical_rect);
extern
void pango_layout_iter_get_cluster_extents (PangoLayoutIter *iter,
					    PangoRectangle  *ink_rect,
					    PangoRectangle  *logical_rect);
extern
void pango_layout_iter_get_run_extents     (PangoLayoutIter *iter,
					    PangoRectangle  *ink_rect,
					    PangoRectangle  *logical_rect);
extern
void pango_layout_iter_get_line_extents    (PangoLayoutIter *iter,
					    PangoRectangle  *ink_rect,
					    PangoRectangle  *logical_rect);
/* All the yranges meet, unlike the logical_rect's (i.e. the yranges
 * assign between-line spacing to the nearest line)
 */
extern
void pango_layout_iter_get_line_yrange     (PangoLayoutIter *iter,
					    int             *y0_,
					    int             *y1_);
extern
void pango_layout_iter_get_layout_extents  (PangoLayoutIter *iter,
					    PangoRectangle  *ink_rect,
					    PangoRectangle  *logical_rect);
extern
int  pango_layout_iter_get_baseline        (PangoLayoutIter *iter);
extern
int  pango_layout_iter_get_run_baseline    (PangoLayoutIter *iter);




#endif /* __PANGO_LAYOUT_H__ */

