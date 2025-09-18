unit gmime_stream_filter;

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
{$ifndef __GMIME_STREAM_FILTER_H__}
{$define __GMIME_STREAM_FILTER_H__}
{$include <gmime/gmime-stream.h>}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeStreamFilter:
 * @parent_object: parent #GMimeStream
 * @priv: private state data
 * @source: source stream
 *
 * A #GMimeStream which passes data through any #GMimeFilter objects.
 * }
  PGMimeStreamFilter = ^TGMimeStreamFilter;
  TGMimeStreamFilter = record
      parent_object : TGMimeStream;
      priv : PGMimeStreamFilterPrivate;
      source : PGMimeStream;
      owner : Tgboolean;
    end;

  PGMimeStreamFilterClass = ^TGMimeStreamFilterClass;
  TGMimeStreamFilterClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_filter_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_filter_new(stream:PGMimeStream):PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_filter_add(stream:PGMimeStreamFilter; filter:PGMimeFilter):longint;cdecl;external libgmime3;
procedure g_mime_stream_filter_remove(stream:PGMimeStreamFilter; id:longint);cdecl;external libgmime3;
procedure g_mime_stream_filter_set_owner(stream:PGMimeStreamFilter; owner:Tgboolean);cdecl;external libgmime3;
function g_mime_stream_filter_get_owner(stream:PGMimeStreamFilter):Tgboolean;cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_FILTER_H__  }

// === Konventiert am: 18-9-25 15:33:56 ===

function GMIME_TYPE_STREAM_FILTER : TGType;
function GMIME_STREAM_FILTER(obj : Pointer) : PGMimeStreamFilter;
function GMIME_STREAM_FILTER_CLASS(klass : Pointer) : PGMimeStreamFilterClass;
function GMIME_IS_STREAM_FILTER(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_FILTER_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_FILTER_GET_CLASS(obj : Pointer) : PGMimeStreamFilterClass;

implementation

function GMIME_TYPE_STREAM_FILTER : TGType;
  begin
    GMIME_TYPE_STREAM_FILTER:=g_mime_stream_filter_get_type;
  end;

function GMIME_STREAM_FILTER(obj : Pointer) : PGMimeStreamFilter;
begin
  Result := PGMimeStreamFilter(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_FILTER));
end;

function GMIME_STREAM_FILTER_CLASS(klass : Pointer) : PGMimeStreamFilterClass;
begin
  Result := PGMimeStreamFilterClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_FILTER));
end;

function GMIME_IS_STREAM_FILTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_FILTER);
end;

function GMIME_IS_STREAM_FILTER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_FILTER);
end;

function GMIME_STREAM_FILTER_GET_CLASS(obj : Pointer) : PGMimeStreamFilterClass;
begin
  Result := PGMimeStreamFilterClass(PGTypeInstance(obj)^.g_class);
end;



end.
