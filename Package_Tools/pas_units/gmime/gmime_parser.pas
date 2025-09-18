unit gmime_parser;

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
{$ifndef __GMIME_PARSER_H__}
{$define __GMIME_PARSER_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <errno.h>}
{$include <gmime/gmime-object.h>}
{$include <gmime/gmime-message.h>}
{$include <gmime/gmime-content-type.h>}
{$include <gmime/gmime-parser-options.h>}
{$include <gmime/gmime-stream.h>}

type
{*
 * GMimeFormat:
 * @GMIME_FORMAT_MESSAGE: The stream contains a single message.
 * @GMIME_FORMAT_MBOX: The stream is in the UNIX mbox format.
 * @GMIME_FORMAT_MMDF: The stream is in the MMDF format.
 *
 * An enum of formats.
 * }

  PGMimeFormat = ^TGMimeFormat;
  TGMimeFormat =  Longint;
  Const
    GMIME_FORMAT_MESSAGE = 0;
    GMIME_FORMAT_MBOX = 1;
    GMIME_FORMAT_MMDF = 2;
;
{*
 * GMimeParser:
 * @parent_object: parent #GObject
 * @priv: private parser state
 *
 * A MIME parser context.
 * }
type
  PGMimeParser = ^TGMimeParser;
  TGMimeParser = record
      parent_object : TGObject;
      priv : PGMimeParserPrivate;
    end;

  PGMimeParserClass = ^TGMimeParserClass;
  TGMimeParserClass = record
      parent_class : TGObjectClass;
    end;

{*
 * GMimeParserHeaderRegexFunc:
 * @parser: The #GMimeParser object.
 * @header: The header field matched.
 * @value: The header field value.
 * @offset: The header field offset.
 * @user_data: The user-supplied callback data.
 *
 * Function signature for the callback to
 * g_mime_parser_set_header_regex().
 * }

  TGMimeParserHeaderRegexFunc = procedure (parser:PGMimeParser; header:Pchar; value:Pchar; offset:Tgint64; user_data:Tgpointer);cdecl;

function g_mime_parser_get_type:TGType;cdecl;external libgmime3;
function g_mime_parser_new:PGMimeParser;cdecl;external libgmime3;
function g_mime_parser_new_with_stream(stream:PGMimeStream):PGMimeParser;cdecl;external libgmime3;
procedure g_mime_parser_init_with_stream(parser:PGMimeParser; stream:PGMimeStream);cdecl;external libgmime3;
function g_mime_parser_get_persist_stream(parser:PGMimeParser):Tgboolean;cdecl;external libgmime3;
procedure g_mime_parser_set_persist_stream(parser:PGMimeParser; persist:Tgboolean);cdecl;external libgmime3;
function g_mime_parser_get_format(parser:PGMimeParser):TGMimeFormat;cdecl;external libgmime3;
procedure g_mime_parser_set_format(parser:PGMimeParser; format:TGMimeFormat);cdecl;external libgmime3;
function g_mime_parser_get_respect_content_length(parser:PGMimeParser):Tgboolean;cdecl;external libgmime3;
procedure g_mime_parser_set_respect_content_length(parser:PGMimeParser; respect_content_length:Tgboolean);cdecl;external libgmime3;
procedure g_mime_parser_set_header_regex(parser:PGMimeParser; regex:Pchar; header_cb:TGMimeParserHeaderRegexFunc; user_data:Tgpointer);cdecl;external libgmime3;
function g_mime_parser_construct_part(parser:PGMimeParser; options:PGMimeParserOptions):PGMimeObject;cdecl;external libgmime3;
function g_mime_parser_construct_message(parser:PGMimeParser; options:PGMimeParserOptions):PGMimeMessage;cdecl;external libgmime3;
function g_mime_parser_tell(parser:PGMimeParser):Tgint64;cdecl;external libgmime3;
function g_mime_parser_eos(parser:PGMimeParser):Tgboolean;cdecl;external libgmime3;
function g_mime_parser_get_mbox_marker(parser:PGMimeParser):Pchar;cdecl;external libgmime3;
function g_mime_parser_get_mbox_marker_offset(parser:PGMimeParser):Tgint64;cdecl;external libgmime3;
function g_mime_parser_get_headers_begin(parser:PGMimeParser):Tgint64;cdecl;external libgmime3;
function g_mime_parser_get_headers_end(parser:PGMimeParser):Tgint64;cdecl;external libgmime3;
{$endif}
{ __GMIME_PARSER_H__  }

// === Konventiert am: 18-9-25 15:32:40 ===

function GMIME_TYPE_PARSER : TGType;
function GMIME_PARSER(obj : Pointer) : PGMimeParser;
function GMIME_PARSER_CLASS(klass : Pointer) : PGMimeParserClass;
function GMIME_IS_PARSER(obj : Pointer) : Tgboolean;
function GMIME_IS_PARSER_CLASS(klass : Pointer) : Tgboolean;
function GMIME_PARSER_GET_CLASS(obj : Pointer) : PGMimeParserClass;

implementation

function GMIME_TYPE_PARSER : TGType;
  begin
    GMIME_TYPE_PARSER:=g_mime_parser_get_type;
  end;

function GMIME_PARSER(obj : Pointer) : PGMimeParser;
begin
  Result := PGMimeParser(g_type_check_instance_cast(obj, GMIME_TYPE_PARSER));
end;

function GMIME_PARSER_CLASS(klass : Pointer) : PGMimeParserClass;
begin
  Result := PGMimeParserClass(g_type_check_class_cast(klass, GMIME_TYPE_PARSER));
end;

function GMIME_IS_PARSER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_PARSER);
end;

function GMIME_IS_PARSER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_PARSER);
end;

function GMIME_PARSER_GET_CLASS(obj : Pointer) : PGMimeParserClass;
begin
  Result := PGMimeParserClass(PGTypeInstance(obj)^.g_class);
end;



end.
