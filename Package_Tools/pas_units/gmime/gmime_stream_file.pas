unit gmime_stream_file;

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
{$ifndef __GMIME_STREAM_FILE_H__}
{$define __GMIME_STREAM_FILE_H__}
{$include <glib.h>}
{$include <stdio.h>}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamFile:
 * @parent_object: parent #GMimeStream
 * @owner: %TRUE if this stream owns @fd
 * @fp: standard-c FILE pointer
 *
 * A #GMimeStream wrapper around standard-c FILE pointers.
 * }
  PGMimeStreamFile = ^TGMimeStreamFile;
  TGMimeStreamFile = record
      parent_object : TGMimeStream;
      owner : Tgboolean;
      fp : PFILE;
    end;

  PGMimeStreamFileClass = ^TGMimeStreamFileClass;
  TGMimeStreamFileClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_file_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_file_new(fp:PFILE):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_file_new_with_bounds(fp:PFILE; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_file_open(path:Pchar; mode:Pchar; err:PPGError):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_file_get_owner(stream:PGMimeStreamFile):Tgboolean;cdecl;external libgmime3;
procedure g_mime_stream_file_set_owner(stream:PGMimeStreamFile; owner:Tgboolean);cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_FILE_H__  }

// === Konventiert am: 18-9-25 15:33:52 ===

function GMIME_TYPE_STREAM_FILE : TGType;
function GMIME_STREAM_FILE(obj : Pointer) : PGMimeStreamFile;
function GMIME_STREAM_FILE_CLASS(klass : Pointer) : PGMimeStreamFileClass;
function GMIME_IS_STREAM_FILE(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_FILE_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_FILE_GET_CLASS(obj : Pointer) : PGMimeStreamFileClass;

implementation

function GMIME_TYPE_STREAM_FILE : TGType;
  begin
    GMIME_TYPE_STREAM_FILE:=g_mime_stream_file_get_type;
  end;

function GMIME_STREAM_FILE(obj : Pointer) : PGMimeStreamFile;
begin
  Result := PGMimeStreamFile(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_FILE));
end;

function GMIME_STREAM_FILE_CLASS(klass : Pointer) : PGMimeStreamFileClass;
begin
  Result := PGMimeStreamFileClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_FILE));
end;

function GMIME_IS_STREAM_FILE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_FILE);
end;

function GMIME_IS_STREAM_FILE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_FILE);
end;

function GMIME_STREAM_FILE_GET_CLASS(obj : Pointer) : PGMimeStreamFileClass;
begin
  Result := PGMimeStreamFileClass(PGTypeInstance(obj)^.g_class);
end;



end.
