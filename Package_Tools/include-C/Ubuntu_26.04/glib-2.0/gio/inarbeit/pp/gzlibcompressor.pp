
unit gzlibcompressor;
interface

{
  Automatically converted by H2Pas 1.0.0 from gzlibcompressor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gzlibcompressor.h
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
PGFileInfo  = ^GFileInfo;
PGZlibCompressor  = ^GZlibCompressor;
PGZlibCompressorClass  = ^GZlibCompressorClass;
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
{$ifndef __G_ZLIB_COMPRESSOR_H__}
{$define __G_ZLIB_COMPRESSOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gconverter.h>}
{$include <gio/gfileinfo.h>}

{ was #define dname def_expr }
function G_TYPE_ZLIB_COMPRESSOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ZLIB_COMPRESSOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ZLIB_COMPRESSOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ZLIB_COMPRESSOR(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ZLIB_COMPRESSOR_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ZLIB_COMPRESSOR_GET_CLASS(o : longint) : longint;

type
  PGZlibCompressorClass = ^TGZlibCompressorClass;
  TGZlibCompressorClass = record
      parent_class : TGObjectClass;
    end;


function g_zlib_compressor_get_type:TGType;cdecl;external;
function g_zlib_compressor_new(format:TGZlibCompressorFormat; level:longint):PGZlibCompressor;cdecl;external;
function g_zlib_compressor_get_file_info(compressor:PGZlibCompressor):PGFileInfo;cdecl;external;
procedure g_zlib_compressor_set_file_info(compressor:PGZlibCompressor; file_info:PGFileInfo);cdecl;external;
function g_zlib_compressor_get_os(compressor:PGZlibCompressor):longint;cdecl;external;
procedure g_zlib_compressor_set_os(compressor:PGZlibCompressor; os:longint);cdecl;external;
{$endif}
{ __G_ZLIB_COMPRESSOR_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_ZLIB_COMPRESSOR : longint; { return type might be wrong }
  begin
    G_TYPE_ZLIB_COMPRESSOR:=g_zlib_compressor_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ZLIB_COMPRESSOR(o : longint) : longint;
begin
  G_ZLIB_COMPRESSOR:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_ZLIB_COMPRESSOR,GZlibCompressor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ZLIB_COMPRESSOR_CLASS(k : longint) : longint;
begin
  G_ZLIB_COMPRESSOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_ZLIB_COMPRESSOR,GZlibCompressorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ZLIB_COMPRESSOR(o : longint) : longint;
begin
  G_IS_ZLIB_COMPRESSOR:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_ZLIB_COMPRESSOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_ZLIB_COMPRESSOR_CLASS(k : longint) : longint;
begin
  G_IS_ZLIB_COMPRESSOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_ZLIB_COMPRESSOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_ZLIB_COMPRESSOR_GET_CLASS(o : longint) : longint;
begin
  G_ZLIB_COMPRESSOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_ZLIB_COMPRESSOR,GZlibCompressorClass);
end;


end.
