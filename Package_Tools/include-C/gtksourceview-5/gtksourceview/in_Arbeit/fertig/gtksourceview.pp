
unit gtksourceview;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourceview.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourceview.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgchar  = ^gchar;
Pgint  = ^gint;
PGtkSourceBackgroundPatternType  = ^GtkSourceBackgroundPatternType;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourceCompletion  = ^GtkSourceCompletion;
PGtkSourceGutter  = ^GtkSourceGutter;
PGtkSourceHover  = ^GtkSourceHover;
PGtkSourceIndenter  = ^GtkSourceIndenter;
PGtkSourceMarkAttributes  = ^GtkSourceMarkAttributes;
PGtkSourceSmartHomeEndType  = ^GtkSourceSmartHomeEndType;
PGtkSourceSnippet  = ^GtkSourceSnippet;
PGtkSourceSpaceDrawer  = ^GtkSourceSpaceDrawer;
PGtkSourceView  = ^GtkSourceView;
PGtkSourceViewClass  = ^GtkSourceViewClass;
PGtkSourceViewGutterPosition  = ^GtkSourceViewGutterPosition;
PGtkTextIter  = ^GtkTextIter;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
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
  }
{$include <gtk/gtk.h>}
{$include "gtksourcetypes.h"}

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_VIEW : longint; { return type might be wrong }

{*
 * GtkSourceViewGutterPosition:
 * @GTK_SOURCE_VIEW_GUTTER_POSITION_LINES: the gutter position of the lines
 * renderer
 * @GTK_SOURCE_VIEW_GUTTER_POSITION_MARKS: the gutter position of the marks
 * renderer
  }
type
  PGtkSourceViewGutterPosition = ^TGtkSourceViewGutterPosition;
  TGtkSourceViewGutterPosition =  Longint;
  Const
    GTK_SOURCE_VIEW_GUTTER_POSITION_LINES = -(30);
    GTK_SOURCE_VIEW_GUTTER_POSITION_MARKS = -(20);
;
{*
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
  }
type
  PGtkSourceSmartHomeEndType = ^TGtkSourceSmartHomeEndType;
  TGtkSourceSmartHomeEndType =  Longint;
  Const
    GTK_SOURCE_SMART_HOME_END_DISABLED = 0;
    GTK_SOURCE_SMART_HOME_END_BEFORE = 1;
    GTK_SOURCE_SMART_HOME_END_AFTER = 2;
    GTK_SOURCE_SMART_HOME_END_ALWAYS = 3;
;
{*
 * GtkSourceBackgroundPatternType:
 * @GTK_SOURCE_BACKGROUND_PATTERN_TYPE_NONE: no pattern
 * @GTK_SOURCE_BACKGROUND_PATTERN_TYPE_GRID: grid pattern
  }
type
  PGtkSourceBackgroundPatternType = ^TGtkSourceBackgroundPatternType;
  TGtkSourceBackgroundPatternType =  Longint;
  Const
    GTK_SOURCE_BACKGROUND_PATTERN_TYPE_NONE = 0;
    GTK_SOURCE_BACKGROUND_PATTERN_TYPE_GRID = 1;
;
{G_DECLARE_DERIVABLE_TYPE (GtkSourceView, gtk_source_view, GTK_SOURCE, VIEW, GtkTextView) }
(* Const before type ignored *)
{< private > }
type
  PGtkSourceViewClass = ^TGtkSourceViewClass;
  TGtkSourceViewClass = record
      parent_class : TGtkTextViewClass;
      line_mark_activated : procedure (view:PGtkSourceView; iter:PGtkTextIter; button:Tguint; state:TGdkModifierType; n_presses:Tgint);cdecl;
      show_completion : procedure (view:PGtkSourceView);cdecl;
      move_lines : procedure (view:PGtkSourceView; down:Tgboolean);cdecl;
      move_words : procedure (view:PGtkSourceView; step:Tgint);cdecl;
      push_snippet : procedure (view:PGtkSourceView; snippet:PGtkSourceSnippet; location:PGtkTextIter);cdecl;
      _reserved : array[0..19] of Tgpointer;
    end;


function gtk_source_view_new:PGtkWidget;cdecl;external;
function gtk_source_view_new_with_buffer(buffer:PGtkSourceBuffer):PGtkWidget;cdecl;external;
procedure gtk_source_view_set_show_line_numbers(view:PGtkSourceView; show:Tgboolean);cdecl;external;
function gtk_source_view_get_show_line_numbers(view:PGtkSourceView):Tgboolean;cdecl;external;
procedure gtk_source_view_set_tab_width(view:PGtkSourceView; width:Tguint);cdecl;external;
function gtk_source_view_get_tab_width(view:PGtkSourceView):Tguint;cdecl;external;
procedure gtk_source_view_set_indent_width(view:PGtkSourceView; width:Tgint);cdecl;external;
function gtk_source_view_get_indent_width(view:PGtkSourceView):Tgint;cdecl;external;
procedure gtk_source_view_set_auto_indent(view:PGtkSourceView; enable:Tgboolean);cdecl;external;
function gtk_source_view_get_auto_indent(view:PGtkSourceView):Tgboolean;cdecl;external;
procedure gtk_source_view_set_insert_spaces_instead_of_tabs(view:PGtkSourceView; enable:Tgboolean);cdecl;external;
function gtk_source_view_get_insert_spaces_instead_of_tabs(view:PGtkSourceView):Tgboolean;cdecl;external;
procedure gtk_source_view_set_indent_on_tab(view:PGtkSourceView; enable:Tgboolean);cdecl;external;
function gtk_source_view_get_indent_on_tab(view:PGtkSourceView):Tgboolean;cdecl;external;
procedure gtk_source_view_indent_lines(view:PGtkSourceView; start:PGtkTextIter; end:PGtkTextIter);cdecl;external;
procedure gtk_source_view_unindent_lines(view:PGtkSourceView; start:PGtkTextIter; end:PGtkTextIter);cdecl;external;
procedure gtk_source_view_set_highlight_current_line(view:PGtkSourceView; highlight:Tgboolean);cdecl;external;
function gtk_source_view_get_highlight_current_line(view:PGtkSourceView):Tgboolean;cdecl;external;
procedure gtk_source_view_set_show_right_margin(view:PGtkSourceView; show:Tgboolean);cdecl;external;
function gtk_source_view_get_show_right_margin(view:PGtkSourceView):Tgboolean;cdecl;external;
procedure gtk_source_view_set_right_margin_position(view:PGtkSourceView; pos:Tguint);cdecl;external;
function gtk_source_view_get_right_margin_position(view:PGtkSourceView):Tguint;cdecl;external;
procedure gtk_source_view_set_show_line_marks(view:PGtkSourceView; show:Tgboolean);cdecl;external;
function gtk_source_view_get_show_line_marks(view:PGtkSourceView):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_view_set_mark_attributes(view:PGtkSourceView; category:Pgchar; attributes:PGtkSourceMarkAttributes; priority:Tgint);cdecl;external;
(* Const before type ignored *)
function gtk_source_view_get_mark_attributes(view:PGtkSourceView; category:Pgchar; priority:Pgint):PGtkSourceMarkAttributes;cdecl;external;
procedure gtk_source_view_set_smart_backspace(view:PGtkSourceView; smart_backspace:Tgboolean);cdecl;external;
function gtk_source_view_get_smart_backspace(view:PGtkSourceView):Tgboolean;cdecl;external;
procedure gtk_source_view_set_smart_home_end(view:PGtkSourceView; smart_home_end:TGtkSourceSmartHomeEndType);cdecl;external;
function gtk_source_view_get_smart_home_end(view:PGtkSourceView):TGtkSourceSmartHomeEndType;cdecl;external;
procedure gtk_source_view_set_enable_snippets(view:PGtkSourceView; enable_snippets:Tgboolean);cdecl;external;
function gtk_source_view_get_enable_snippets(view:PGtkSourceView):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_source_view_get_visual_column(view:PGtkSourceView; iter:PGtkTextIter):Tguint;cdecl;external;
function gtk_source_view_get_completion(view:PGtkSourceView):PGtkSourceCompletion;cdecl;external;
function gtk_source_view_get_hover(view:PGtkSourceView):PGtkSourceHover;cdecl;external;
function gtk_source_view_get_indenter(view:PGtkSourceView):PGtkSourceIndenter;cdecl;external;
procedure gtk_source_view_set_indenter(view:PGtkSourceView; indenter:PGtkSourceIndenter);cdecl;external;
function gtk_source_view_get_gutter(view:PGtkSourceView; window_type:TGtkTextWindowType):PGtkSourceGutter;cdecl;external;
procedure gtk_source_view_set_background_pattern(view:PGtkSourceView; background_pattern:TGtkSourceBackgroundPatternType);cdecl;external;
function gtk_source_view_get_background_pattern(view:PGtkSourceView):TGtkSourceBackgroundPatternType;cdecl;external;
function gtk_source_view_get_space_drawer(view:PGtkSourceView):PGtkSourceSpaceDrawer;cdecl;external;
procedure gtk_source_view_push_snippet(view:PGtkSourceView; snippet:PGtkSourceSnippet; location:PGtkTextIter);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_VIEW : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_VIEW:=gtk_source_view_get_type;
  end;


end.
