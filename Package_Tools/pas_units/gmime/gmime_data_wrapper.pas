unit gmime_data_wrapper;

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
{$ifndef __GMIME_DATA_WRAPPER_H__}
{$define __GMIME_DATA_WRAPPER_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-content-type.h>}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-stream.h>}
{$include <gmime/gmime-utils.h>}

type
{*
 * GMimeDataWrapper:
 * @parent_object: parent #GObject
 * @encoding: the encoding of the content
 * @stream: content stream
 *
 * A wrapper for a stream which may be encoded.
 * }
  PGMimeDataWrapper = ^TGMimeDataWrapper;
  TGMimeDataWrapper = record
      parent_object : TGObject;
      encoding : TGMimeContentEncoding;
      stream : PGMimeStream;
    end;

  PGMimeDataWrapperClass = ^TGMimeDataWrapperClass;
  TGMimeDataWrapperClass = record
      parent_class : TGObjectClass;
      write_to_stream : function (wrapper:PGMimeDataWrapper; stream:PGMimeStream):Tssize_t;cdecl;
    end;


function g_mime_data_wrapper_get_type:TGType;cdecl;external libgmime3;
function g_mime_data_wrapper_new:PGMimeDataWrapper;cdecl;external libgmime3;
function g_mime_data_wrapper_new_with_stream(stream:PGMimeStream; encoding:TGMimeContentEncoding):PGMimeDataWrapper;cdecl;external libgmime3;
procedure g_mime_data_wrapper_set_stream(wrapper:PGMimeDataWrapper; stream:PGMimeStream);cdecl;external libgmime3;
function g_mime_data_wrapper_get_stream(wrapper:PGMimeDataWrapper):PGMimeStream;cdecl;external libgmime3;
procedure g_mime_data_wrapper_set_encoding(wrapper:PGMimeDataWrapper; encoding:TGMimeContentEncoding);cdecl;external libgmime3;
function g_mime_data_wrapper_get_encoding(wrapper:PGMimeDataWrapper):TGMimeContentEncoding;cdecl;external libgmime3;
function g_mime_data_wrapper_write_to_stream(wrapper:PGMimeDataWrapper; stream:PGMimeStream):Tssize_t;cdecl;external libgmime3;
{$endif}
{ __GMIME_DATA_WRAPPER_H__  }

// === Konventiert am: 18-9-25 15:26:33 ===

function GMIME_TYPE_DATA_WRAPPER : TGType;
function GMIME_DATA_WRAPPER(obj : Pointer) : PGMimeDataWrapper;
function GMIME_DATA_WRAPPER_CLASS(klass : Pointer) : PGMimeDataWrapperClass;
function GMIME_IS_DATA_WRAPPER(obj : Pointer) : Tgboolean;
function GMIME_IS_DATA_WRAPPER_CLASS(klass : Pointer) : Tgboolean;
function GMIME_DATA_WRAPPER_GET_CLASS(obj : Pointer) : PGMimeDataWrapperClass;

implementation

function GMIME_TYPE_DATA_WRAPPER : TGType;
  begin
    GMIME_TYPE_DATA_WRAPPER:=g_mime_data_wrapper_get_type;
  end;

function GMIME_DATA_WRAPPER(obj : Pointer) : PGMimeDataWrapper;
begin
  Result := PGMimeDataWrapper(g_type_check_instance_cast(obj, GMIME_TYPE_DATA_WRAPPER));
end;

function GMIME_DATA_WRAPPER_CLASS(klass : Pointer) : PGMimeDataWrapperClass;
begin
  Result := PGMimeDataWrapperClass(g_type_check_class_cast(klass, GMIME_TYPE_DATA_WRAPPER));
end;

function GMIME_IS_DATA_WRAPPER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_DATA_WRAPPER);
end;

function GMIME_IS_DATA_WRAPPER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_DATA_WRAPPER);
end;

function GMIME_DATA_WRAPPER_GET_CLASS(obj : Pointer) : PGMimeDataWrapperClass;
begin
  Result := PGMimeDataWrapperClass(PGTypeInstance(obj)^.g_class);
end;



end.
