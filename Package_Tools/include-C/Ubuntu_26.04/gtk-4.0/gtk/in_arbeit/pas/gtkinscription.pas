unit gtkinscription;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2022 Benjamin Otte
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtkwidget.h>}

{*
 * GtkInscriptionOverflow:
 * @GTK_INSCRIPTION_OVERFLOW_CLIP: Clip the remaining text
 * @GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_START: Omit characters at the start of the text
 * @GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_MIDDLE: Omit characters at the middle of the text
 * @GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_END: Omit characters at the end of the text
 *
 * The different methods to handle text in #GtkInscription when it doesn't
 * fit the available space.
 *
 * Since: 4.8
  }
type
  PGtkInscriptionOverflow = ^TGtkInscriptionOverflow;
  TGtkInscriptionOverflow =  Longint;
  Const
    GTK_INSCRIPTION_OVERFLOW_CLIP = 0;
    GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_START = 1;
    GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_MIDDLE = 2;
    GTK_INSCRIPTION_OVERFLOW_ELLIPSIZE_END = 3;
;
{G_DECLARE_FINAL_TYPE (GtkInscription, gtk_inscription, GTK, INSCRIPTION, GtkWidget) }

function gtk_inscription_new(text:Pchar):PGtkWidget;cdecl;external libgtk4;
function gtk_inscription_get_text(self:PGtkInscription):Pchar;cdecl;external libgtk4;
procedure gtk_inscription_set_text(self:PGtkInscription; text:Pchar);cdecl;external libgtk4;
function gtk_inscription_get_attributes(self:PGtkInscription):PPangoAttrList;cdecl;external libgtk4;
procedure gtk_inscription_set_attributes(self:PGtkInscription; attrs:PPangoAttrList);cdecl;external libgtk4;
procedure gtk_inscription_set_markup(self:PGtkInscription; markup:Pchar);cdecl;external libgtk4;
function gtk_inscription_get_text_overflow(self:PGtkInscription):TGtkInscriptionOverflow;cdecl;external libgtk4;
procedure gtk_inscription_set_text_overflow(self:PGtkInscription; overflow:TGtkInscriptionOverflow);cdecl;external libgtk4;
function gtk_inscription_get_wrap_mode(self:PGtkInscription):TPangoWrapMode;cdecl;external libgtk4;
procedure gtk_inscription_set_wrap_mode(self:PGtkInscription; wrap_mode:TPangoWrapMode);cdecl;external libgtk4;
function gtk_inscription_get_min_chars(self:PGtkInscription):Tguint;cdecl;external libgtk4;
procedure gtk_inscription_set_min_chars(self:PGtkInscription; min_chars:Tguint);cdecl;external libgtk4;
function gtk_inscription_get_nat_chars(self:PGtkInscription):Tguint;cdecl;external libgtk4;
procedure gtk_inscription_set_nat_chars(self:PGtkInscription; nat_chars:Tguint);cdecl;external libgtk4;
function gtk_inscription_get_min_lines(self:PGtkInscription):Tguint;cdecl;external libgtk4;
procedure gtk_inscription_set_min_lines(self:PGtkInscription; min_lines:Tguint);cdecl;external libgtk4;
function gtk_inscription_get_nat_lines(self:PGtkInscription):Tguint;cdecl;external libgtk4;
procedure gtk_inscription_set_nat_lines(self:PGtkInscription; nat_lines:Tguint);cdecl;external libgtk4;
function gtk_inscription_get_xalign(self:PGtkInscription):single;cdecl;external libgtk4;
procedure gtk_inscription_set_xalign(self:PGtkInscription; xalign:single);cdecl;external libgtk4;
function gtk_inscription_get_yalign(self:PGtkInscription):single;cdecl;external libgtk4;
procedure gtk_inscription_set_yalign(self:PGtkInscription; yalign:single);cdecl;external libgtk4;

// === Konventiert am: 6-7-26 16:20:44 ===

function GTK_TYPE_INSCRIPTION: TGType;
function GTK_INSCRIPTION(obj: Pointer): PGtkInscription;
function GTK_IS_INSCRIPTION(obj: Pointer): Tgboolean;

implementation

function GTK_TYPE_INSCRIPTION: TGType;
begin
  Result := gtk_inscription_get_type;
end;

function GTK_INSCRIPTION(obj: Pointer): PGtkInscription;
begin
  Result := PGtkInscription(g_type_check_instance_cast(obj, GTK_TYPE_INSCRIPTION));
end;

function GTK_IS_INSCRIPTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_INSCRIPTION);
end;

type 
  PGtkInscription = type Pointer;

  TGtkInscriptionClass = record
    parent_class: TGtkWidgetClass;
  end;
  PGtkInscriptionClass = ^TGtkInscriptionClass;

function gtk_inscription_get_type: TGType; cdecl; external libgxxxxxxx;



end.
