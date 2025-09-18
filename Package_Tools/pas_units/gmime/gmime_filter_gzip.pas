unit gmime_filter_gzip;

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
{$ifndef __GMIME_FILTER_GZIP_H__}
{$define __GMIME_FILTER_GZIP_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterGZipMode:
 * @GMIME_FILTER_GZIP_MODE_ZIP: Compress (zip) mode.
 * @GMIME_FILTER_GZIP_MODE_UNZIP: Uncompress (unzip) mode.
 *
 * The mode for the #GMimeFilterGZip filter.
 * }

  PGMimeFilterGZipMode = ^TGMimeFilterGZipMode;
  TGMimeFilterGZipMode =  Longint;
  Const
    GMIME_FILTER_GZIP_MODE_ZIP = 0;
    GMIME_FILTER_GZIP_MODE_UNZIP = 1;
;
{*
 * GMimeFilterGZip:
 * @parent_object: parent #GMimeFilter
 * @priv: private state data
 * @mode: #GMimeFilterGZipMode
 * @level: compression level
 *
 * A filter for compresing or decompressing a gzip stream.
 * }
type
  PGMimeFilterGZip = ^TGMimeFilterGZip;
  TGMimeFilterGZip = record
      parent_object : TGMimeFilter;
      priv : PGMimeFilterGZipPrivate;
      mode : TGMimeFilterGZipMode;
      level : longint;
    end;

  PGMimeFilterGZipClass = ^TGMimeFilterGZipClass;
  TGMimeFilterGZipClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_gzip_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_gzip_new(mode:TGMimeFilterGZipMode; level:longint):PGMimeFilter;cdecl;external libgmime3;
function g_mime_filter_gzip_get_filename(gzip:PGMimeFilterGZip):Pchar;cdecl;external libgmime3;
procedure g_mime_filter_gzip_set_filename(gzip:PGMimeFilterGZip; filename:Pchar);cdecl;external libgmime3;
function g_mime_filter_gzip_get_comment(gzip:PGMimeFilterGZip):Pchar;cdecl;external libgmime3;
procedure g_mime_filter_gzip_set_comment(gzip:PGMimeFilterGZip; comment:Pchar);cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_GZIP_H__  }

// === Konventiert am: 18-9-25 15:27:46 ===

function GMIME_TYPE_FILTER_GZIP : TGType;
function GMIME_FILTER_GZIP(obj : Pointer) : PGMimeFilterGZip;
function GMIME_FILTER_GZIP_CLASS(klass : Pointer) : PGMimeFilterGZipClass;
function GMIME_IS_FILTER_GZIP(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_GZIP_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_GZIP_GET_CLASS(obj : Pointer) : PGMimeFilterGZipClass;

implementation

function GMIME_TYPE_FILTER_GZIP : TGType;
  begin
    GMIME_TYPE_FILTER_GZIP:=g_mime_filter_gzip_get_type;
  end;

function GMIME_FILTER_GZIP(obj : Pointer) : PGMimeFilterGZip;
begin
  Result := PGMimeFilterGZip(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_GZIP));
end;

function GMIME_FILTER_GZIP_CLASS(klass : Pointer) : PGMimeFilterGZipClass;
begin
  Result := PGMimeFilterGZipClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_GZIP));
end;

function GMIME_IS_FILTER_GZIP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_GZIP);
end;

function GMIME_IS_FILTER_GZIP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_GZIP);
end;

function GMIME_FILTER_GZIP_GET_CLASS(obj : Pointer) : PGMimeFilterGZipClass;
begin
  Result := PGMimeFilterGZipClass(PGTypeInstance(obj)^.g_class);
end;



end.
