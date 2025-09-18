unit gmime_stream_gio;

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
{$ifndef __GMIME_STREAM_GIO_H__}
{$define __GMIME_STREAM_GIO_H__}
{$include <gio/gio.h>}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamGIO:
 * @parent_object: parent #GMimeStream
 * @ostream: a #GOutputStream
 * @istream: a #GInputStream
 * @file: a #GFile
 * @owner: %TRUE if this stream owns the #GFile or %FALSE otherwise
 * @eos: %TRUE if the end of the stream has been reached or %FALSE otherwise
 *
 * A #GMimeStream wrapper around GLib's GIO streams.
 * }
  PGMimeStreamGIO = ^TGMimeStreamGIO;
  TGMimeStreamGIO = record
      parent_object : TGMimeStream;
      ostream : PGOutputStream;
      istream : PGInputStream;
      file : PGFile;
      owner : Tgboolean;
      eos : Tgboolean;
    end;

  PGMimeStreamGIOClass = ^TGMimeStreamGIOClass;
  TGMimeStreamGIOClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_gio_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_gio_new(file:PGFile):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_gio_new_with_bounds(file:PGFile; start:Tgint64; end:Tgint64):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_gio_get_owner(stream:PGMimeStreamGIO):Tgboolean;cdecl;external libgmime3;
procedure g_mime_stream_gio_set_owner(stream:PGMimeStreamGIO; owner:Tgboolean);cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_GIO_H__  }

// === Konventiert am: 18-9-25 15:34:05 ===

function GMIME_TYPE_STREAM_GIO : TGType;
function GMIME_STREAM_GIO(obj : Pointer) : PGMimeStreamGIO;
function GMIME_STREAM_GIO_CLASS(klass : Pointer) : PGMimeStreamGIOClass;
function GMIME_IS_STREAM_GIO(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_GIO_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_GIO_GET_CLASS(obj : Pointer) : PGMimeStreamGIOClass;

implementation

function GMIME_TYPE_STREAM_GIO : TGType;
  begin
    GMIME_TYPE_STREAM_GIO:=g_mime_stream_gio_get_type;
  end;

function GMIME_STREAM_GIO(obj : Pointer) : PGMimeStreamGIO;
begin
  Result := PGMimeStreamGIO(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_GIO));
end;

function GMIME_STREAM_GIO_CLASS(klass : Pointer) : PGMimeStreamGIOClass;
begin
  Result := PGMimeStreamGIOClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_GIO));
end;

function GMIME_IS_STREAM_GIO(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_GIO);
end;

function GMIME_IS_STREAM_GIO_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_GIO);
end;

function GMIME_STREAM_GIO_GET_CLASS(obj : Pointer) : PGMimeStreamGIOClass;
begin
  Result := PGMimeStreamGIOClass(PGTypeInstance(obj)^.g_class);
end;



end.
