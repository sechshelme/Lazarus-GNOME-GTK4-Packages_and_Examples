
unit gcharsetconverter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gcharsetconverter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gcharsetconverter.h
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
Pgchar  = ^gchar;
PGCharsetConverter  = ^GCharsetConverter;
PGCharsetConverterClass  = ^GCharsetConverterClass;
PGError  = ^GError;
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

{ was #define dname def_expr }
function G_TYPE_CHARSET_CONVERTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CHARSET_CONVERTER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CHARSET_CONVERTER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CHARSET_CONVERTER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CHARSET_CONVERTER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CHARSET_CONVERTER_GET_CLASS(o : longint) : longint;

type
  PGCharsetConverterClass = ^TGCharsetConverterClass;
  TGCharsetConverterClass = record
      parent_class : TGObjectClass;
    end;


function g_charset_converter_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_charset_converter_new(to_charset:Pgchar; from_charset:Pgchar; error:PPGError):PGCharsetConverter;cdecl;external;
procedure g_charset_converter_set_use_fallback(converter:PGCharsetConverter; use_fallback:Tgboolean);cdecl;external;
function g_charset_converter_get_use_fallback(converter:PGCharsetConverter):Tgboolean;cdecl;external;
function g_charset_converter_get_num_fallbacks(converter:PGCharsetConverter):Tguint;cdecl;external;
{$endif}
{ __G_CHARSET_CONVERTER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_CHARSET_CONVERTER : longint; { return type might be wrong }
  begin
    G_TYPE_CHARSET_CONVERTER:=g_charset_converter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CHARSET_CONVERTER(o : longint) : longint;
begin
  G_CHARSET_CONVERTER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_CHARSET_CONVERTER,GCharsetConverter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CHARSET_CONVERTER_CLASS(k : longint) : longint;
begin
  G_CHARSET_CONVERTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_CHARSET_CONVERTER,GCharsetConverterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CHARSET_CONVERTER(o : longint) : longint;
begin
  G_IS_CHARSET_CONVERTER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_CHARSET_CONVERTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_CHARSET_CONVERTER_CLASS(k : longint) : longint;
begin
  G_IS_CHARSET_CONVERTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_CHARSET_CONVERTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_CHARSET_CONVERTER_GET_CLASS(o : longint) : longint;
begin
  G_CHARSET_CONVERTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_CHARSET_CONVERTER,GCharsetConverterClass);
end;


end.
