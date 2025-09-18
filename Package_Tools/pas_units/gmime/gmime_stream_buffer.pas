unit gmime_stream_buffer;

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
{$ifndef __GMIME_STREAM_BUFFER_H__}
{$define __GMIME_STREAM_BUFFER_H__}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamBufferMode:
 * @GMIME_STREAM_BUFFER_BLOCK_READ: Read in 4k blocks.
 * @GMIME_STREAM_BUFFER_BLOCK_WRITE: Write in 4k blocks.
 *
 * The buffering mode for a #GMimeStreamBuffer stream.
 * }

  PGMimeStreamBufferMode = ^TGMimeStreamBufferMode;
  TGMimeStreamBufferMode =  Longint;
  Const
    GMIME_STREAM_BUFFER_BLOCK_READ = 0;
    GMIME_STREAM_BUFFER_BLOCK_WRITE = 1;
;
{*
 * GMimeStreamBuffer:
 * @parent_object: parent #GMimeStream
 * @mode: buffering mode
 * @source: source stream
 * @buffer: internal buffer
 * @bufptr: current position in the buffer
 * @bufend: end of the buffer
 * @buflen: buffer length
 *
 * A buffered stream wrapper around any #GMimeStream object.
 * }
type
  PGMimeStreamBuffer = ^TGMimeStreamBuffer;
  TGMimeStreamBuffer = record
      parent_object : TGMimeStream;
      mode : TGMimeStreamBufferMode;
      source : PGMimeStream;
      buffer : Pchar;
      bufptr : Pchar;
      bufend : Pchar;
      buflen : Tsize_t;
    end;

  PGMimeStreamBufferClass = ^TGMimeStreamBufferClass;
  TGMimeStreamBufferClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_buffer_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_buffer_new(source:PGMimeStream; mode:TGMimeStreamBufferMode):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_buffer_gets(stream:PGMimeStream; buf:Pchar; max:Tsize_t):Tssize_t;cdecl;external libgmime3;
procedure g_mime_stream_buffer_readln(stream:PGMimeStream; buffer:PGByteArray);cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_BUFFER_H__  }

// === Konventiert am: 18-9-25 15:33:44 ===

function GMIME_TYPE_STREAM_BUFFER : TGType;
function GMIME_STREAM_BUFFER(obj : Pointer) : PGMimeStreamBuffer;
function GMIME_STREAM_BUFFER_CLASS(klass : Pointer) : PGMimeStreamBufferClass;
function GMIME_IS_STREAM_BUFFER(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_BUFFER_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_BUFFER_GET_CLASS(obj : Pointer) : PGMimeStreamBufferClass;

implementation

function GMIME_TYPE_STREAM_BUFFER : TGType;
  begin
    GMIME_TYPE_STREAM_BUFFER:=g_mime_stream_buffer_get_type;
  end;

function GMIME_STREAM_BUFFER(obj : Pointer) : PGMimeStreamBuffer;
begin
  Result := PGMimeStreamBuffer(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_BUFFER));
end;

function GMIME_STREAM_BUFFER_CLASS(klass : Pointer) : PGMimeStreamBufferClass;
begin
  Result := PGMimeStreamBufferClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_BUFFER));
end;

function GMIME_IS_STREAM_BUFFER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_BUFFER);
end;

function GMIME_IS_STREAM_BUFFER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_BUFFER);
end;

function GMIME_STREAM_BUFFER_GET_CLASS(obj : Pointer) : PGMimeStreamBufferClass;
begin
  Result := PGMimeStreamBufferClass(PGTypeInstance(obj)^.g_class);
end;



end.
