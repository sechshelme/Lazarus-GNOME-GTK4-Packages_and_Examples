unit gmime_stream_null;

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
{$ifndef __GMIME_STREAM_NULL_H__}
{$define __GMIME_STREAM_NULL_H__}
{$include <glib.h>}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamNull:
 * @parent_object: parent #GMimeStream
 * @written: number of bytes written to this stream
 * @newlines: the number of newlines written to this stream
 * @count_newlines: whether or not the stream should count newlines
 *
 * A #GMimeStream which has no backing store.
 * }
  PGMimeStreamNull = ^TGMimeStreamNull;
  TGMimeStreamNull = record
      parent_object : TGMimeStream;
      written : Tsize_t;
      newlines : Tsize_t;
      count_newlines : Tgboolean;
    end;

  PGMimeStreamNullClass = ^TGMimeStreamNullClass;
  TGMimeStreamNullClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_null_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_null_new:PGMimeStream;cdecl;external libgmime3;
procedure g_mime_stream_null_set_count_newlines(stream:PGMimeStreamNull; count:Tgboolean);cdecl;external libgmime3;
function g_mime_stream_null_get_count_newlines(stream:PGMimeStreamNull):Tgboolean;cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_NULL_H__  }

// === Konventiert am: 18-9-25 15:34:18 ===

function GMIME_TYPE_STREAM_NULL : TGType;
function GMIME_STREAM_NULL(obj : Pointer) : PGMimeStreamNull;
function GMIME_STREAM_NULL_CLASS(klass : Pointer) : PGMimeStreamNullClass;
function GMIME_IS_STREAM_NULL(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_NULL_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_NULL_GET_CLASS(obj : Pointer) : PGMimeStreamNullClass;

implementation

function GMIME_TYPE_STREAM_NULL : TGType;
  begin
    GMIME_TYPE_STREAM_NULL:=g_mime_stream_null_get_type;
  end;

function GMIME_STREAM_NULL(obj : Pointer) : PGMimeStreamNull;
begin
  Result := PGMimeStreamNull(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_NULL));
end;

function GMIME_STREAM_NULL_CLASS(klass : Pointer) : PGMimeStreamNullClass;
begin
  Result := PGMimeStreamNullClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_NULL));
end;

function GMIME_IS_STREAM_NULL(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_NULL);
end;

function GMIME_IS_STREAM_NULL_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_NULL);
end;

function GMIME_STREAM_NULL_GET_CLASS(obj : Pointer) : PGMimeStreamNullClass;
begin
  Result := PGMimeStreamNullClass(PGTypeInstance(obj)^.g_class);
end;



end.
