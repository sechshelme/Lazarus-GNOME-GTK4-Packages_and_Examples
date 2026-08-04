
unit gspell_text_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_text_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_text_view.h
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
PGspellTextView  = ^GspellTextView;
PGspellTextViewClass  = ^GspellTextViewClass;
PGtkTextView  = ^GtkTextView;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2015, 2016 - Sébastien Wilmet
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef GSPELL_TEXT_VIEW_H}
{$define GSPELL_TEXT_VIEW_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_TEXT_VIEW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GspellTextView, gspell_text_view, GSPELL, TEXT_VIEW, GObject) }
{ Padding for future expansion  }
type
  PGspellTextViewClass = ^TGspellTextViewClass;
  TGspellTextViewClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function gspell_text_view_get_from_gtk_text_view(gtk_view:PGtkTextView):PGspellTextView;cdecl;external;
procedure gspell_text_view_basic_setup(gspell_view:PGspellTextView);cdecl;external;
function gspell_text_view_get_view(gspell_view:PGspellTextView):PGtkTextView;cdecl;external;
function gspell_text_view_get_inline_spell_checking(gspell_view:PGspellTextView):Tgboolean;cdecl;external;
procedure gspell_text_view_set_inline_spell_checking(gspell_view:PGspellTextView; enable:Tgboolean);cdecl;external;
function gspell_text_view_get_enable_language_menu(gspell_view:PGspellTextView):Tgboolean;cdecl;external;
procedure gspell_text_view_set_enable_language_menu(gspell_view:PGspellTextView; enable_language_menu:Tgboolean);cdecl;external;
{$endif}
{ GSPELL_TEXT_VIEW_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_TEXT_VIEW : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_TEXT_VIEW:=gspell_text_view_get_type;
  end;


end.
