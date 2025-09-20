unit gmime_parser;

interface

uses
  fp_glib2, fp_gmime3, gmime_stream, gmime_parser_options, gmime_object, gmime_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeFormat = ^TGMimeFormat;
  TGMimeFormat = longint;

const
  GMIME_FORMAT_MESSAGE = 0;
  GMIME_FORMAT_MBOX = 1;
  GMIME_FORMAT_MMDF = 2;

type
  PGMimeParserPrivate = type Pointer;

  TGMimeParser = record
    parent_object: TGObject;
    priv: PGMimeParserPrivate;
  end;
  PGMimeParser = ^TGMimeParser;

  TGMimeParserClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeParserClass = ^TGMimeParserClass;

  TGMimeParserHeaderRegexFunc = procedure(parser: PGMimeParser; header: pchar; value: pchar; offset: Tgint64; user_data: Tgpointer); cdecl;

function g_mime_parser_get_type: TGType; cdecl; external libgmime3;
function g_mime_parser_new: PGMimeParser; cdecl; external libgmime3;
function g_mime_parser_new_with_stream(stream: PGMimeStream): PGMimeParser; cdecl; external libgmime3;
procedure g_mime_parser_init_with_stream(parser: PGMimeParser; stream: PGMimeStream); cdecl; external libgmime3;
function g_mime_parser_get_persist_stream(parser: PGMimeParser): Tgboolean; cdecl; external libgmime3;
procedure g_mime_parser_set_persist_stream(parser: PGMimeParser; persist: Tgboolean); cdecl; external libgmime3;
function g_mime_parser_get_format(parser: PGMimeParser): TGMimeFormat; cdecl; external libgmime3;
procedure g_mime_parser_set_format(parser: PGMimeParser; format: TGMimeFormat); cdecl; external libgmime3;
function g_mime_parser_get_respect_content_length(parser: PGMimeParser): Tgboolean; cdecl; external libgmime3;
procedure g_mime_parser_set_respect_content_length(parser: PGMimeParser; respect_content_length: Tgboolean); cdecl; external libgmime3;
procedure g_mime_parser_set_header_regex(parser: PGMimeParser; regex: pchar; header_cb: TGMimeParserHeaderRegexFunc; user_data: Tgpointer); cdecl; external libgmime3;
function g_mime_parser_construct_part(parser: PGMimeParser; options: PGMimeParserOptions): PGMimeObject; cdecl; external libgmime3;
function g_mime_parser_construct_message(parser: PGMimeParser; options: PGMimeParserOptions): PGMimeMessage; cdecl; external libgmime3;
function g_mime_parser_tell(parser: PGMimeParser): Tgint64; cdecl; external libgmime3;
function g_mime_parser_eos(parser: PGMimeParser): Tgboolean; cdecl; external libgmime3;
function g_mime_parser_get_mbox_marker(parser: PGMimeParser): pchar; cdecl; external libgmime3;
function g_mime_parser_get_mbox_marker_offset(parser: PGMimeParser): Tgint64; cdecl; external libgmime3;
function g_mime_parser_get_headers_begin(parser: PGMimeParser): Tgint64; cdecl; external libgmime3;
function g_mime_parser_get_headers_end(parser: PGMimeParser): Tgint64; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:32:40 ===

function GMIME_TYPE_PARSER: TGType;
function GMIME_PARSER(obj: Pointer): PGMimeParser;
function GMIME_PARSER_CLASS(klass: Pointer): PGMimeParserClass;
function GMIME_IS_PARSER(obj: Pointer): Tgboolean;
function GMIME_IS_PARSER_CLASS(klass: Pointer): Tgboolean;
function GMIME_PARSER_GET_CLASS(obj: Pointer): PGMimeParserClass;

implementation

function GMIME_TYPE_PARSER: TGType;
begin
  GMIME_TYPE_PARSER := g_mime_parser_get_type;
end;

function GMIME_PARSER(obj: Pointer): PGMimeParser;
begin
  Result := PGMimeParser(g_type_check_instance_cast(obj, GMIME_TYPE_PARSER));
end;

function GMIME_PARSER_CLASS(klass: Pointer): PGMimeParserClass;
begin
  Result := PGMimeParserClass(g_type_check_class_cast(klass, GMIME_TYPE_PARSER));
end;

function GMIME_IS_PARSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_PARSER);
end;

function GMIME_IS_PARSER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_PARSER);
end;

function GMIME_PARSER_GET_CLASS(obj: Pointer): PGMimeParserClass;
begin
  Result := PGMimeParserClass(PGTypeInstance(obj)^.g_class);
end;



end.
