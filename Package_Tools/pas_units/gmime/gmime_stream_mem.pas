unit gmime_stream_mem;

interface

uses
  fp_glib2, fp_gmime3;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_STREAM_MEM_H__}
{$define __GMIME_STREAM_MEM_H__}
{$include <glib.h>}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamMem:
 * @parent_object: parent #GMimeStream
 * @buffer: a memory buffer
 * @owner: %TRUE if this stream owns the memory buffer
 *
 * A memory-backed #GMimeStream.
 * }
  PGMimeStreamMem = ^TGMimeStreamMem;
  TGMimeStreamMem = record
      parent_object : TGMimeStream;
      buffer : PGByteArray;
      owner : Tgboolean;
    end;

  PGMimeStreamMemClass = ^TGMimeStreamMemClass;
  TGMimeStreamMemClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_mem_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_mem_new:PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_mem_new_with_byte_array(array:PGByteArray):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_mem_new_with_buffer(buffer:Pchar; len:Tsize_t):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_mem_get_byte_array(mem:PGMimeStreamMem):PGByteArray;cdecl;external libgmime3;
procedure g_mime_stream_mem_set_byte_array(mem:PGMimeStreamMem; array:PGByteArray);cdecl;external libgmime3;
function g_mime_stream_mem_get_owner(mem:PGMimeStreamMem):Tgboolean;cdecl;external libgmime3;
procedure g_mime_stream_mem_set_owner(mem:PGMimeStreamMem; owner:Tgboolean);cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_MEM_H__  }

// === Konventiert am: 18-9-25 15:34:09 ===

function GMIME_TYPE_STREAM_MEM : TGType;
function GMIME_STREAM_MEM(obj : Pointer) : PGMimeStreamMem;
function GMIME_STREAM_MEM_CLASS(klass : Pointer) : PGMimeStreamMemClass;
function GMIME_IS_STREAM_MEM(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_MEM_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_MEM_GET_CLASS(obj : Pointer) : PGMimeStreamMemClass;

implementation

function GMIME_TYPE_STREAM_MEM : TGType;
  begin
    GMIME_TYPE_STREAM_MEM:=g_mime_stream_mem_get_type;
  end;

function GMIME_STREAM_MEM(obj : Pointer) : PGMimeStreamMem;
begin
  Result := PGMimeStreamMem(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_MEM));
end;

function GMIME_STREAM_MEM_CLASS(klass : Pointer) : PGMimeStreamMemClass;
begin
  Result := PGMimeStreamMemClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_MEM));
end;

function GMIME_IS_STREAM_MEM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_MEM);
end;

function GMIME_IS_STREAM_MEM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_MEM);
end;

function GMIME_STREAM_MEM_GET_CLASS(obj : Pointer) : PGMimeStreamMemClass;
begin
  Result := PGMimeStreamMemClass(PGTypeInstance(obj)^.g_class);
end;



end.
