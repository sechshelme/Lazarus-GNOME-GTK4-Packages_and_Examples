
unit gconverter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gconverter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gconverter.h
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
PGBytes  = ^GBytes;
PGConverter  = ^GConverter;
PGConverterIface  = ^GConverterIface;
PGError  = ^GError;
Pgsize  = ^gsize;
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

{ was #define dname def_expr }
function G_TYPE_CONVERTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CONVERTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER_GET_IFACE(obj : longint) : longint;

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
(* Const before type ignored *)
  PGConverterIface = ^TGConverterIface;
  TGConverterIface = record
      g_iface : TGTypeInterface;
      convert : function (converter:PGConverter; inbuf:pointer; inbuf_size:Tgsize; outbuf:pointer; outbuf_size:Tgsize; 
                   flags:TGConverterFlags; bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):TGConverterResult;cdecl;
      reset : procedure (converter:PGConverter);cdecl;
    end;


function g_converter_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_converter_convert(converter:PGConverter; inbuf:pointer; inbuf_size:Tgsize; outbuf:pointer; outbuf_size:Tgsize; 
           flags:TGConverterFlags; bytes_read:Pgsize; bytes_written:Pgsize; error:PPGError):TGConverterResult;cdecl;external;
procedure g_converter_reset(converter:PGConverter);cdecl;external;
function g_converter_convert_bytes(converter:PGConverter; bytes:PGBytes; error:PPGError):PGBytes;cdecl;external;
{$endif}
{ __G_CONVERTER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_CONVERTER : longint; { return type might be wrong }
  begin
    G_TYPE_CONVERTER:=g_converter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER(obj : longint) : longint;
begin
  G_CONVERTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,G_TYPE_CONVERTER,GConverter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CONVERTER(obj : longint) : longint;
begin
  G_IS_CONVERTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,G_TYPE_CONVERTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CONVERTER_GET_IFACE(obj : longint) : longint;
begin
  G_CONVERTER_GET_IFACE:=G_TYPE_INSTANCE_GET_INTERFACE(obj,G_TYPE_CONVERTER,GConverterIface);
end;


end.
