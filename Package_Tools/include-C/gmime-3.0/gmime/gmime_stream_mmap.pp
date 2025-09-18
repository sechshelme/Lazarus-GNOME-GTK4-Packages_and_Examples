
unit gmime_stream_mmap;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_stream_mmap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_stream_mmap.h
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
Pchar  = ^char;
PGMimeStream  = ^GMimeStream;
PGMimeStreamMmap  = ^GMimeStreamMmap;
PGMimeStreamMmapClass  = ^GMimeStreamMmapClass;
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

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_MMAP : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_MMAP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_MMAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_MMAP(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_MMAP_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_MMAP_GET_CLASS(obj : longint) : longint;

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


function g_mime_stream_mmap_get_type:TGType;cdecl;external;
function g_mime_stream_mmap_new(fd:longint; prot:longint; flags:longint):PGMimeStream;cdecl;external;
function g_mime_stream_mmap_new_with_bounds(fd:longint; prot:longint; flags:longint; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;external;
function g_mime_stream_mmap_get_owner(stream:PGMimeStreamMmap):Tgboolean;cdecl;external;
procedure g_mime_stream_mmap_set_owner(stream:PGMimeStreamMmap; owner:Tgboolean);cdecl;external;
{$endif}
{ __GMIME_STREAM_MMAP_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_MMAP : longint; { return type might be wrong }
  begin
    GMIME_TYPE_STREAM_MMAP:=g_mime_stream_mmap_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_MMAP(obj : longint) : longint;
begin
  GMIME_STREAM_MMAP:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_STREAM_MMAP,GMimeStreamMmap);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_MMAP_CLASS(klass : longint) : longint;
begin
  GMIME_STREAM_MMAP_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_STREAM_MMAP,GMimeStreamMmapClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_MMAP(obj : longint) : longint;
begin
  GMIME_IS_STREAM_MMAP:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_STREAM_MMAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_MMAP_CLASS(klass : longint) : longint;
begin
  GMIME_IS_STREAM_MMAP_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_STREAM_MMAP);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_MMAP_GET_CLASS(obj : longint) : longint;
begin
  GMIME_STREAM_MMAP_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_STREAM_MMAP,GMimeStreamMmapClass);
end;


end.
