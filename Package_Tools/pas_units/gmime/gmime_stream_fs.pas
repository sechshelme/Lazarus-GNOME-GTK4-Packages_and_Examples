unit gmime_stream_fs;

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
{$ifndef __GMIME_STREAM_FS_H__}
{$define __GMIME_STREAM_FS_H__}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamFs:
 * @parent_object: parent #GMimeStream
 * @owner: %TRUE if this stream owns @fd
 * @eos: %TRUE if end-of-stream
 * @fd: file descriptor
 *
 * A #GMimeStream wrapper around POSIX file descriptors.
 * }
  PGMimeStreamFs = ^TGMimeStreamFs;
  TGMimeStreamFs = record
      parent_object : TGMimeStream;
      owner : Tgboolean;
      eos : Tgboolean;
      fd : longint;
    end;

  PGMimeStreamFsClass = ^TGMimeStreamFsClass;
  TGMimeStreamFsClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_fs_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_fs_new(fd:longint):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_fs_new_with_bounds(fd:longint; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_fs_open(path:Pchar; flags:longint; mode:longint; err:PPGError):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_fs_get_owner(stream:PGMimeStreamFs):Tgboolean;cdecl;external libgmime3;
procedure g_mime_stream_fs_set_owner(stream:PGMimeStreamFs; owner:Tgboolean);cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_FS_H__  }

// === Konventiert am: 18-9-25 15:34:01 ===

function GMIME_TYPE_STREAM_FS : TGType;
function GMIME_STREAM_FS(obj : Pointer) : PGMimeStreamFs;
function GMIME_STREAM_FS_CLASS(klass : Pointer) : PGMimeStreamFsClass;
function GMIME_IS_STREAM_FS(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_FS_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_FS_GET_CLASS(obj : Pointer) : PGMimeStreamFsClass;

implementation

function GMIME_TYPE_STREAM_FS : TGType;
  begin
    GMIME_TYPE_STREAM_FS:=g_mime_stream_fs_get_type;
  end;

function GMIME_STREAM_FS(obj : Pointer) : PGMimeStreamFs;
begin
  Result := PGMimeStreamFs(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_FS));
end;

function GMIME_STREAM_FS_CLASS(klass : Pointer) : PGMimeStreamFsClass;
begin
  Result := PGMimeStreamFsClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_FS));
end;

function GMIME_IS_STREAM_FS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_FS);
end;

function GMIME_IS_STREAM_FS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_FS);
end;

function GMIME_STREAM_FS_GET_CLASS(obj : Pointer) : PGMimeStreamFsClass;
begin
  Result := PGMimeStreamFsClass(PGTypeInstance(obj)^.g_class);
end;



end.
