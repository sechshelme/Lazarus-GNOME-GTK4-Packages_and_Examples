unit gspell_navigator_text_view;

interface

uses
  fp_glib2;

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

{G_DECLARE_DERIVABLE_TYPE (GspellNavigatorTextView, gspell_navigator_text_view, GSPELL, NAVIGATOR_TEXT_VIEW, GInitiallyUnowned) }
{ Padding for future expansion  }
type
  PGspellNavigatorTextViewClass = ^TGspellNavigatorTextViewClass;
  TGspellNavigatorTextViewClass = record
      parent_class : TGInitiallyUnownedClass;
      padding : array[0..7] of Tgpointer;
    end;


function gspell_navigator_text_view_new(view:PGtkTextView):PGspellNavigator;cdecl;external libgspell;
function gspell_navigator_text_view_get_view(navigator:PGspellNavigatorTextView):PGtkTextView;cdecl;external libgspell;
{$endif}
{ GSPELL_NAVIGATOR_TEXT_VIEW_H  }

// === Konventiert am: 4-8-26 16:41:52 ===

function GSPELL_TYPE_NAVIGATOR_TEXT_VIEW: TGType;
function GSPELL_NAVIGATOR_TEXT_VIEW(obj: Pointer): PGspellNavigatorTextView;
function GSPELL_IS_NAVIGATOR_TEXT_VIEW(obj: Pointer): Tgboolean;
function GSPELL_NAVIGATOR_TEXT_VIEW_CLASS(klass: Pointer): PGspellNavigatorTextViewClass;
function GSPELL_IS_NAVIGATOR_TEXT_VIEW_CLASS(klass: Pointer): Tgboolean;
function GSPELL_NAVIGATOR_TEXT_VIEW_GET_CLASS(obj: Pointer): PGspellNavigatorTextViewClass;

implementation

function GSPELL_TYPE_NAVIGATOR_TEXT_VIEW: TGType;
begin
  Result := gspell_navigator_text_view_get_type;
end;

function GSPELL_NAVIGATOR_TEXT_VIEW(obj: Pointer): PGspellNavigatorTextView;
begin
  Result := PGspellNavigatorTextView(g_type_check_instance_cast(obj, GSPELL_TYPE_NAVIGATOR_TEXT_VIEW));
end;

function GSPELL_IS_NAVIGATOR_TEXT_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_NAVIGATOR_TEXT_VIEW);
end;

function GSPELL_NAVIGATOR_TEXT_VIEW_CLASS(klass: Pointer): PGspellNavigatorTextViewClass;
begin
  Result := PGspellNavigatorTextViewClass(g_type_check_class_cast(klass, GSPELL_TYPE_NAVIGATOR_TEXT_VIEW));
end;

function GSPELL_IS_NAVIGATOR_TEXT_VIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GSPELL_TYPE_NAVIGATOR_TEXT_VIEW);
end;

function GSPELL_NAVIGATOR_TEXT_VIEW_GET_CLASS(obj: Pointer): PGspellNavigatorTextViewClass;
begin
  Result := PGspellNavigatorTextViewClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGspellNavigatorTextView = record
    parent_instance: TGInitiallyUnowned;
  end;
  PGspellNavigatorTextView = ^TGspellNavigatorTextView;

  PGspellNavigatorTextViewClass = type Pointer;

function gspell_navigator_text_view_get_type: TGType; cdecl; external libgxxxxxxx;



end.
