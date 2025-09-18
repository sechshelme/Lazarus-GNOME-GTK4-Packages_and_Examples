unit gmime_stream_mmap;

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
{$ifndef __GMIME_STREAM_MMAP_H__}
{$define __GMIME_STREAM_MMAP_H__}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamMmap:
 * @parent_object: parent #GMimeStream
 * @owner: %TRUE if this stream owns the memory map
 * @eos: %TRUE if end-of-stream
 * @fd: file descriptor
 * @map: memory map
 * @maplen: length of the memory map
 *
 * A memory-mapped #GMimeStream.
 * }
  PGMimeStreamMmap = ^TGMimeStreamMmap;
  TGMimeStreamMmap = record
      parent_object : TGMimeStream;
      owner : Tgboolean;
      eos : Tgboolean;
      fd : longint;
      map : Pchar;
      maplen : Tsize_t;
    end;

  PGMimeStreamMmapClass = ^TGMimeStreamMmapClass;
  TGMimeStreamMmapClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_mmap_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_mmap_new(fd:longint; prot:longint; flags:longint):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_mmap_new_with_bounds(fd:longint; prot:longint; flags:longint; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_mmap_get_owner(stream:PGMimeStreamMmap):Tgboolean;cdecl;external libgmime3;
procedure g_mime_stream_mmap_set_owner(stream:PGMimeStreamMmap; owner:Tgboolean);cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_MMAP_H__  }

// === Konventiert am: 18-9-25 15:34:14 ===

function GMIME_TYPE_STREAM_MMAP : TGType;
function GMIME_STREAM_MMAP(obj : Pointer) : PGMimeStreamMmap;
function GMIME_STREAM_MMAP_CLASS(klass : Pointer) : PGMimeStreamMmapClass;
function GMIME_IS_STREAM_MMAP(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_MMAP_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_MMAP_GET_CLASS(obj : Pointer) : PGMimeStreamMmapClass;

implementation

function GMIME_TYPE_STREAM_MMAP : TGType;
  begin
    GMIME_TYPE_STREAM_MMAP:=g_mime_stream_mmap_get_type;
  end;

function GMIME_STREAM_MMAP(obj : Pointer) : PGMimeStreamMmap;
begin
  Result := PGMimeStreamMmap(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_MMAP));
end;

function GMIME_STREAM_MMAP_CLASS(klass : Pointer) : PGMimeStreamMmapClass;
begin
  Result := PGMimeStreamMmapClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_MMAP));
end;

function GMIME_IS_STREAM_MMAP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_MMAP);
end;

function GMIME_IS_STREAM_MMAP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_MMAP);
end;

function GMIME_STREAM_MMAP_GET_CLASS(obj : Pointer) : PGMimeStreamMmapClass;
begin
  Result := PGMimeStreamMmapClass(PGTypeInstance(obj)^.g_class);
end;



end.
