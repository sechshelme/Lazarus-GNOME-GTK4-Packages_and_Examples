unit gmime_filter_charset;

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
{$ifndef __GMIME_FILTER_CHARSET_H__}
{$define __GMIME_FILTER_CHARSET_H__}
{$include <iconv.h>}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterCharset:
 * @parent_object: parent #GMimeFilter
 * @from_charset: charset that the filter is converting from
 * @to_charset: charset the filter is converting to
 * @cd: charset conversion state
 *
 * A filter to convert between charsets.
 * }
  PGMimeFilterCharset = ^TGMimeFilterCharset;
  TGMimeFilterCharset = record
      parent_object : TGMimeFilter;
      from_charset : Pchar;
      to_charset : Pchar;
      cd : Ticonv_t;
    end;

  PGMimeFilterCharsetClass = ^TGMimeFilterCharsetClass;
  TGMimeFilterCharsetClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_charset_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_charset_new(from_charset:Pchar; to_charset:Pchar):PGMimeFilter;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_CHARSET_H__  }

// === Konventiert am: 18-9-25 15:27:21 ===

function GMIME_TYPE_FILTER_CHARSET : TGType;
function GMIME_FILTER_CHARSET(obj : Pointer) : PGMimeFilterCharset;
function GMIME_FILTER_CHARSET_CLASS(klass : Pointer) : PGMimeFilterCharsetClass;
function GMIME_IS_FILTER_CHARSET(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_CHARSET_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_CHARSET_GET_CLASS(obj : Pointer) : PGMimeFilterCharsetClass;

implementation

function GMIME_TYPE_FILTER_CHARSET : TGType;
  begin
    GMIME_TYPE_FILTER_CHARSET:=g_mime_filter_charset_get_type;
  end;

function GMIME_FILTER_CHARSET(obj : Pointer) : PGMimeFilterCharset;
begin
  Result := PGMimeFilterCharset(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_CHARSET));
end;

function GMIME_FILTER_CHARSET_CLASS(klass : Pointer) : PGMimeFilterCharsetClass;
begin
  Result := PGMimeFilterCharsetClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_CHARSET));
end;

function GMIME_IS_FILTER_CHARSET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_CHARSET);
end;

function GMIME_IS_FILTER_CHARSET_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_CHARSET);
end;

function GMIME_FILTER_CHARSET_GET_CLASS(obj : Pointer) : PGMimeFilterCharsetClass;
begin
  Result := PGMimeFilterCharsetClass(PGTypeInstance(obj)^.g_class);
end;



end.
