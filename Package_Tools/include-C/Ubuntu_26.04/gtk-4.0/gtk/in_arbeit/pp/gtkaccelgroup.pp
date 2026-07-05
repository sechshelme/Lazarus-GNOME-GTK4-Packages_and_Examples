
unit gtkaccelgroup;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtkaccelgroup.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtkaccelgroup.h
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
PGdkDisplay  = ^GdkDisplay;
PGdkModifierType  = ^GdkModifierType;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GTK - The GIMP Toolkit
 * Copyright (C) 1998, 2001 Tim Janik
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
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
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}
{ --- Accelerators---  }

function gtk_accelerator_valid(keyval:Tguint; modifiers:TGdkModifierType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_accelerator_parse(accelerator:Pchar; accelerator_key:Pguint; accelerator_mods:PGdkModifierType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gtk_accelerator_parse_with_keycode(accelerator:Pchar; display:PGdkDisplay; accelerator_key:Pguint; accelerator_codes:PPguint; accelerator_mods:PGdkModifierType):Tgboolean;cdecl;external;
function gtk_accelerator_name(accelerator_key:Tguint; accelerator_mods:TGdkModifierType):Pchar;cdecl;external;
function gtk_accelerator_name_with_keycode(display:PGdkDisplay; accelerator_key:Tguint; keycode:Tguint; accelerator_mods:TGdkModifierType):Pchar;cdecl;external;
function gtk_accelerator_get_label(accelerator_key:Tguint; accelerator_mods:TGdkModifierType):Pchar;cdecl;external;
function gtk_accelerator_get_label_with_keycode(display:PGdkDisplay; accelerator_key:Tguint; keycode:Tguint; accelerator_mods:TGdkModifierType):Pchar;cdecl;external;
function gtk_accelerator_get_accessible_label(accelerator_key:Tguint; accelerator_mods:TGdkModifierType):Pchar;cdecl;external;
function gtk_accelerator_get_default_mod_mask:TGdkModifierType;cdecl;external;

implementation


end.
