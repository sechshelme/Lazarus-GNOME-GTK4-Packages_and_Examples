
unit gmime_stream_buffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_stream_buffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_stream_buffer.h
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
PGByteArray  = ^GByteArray;
PGMimeStream  = ^GMimeStream;
PGMimeStreamBuffer  = ^GMimeStreamBuffer;
PGMimeStreamBufferClass  = ^GMimeStreamBufferClass;
PGMimeStreamBufferMode  = ^GMimeStreamBufferMode;
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

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_BUFFER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_BUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_BUFFER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_BUFFER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_BUFFER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_BUFFER_GET_CLASS(obj : longint) : longint;

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


function g_mime_stream_buffer_get_type:TGType;cdecl;external;
function g_mime_stream_buffer_new(source:PGMimeStream; mode:TGMimeStreamBufferMode):PGMimeStream;cdecl;external;
function g_mime_stream_buffer_gets(stream:PGMimeStream; buf:Pchar; max:Tsize_t):Tssize_t;cdecl;external;
procedure g_mime_stream_buffer_readln(stream:PGMimeStream; buffer:PGByteArray);cdecl;external;
{$endif}
{ __GMIME_STREAM_BUFFER_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_BUFFER : longint; { return type might be wrong }
  begin
    GMIME_TYPE_STREAM_BUFFER:=g_mime_stream_buffer_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_BUFFER(obj : longint) : longint;
begin
  GMIME_STREAM_BUFFER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_STREAM_BUFFER,GMimeStreamBuffer);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_BUFFER_CLASS(klass : longint) : longint;
begin
  GMIME_STREAM_BUFFER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_STREAM_BUFFER,GMimeStreamBufferClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_BUFFER(obj : longint) : longint;
begin
  GMIME_IS_STREAM_BUFFER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_STREAM_BUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_BUFFER_CLASS(klass : longint) : longint;
begin
  GMIME_IS_STREAM_BUFFER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_STREAM_BUFFER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_BUFFER_GET_CLASS(obj : longint) : longint;
begin
  GMIME_STREAM_BUFFER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_STREAM_BUFFER,GMimeStreamBufferClass);
end;


end.
