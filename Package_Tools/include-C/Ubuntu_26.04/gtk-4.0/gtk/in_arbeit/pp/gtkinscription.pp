
unit gtkinscription;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkinscription.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkinscription.h
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
Pchar  = ^char;
PGtkInscription  = ^GtkInscription;
PGtkInscriptionOverflow  = ^GtkInscriptionOverflow;
PGtkWidget  = ^GtkWidget;
PPangoAttrList  = ^PangoAttrList;
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

{ was #define dname def_expr }
function GTK_TYPE_INSCRIPTION : longint; { return type might be wrong }

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
(* Const before type ignored *)

function gtk_inscription_new(text:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function gtk_inscription_get_text(self:PGtkInscription):Pchar;cdecl;external;
(* Const before type ignored *)
procedure gtk_inscription_set_text(self:PGtkInscription; text:Pchar);cdecl;external;
function gtk_inscription_get_attributes(self:PGtkInscription):PPangoAttrList;cdecl;external;
procedure gtk_inscription_set_attributes(self:PGtkInscription; attrs:PPangoAttrList);cdecl;external;
(* Const before type ignored *)
procedure gtk_inscription_set_markup(self:PGtkInscription; markup:Pchar);cdecl;external;
function gtk_inscription_get_text_overflow(self:PGtkInscription):TGtkInscriptionOverflow;cdecl;external;
procedure gtk_inscription_set_text_overflow(self:PGtkInscription; overflow:TGtkInscriptionOverflow);cdecl;external;
function gtk_inscription_get_wrap_mode(self:PGtkInscription):TPangoWrapMode;cdecl;external;
procedure gtk_inscription_set_wrap_mode(self:PGtkInscription; wrap_mode:TPangoWrapMode);cdecl;external;
function gtk_inscription_get_min_chars(self:PGtkInscription):Tguint;cdecl;external;
procedure gtk_inscription_set_min_chars(self:PGtkInscription; min_chars:Tguint);cdecl;external;
function gtk_inscription_get_nat_chars(self:PGtkInscription):Tguint;cdecl;external;
procedure gtk_inscription_set_nat_chars(self:PGtkInscription; nat_chars:Tguint);cdecl;external;
function gtk_inscription_get_min_lines(self:PGtkInscription):Tguint;cdecl;external;
procedure gtk_inscription_set_min_lines(self:PGtkInscription; min_lines:Tguint);cdecl;external;
function gtk_inscription_get_nat_lines(self:PGtkInscription):Tguint;cdecl;external;
procedure gtk_inscription_set_nat_lines(self:PGtkInscription; nat_lines:Tguint);cdecl;external;
function gtk_inscription_get_xalign(self:PGtkInscription):single;cdecl;external;
procedure gtk_inscription_set_xalign(self:PGtkInscription; xalign:single);cdecl;external;
function gtk_inscription_get_yalign(self:PGtkInscription):single;cdecl;external;
procedure gtk_inscription_set_yalign(self:PGtkInscription; yalign:single);cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_INSCRIPTION : longint; { return type might be wrong }
  begin
    GTK_TYPE_INSCRIPTION:=gtk_inscription_get_type;
  end;


end.
