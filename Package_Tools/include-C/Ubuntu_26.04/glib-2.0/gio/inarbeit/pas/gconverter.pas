unit gconverter;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2009 Red Hat, Inc.
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
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_CONVERTER_H__}
{$define __G_CONVERTER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type
{*
 * GConverterIface:
 * @g_iface: The parent interface.
 * @convert: Converts data.
 * @reset: Reverts the internal state of the converter to its initial state.
 *
 * Provides an interface for converting data from one type
 * to another type. The conversion can be stateful
 * and may fail at any place.
 *
 * Since: 2.24
 * }
{ Virtual Table  }
  PGConverterIface = ^TGConverterIface;
  TGConverterIface = record
      g_iface : TGTypeInterface;
      convert : function (converter:PGConverter; inbuf:pointer; inbuf_size:Tgsize; outbuf:pointer; outbuf_size:Tgsize; 
                   flags:TGConverterFlags; bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):TGConverterResult;cdecl;
      reset : procedure (converter:PGConverter);cdecl;
    end;


function g_converter_get_type:TGType;cdecl;external libgio2;
function g_converter_convert(converter:PGConverter; inbuf:pointer; inbuf_size:Tgsize; outbuf:pointer; outbuf_size:Tgsize; 
           flags:TGConverterFlags; bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):TGConverterResult;cdecl;external libgio2;
procedure g_converter_reset(converter:PGConverter);cdecl;external libgio2;
function g_converter_convert_bytes(converter:PGConverter; bytes:PGBytes; error:PPGError):PGBytes;cdecl;external libgio2;
{$endif}
{ __G_CONVERTER_H__  }

// === Konventiert am: 26-6-26 16:35:51 ===

function G_TYPE_CONVERTER : TGType;
function G_CONVERTER(obj : Pointer) : PGConverter;
function G_IS_CONVERTER(obj : Pointer) : Tgboolean;
function G_CONVERTER_GET_IFACE(obj : Pointer) : PGConverterIface;

implementation

function G_TYPE_CONVERTER : TGType;
  begin
    G_TYPE_CONVERTER:=g_converter_get_type;
  end;

function G_CONVERTER(obj : Pointer) : PGConverter;
begin
  Result := PGConverter(g_type_check_instance_cast(obj, G_TYPE_CONVERTER));
end;

function G_IS_CONVERTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_CONVERTER);
end;

function G_CONVERTER_GET_IFACE(obj : Pointer) : PGConverterIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_CONVERTER);
end;



end.
