
unit gmime_stream_fs;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_stream_fs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_stream_fs.h
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
PGError  = ^GError;
PGMimeStream  = ^GMimeStream;
PGMimeStreamFs  = ^GMimeStreamFs;
PGMimeStreamFsClass  = ^GMimeStreamFsClass;
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

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_FS : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_FS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_FS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_FS(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_FS_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_FS_GET_CLASS(obj : longint) : longint;

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


function g_mime_stream_fs_get_type:TGType;cdecl;external;
function g_mime_stream_fs_new(fd:longint):PGMimeStream;cdecl;external;
function g_mime_stream_fs_new_with_bounds(fd:longint; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;external;
(* Const before type ignored *)
function g_mime_stream_fs_open(path:Pchar; flags:longint; mode:longint; err:PPGError):PGMimeStream;cdecl;external;
function g_mime_stream_fs_get_owner(stream:PGMimeStreamFs):Tgboolean;cdecl;external;
procedure g_mime_stream_fs_set_owner(stream:PGMimeStreamFs; owner:Tgboolean);cdecl;external;
{$endif}
{ __GMIME_STREAM_FS_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_STREAM_FS : longint; { return type might be wrong }
  begin
    GMIME_TYPE_STREAM_FS:=g_mime_stream_fs_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_FS(obj : longint) : longint;
begin
  GMIME_STREAM_FS:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_STREAM_FS,GMimeStreamFs);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_FS_CLASS(klass : longint) : longint;
begin
  GMIME_STREAM_FS_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_STREAM_FS,GMimeStreamFsClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_FS(obj : longint) : longint;
begin
  GMIME_IS_STREAM_FS:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_STREAM_FS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_STREAM_FS_CLASS(klass : longint) : longint;
begin
  GMIME_IS_STREAM_FS_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_STREAM_FS);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_STREAM_FS_GET_CLASS(obj : longint) : longint;
begin
  GMIME_STREAM_FS_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_STREAM_FS,GMimeStreamFsClass);
end;


end.
