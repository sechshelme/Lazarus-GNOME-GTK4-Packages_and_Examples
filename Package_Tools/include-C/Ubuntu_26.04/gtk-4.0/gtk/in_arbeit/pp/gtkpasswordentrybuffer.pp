
unit gtkpasswordentrybuffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkpasswordentrybuffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkpasswordentrybuffer.h
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
PGtkEntryBuffer  = ^GtkEntryBuffer;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtkpasswordentrybufferprivate.h: Entry buffer using secure allocation
 *
 * Copyright 2020  GNOME Foundation
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtkentrybuffer.h>}

{ was #define dname def_expr }
function GTK_TYPE_PASSWORD_ENTRY_BUFFER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (GtkPasswordEntryBuffer, gtk_password_entry_buffer, GTK, PASSWORD_ENTRY_BUFFER, GtkEntryBuffer) }
function gtk_password_entry_buffer_new:PGtkEntryBuffer;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_PASSWORD_ENTRY_BUFFER : longint; { return type might be wrong }
  begin
    GTK_TYPE_PASSWORD_ENTRY_BUFFER:=gtk_password_entry_buffer_get_type;
  end;


end.
