unit gmime_filter_basic;

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
{$ifndef __GMIME_FILTER_BASIC_H__}
{$define __GMIME_FILTER_BASIC_H__}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterBasic:
 * @parent_object: parent #GMimeFilter
 * @encoder: #GMimeEncoding state
 *
 * A basic encoder/decoder filter for the MIME encodings.
 * }
  PGMimeFilterBasic = ^TGMimeFilterBasic;
  TGMimeFilterBasic = record
      parent_object : TGMimeFilter;
      encoder : TGMimeEncoding;
    end;

  PGMimeFilterBasicClass = ^TGMimeFilterBasicClass;
  TGMimeFilterBasicClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_basic_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_basic_new(encoding:TGMimeContentEncoding; encode:Tgboolean):PGMimeFilter;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_BASIC_H__  }

// === Konventiert am: 18-9-25 15:27:06 ===

function GMIME_TYPE_FILTER_BASIC : TGType;
function GMIME_FILTER_BASIC(obj : Pointer) : PGMimeFilterBasic;
function GMIME_FILTER_BASIC_CLASS(klass : Pointer) : PGMimeFilterBasicClass;
function GMIME_IS_FILTER_BASIC(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_BASIC_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_BASIC_GET_CLASS(obj : Pointer) : PGMimeFilterBasicClass;

implementation

function GMIME_TYPE_FILTER_BASIC : TGType;
  begin
    GMIME_TYPE_FILTER_BASIC:=g_mime_filter_basic_get_type;
  end;

function GMIME_FILTER_BASIC(obj : Pointer) : PGMimeFilterBasic;
begin
  Result := PGMimeFilterBasic(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_BASIC));
end;

function GMIME_FILTER_BASIC_CLASS(klass : Pointer) : PGMimeFilterBasicClass;
begin
  Result := PGMimeFilterBasicClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_BASIC));
end;

function GMIME_IS_FILTER_BASIC(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_BASIC);
end;

function GMIME_IS_FILTER_BASIC_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_BASIC);
end;

function GMIME_FILTER_BASIC_GET_CLASS(obj : Pointer) : PGMimeFilterBasicClass;
begin
  Result := PGMimeFilterBasicClass(PGTypeInstance(obj)^.g_class);
end;



end.
