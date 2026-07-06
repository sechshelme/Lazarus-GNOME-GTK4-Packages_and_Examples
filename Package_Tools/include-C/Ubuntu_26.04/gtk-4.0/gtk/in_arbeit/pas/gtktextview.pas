unit gtktextview;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * gtktextview.h Copyright (C) 2000 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
{
 * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
 * file for a list of people on the GTK+ Team.  See the ChangeLog
 * files for a list of changes.  These files are distributed with
 * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}
{$include <gtk/gtkimcontext.h>}
{$include <gtk/gtktextbuffer.h>}

{*
 * GtkTextWindowType:
 * @GTK_TEXT_WINDOW_WIDGET: Window that floats over scrolling areas.
 * @GTK_TEXT_WINDOW_TEXT: Scrollable text window.
 * @GTK_TEXT_WINDOW_LEFT: Left side border window.
 * @GTK_TEXT_WINDOW_RIGHT: Right side border window.
 * @GTK_TEXT_WINDOW_TOP: Top border window.
 * @GTK_TEXT_WINDOW_BOTTOM: Bottom border window.
 *
 * Used to reference the parts of `GtkTextView`.
  }
type
  PGtkTextWindowType = ^TGtkTextWindowType;
  TGtkTextWindowType =  Longint;
  Const
    GTK_TEXT_WINDOW_WIDGET = 1;
    GTK_TEXT_WINDOW_TEXT = 2;
    GTK_TEXT_WINDOW_LEFT = 3;
    GTK_TEXT_WINDOW_RIGHT = 4;
    GTK_TEXT_WINDOW_TOP = 5;
    GTK_TEXT_WINDOW_BOTTOM = 6;
;
{*
 * GtkTextViewLayer:
 * @GTK_TEXT_VIEW_LAYER_BELOW_TEXT: The layer rendered below the text (but above the background).
 * @GTK_TEXT_VIEW_LAYER_ABOVE_TEXT: The layer rendered above the text.
 *
 * Used to reference the layers of `GtkTextView` for the purpose of customized
 * drawing with the ::snapshot_layer vfunc.
  }
type
  PGtkTextViewLayer = ^TGtkTextViewLayer;
  TGtkTextViewLayer =  Longint;
  Const
    GTK_TEXT_VIEW_LAYER_BELOW_TEXT = 0;
    GTK_TEXT_VIEW_LAYER_ABOVE_TEXT = 1;
;
{*
 * GtkTextExtendSelection:
 * @GTK_TEXT_EXTEND_SELECTION_WORD: Selects the current word. It is triggered by
 *   a double-click for example.
 * @GTK_TEXT_EXTEND_SELECTION_LINE: Selects the current line. It is triggered by
 *   a triple-click for example.
 *
 * Granularity types that extend the text selection. Use the
 * `GtkTextView::extend-selection` signal to customize the selection.
  }
type
  PGtkTextExtendSelection = ^TGtkTextExtendSelection;
  TGtkTextExtendSelection =  Longint;
  Const
    GTK_TEXT_EXTEND_SELECTION_WORD = 0;
    GTK_TEXT_EXTEND_SELECTION_LINE = 1;
;
{*
 * GTK_TEXT_VIEW_PRIORITY_VALIDATE: (value 125)
 *
 * The priority at which the text view validates onscreen lines
 * in an idle job in the background.
  }
  GTK_TEXT_VIEW_PRIORITY_VALIDATE = GDK_PRIORITY_REDRAW+5;  
type
{< private > }
  PGtkTextView = ^TGtkTextView;
  TGtkTextView = record
      parent_instance : TGtkWidget;
      priv : PGtkTextViewPrivate;
    end;

{*
 * GtkTextViewClass:
 * @parent_class: The object class structure needs to be the first
 * @move_cursor: The class handler for the `GtkTextView::move-cursor`
 *   keybinding signal.
 * @set_anchor: The class handler for the `GtkTextView::set-anchor`
 *   keybinding signal.
 * @insert_at_cursor: The class handler for the `GtkTextView::insert-at-cursor`
 *   keybinding signal.
 * @delete_from_cursor: The class handler for the `GtkTextView::delete-from-cursor`
 *   keybinding signal.
 * @backspace: The class handler for the `GtkTextView::backspace`
 *   keybinding signal.
 * @cut_clipboard: The class handler for the `GtkTextView::cut-clipboard`
 *   keybinding signal
 * @copy_clipboard: The class handler for the `GtkTextView::copy-clipboard`
 *   keybinding signal.
 * @paste_clipboard: The class handler for the `GtkTextView::paste-clipboard`
 *   keybinding signal.
 * @toggle_overwrite: The class handler for the `GtkTextView::toggle-overwrite`
 *   keybinding signal.
 * @create_buffer: The create_buffer vfunc is called to create a `GtkTextBuffer`
 *   for the text view. The default implementation is to just call
 *   gtk_text_buffer_new().
 * @snapshot_layer: The snapshot_layer vfunc is called before and after the text
 *   view is drawing its own text. Applications can override this vfunc
 *   in a subclass to draw customized content underneath or above the
 *   text. In the %GTK_TEXT_VIEW_LAYER_BELOW_TEXT and %GTK_TEXT_VIEW_LAYER_ABOVE_TEXT
 *   layers the drawing is done in the buffer coordinate space.
 * @extend_selection: The class handler for the `GtkTextView::extend-selection` signal.
 * @insert_emoji: The class handler for the `GtkTextView::insert-emoji` signal.
  }
{< public > }
{< private > }
  PGtkTextViewClass = ^TGtkTextViewClass;
  TGtkTextViewClass = record
      parent_class : TGtkWidgetClass;
      move_cursor : procedure (text_view:PGtkTextView; step:TGtkMovementStep; count:longint; extend_selection:Tgboolean);cdecl;
      set_anchor : procedure (text_view:PGtkTextView);cdecl;
      insert_at_cursor : procedure (text_view:PGtkTextView; str:Pchar);cdecl;
      delete_from_cursor : procedure (text_view:PGtkTextView; _type:TGtkDeleteType; count:longint);cdecl;
      backspace : procedure (text_view:PGtkTextView);cdecl;
      cut_clipboard : procedure (text_view:PGtkTextView);cdecl;
      copy_clipboard : procedure (text_view:PGtkTextView);cdecl;
      paste_clipboard : procedure (text_view:PGtkTextView);cdecl;
      toggle_overwrite : procedure (text_view:PGtkTextView);cdecl;
      create_buffer : function (text_view:PGtkTextView):PGtkTextBuffer;cdecl;
      snapshot_layer : procedure (text_view:PGtkTextView; layer:TGtkTextViewLayer; snapshot:PGtkSnapshot);cdecl;
      extend_selection : function (text_view:PGtkTextView; granularity:TGtkTextExtendSelection; location:PGtkTextIter; start:PGtkTextIter; end:PGtkTextIter):Tgboolean;cdecl;
      insert_emoji : procedure (text_view:PGtkTextView);cdecl;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_text_view_get_type:TGType;cdecl;external libgtk4;
function gtk_text_view_new:PGtkWidget;cdecl;external libgtk4;
function gtk_text_view_new_with_buffer(buffer:PGtkTextBuffer):PGtkWidget;cdecl;external libgtk4;
procedure gtk_text_view_set_buffer(text_view:PGtkTextView; buffer:PGtkTextBuffer);cdecl;external libgtk4;
function gtk_text_view_get_buffer(text_view:PGtkTextView):PGtkTextBuffer;cdecl;external libgtk4;
function gtk_text_view_scroll_to_iter(text_view:PGtkTextView; iter:PGtkTextIter; within_margin:Tdouble; use_align:Tgboolean; xalign:Tdouble; 
           yalign:Tdouble):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_scroll_to_mark(text_view:PGtkTextView; mark:PGtkTextMark; within_margin:Tdouble; use_align:Tgboolean; xalign:Tdouble; 
            yalign:Tdouble);cdecl;external libgtk4;
procedure gtk_text_view_scroll_mark_onscreen(text_view:PGtkTextView; mark:PGtkTextMark);cdecl;external libgtk4;
function gtk_text_view_move_mark_onscreen(text_view:PGtkTextView; mark:PGtkTextMark):Tgboolean;cdecl;external libgtk4;
function gtk_text_view_place_cursor_onscreen(text_view:PGtkTextView):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_get_visible_rect(text_view:PGtkTextView; visible_rect:PGdkRectangle);cdecl;external libgtk4;
procedure gtk_text_view_get_visible_offset(text_view:PGtkTextView; x_offset:Pdouble; y_offset:Pdouble);cdecl;external libgtk4;
procedure gtk_text_view_set_cursor_visible(text_view:PGtkTextView; setting:Tgboolean);cdecl;external libgtk4;
function gtk_text_view_get_cursor_visible(text_view:PGtkTextView):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_reset_cursor_blink(text_view:PGtkTextView);cdecl;external libgtk4;
procedure gtk_text_view_get_cursor_locations(text_view:PGtkTextView; iter:PGtkTextIter; strong:PGdkRectangle; weak:PGdkRectangle);cdecl;external libgtk4;
procedure gtk_text_view_get_iter_location(text_view:PGtkTextView; iter:PGtkTextIter; location:PGdkRectangle);cdecl;external libgtk4;
function gtk_text_view_get_iter_at_location(text_view:PGtkTextView; iter:PGtkTextIter; x:longint; y:longint):Tgboolean;cdecl;external libgtk4;
function gtk_text_view_get_iter_at_position(text_view:PGtkTextView; iter:PGtkTextIter; trailing:Plongint; x:longint; y:longint):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_get_line_yrange(text_view:PGtkTextView; iter:PGtkTextIter; y:Plongint; height:Plongint);cdecl;external libgtk4;
procedure gtk_text_view_get_line_at_y(text_view:PGtkTextView; target_iter:PGtkTextIter; y:longint; line_top:Plongint);cdecl;external libgtk4;
procedure gtk_text_view_buffer_to_window_coords(text_view:PGtkTextView; win:TGtkTextWindowType; buffer_x:longint; buffer_y:longint; window_x:Plongint; 
            window_y:Plongint);cdecl;external libgtk4;
procedure gtk_text_view_window_to_buffer_coords(text_view:PGtkTextView; win:TGtkTextWindowType; window_x:longint; window_y:longint; buffer_x:Plongint; 
            buffer_y:Plongint);cdecl;external libgtk4;
function gtk_text_view_forward_display_line(text_view:PGtkTextView; iter:PGtkTextIter):Tgboolean;cdecl;external libgtk4;
function gtk_text_view_backward_display_line(text_view:PGtkTextView; iter:PGtkTextIter):Tgboolean;cdecl;external libgtk4;
function gtk_text_view_forward_display_line_end(text_view:PGtkTextView; iter:PGtkTextIter):Tgboolean;cdecl;external libgtk4;
function gtk_text_view_backward_display_line_start(text_view:PGtkTextView; iter:PGtkTextIter):Tgboolean;cdecl;external libgtk4;
function gtk_text_view_starts_display_line(text_view:PGtkTextView; iter:PGtkTextIter):Tgboolean;cdecl;external libgtk4;
function gtk_text_view_move_visually(text_view:PGtkTextView; iter:PGtkTextIter; count:longint):Tgboolean;cdecl;external libgtk4;
function gtk_text_view_im_context_filter_keypress(text_view:PGtkTextView; event:PGdkEvent):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_reset_im_context(text_view:PGtkTextView);cdecl;external libgtk4;
{ Adding child widgets  }
function gtk_text_view_get_gutter(text_view:PGtkTextView; win:TGtkTextWindowType):PGtkWidget;cdecl;external libgtk4;
procedure gtk_text_view_set_gutter(text_view:PGtkTextView; win:TGtkTextWindowType; widget:PGtkWidget);cdecl;external libgtk4;
procedure gtk_text_view_add_child_at_anchor(text_view:PGtkTextView; child:PGtkWidget; anchor:PGtkTextChildAnchor);cdecl;external libgtk4;
procedure gtk_text_view_add_overlay(text_view:PGtkTextView; child:PGtkWidget; xpos:longint; ypos:longint);cdecl;external libgtk4;
procedure gtk_text_view_move_overlay(text_view:PGtkTextView; child:PGtkWidget; xpos:longint; ypos:longint);cdecl;external libgtk4;
procedure gtk_text_view_remove(text_view:PGtkTextView; child:PGtkWidget);cdecl;external libgtk4;
{ Default style settings (fallbacks if no tag affects the property)  }
procedure gtk_text_view_set_wrap_mode(text_view:PGtkTextView; wrap_mode:TGtkWrapMode);cdecl;external libgtk4;
function gtk_text_view_get_wrap_mode(text_view:PGtkTextView):TGtkWrapMode;cdecl;external libgtk4;
procedure gtk_text_view_set_editable(text_view:PGtkTextView; setting:Tgboolean);cdecl;external libgtk4;
function gtk_text_view_get_editable(text_view:PGtkTextView):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_set_overwrite(text_view:PGtkTextView; overwrite:Tgboolean);cdecl;external libgtk4;
function gtk_text_view_get_overwrite(text_view:PGtkTextView):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_set_accepts_tab(text_view:PGtkTextView; accepts_tab:Tgboolean);cdecl;external libgtk4;
function gtk_text_view_get_accepts_tab(text_view:PGtkTextView):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_set_pixels_above_lines(text_view:PGtkTextView; pixels_above_lines:longint);cdecl;external libgtk4;
function gtk_text_view_get_pixels_above_lines(text_view:PGtkTextView):longint;cdecl;external libgtk4;
procedure gtk_text_view_set_pixels_below_lines(text_view:PGtkTextView; pixels_below_lines:longint);cdecl;external libgtk4;
function gtk_text_view_get_pixels_below_lines(text_view:PGtkTextView):longint;cdecl;external libgtk4;
procedure gtk_text_view_set_pixels_inside_wrap(text_view:PGtkTextView; pixels_inside_wrap:longint);cdecl;external libgtk4;
function gtk_text_view_get_pixels_inside_wrap(text_view:PGtkTextView):longint;cdecl;external libgtk4;
procedure gtk_text_view_set_justification(text_view:PGtkTextView; justification:TGtkJustification);cdecl;external libgtk4;
function gtk_text_view_get_justification(text_view:PGtkTextView):TGtkJustification;cdecl;external libgtk4;
procedure gtk_text_view_set_left_margin(text_view:PGtkTextView; left_margin:longint);cdecl;external libgtk4;
function gtk_text_view_get_left_margin(text_view:PGtkTextView):longint;cdecl;external libgtk4;
procedure gtk_text_view_set_right_margin(text_view:PGtkTextView; right_margin:longint);cdecl;external libgtk4;
function gtk_text_view_get_right_margin(text_view:PGtkTextView):longint;cdecl;external libgtk4;
procedure gtk_text_view_set_top_margin(text_view:PGtkTextView; top_margin:longint);cdecl;external libgtk4;
function gtk_text_view_get_top_margin(text_view:PGtkTextView):longint;cdecl;external libgtk4;
procedure gtk_text_view_set_bottom_margin(text_view:PGtkTextView; bottom_margin:longint);cdecl;external libgtk4;
function gtk_text_view_get_bottom_margin(text_view:PGtkTextView):longint;cdecl;external libgtk4;
procedure gtk_text_view_set_indent(text_view:PGtkTextView; indent:longint);cdecl;external libgtk4;
function gtk_text_view_get_indent(text_view:PGtkTextView):longint;cdecl;external libgtk4;
procedure gtk_text_view_set_tabs(text_view:PGtkTextView; tabs:PPangoTabArray);cdecl;external libgtk4;
function gtk_text_view_get_tabs(text_view:PGtkTextView):PPangoTabArray;cdecl;external libgtk4;
procedure gtk_text_view_set_input_purpose(text_view:PGtkTextView; purpose:TGtkInputPurpose);cdecl;external libgtk4;
function gtk_text_view_get_input_purpose(text_view:PGtkTextView):TGtkInputPurpose;cdecl;external libgtk4;
procedure gtk_text_view_set_input_hints(text_view:PGtkTextView; hints:TGtkInputHints);cdecl;external libgtk4;
function gtk_text_view_get_input_hints(text_view:PGtkTextView):TGtkInputHints;cdecl;external libgtk4;
procedure gtk_text_view_set_monospace(text_view:PGtkTextView; monospace:Tgboolean);cdecl;external libgtk4;
function gtk_text_view_get_monospace(text_view:PGtkTextView):Tgboolean;cdecl;external libgtk4;
procedure gtk_text_view_set_extra_menu(text_view:PGtkTextView; model:PGMenuModel);cdecl;external libgtk4;
function gtk_text_view_get_extra_menu(text_view:PGtkTextView):PGMenuModel;cdecl;external libgtk4;
function gtk_text_view_get_rtl_context(text_view:PGtkTextView):PPangoContext;cdecl;external libgtk4;
function gtk_text_view_get_ltr_context(text_view:PGtkTextView):PPangoContext;cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTextView, g_object_unref) }

// === Konventiert am: 6-7-26 14:18:53 ===

function GTK_TYPE_TEXT_VIEW : TGType;
function GTK_TEXT_VIEW(obj : Pointer) : PGtkTextView;
function GTK_TEXT_VIEW_CLASS(klass : Pointer) : PGtkTextViewClass;
function GTK_IS_TEXT_VIEW(obj : Pointer) : Tgboolean;
function GTK_IS_TEXT_VIEW_CLASS(klass : Pointer) : Tgboolean;
function GTK_TEXT_VIEW_GET_CLASS(obj : Pointer) : PGtkTextViewClass;

implementation

function GTK_TYPE_TEXT_VIEW : TGType;
  begin
    GTK_TYPE_TEXT_VIEW:=gtk_text_view_get_type;
  end;

function GTK_TEXT_VIEW(obj : Pointer) : PGtkTextView;
begin
  Result := PGtkTextView(g_type_check_instance_cast(obj, GTK_TYPE_TEXT_VIEW));
end;

function GTK_TEXT_VIEW_CLASS(klass : Pointer) : PGtkTextViewClass;
begin
  Result := PGtkTextViewClass(g_type_check_class_cast(klass, GTK_TYPE_TEXT_VIEW));
end;

function GTK_IS_TEXT_VIEW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TEXT_VIEW);
end;

function GTK_IS_TEXT_VIEW_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_TEXT_VIEW);
end;

function GTK_TEXT_VIEW_GET_CLASS(obj : Pointer) : PGtkTextViewClass;
begin
  Result := PGtkTextViewClass(PGTypeInstance(obj)^.g_class);
end;



end.
