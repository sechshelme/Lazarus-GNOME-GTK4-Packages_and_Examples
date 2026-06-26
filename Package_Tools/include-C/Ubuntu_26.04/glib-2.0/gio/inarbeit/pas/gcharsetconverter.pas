unit gcharsetconverter;

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
{$ifndef __G_CHARSET_CONVERTER_H__}
{$define __G_CHARSET_CONVERTER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gconverter.h>}

type
  PGCharsetConverterClass = ^TGCharsetConverterClass;
  TGCharsetConverterClass = record
      parent_class : TGObjectClass;
    end;


function g_charset_converter_get_type:TGType;cdecl;external libgio2;
function g_charset_converter_new(to_charset:Pgchar; from_charset:Pgchar; error:PPGError):PGCharsetConverter;cdecl;external libgio2;
procedure g_charset_converter_set_use_fallback(converter:PGCharsetConverter; use_fallback:Tgboolean);cdecl;external libgio2;
function g_charset_converter_get_use_fallback(converter:PGCharsetConverter):Tgboolean;cdecl;external libgio2;
function g_charset_converter_get_num_fallbacks(converter:PGCharsetConverter):Tguint;cdecl;external libgio2;
{$endif}
{ __G_CHARSET_CONVERTER_H__  }

// === Konventiert am: 26-6-26 16:36:09 ===

function G_TYPE_CHARSET_CONVERTER : TGType;
function G_CHARSET_CONVERTER(obj : Pointer) : PGCharsetConverter;
function G_CHARSET_CONVERTER_CLASS(klass : Pointer) : PGCharsetConverterClass;
function G_IS_CHARSET_CONVERTER(obj : Pointer) : Tgboolean;
function G_IS_CHARSET_CONVERTER_CLASS(klass : Pointer) : Tgboolean;
function G_CHARSET_CONVERTER_GET_CLASS(obj : Pointer) : PGCharsetConverterClass;

implementation

function G_TYPE_CHARSET_CONVERTER : TGType;
  begin
    G_TYPE_CHARSET_CONVERTER:=g_charset_converter_get_type;
  end;

function G_CHARSET_CONVERTER(obj : Pointer) : PGCharsetConverter;
begin
  Result := PGCharsetConverter(g_type_check_instance_cast(obj, G_TYPE_CHARSET_CONVERTER));
end;

function G_CHARSET_CONVERTER_CLASS(klass : Pointer) : PGCharsetConverterClass;
begin
  Result := PGCharsetConverterClass(g_type_check_class_cast(klass, G_TYPE_CHARSET_CONVERTER));
end;

function G_IS_CHARSET_CONVERTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_CHARSET_CONVERTER);
end;

function G_IS_CHARSET_CONVERTER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_CHARSET_CONVERTER);
end;

function G_CHARSET_CONVERTER_GET_CLASS(obj : Pointer) : PGCharsetConverterClass;
begin
  Result := PGCharsetConverterClass(PGTypeInstance(obj)^.g_class);
end;



end.
