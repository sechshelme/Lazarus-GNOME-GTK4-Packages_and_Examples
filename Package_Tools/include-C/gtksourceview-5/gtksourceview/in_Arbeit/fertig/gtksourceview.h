/*
 * This file is part of GtkSourceView
 *
 * Copyright 2001 Mikael Hermansson <tyan@linux.se> and
 *                Chris Phelps <chicane@reninet.com>
 * Copyright 2003 Gustavo Giráldez and Paolo Maggi
 *
 * GtkSourceView is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * GtkSourceView is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
 */


#include <gtk/gtk.h>

#include "gtksourcetypes.h"



#define GTK_SOURCE_TYPE_VIEW (gtk_source_view_get_type())

/**
 * GtkSourceViewGutterPosition:
 * @GTK_SOURCE_VIEW_GUTTER_POSITION_LINES: the gutter position of the lines
 * renderer
 * @GTK_SOURCE_VIEW_GUTTER_POSITION_MARKS: the gutter position of the marks
 * renderer
 */
typedef enum _GtkSourceViewGutterPosition
{
	GTK_SOURCE_VIEW_GUTTER_POSITION_LINES = -30,
	GTK_SOURCE_VIEW_GUTTER_POSITION_MARKS = -20
} GtkSourceViewGutterPosition;

/**
 * GtkSourceSmartHomeEndType:
 * @GTK_SOURCE_SMART_HOME_END_DISABLED: smart-home-end disabled.
 * @GTK_SOURCE_SMART_HOME_END_BEFORE: move to the first/last
 * non-whitespace character on the first press of the HOME/END keys and
 * to the beginning/end of the line on the second press.
 * @GTK_SOURCE_SMART_HOME_END_AFTER: move to the beginning/end of the
 * line on the first press of the HOME/END keys and to the first/last
 * non-whitespace character on the second press.
 * @GTK_SOURCE_SMART_HOME_END_ALWAYS: always move to the first/last
 * non-whitespace character when the HOME/END keys are pressed.
 */
typedef enum _GtkSourceSmartHomeEndType
{
	GTK_SOURCE_SMART_HOME_END_DISABLED,
	GTK_SOURCE_SMART_HOME_END_BEFORE,
	GTK_SOURCE_SMART_HOME_END_AFTER,
	GTK_SOURCE_SMART_HOME_END_ALWAYS
} GtkSourceSmartHomeEndType;

/**
 * GtkSourceBackgroundPatternType:
 * @GTK_SOURCE_BACKGROUND_PATTERN_TYPE_NONE: no pattern
 * @GTK_SOURCE_BACKGROUND_PATTERN_TYPE_GRID: grid pattern
 */
typedef enum _GtkSourceBackgroundPatternType
{
	GTK_SOURCE_BACKGROUND_PATTERN_TYPE_NONE,
	GTK_SOURCE_BACKGROUND_PATTERN_TYPE_GRID
} GtkSourceBackgroundPatternType;

//G_DECLARE_DERIVABLE_TYPE (GtkSourceView, gtk_source_view, GTK_SOURCE, VIEW, GtkTextView)

struct _GtkSourceViewClass
{
	GtkTextViewClass parent_class;

	void (*line_mark_activated) (GtkSourceView     *view,
	                             const GtkTextIter *iter,
	                             guint              button,
	                             GdkModifierType    state,
	                             gint               n_presses);
	void (*show_completion)     (GtkSourceView     *view);
	void (*move_lines)          (GtkSourceView     *view,
	                             gboolean           down);
	void (*move_words)          (GtkSourceView     *view,
	                             gint               step);
	void (*push_snippet)        (GtkSourceView     *view,
	                             GtkSourceSnippet  *snippet,
	                             GtkTextIter       *location);

	/*< private >*/
	gpointer _reserved[20];
};

extern
GtkWidget                      *gtk_source_view_new                               (void);
extern
GtkWidget                      *gtk_source_view_new_with_buffer                   (GtkSourceBuffer                *buffer);
extern
void                            gtk_source_view_set_show_line_numbers             (GtkSourceView                  *view,
                                                                                   gboolean                        show);
extern
gboolean                        gtk_source_view_get_show_line_numbers             (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_tab_width                     (GtkSourceView                  *view,
                                                                                   guint                           width);
extern
guint                           gtk_source_view_get_tab_width                     (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_indent_width                  (GtkSourceView                  *view,
                                                                                   gint                            width);
extern
gint                            gtk_source_view_get_indent_width                  (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_auto_indent                   (GtkSourceView                  *view,
                                                                                   gboolean                        enable);
extern
gboolean                        gtk_source_view_get_auto_indent                   (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_insert_spaces_instead_of_tabs (GtkSourceView                  *view,
                                                                                   gboolean                        enable);
extern
gboolean                        gtk_source_view_get_insert_spaces_instead_of_tabs (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_indent_on_tab                 (GtkSourceView                  *view,
                                                                                   gboolean                        enable);
extern
gboolean                        gtk_source_view_get_indent_on_tab                 (GtkSourceView                  *view);
extern
void                            gtk_source_view_indent_lines                      (GtkSourceView                  *view,
                                                                                   GtkTextIter                    *start,
                                                                                   GtkTextIter                    *end);
extern
void                            gtk_source_view_unindent_lines                    (GtkSourceView                  *view,
                                                                                   GtkTextIter                    *start,
                                                                                   GtkTextIter                    *end);
extern
void                            gtk_source_view_set_highlight_current_line        (GtkSourceView                  *view,
                                                                                   gboolean                        highlight);
extern
gboolean                        gtk_source_view_get_highlight_current_line        (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_show_right_margin             (GtkSourceView                  *view,
                                                                                   gboolean                        show);
extern
gboolean                        gtk_source_view_get_show_right_margin             (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_right_margin_position         (GtkSourceView                  *view,
                                                                                   guint                           pos);
extern
guint                           gtk_source_view_get_right_margin_position         (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_show_line_marks               (GtkSourceView                  *view,
                                                                                   gboolean                        show);
extern
gboolean                        gtk_source_view_get_show_line_marks               (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_mark_attributes               (GtkSourceView                  *view,
                                                                                   const gchar                    *category,
                                                                                   GtkSourceMarkAttributes        *attributes,
                                                                                   gint                            priority);
extern
GtkSourceMarkAttributes        *gtk_source_view_get_mark_attributes               (GtkSourceView                  *view,
                                                                                   const gchar                    *category,
                                                                                   gint                           *priority);
extern
void                            gtk_source_view_set_smart_backspace               (GtkSourceView                  *view,
                                                                                   gboolean                        smart_backspace);
extern
gboolean                        gtk_source_view_get_smart_backspace               (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_smart_home_end                (GtkSourceView                  *view,
                                                                                   GtkSourceSmartHomeEndType       smart_home_end);
extern
GtkSourceSmartHomeEndType       gtk_source_view_get_smart_home_end                (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_enable_snippets               (GtkSourceView                  *view,
                                                                                   gboolean                        enable_snippets);
extern
gboolean                        gtk_source_view_get_enable_snippets               (GtkSourceView                  *view);
extern
guint                           gtk_source_view_get_visual_column                 (GtkSourceView                  *view,
                                                                                   const GtkTextIter              *iter);
extern
GtkSourceCompletion            *gtk_source_view_get_completion                    (GtkSourceView                  *view);
extern
GtkSourceHover                 *gtk_source_view_get_hover                         (GtkSourceView                  *view);
extern
GtkSourceIndenter              *gtk_source_view_get_indenter                      (GtkSourceView                  *view);
extern
void                            gtk_source_view_set_indenter                      (GtkSourceView                  *view,
                                                                                   GtkSourceIndenter              *indenter);
extern
GtkSourceGutter                *gtk_source_view_get_gutter                        (GtkSourceView                  *view,
                                                                                   GtkTextWindowType               window_type);
extern
void                            gtk_source_view_set_background_pattern            (GtkSourceView                  *view,
                                                                                   GtkSourceBackgroundPatternType  background_pattern);
extern
GtkSourceBackgroundPatternType  gtk_source_view_get_background_pattern            (GtkSourceView                  *view);
extern
GtkSourceSpaceDrawer           *gtk_source_view_get_space_drawer                  (GtkSourceView                  *view);
extern
void                            gtk_source_view_push_snippet                      (GtkSourceView                  *view,
                                                                                   GtkSourceSnippet               *snippet,
                                                                                   GtkTextIter                    *location);


