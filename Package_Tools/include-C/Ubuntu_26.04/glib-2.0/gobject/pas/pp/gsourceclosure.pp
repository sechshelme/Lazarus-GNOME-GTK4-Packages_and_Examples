
unit gsourceclosure;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsourceclosure.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsourceclosure.h
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
PGClosure  = ^GClosure;
PGSource  = ^GSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2001 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_SOURCECLOSURE_H__}
{$define __G_SOURCECLOSURE_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include <gobject/gclosure.h>}
{$include <gobject/glib-types.h>}

procedure g_source_set_closure(source:PGSource; closure:PGClosure);cdecl;external;
procedure g_source_set_dummy_callback(source:PGSource);cdecl;external;
{$endif}
{ __G_SOURCECLOSURE_H__  }

implementation


end.
