unit gspell_text_view;

interface

uses
  fp_glib2;

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

{G_DECLARE_DERIVABLE_TYPE (GspellTextView, gspell_text_view, GSPELL, TEXT_VIEW, GObject) }
{ Padding for future expansion  }
type
  PGspellTextViewClass = ^TGspellTextViewClass;
  TGspellTextViewClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function gspell_text_view_get_from_gtk_text_view(gtk_view:PGtkTextView):PGspellTextView;cdecl;external libgspell;
procedure gspell_text_view_basic_setup(gspell_view:PGspellTextView);cdecl;external libgspell;
function gspell_text_view_get_view(gspell_view:PGspellTextView):PGtkTextView;cdecl;external libgspell;
function gspell_text_view_get_inline_spell_checking(gspell_view:PGspellTextView):Tgboolean;cdecl;external libgspell;
procedure gspell_text_view_set_inline_spell_checking(gspell_view:PGspellTextView; enable:Tgboolean);cdecl;external libgspell;
function gspell_text_view_get_enable_language_menu(gspell_view:PGspellTextView):Tgboolean;cdecl;external libgspell;
procedure gspell_text_view_set_enable_language_menu(gspell_view:PGspellTextView; enable_language_menu:Tgboolean);cdecl;external libgspell;
{$endif}
{ GSPELL_TEXT_VIEW_H  }

// === Konventiert am: 4-8-26 16:41:43 ===

function GSPELL_TYPE_TEXT_VIEW: TGType;
function GSPELL_TEXT_VIEW(obj: Pointer): PGspellTextView;
function GSPELL_IS_TEXT_VIEW(obj: Pointer): Tgboolean;
function GSPELL_TEXT_VIEW_CLASS(klass: Pointer): PGspellTextViewClass;
function GSPELL_IS_TEXT_VIEW_CLASS(klass: Pointer): Tgboolean;
function GSPELL_TEXT_VIEW_GET_CLASS(obj: Pointer): PGspellTextViewClass;

implementation

function GSPELL_TYPE_TEXT_VIEW: TGType;
begin
  Result := gspell_text_view_get_type;
end;

function GSPELL_TEXT_VIEW(obj: Pointer): PGspellTextView;
begin
  Result := PGspellTextView(g_type_check_instance_cast(obj, GSPELL_TYPE_TEXT_VIEW));
end;

function GSPELL_IS_TEXT_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSPELL_TYPE_TEXT_VIEW);
end;

function GSPELL_TEXT_VIEW_CLASS(klass: Pointer): PGspellTextViewClass;
begin
  Result := PGspellTextViewClass(g_type_check_class_cast(klass, GSPELL_TYPE_TEXT_VIEW));
end;

function GSPELL_IS_TEXT_VIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GSPELL_TYPE_TEXT_VIEW);
end;

function GSPELL_TEXT_VIEW_GET_CLASS(obj: Pointer): PGspellTextViewClass;
begin
  Result := PGspellTextViewClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGspellTextView = record
    parent_instance: TGObject;
  end;
  PGspellTextView = ^TGspellTextView;

  PGspellTextViewClass = type Pointer;

function gspell_text_view_get_type: TGType; cdecl; external libgxxxxxxx;



end.
