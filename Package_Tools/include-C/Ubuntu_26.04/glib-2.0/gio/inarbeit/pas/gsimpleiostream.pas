unit gsimpleiostream;

interface

uses
  fp_glib2;

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

function g_simple_io_stream_get_type:TGType;cdecl;external libgio2;
function g_simple_io_stream_new(input_stream:PGInputStream; output_stream:PGOutputStream):PGIOStream;cdecl;external libgio2;
{$endif}
{ __G_SIMPLE_IO_STREAM_H__  }

// === Konventiert am: 26-6-26 19:51:48 ===

function G_TYPE_SIMPLE_IO_STREAM : TGType;
function G_SIMPLE_IO_STREAM(obj : Pointer) : PGSimpleIOStream;
function G_IS_SIMPLE_IO_STREAM(obj : Pointer) : Tgboolean;

implementation

function G_TYPE_SIMPLE_IO_STREAM : TGType;
  begin
    G_TYPE_SIMPLE_IO_STREAM:=g_simple_io_stream_get_type;
  end;

function G_SIMPLE_IO_STREAM(obj : Pointer) : PGSimpleIOStream;
begin
  Result := PGSimpleIOStream(g_type_check_instance_cast(obj, G_TYPE_SIMPLE_IO_STREAM));
end;

function G_IS_SIMPLE_IO_STREAM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_SIMPLE_IO_STREAM);
end;



end.
