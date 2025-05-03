
unit vteterminal;
interface

{
  Automatically converted by H2Pas 1.0.0 from vteterminal.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vteterminal.h
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
Pcairo_font_options_t  = ^cairo_font_options_t;
Pchar  = ^char;
Pdouble  = ^double;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGdkRGBA  = ^GdkRGBA;
PGError  = ^GError;
Pglong  = ^glong;
PGMenuModel  = ^GMenuModel;
PGOutputStream  = ^GOutputStream;
Pgpointer  = ^gpointer;
Pgsize  = ^gsize;
PGtkWidget  = ^GtkWidget;
Plongint  = ^longint;
PPangoFontDescription  = ^PangoFontDescription;
PVteEventContext  = ^VteEventContext;
PVtePty  = ^VtePty;
PVteRegex  = ^VteRegex;
PVteTerminal  = ^VteTerminal;
PVteTerminalClass  = ^VteTerminalClass;
PVteTerminalClassPrivate  = ^VteTerminalClassPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2001,2002,2003,2009,2010 Red Hat, Inc.
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__VTE_VTE_H_INSIDE__) && !defined (VTE_COMPILATION)}
{$error "Only <vte/vte.h> can be included directly."}
{$endif}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include <cairo.h>}
{$include <pango/pango.h>}
{$include <gtk/gtk.h>}
{$include "vteenums.h"}
{$include "vtemacros.h"}
{$include "vtepty.h"}
{$include "vteregex.h"}

{ was #define dname def_expr }
function VTE_TYPE_TERMINAL : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_TERMINAL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_TERMINAL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_IS_TERMINAL(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_IS_TERMINAL_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_TERMINAL_GET_CLASS(obj : longint) : longint;

{ was #define dname def_expr }
function VTE_TYPE_EVENT_CONTEXT : longint; { return type might be wrong }



type
{*
 * VteTerminal:
  }
{$if _VTE_GTK == 3}
{< private > }
{ FIXMEchpe: remove this field on the next ABI break  }
{$endif}
type
  PVteTerminal = ^TVteTerminal;
  TVteTerminal = record
      widget : TGtkWidget;
      _unused_padding : array[0..0] of Pgpointer;
    end;

{*
 * VteTerminalClass:
 *
 * All of these fields should be considered read-only, except for derived classes.
  }
{< public >  }
{ Inherited parent class.  }
{< protected >  }
{ Default signal handlers.  }
(* Const before type ignored *)
{ FIXMEchpe: should these return gboolean and have defaul thandlers
         * settings the "scale" property?
          }
{< protected > }
(* Const before declarator ignored *)
{ Add new vfuncs just above, and subtract from the padding below.  }
{ Padding for future expansion.  }
{ FIXMEgtk4 use class private data instead }
  PVteTerminalClass = ^TVteTerminalClass;
  TVteTerminalClass = record
      parent_class : TGtkWidgetClass;
      eof : procedure (terminal:PVteTerminal);cdecl;
      child_exited : procedure (terminal:PVteTerminal; status:longint);cdecl;
      encoding_changed : procedure (terminal:PVteTerminal);cdecl;
      char_size_changed : procedure (terminal:PVteTerminal; char_width:Tguint; char_height:Tguint);cdecl;
      window_title_changed : procedure (terminal:PVteTerminal);cdecl;
      icon_title_changed : procedure (terminal:PVteTerminal);cdecl;
      selection_changed : procedure (terminal:PVteTerminal);cdecl;
      contents_changed : procedure (terminal:PVteTerminal);cdecl;
      cursor_moved : procedure (terminal:PVteTerminal);cdecl;
      commit : procedure (terminal:PVteTerminal; text:Pgchar; size:Tguint);cdecl;
      deiconify_window : procedure (terminal:PVteTerminal);cdecl;
      iconify_window : procedure (terminal:PVteTerminal);cdecl;
      raise_window : procedure (terminal:PVteTerminal);cdecl;
      lower_window : procedure (terminal:PVteTerminal);cdecl;
      refresh_window : procedure (terminal:PVteTerminal);cdecl;
      restore_window : procedure (terminal:PVteTerminal);cdecl;
      maximize_window : procedure (terminal:PVteTerminal);cdecl;
      resize_window : procedure (terminal:PVteTerminal; width:Tguint; height:Tguint);cdecl;
      move_window : procedure (terminal:PVteTerminal; x:Tguint; y:Tguint);cdecl;
      increase_font_size : procedure (terminal:PVteTerminal);cdecl;
      decrease_font_size : procedure (terminal:PVteTerminal);cdecl;
      copy_clipboard : procedure (terminal:PVteTerminal);cdecl;
      paste_clipboard : procedure (terminal:PVteTerminal);cdecl;
      bell : procedure (terminal:PVteTerminal);cdecl;
      setup_context_menu : procedure (terminal:PVteTerminal; context:PVteEventContext);cdecl;
      _padding : array[0..14] of Tgpointer;
      priv : PVteTerminalClassPrivate;
    end;

{ The widget's type.  }

function vte_terminal_get_type:TGType;cdecl;external;
function vte_terminal_new:PGtkWidget;cdecl;external;
function vte_terminal_pty_new_sync(terminal:PVteTerminal; flags:TVtePtyFlags; cancellable:PGCancellable; error:PPGError):PVtePty;cdecl;external;
procedure vte_terminal_watch_child(terminal:PVteTerminal; child_pid:TGPid);cdecl;external;
type

  TVteTerminalSpawnAsyncCallback = procedure (terminal:PVteTerminal; pid:TGPid; error:PGError; user_data:Tgpointer);cdecl;
(* Const before type ignored *)

procedure vte_terminal_spawn_async(terminal:PVteTerminal; pty_flags:TVtePtyFlags; working_directory:Pchar; argv:PPchar; envv:PPchar; 
            spawn_flags:TGSpawnFlags; child_setup:TGSpawnChildSetupFunc; child_setup_data:Tgpointer; child_setup_data_destroy:TGDestroyNotify; timeout:longint; 
            cancellable:PGCancellable; callback:TVteTerminalSpawnAsyncCallback; user_data:Tgpointer);cdecl;external;
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
(* Const before declarator ignored *)
procedure vte_terminal_spawn_with_fds_async(terminal:PVteTerminal; pty_flags:TVtePtyFlags; working_directory:Pchar; argv:PPchar; envv:PPchar; 
            fds:Plongint; n_fds:longint; map_fds:Plongint; n_map_fds:longint; spawn_flags:TGSpawnFlags; 
            child_setup:TGSpawnChildSetupFunc; child_setup_data:Tgpointer; child_setup_data_destroy:TGDestroyNotify; timeout:longint; cancellable:PGCancellable; 
            callback:TVteTerminalSpawnAsyncCallback; user_data:Tgpointer);cdecl;external;
{ Send data to the terminal to display, or to the terminal's forked command
 * to handle in some way.  If it's 'cat', they should be the same.  }
(* Const before type ignored *)
procedure vte_terminal_feed(terminal:PVteTerminal; data:Pchar; length:Tgssize);cdecl;external;
(* Const before type ignored *)
procedure vte_terminal_feed_child(terminal:PVteTerminal; text:Pchar; length:Tgssize);cdecl;external;
{ Copy currently-selected text to the clipboard, or from the clipboard to
 * the terminal.  }
procedure vte_terminal_copy_clipboard_format(terminal:PVteTerminal; format:TVteFormat);cdecl;external;
procedure vte_terminal_paste_clipboard(terminal:PVteTerminal);cdecl;external;
(* Const before declarator ignored *)
procedure vte_terminal_paste_text(terminal:PVteTerminal; text:Pchar);cdecl;external;
procedure vte_terminal_copy_primary(terminal:PVteTerminal);cdecl;external;
procedure vte_terminal_paste_primary(terminal:PVteTerminal);cdecl;external;
procedure vte_terminal_select_all(terminal:PVteTerminal);cdecl;external;
procedure vte_terminal_unselect_all(terminal:PVteTerminal);cdecl;external;
{ By-word selection  }
(* Const before type ignored *)
procedure vte_terminal_set_word_char_exceptions(terminal:PVteTerminal; exceptions:Pchar);cdecl;external;
(* Const before type ignored *)
function vte_terminal_get_word_char_exceptions(terminal:PVteTerminal):Pchar;cdecl;external;
{ Set the terminal's size.  }
procedure vte_terminal_set_size(terminal:PVteTerminal; columns:Tglong; rows:Tglong);cdecl;external;
procedure vte_terminal_set_font_scale(terminal:PVteTerminal; scale:Tgdouble);cdecl;external;
function vte_terminal_get_font_scale(terminal:PVteTerminal):Tgdouble;cdecl;external;
(* Const before declarator ignored *)
procedure vte_terminal_set_font_options(terminal:PVteTerminal; font_options:Pcairo_font_options_t);cdecl;external;
(* Const before declarator ignored *)
function vte_terminal_get_font_options(terminal:PVteTerminal):Pcairo_font_options_t;cdecl;external;
procedure vte_terminal_set_cell_width_scale(terminal:PVteTerminal; scale:Tdouble);cdecl;external;
function vte_terminal_get_cell_width_scale(terminal:PVteTerminal):Tdouble;cdecl;external;
procedure vte_terminal_set_cell_height_scale(terminal:PVteTerminal; scale:Tdouble);cdecl;external;
function vte_terminal_get_cell_height_scale(terminal:PVteTerminal):Tdouble;cdecl;external;
{ Set various on-off settings.  }
procedure vte_terminal_set_text_blink_mode(terminal:PVteTerminal; text_blink_mode:TVteTextBlinkMode);cdecl;external;
function vte_terminal_get_text_blink_mode(terminal:PVteTerminal):TVteTextBlinkMode;cdecl;external;
procedure vte_terminal_set_audible_bell(terminal:PVteTerminal; is_audible:Tgboolean);cdecl;external;
function vte_terminal_get_audible_bell(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_scroll_on_output(terminal:PVteTerminal; scroll:Tgboolean);cdecl;external;
procedure vte_terminal_set_scroll_on_insert(terminal:PVteTerminal; scroll:Tgboolean);cdecl;external;
function vte_terminal_get_scroll_on_insert(terminal:PVteTerminal):Tgboolean;cdecl;external;
function vte_terminal_get_scroll_on_output(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_scroll_on_keystroke(terminal:PVteTerminal; scroll:Tgboolean);cdecl;external;
function vte_terminal_get_scroll_on_keystroke(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_enable_fallback_scrolling(terminal:PVteTerminal; enable:Tgboolean);cdecl;external;
function vte_terminal_get_enable_fallback_scrolling(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_scroll_unit_is_pixels(terminal:PVteTerminal; enable:Tgboolean);cdecl;external;
function vte_terminal_get_scroll_unit_is_pixels(terminal:PVteTerminal):Tgboolean;cdecl;external;
{ Set the color scheme.  }
(* Const before type ignored *)
procedure vte_terminal_set_color_bold(terminal:PVteTerminal; bold:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure vte_terminal_set_color_foreground(terminal:PVteTerminal; foreground:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure vte_terminal_set_color_background(terminal:PVteTerminal; background:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure vte_terminal_set_color_cursor(terminal:PVteTerminal; cursor_background:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure vte_terminal_set_color_cursor_foreground(terminal:PVteTerminal; cursor_foreground:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure vte_terminal_set_color_highlight(terminal:PVteTerminal; highlight_background:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
procedure vte_terminal_set_color_highlight_foreground(terminal:PVteTerminal; highlight_foreground:PGdkRGBA);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure vte_terminal_set_colors(terminal:PVteTerminal; foreground:PGdkRGBA; background:PGdkRGBA; palette:PGdkRGBA; palette_size:Tgsize);cdecl;external;
procedure vte_terminal_set_default_colors(terminal:PVteTerminal);cdecl;external;
{ Set whether or not the cursor blinks.  }
procedure vte_terminal_set_cursor_blink_mode(terminal:PVteTerminal; mode:TVteCursorBlinkMode);cdecl;external;
function vte_terminal_get_cursor_blink_mode(terminal:PVteTerminal):TVteCursorBlinkMode;cdecl;external;
{ Set cursor shape  }
procedure vte_terminal_set_cursor_shape(terminal:PVteTerminal; shape:TVteCursorShape);cdecl;external;
function vte_terminal_get_cursor_shape(terminal:PVteTerminal):TVteCursorShape;cdecl;external;
{ Set the number of scrollback lines, above or at an internal minimum.  }
procedure vte_terminal_set_scrollback_lines(terminal:PVteTerminal; lines:Tglong);cdecl;external;
function vte_terminal_get_scrollback_lines(terminal:PVteTerminal):Tglong;cdecl;external;
{ Set or retrieve the current font.  }
(* Const before type ignored *)
procedure vte_terminal_set_font(terminal:PVteTerminal; font_desc:PPangoFontDescription);cdecl;external;
(* Const before type ignored *)
function vte_terminal_get_font(terminal:PVteTerminal):PPangoFontDescription;cdecl;external;
procedure vte_terminal_set_bold_is_bright(terminal:PVteTerminal; bold_is_bright:Tgboolean);cdecl;external;
function vte_terminal_get_bold_is_bright(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_allow_hyperlink(terminal:PVteTerminal; allow_hyperlink:Tgboolean);cdecl;external;
function vte_terminal_get_allow_hyperlink(terminal:PVteTerminal):Tgboolean;cdecl;external;
{ Check if the terminal is the current selection owner.  }
function vte_terminal_get_has_selection(terminal:PVteTerminal):Tgboolean;cdecl;external;
function vte_terminal_get_text_selected(terminal:PVteTerminal; format:TVteFormat):Pchar;cdecl;external;
function vte_terminal_get_text_selected_full(terminal:PVteTerminal; format:TVteFormat; length:Pgsize):Pchar;cdecl;external;
{ Set what happens when the user strikes backspace or delete.  }
procedure vte_terminal_set_backspace_binding(terminal:PVteTerminal; binding:TVteEraseBinding);cdecl;external;
procedure vte_terminal_set_delete_binding(terminal:PVteTerminal; binding:TVteEraseBinding);cdecl;external;
{ BiDi and shaping  }
procedure vte_terminal_set_enable_bidi(terminal:PVteTerminal; enable_bidi:Tgboolean);cdecl;external;
function vte_terminal_get_enable_bidi(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_enable_shaping(terminal:PVteTerminal; enable_shaping:Tgboolean);cdecl;external;
function vte_terminal_get_enable_shaping(terminal:PVteTerminal):Tgboolean;cdecl;external;
{ Manipulate the autohide setting.  }
procedure vte_terminal_set_mouse_autohide(terminal:PVteTerminal; setting:Tgboolean);cdecl;external;
function vte_terminal_get_mouse_autohide(terminal:PVteTerminal):Tgboolean;cdecl;external;
{ Reset the terminal, optionally clearing the tab stops and line history.  }
procedure vte_terminal_reset(terminal:PVteTerminal; clear_tabstops:Tgboolean; clear_history:Tgboolean);cdecl;external;
function vte_terminal_get_text_format(terminal:PVteTerminal; format:TVteFormat):Pchar;cdecl;external;
function vte_terminal_get_text_range_format(terminal:PVteTerminal; format:TVteFormat; start_row:longint; start_col:longint; end_row:longint; 
           end_col:longint; length:Pgsize):Pchar;cdecl;external;
procedure vte_terminal_get_cursor_position(terminal:PVteTerminal; column:Pglong; row:Pglong);cdecl;external;
function vte_terminal_check_hyperlink_at(terminal:PVteTerminal; x:Tdouble; y:Tdouble):Pchar;cdecl;external;
{ Add a matching expression, returning the tag the widget assigns to that
 * expression.  }
function vte_terminal_match_add_regex(terminal:PVteTerminal; regex:PVteRegex; flags:Tguint32):longint;cdecl;external;
{ Set the cursor to be used when the pointer is over a given match.  }
(* Const before type ignored *)
procedure vte_terminal_match_set_cursor_name(terminal:PVteTerminal; tag:longint; cursor_name:Pchar);cdecl;external;
procedure vte_terminal_match_remove(terminal:PVteTerminal; tag:longint);cdecl;external;
procedure vte_terminal_match_remove_all(terminal:PVteTerminal);cdecl;external;
{ Check if a given cell on the screen contains part of a matched string.  If
 * it does, return the string, and store the match tag in the optional tag
 * argument.  }
function vte_terminal_check_match_at(terminal:PVteTerminal; x:Tdouble; y:Tdouble; tag:Plongint):Pchar;cdecl;external;
function vte_terminal_check_regex_array_at(terminal:PVteTerminal; x:Tdouble; y:Tdouble; regexes:PPVteRegex; n_regexes:Tgsize; 
           match_flags:Tguint32; n_matches:Pgsize):^Pchar;cdecl;external;
function vte_terminal_check_regex_simple_at(terminal:PVteTerminal; x:Tdouble; y:Tdouble; regexes:PPVteRegex; n_regexes:Tgsize; 
           match_flags:Tguint32; matches:PPchar):Tgboolean;cdecl;external;
procedure vte_terminal_search_set_regex(terminal:PVteTerminal; regex:PVteRegex; flags:Tguint32);cdecl;external;
function vte_terminal_search_get_regex(terminal:PVteTerminal):PVteRegex;cdecl;external;
procedure vte_terminal_search_set_wrap_around(terminal:PVteTerminal; wrap_around:Tgboolean);cdecl;external;
function vte_terminal_search_get_wrap_around(terminal:PVteTerminal):Tgboolean;cdecl;external;
function vte_terminal_search_find_previous(terminal:PVteTerminal):Tgboolean;cdecl;external;
function vte_terminal_search_find_next(terminal:PVteTerminal):Tgboolean;cdecl;external;
{ CJK compatibility setting  }
procedure vte_terminal_set_cjk_ambiguous_width(terminal:PVteTerminal; width:longint);cdecl;external;
function vte_terminal_get_cjk_ambiguous_width(terminal:PVteTerminal):longint;cdecl;external;
procedure vte_terminal_set_pty(terminal:PVteTerminal; pty:PVtePty);cdecl;external;
function vte_terminal_get_pty(terminal:PVteTerminal):PVtePty;cdecl;external;
{ Accessors for bindings.  }
function vte_terminal_get_char_width(terminal:PVteTerminal):Tglong;cdecl;external;
function vte_terminal_get_char_height(terminal:PVteTerminal):Tglong;cdecl;external;
function vte_terminal_get_row_count(terminal:PVteTerminal):Tglong;cdecl;external;
function vte_terminal_get_column_count(terminal:PVteTerminal):Tglong;cdecl;external;
(* Const before type ignored *)
function vte_terminal_get_window_title(terminal:PVteTerminal):Pchar;cdecl;external;
(* Const before type ignored *)
function vte_terminal_get_current_directory_uri(terminal:PVteTerminal):Pchar;cdecl;external;
(* Const before type ignored *)
function vte_terminal_get_current_file_uri(terminal:PVteTerminal):Pchar;cdecl;external;
{ misc  }
procedure vte_terminal_set_input_enabled(terminal:PVteTerminal; enabled:Tgboolean);cdecl;external;
function vte_terminal_get_input_enabled(terminal:PVteTerminal):Tgboolean;cdecl;external;
{ rarely useful functions  }
procedure vte_terminal_set_clear_background(terminal:PVteTerminal; setting:Tgboolean);cdecl;external;
procedure vte_terminal_get_color_background_for_draw(terminal:PVteTerminal; color:PGdkRGBA);cdecl;external;
{ Writing contents out  }
function vte_terminal_write_contents_sync(terminal:PVteTerminal; stream:PGOutputStream; flags:TVteWriteFlags; cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{ Images  }
{ Set or get whether SIXEL image support is enabled  }
procedure vte_terminal_set_enable_sixel(terminal:PVteTerminal; enabled:Tgboolean);cdecl;external;
function vte_terminal_get_enable_sixel(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_xalign(terminal:PVteTerminal; align:TVteAlign);cdecl;external;
function vte_terminal_get_xalign(terminal:PVteTerminal):TVteAlign;cdecl;external;
procedure vte_terminal_set_yalign(terminal:PVteTerminal; align:TVteAlign);cdecl;external;
function vte_terminal_get_yalign(terminal:PVteTerminal):TVteAlign;cdecl;external;
procedure vte_terminal_set_xfill(terminal:PVteTerminal; fill:Tgboolean);cdecl;external;
function vte_terminal_get_xfill(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_yfill(terminal:PVteTerminal; fill:Tgboolean);cdecl;external;
function vte_terminal_get_yfill(terminal:PVteTerminal):Tgboolean;cdecl;external;
procedure vte_terminal_set_context_menu_model(terminal:PVteTerminal; model:PGMenuModel);cdecl;external;
function vte_terminal_get_context_menu_model(terminal:PVteTerminal):PGMenuModel;cdecl;external;
procedure vte_terminal_set_context_menu(terminal:PVteTerminal; menu:PGtkWidget);cdecl;external;
function vte_terminal_get_context_menu(terminal:PVteTerminal):PGtkWidget;cdecl;external;
function vte_event_context_get_type:TGType;cdecl;external;
(* Const before declarator ignored *)
function vte_event_context_get_coordinates(context:PVteEventContext; x:Pdouble; y:Pdouble):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function VTE_TYPE_TERMINAL : longint; { return type might be wrong }
  begin
    VTE_TYPE_TERMINAL:=vte_terminal_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_TERMINAL(obj : longint) : longint;
begin
  VTE_TERMINAL:=G_TYPE_CHECK_INSTANCE_CAST(obj,VTE_TYPE_TERMINAL,VteTerminal);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_TERMINAL_CLASS(klass : longint) : longint;
begin
  VTE_TERMINAL_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VTE_TYPE_TERMINAL,VteTerminalClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_IS_TERMINAL(obj : longint) : longint;
begin
  VTE_IS_TERMINAL:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VTE_TYPE_TERMINAL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_IS_TERMINAL_CLASS(klass : longint) : longint;
begin
  VTE_IS_TERMINAL_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VTE_TYPE_TERMINAL);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VTE_TERMINAL_GET_CLASS(obj : longint) : longint;
begin
  VTE_TERMINAL_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VTE_TYPE_TERMINAL,VteTerminalClass);
end;

{ was #define dname def_expr }
function VTE_TYPE_EVENT_CONTEXT : longint; { return type might be wrong }
  begin
    VTE_TYPE_EVENT_CONTEXT:=vte_event_context_get_type;
  end;




end.
