
unit gtksourcetypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtksourcetypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtksourcetypes.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of GtkSourceView
 *
 * Copyright 2012-2016 - Sébastien Wilmet <swilmet@gnome.org>
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
{$include <glib.h>}
{$include "gtksourceversion.h"}
{ This header exists to avoid cycles in header inclusions, when header A needs
 * the type B and header B needs the type A. For an alternative way to solve
 * this problem (in C11), see:
 * https://bugzilla.gnome.org/show_bug.cgi?id=679424#c20
  }
type

implementation


end.
