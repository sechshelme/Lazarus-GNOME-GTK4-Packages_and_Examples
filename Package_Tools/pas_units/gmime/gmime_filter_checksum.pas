unit gmime_filter_checksum;

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
{$ifndef __GMIME_FILTER_MD5_H__}
{$define __GMIME_FILTER_MD5_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterChecksum:
 * @parent_object: parent #GMimeFilter
 * @checksum: The checksum context
 *
 * A filter for calculating the checksum of a stream.
 * }
  PGMimeFilterChecksum = ^TGMimeFilterChecksum;
  TGMimeFilterChecksum = record
      parent_object : TGMimeFilter;
      checksum : PGChecksum;
    end;

  PGMimeFilterChecksumClass = ^TGMimeFilterChecksumClass;
  TGMimeFilterChecksumClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_checksum_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_checksum_new(_type:TGChecksumType):PGMimeFilter;cdecl;external libgmime3;
function g_mime_filter_checksum_get_digest(checksum:PGMimeFilterChecksum; digest:Pbyte; len:Tsize_t):Tsize_t;cdecl;external libgmime3;
function g_mime_filter_checksum_get_string(checksum:PGMimeFilterChecksum):Pgchar;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_CHECKSUM_H__  }

// === Konventiert am: 18-9-25 15:27:25 ===

function GMIME_TYPE_FILTER_CHECKSUM : TGType;
function GMIME_FILTER_CHECKSUM(obj : Pointer) : PGMimeFilterChecksum;
function GMIME_FILTER_CHECKSUM_CLASS(klass : Pointer) : PGMimeFilterChecksumClass;
function GMIME_IS_FILTER_CHECKSUM(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_CHECKSUM_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_CHECKSUM_GET_CLASS(obj : Pointer) : PGMimeFilterChecksumClass;

implementation

function GMIME_TYPE_FILTER_CHECKSUM : TGType;
  begin
    GMIME_TYPE_FILTER_CHECKSUM:=g_mime_filter_checksum_get_type;
  end;

function GMIME_FILTER_CHECKSUM(obj : Pointer) : PGMimeFilterChecksum;
begin
  Result := PGMimeFilterChecksum(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_CHECKSUM));
end;

function GMIME_FILTER_CHECKSUM_CLASS(klass : Pointer) : PGMimeFilterChecksumClass;
begin
  Result := PGMimeFilterChecksumClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_CHECKSUM));
end;

function GMIME_IS_FILTER_CHECKSUM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_CHECKSUM);
end;

function GMIME_IS_FILTER_CHECKSUM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_CHECKSUM);
end;

function GMIME_FILTER_CHECKSUM_GET_CLASS(obj : Pointer) : PGMimeFilterChecksumClass;
begin
  Result := PGMimeFilterChecksumClass(PGTypeInstance(obj)^.g_class);
end;



end.
