
unit gmime_parser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_parser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_parser.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGMimeFormat  = ^GMimeFormat;
PGMimeMessage  = ^GMimeMessage;
PGMimeObject  = ^GMimeObject;
PGMimeParser  = ^GMimeParser;
PGMimeParserClass  = ^GMimeParserClass;
PGMimeParserOptions  = ^GMimeParserOptions;
PGMimeParserPrivate  = ^GMimeParserPrivate;
PGMimeStream  = ^GMimeStream;
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

{ was #define dname def_expr }
function GMIME_TYPE_PARSER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARSER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARSER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARSER_GET_CLASS(obj : longint) : longint;

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
(* Const before type ignored *)
(* Const before type ignored *)

  TGMimeParserHeaderRegexFunc = procedure (parser:PGMimeParser; header:Pchar; value:Pchar; offset:Tgint64; user_data:Tgpointer);cdecl;

function g_mime_parser_get_type:TGType;cdecl;external;
function g_mime_parser_new:PGMimeParser;cdecl;external;
function g_mime_parser_new_with_stream(stream:PGMimeStream):PGMimeParser;cdecl;external;
procedure g_mime_parser_init_with_stream(parser:PGMimeParser; stream:PGMimeStream);cdecl;external;
function g_mime_parser_get_persist_stream(parser:PGMimeParser):Tgboolean;cdecl;external;
procedure g_mime_parser_set_persist_stream(parser:PGMimeParser; persist:Tgboolean);cdecl;external;
function g_mime_parser_get_format(parser:PGMimeParser):TGMimeFormat;cdecl;external;
procedure g_mime_parser_set_format(parser:PGMimeParser; format:TGMimeFormat);cdecl;external;
function g_mime_parser_get_respect_content_length(parser:PGMimeParser):Tgboolean;cdecl;external;
procedure g_mime_parser_set_respect_content_length(parser:PGMimeParser; respect_content_length:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure g_mime_parser_set_header_regex(parser:PGMimeParser; regex:Pchar; header_cb:TGMimeParserHeaderRegexFunc; user_data:Tgpointer);cdecl;external;
function g_mime_parser_construct_part(parser:PGMimeParser; options:PGMimeParserOptions):PGMimeObject;cdecl;external;
function g_mime_parser_construct_message(parser:PGMimeParser; options:PGMimeParserOptions):PGMimeMessage;cdecl;external;
function g_mime_parser_tell(parser:PGMimeParser):Tgint64;cdecl;external;
function g_mime_parser_eos(parser:PGMimeParser):Tgboolean;cdecl;external;
function g_mime_parser_get_mbox_marker(parser:PGMimeParser):Pchar;cdecl;external;
function g_mime_parser_get_mbox_marker_offset(parser:PGMimeParser):Tgint64;cdecl;external;
function g_mime_parser_get_headers_begin(parser:PGMimeParser):Tgint64;cdecl;external;
function g_mime_parser_get_headers_end(parser:PGMimeParser):Tgint64;cdecl;external;
{$endif}
{ __GMIME_PARSER_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_PARSER : longint; { return type might be wrong }
  begin
    GMIME_TYPE_PARSER:=g_mime_parser_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARSER(obj : longint) : longint;
begin
  GMIME_PARSER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_PARSER,GMimeParser);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARSER_CLASS(klass : longint) : longint;
begin
  GMIME_PARSER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_PARSER,GMimeParserClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARSER(obj : longint) : longint;
begin
  GMIME_IS_PARSER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_PARSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_PARSER_CLASS(klass : longint) : longint;
begin
  GMIME_IS_PARSER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_PARSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_PARSER_GET_CLASS(obj : longint) : longint;
begin
  GMIME_PARSER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_PARSER,GMimeParserClass);
end;


end.
