
unit gtksourceprintcompositor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourceprintcompositor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourceprintcompositor.h
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
PGtkPrintContext  = ^GtkPrintContext;
PGtkSourceBuffer  = ^GtkSourceBuffer;
PGtkSourcePrintCompositor  = ^GtkSourcePrintCompositor;
PGtkSourcePrintCompositorClass  = ^GtkSourcePrintCompositorClass;
PGtkSourceView  = ^GtkSourceView;
PGtkTextTag  = ^GtkTextTag;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2003  Gustavo Giráldez
 * Copyright 2007-2008  Paolo Maggi, Paolo Borelli and Yevgen Muntyan
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
function GTK_SOURCE_TYPE_PRINT_COMPOSITOR : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkSourcePrintCompositor, gtk_source_print_compositor, GTK_SOURCE, PRINT_COMPOSITOR, GObject) }
{< private > }
type
  PGtkSourcePrintCompositorClass = ^TGtkSourcePrintCompositorClass;
  TGtkSourcePrintCompositorClass = record
      parent_class : TGObjectClass;
      _reserved : array[0..9] of Tgpointer;
    end;


function gtk_source_print_compositor_new(buffer:PGtkSourceBuffer):PGtkSourcePrintCompositor;cdecl;external;
function gtk_source_print_compositor_new_from_view(view:PGtkSourceView):PGtkSourcePrintCompositor;cdecl;external;
function gtk_source_print_compositor_get_buffer(compositor:PGtkSourcePrintCompositor):PGtkSourceBuffer;cdecl;external;
procedure gtk_source_print_compositor_set_tab_width(compositor:PGtkSourcePrintCompositor; width:Tguint);cdecl;external;
function gtk_source_print_compositor_get_tab_width(compositor:PGtkSourcePrintCompositor):Tguint;cdecl;external;
procedure gtk_source_print_compositor_set_wrap_mode(compositor:PGtkSourcePrintCompositor; wrap_mode:TGtkWrapMode);cdecl;external;
function gtk_source_print_compositor_get_wrap_mode(compositor:PGtkSourcePrintCompositor):TGtkWrapMode;cdecl;external;
procedure gtk_source_print_compositor_set_highlight_syntax(compositor:PGtkSourcePrintCompositor; highlight:Tgboolean);cdecl;external;
function gtk_source_print_compositor_get_highlight_syntax(compositor:PGtkSourcePrintCompositor):Tgboolean;cdecl;external;
procedure gtk_source_print_compositor_set_print_line_numbers(compositor:PGtkSourcePrintCompositor; interval:Tguint);cdecl;external;
function gtk_source_print_compositor_get_print_line_numbers(compositor:PGtkSourcePrintCompositor):Tguint;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_print_compositor_set_body_font_name(compositor:PGtkSourcePrintCompositor; font_name:Pgchar);cdecl;external;
function gtk_source_print_compositor_get_body_font_name(compositor:PGtkSourcePrintCompositor):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_print_compositor_set_line_numbers_font_name(compositor:PGtkSourcePrintCompositor; font_name:Pgchar);cdecl;external;
function gtk_source_print_compositor_get_line_numbers_font_name(compositor:PGtkSourcePrintCompositor):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_print_compositor_set_header_font_name(compositor:PGtkSourcePrintCompositor; font_name:Pgchar);cdecl;external;
function gtk_source_print_compositor_get_header_font_name(compositor:PGtkSourcePrintCompositor):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_source_print_compositor_set_footer_font_name(compositor:PGtkSourcePrintCompositor; font_name:Pgchar);cdecl;external;
function gtk_source_print_compositor_get_footer_font_name(compositor:PGtkSourcePrintCompositor):Pgchar;cdecl;external;
function gtk_source_print_compositor_get_top_margin(compositor:PGtkSourcePrintCompositor; unit:TGtkUnit):Tgdouble;cdecl;external;
procedure gtk_source_print_compositor_set_top_margin(compositor:PGtkSourcePrintCompositor; margin:Tgdouble; unit:TGtkUnit);cdecl;external;
function gtk_source_print_compositor_get_bottom_margin(compositor:PGtkSourcePrintCompositor; unit:TGtkUnit):Tgdouble;cdecl;external;
procedure gtk_source_print_compositor_set_bottom_margin(compositor:PGtkSourcePrintCompositor; margin:Tgdouble; unit:TGtkUnit);cdecl;external;
function gtk_source_print_compositor_get_left_margin(compositor:PGtkSourcePrintCompositor; unit:TGtkUnit):Tgdouble;cdecl;external;
procedure gtk_source_print_compositor_set_left_margin(compositor:PGtkSourcePrintCompositor; margin:Tgdouble; unit:TGtkUnit);cdecl;external;
function gtk_source_print_compositor_get_right_margin(compositor:PGtkSourcePrintCompositor; unit:TGtkUnit):Tgdouble;cdecl;external;
procedure gtk_source_print_compositor_set_right_margin(compositor:PGtkSourcePrintCompositor; margin:Tgdouble; unit:TGtkUnit);cdecl;external;
procedure gtk_source_print_compositor_set_print_header(compositor:PGtkSourcePrintCompositor; print:Tgboolean);cdecl;external;
function gtk_source_print_compositor_get_print_header(compositor:PGtkSourcePrintCompositor):Tgboolean;cdecl;external;
procedure gtk_source_print_compositor_set_print_footer(compositor:PGtkSourcePrintCompositor; print:Tgboolean);cdecl;external;
function gtk_source_print_compositor_get_print_footer(compositor:PGtkSourcePrintCompositor):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_print_compositor_set_header_format(compositor:PGtkSourcePrintCompositor; separator:Tgboolean; left:Pgchar; center:Pgchar; right:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gtk_source_print_compositor_set_footer_format(compositor:PGtkSourcePrintCompositor; separator:Tgboolean; left:Pgchar; center:Pgchar; right:Pgchar);cdecl;external;
function gtk_source_print_compositor_get_n_pages(compositor:PGtkSourcePrintCompositor):Tgint;cdecl;external;
function gtk_source_print_compositor_paginate(compositor:PGtkSourcePrintCompositor; context:PGtkPrintContext):Tgboolean;cdecl;external;
function gtk_source_print_compositor_get_pagination_progress(compositor:PGtkSourcePrintCompositor):Tgdouble;cdecl;external;
procedure gtk_source_print_compositor_draw_page(compositor:PGtkSourcePrintCompositor; context:PGtkPrintContext; page_nr:Tgint);cdecl;external;
procedure gtk_source_print_compositor_ignore_tag(compositor:PGtkSourcePrintCompositor; tag:PGtkTextTag);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_SOURCE_TYPE_PRINT_COMPOSITOR : longint; { return type might be wrong }
  begin
    GTK_SOURCE_TYPE_PRINT_COMPOSITOR:=gtk_source_print_compositor_get_type;
  end;


end.
