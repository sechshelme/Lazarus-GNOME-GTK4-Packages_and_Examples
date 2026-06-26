unit gzlibdecompressor;

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
{$ifndef __G_ZLIB_DECOMPRESSOR_H__}
{$define __G_ZLIB_DECOMPRESSOR_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/gconverter.h>}
{$include <gio/gfileinfo.h>}

type
  PGZlibDecompressorClass = ^TGZlibDecompressorClass;
  TGZlibDecompressorClass = record
      parent_class : TGObjectClass;
    end;


function g_zlib_decompressor_get_type:TGType;cdecl;external libgio2;
function g_zlib_decompressor_new(format:TGZlibCompressorFormat):PGZlibDecompressor;cdecl;external libgio2;
function g_zlib_decompressor_get_file_info(decompressor:PGZlibDecompressor):PGFileInfo;cdecl;external libgio2;
{$endif}
{ __G_ZLIB_DECOMPRESSOR_H__  }

// === Konventiert am: 26-6-26 20:07:49 ===

function G_TYPE_ZLIB_DECOMPRESSOR : TGType;
function G_ZLIB_DECOMPRESSOR(obj : Pointer) : PGZlibDecompressor;
function G_ZLIB_DECOMPRESSOR_CLASS(klass : Pointer) : PGZlibDecompressorClass;
function G_IS_ZLIB_DECOMPRESSOR(obj : Pointer) : Tgboolean;
function G_IS_ZLIB_DECOMPRESSOR_CLASS(klass : Pointer) : Tgboolean;
function G_ZLIB_DECOMPRESSOR_GET_CLASS(obj : Pointer) : PGZlibDecompressorClass;

implementation

function G_TYPE_ZLIB_DECOMPRESSOR : TGType;
  begin
    G_TYPE_ZLIB_DECOMPRESSOR:=g_zlib_decompressor_get_type;
  end;

function G_ZLIB_DECOMPRESSOR(obj : Pointer) : PGZlibDecompressor;
begin
  Result := PGZlibDecompressor(g_type_check_instance_cast(obj, G_TYPE_ZLIB_DECOMPRESSOR));
end;

function G_ZLIB_DECOMPRESSOR_CLASS(klass : Pointer) : PGZlibDecompressorClass;
begin
  Result := PGZlibDecompressorClass(g_type_check_class_cast(klass, G_TYPE_ZLIB_DECOMPRESSOR));
end;

function G_IS_ZLIB_DECOMPRESSOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_ZLIB_DECOMPRESSOR);
end;

function G_IS_ZLIB_DECOMPRESSOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_ZLIB_DECOMPRESSOR);
end;

function G_ZLIB_DECOMPRESSOR_GET_CLASS(obj : Pointer) : PGZlibDecompressorClass;
begin
  Result := PGZlibDecompressorClass(PGTypeInstance(obj)^.g_class);
end;



end.
