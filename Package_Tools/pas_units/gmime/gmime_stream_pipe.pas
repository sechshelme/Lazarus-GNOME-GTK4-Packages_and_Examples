unit gmime_stream_pipe;

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
{$ifndef __GMIME_STREAM_PIPE_H__}
{$define __GMIME_STREAM_PIPE_H__}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamPipe:
 * @parent_object: parent #GMimeStream
 * @owner: %TRUE if this stream owns @fd
 * @eos: %TRUE if end-of-stream
 * @fd: pipe descriptor
 *
 * A #GMimeStream wrapper around pipes.
 * }
  PGMimeStreamPipe = ^TGMimeStreamPipe;
  TGMimeStreamPipe = record
      parent_object : TGMimeStream;
      owner : Tgboolean;
      eos : Tgboolean;
      fd : longint;
    end;

  PGMimeStreamPipeClass = ^TGMimeStreamPipeClass;
  TGMimeStreamPipeClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_pipe_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_pipe_new(fd:longint):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_pipe_get_owner(stream:PGMimeStreamPipe):Tgboolean;cdecl;external libgmime3;
procedure g_mime_stream_pipe_set_owner(stream:PGMimeStreamPipe; owner:Tgboolean);cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_PIPE_H__  }

// === Konventiert am: 18-9-25 15:34:22 ===

function GMIME_TYPE_STREAM_PIPE : TGType;
function GMIME_STREAM_PIPE(obj : Pointer) : PGMimeStreamPipe;
function GMIME_STREAM_PIPE_CLASS(klass : Pointer) : PGMimeStreamPipeClass;
function GMIME_IS_STREAM_PIPE(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_PIPE_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_PIPE_GET_CLASS(obj : Pointer) : PGMimeStreamPipeClass;

implementation

function GMIME_TYPE_STREAM_PIPE : TGType;
  begin
    GMIME_TYPE_STREAM_PIPE:=g_mime_stream_pipe_get_type;
  end;

function GMIME_STREAM_PIPE(obj : Pointer) : PGMimeStreamPipe;
begin
  Result := PGMimeStreamPipe(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_PIPE));
end;

function GMIME_STREAM_PIPE_CLASS(klass : Pointer) : PGMimeStreamPipeClass;
begin
  Result := PGMimeStreamPipeClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_PIPE));
end;

function GMIME_IS_STREAM_PIPE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_PIPE);
end;

function GMIME_IS_STREAM_PIPE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_PIPE);
end;

function GMIME_STREAM_PIPE_GET_CLASS(obj : Pointer) : PGMimeStreamPipeClass;
begin
  Result := PGMimeStreamPipeClass(PGTypeInstance(obj)^.g_class);
end;



end.
