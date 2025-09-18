unit gmime_header_xxxxx;

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
{$ifndef __GMIME_HEADER_H__}
{$define __GMIME_HEADER_H__}
{$include <glib.h>}
{$include <gmime/gmime-format-options.h>}
{$include <gmime/gmime-parser-options.h>}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeHeaderRawValueFormatter:
 * @header: a #GMimeHeader
 * @options: a #GMimeFormatOptions
 * @value: an unencoded header value
 * @charset: a charset
 *
 * Function callback for encoding and formatting a header value.
 *
 * Returns: the encoded and formatted raw header value.
 * }

  PGMimeHeaderRawValueFormatter = ^TGMimeHeaderRawValueFormatter;
  TGMimeHeaderRawValueFormatter = function (header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar):Pchar;cdecl;

function g_mime_header_format_content_disposition(header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_header_format_content_type(header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_header_format_message_id(header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_header_format_references(header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_header_format_addrlist(header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_header_format_received(header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_header_format_default(header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar):Pchar;cdecl;external libgmime3;
{*
 * GMimeHeader:
 * @name: the name of the header
 * @value: the unfolded value of the header
 *
 * A message or mime-part header.
 * }
{ <private>  }
{ <private>  }
type
  PGMimeHeader = ^TGMimeHeader;
  TGMimeHeader = record
      parent_object : TGObject;cdecl;
      name : Pchar;
      value : Pchar;
      formatter : TGMimeHeaderRawValueFormatter;
      options : PGMimeParserOptions;
      reformat : Tgboolean;
      changed : Tgpointer;
      raw_value : Pchar;
      raw_name : Pchar;
      charset : Pchar;
      offset : Tgint64;
    end;

  PGMimeHeaderClass = ^TGMimeHeaderClass;
  TGMimeHeaderClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_header_get_type:TGType;cdecl;external libgmime3;
function g_mime_header_get_name(header:PGMimeHeader):Pchar;cdecl;external libgmime3;
function g_mime_header_get_raw_name(header:PGMimeHeader):Pchar;cdecl;external libgmime3;
function g_mime_header_get_value(header:PGMimeHeader):Pchar;cdecl;external libgmime3;
procedure g_mime_header_set_value(header:PGMimeHeader; options:PGMimeFormatOptions; value:Pchar; charset:Pchar);cdecl;external libgmime3;
function g_mime_header_get_raw_value(header:PGMimeHeader):Pchar;cdecl;external libgmime3;
procedure g_mime_header_set_raw_value(header:PGMimeHeader; raw_value:Pchar);cdecl;external libgmime3;
function g_mime_header_get_offset(header:PGMimeHeader):Tgint64;cdecl;external libgmime3;
function g_mime_header_write_to_stream(header:PGMimeHeader; options:PGMimeFormatOptions; stream:PGMimeStream):Tssize_t;cdecl;external libgmime3;
{*
 * GMimeHeaderList:
 *
 * A list of message or mime-part headers.
 * }
{ < private >  }
type
  PGMimeHeaderList = ^TGMimeHeaderList;
  TGMimeHeaderList = record
      parent_object : TGObject;
      options : PGMimeParserOptions;
      changed : Tgpointer;
      hash : PGHashTable;
      array : PGPtrArray;
    end;

  PGMimeHeaderListClass = ^TGMimeHeaderListClass;
  TGMimeHeaderListClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_header_list_get_type:TGType;cdecl;external libgmime3;
function g_mime_header_list_new(options:PGMimeParserOptions):PGMimeHeaderList;cdecl;external libgmime3;
procedure g_mime_header_list_clear(headers:PGMimeHeaderList);cdecl;external libgmime3;
function g_mime_header_list_get_count(headers:PGMimeHeaderList):longint;cdecl;external libgmime3;
function g_mime_header_list_contains(headers:PGMimeHeaderList; name:Pchar):Tgboolean;cdecl;external libgmime3;
procedure g_mime_header_list_prepend(headers:PGMimeHeaderList; name:Pchar; value:Pchar; charset:Pchar);cdecl;external libgmime3;
procedure g_mime_header_list_append(headers:PGMimeHeaderList; name:Pchar; value:Pchar; charset:Pchar);cdecl;external libgmime3;
procedure g_mime_header_list_set(headers:PGMimeHeaderList; name:Pchar; value:Pchar; charset:Pchar);cdecl;external libgmime3;
function g_mime_header_list_get_header(headers:PGMimeHeaderList; name:Pchar):PGMimeHeader;cdecl;external libgmime3;
function g_mime_header_list_get_header_at(headers:PGMimeHeaderList; index:longint):PGMimeHeader;cdecl;external libgmime3;
function g_mime_header_list_remove(headers:PGMimeHeaderList; name:Pchar):Tgboolean;cdecl;external libgmime3;
procedure g_mime_header_list_remove_at(headers:PGMimeHeaderList; index:longint);cdecl;external libgmime3;
function g_mime_header_list_write_to_stream(headers:PGMimeHeaderList; options:PGMimeFormatOptions; stream:PGMimeStream):Tssize_t;cdecl;external libgmime3;
function g_mime_header_list_to_string(headers:PGMimeHeaderList; options:PGMimeFormatOptions):Pchar;cdecl;external libgmime3;
{$endif}
{ __GMIME_HEADER_H__  }

// === Konventiert am: 18-9-25 15:29:03 ===

function GMIME_TYPE_HEADER_LIST : TGType;
function GMIME_HEADER_LIST(obj : Pointer) : PGMimeHeaderList;
function GMIME_HEADER_LIST_CLASS(klass : Pointer) : PGMimeHeaderListClass;
function GMIME_IS_HEADER_LIST(obj : Pointer) : Tgboolean;
function GMIME_IS_HEADER_LIST_CLASS(klass : Pointer) : Tgboolean;
function GMIME_HEADER_LIST_GET_CLASS(obj : Pointer) : PGMimeHeaderListClass;

implementation

function GMIME_TYPE_HEADER_LIST : TGType;
  begin
    GMIME_TYPE_HEADER_LIST:=g_mime_header_list_get_type;
  end;

function GMIME_HEADER_LIST(obj : Pointer) : PGMimeHeaderList;
begin
  Result := PGMimeHeaderList(g_type_check_instance_cast(obj, GMIME_TYPE_HEADER_LIST));
end;

function GMIME_HEADER_LIST_CLASS(klass : Pointer) : PGMimeHeaderListClass;
begin
  Result := PGMimeHeaderListClass(g_type_check_class_cast(klass, GMIME_TYPE_HEADER_LIST));
end;

function GMIME_IS_HEADER_LIST(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_HEADER_LIST);
end;

function GMIME_IS_HEADER_LIST_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_HEADER_LIST);
end;

function GMIME_HEADER_LIST_GET_CLASS(obj : Pointer) : PGMimeHeaderListClass;
begin
  Result := PGMimeHeaderListClass(PGTypeInstance(obj)^.g_class);
end;



end.
