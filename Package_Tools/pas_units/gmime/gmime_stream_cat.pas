unit gmime_stream_cat;

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
{$ifndef __GMIME_STREAM_CAT_H__}
{$define __GMIME_STREAM_CAT_H__}
{$include <glib.h>}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeStreamCat:
 * @parent_object: parent #GMimeStream
 * @sources: list of sources
 * @current: current source
 *
 * A concatenation of other #GMimeStream objects.
 * }
  PGMimeStreamCat = ^TGMimeStreamCat;
  TGMimeStreamCat = record
      parent_object : TGMimeStream;
      sources : Pcat_node;
      current : Pcat_node;
    end;

  PGMimeStreamCatClass = ^TGMimeStreamCatClass;
  TGMimeStreamCatClass = record
      parent_class : TGMimeStreamClass;
    end;


function g_mime_stream_cat_get_type:TGType;cdecl;external libgmime3;
function g_mime_stream_cat_new:PGMimeStream;cdecl;external libgmime3;
function g_mime_stream_cat_add_source(cat:PGMimeStreamCat; source:PGMimeStream):longint;cdecl;external libgmime3;
{$endif}
{ __GMIME_STREAM_CAT_H__  }

// === Konventiert am: 18-9-25 15:33:48 ===

function GMIME_TYPE_STREAM_CAT : TGType;
function GMIME_STREAM_CAT(obj : Pointer) : PGMimeStreamCat;
function GMIME_STREAM_CAT_CLASS(klass : Pointer) : PGMimeStreamCatClass;
function GMIME_IS_STREAM_CAT(obj : Pointer) : Tgboolean;
function GMIME_IS_STREAM_CAT_CLASS(klass : Pointer) : Tgboolean;
function GMIME_STREAM_CAT_GET_CLASS(obj : Pointer) : PGMimeStreamCatClass;

implementation

function GMIME_TYPE_STREAM_CAT : TGType;
  begin
    GMIME_TYPE_STREAM_CAT:=g_mime_stream_cat_get_type;
  end;

function GMIME_STREAM_CAT(obj : Pointer) : PGMimeStreamCat;
begin
  Result := PGMimeStreamCat(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_CAT));
end;

function GMIME_STREAM_CAT_CLASS(klass : Pointer) : PGMimeStreamCatClass;
begin
  Result := PGMimeStreamCatClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_CAT));
end;

function GMIME_IS_STREAM_CAT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_STREAM_CAT);
end;

function GMIME_IS_STREAM_CAT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_STREAM_CAT);
end;

function GMIME_STREAM_CAT_GET_CLASS(obj : Pointer) : PGMimeStreamCatClass;
begin
  Result := PGMimeStreamCatClass(PGTypeInstance(obj)^.g_class);
end;



end.
