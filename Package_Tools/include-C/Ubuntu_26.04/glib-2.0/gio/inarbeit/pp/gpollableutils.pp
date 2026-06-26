
unit gpollableutils;
interface

{
  Automatically converted by H2Pas 1.0.0 from gpollableutils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gpollableutils.h
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
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGObject  = ^GObject;
PGOutputStream  = ^GOutputStream;
Pgsize  = ^gsize;
PGSource  = ^GSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2012 Red Hat, Inc.
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
{$ifndef __G_POLLABLE_UTILS_H__}
{$define __G_POLLABLE_UTILS_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}

function g_pollable_source_new(pollable_stream:PGObject):PGSource;cdecl;external;
function g_pollable_source_new_full(pollable_stream:Tgpointer; child_source:PGSource; cancellable:PGCancellable):PGSource;cdecl;external;
function g_pollable_stream_read(stream:PGInputStream; buffer:pointer; count:Tgsize; blocking:Tgboolean; cancellable:PGCancellable; 
           error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
function g_pollable_stream_write(stream:PGOutputStream; buffer:pointer; count:Tgsize; blocking:Tgboolean; cancellable:PGCancellable; 
           error:PPGError):Tgssize;cdecl;external;
(* Const before type ignored *)
function g_pollable_stream_write_all(stream:PGOutputStream; buffer:pointer; count:Tgsize; blocking:Tgboolean; bytes_written:Pgsize; 
           cancellable:PGCancellable; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ _G_POLLABLE_UTILS_H_  }

implementation


end.
