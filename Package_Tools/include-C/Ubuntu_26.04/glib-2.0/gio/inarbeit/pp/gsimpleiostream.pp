
unit gsimpleiostream;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsimpleiostream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsimpleiostream.h
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
PGInputStream  = ^GInputStream;
PGIOStream  = ^GIOStream;
PGOutputStream  = ^GOutputStream;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2014 NICE s.r.l.
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
 *
 * Authors: Ignacio Casal Quinteiro <ignacio.casal@nice-software.com>
  }
{$ifndef __G_SIMPLE_IO_STREAM_H__}
{$define __G_SIMPLE_IO_STREAM_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{$include <gio/giostream.h>}

{ was #define dname def_expr }
function G_TYPE_SIMPLE_IO_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_IO_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_IO_STREAM(obj : longint) : longint;

function g_simple_io_stream_get_type:TGType;cdecl;external;
function g_simple_io_stream_new(input_stream:PGInputStream; output_stream:PGOutputStream):PGIOStream;cdecl;external;
{$endif}
{ __G_SIMPLE_IO_STREAM_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SIMPLE_IO_STREAM : longint; { return type might be wrong }
  begin
    G_TYPE_SIMPLE_IO_STREAM:=g_simple_io_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_SIMPLE_IO_STREAM(obj : longint) : longint;
begin
  G_SIMPLE_IO_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_SIMPLE_IO_STREAM,GSimpleIOStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_SIMPLE_IO_STREAM(obj : longint) : longint;
begin
  G_IS_SIMPLE_IO_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_SIMPLE_IO_STREAM);
end;


end.
