
unit gspell_navigator_text_view;
interface

{
  Automatically converted by H2Pas 1.0.0 from gspell_navigator_text_view.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gspell_navigator_text_view.h
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
PGspellNavigator  = ^GspellNavigator;
PGspellNavigatorTextView  = ^GspellNavigatorTextView;
PGspellNavigatorTextViewClass  = ^GspellNavigatorTextViewClass;
PGtkTextView  = ^GtkTextView;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of gspell, a spell-checking library.
 *
 * Copyright 2015, 2016 - Sébastien Wilmet <swilmet@gnome.org>
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
{$ifndef GSPELL_NAVIGATOR_TEXT_VIEW_H}
{$define GSPELL_NAVIGATOR_TEXT_VIEW_H}
{$if !defined (GSPELL_H_INSIDE) && !defined (GSPELL_COMPILATION)}
{$error "Only <gspell/gspell.h> can be included directly."}
{$endif}
{$include <gtk/gtk.h>}
{$include <gspell/gspell-navigator.h>}
{$include <gspell/gspell-checker.h>}

{ was #define dname def_expr }
function GSPELL_TYPE_NAVIGATOR_TEXT_VIEW : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GspellNavigatorTextView, gspell_navigator_text_view, GSPELL, NAVIGATOR_TEXT_VIEW, GInitiallyUnowned) }
{ Padding for future expansion  }
type
  PGspellNavigatorTextViewClass = ^TGspellNavigatorTextViewClass;
  TGspellNavigatorTextViewClass = record
      parent_class : TGInitiallyUnownedClass;
      padding : array[0..7] of Tgpointer;
    end;


function gspell_navigator_text_view_new(view:PGtkTextView):PGspellNavigator;cdecl;external;
function gspell_navigator_text_view_get_view(navigator:PGspellNavigatorTextView):PGtkTextView;cdecl;external;
{$endif}
{ GSPELL_NAVIGATOR_TEXT_VIEW_H  }

implementation

{ was #define dname def_expr }
function GSPELL_TYPE_NAVIGATOR_TEXT_VIEW : longint; { return type might be wrong }
  begin
    GSPELL_TYPE_NAVIGATOR_TEXT_VIEW:=gspell_navigator_text_view_get_type;
  end;


end.
