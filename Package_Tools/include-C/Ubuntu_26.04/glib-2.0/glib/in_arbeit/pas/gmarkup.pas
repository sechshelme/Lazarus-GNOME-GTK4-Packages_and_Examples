unit gmarkup;

interface

uses
  common_GLIB, gtypes, gquark, gerror, gslist;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMarkupError = ^TGMarkupError;
  TGMarkupError = longint;
const
  G_MARKUP_ERROR_BAD_UTF8 = 0;
  G_MARKUP_ERROR_EMPTY = 1;
  G_MARKUP_ERROR_PARSE = 2;
  G_MARKUP_ERROR_UNKNOWN_ELEMENT = 3;
  G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE = 4;
  G_MARKUP_ERROR_INVALID_CONTENT = 5;
  G_MARKUP_ERROR_MISSING_ATTRIBUTE = 6;

function g_markup_error_quark: TGQuark; cdecl; external libglib2;

type
  PGMarkupParseFlags = ^TGMarkupParseFlags;
  TGMarkupParseFlags = longint;
const
  G_MARKUP_DEFAULT_FLAGS = 0;
  G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG = 1 shl 0;
  G_MARKUP_TREAT_CDATA_AS_TEXT = 1 shl 1;
  G_MARKUP_PREFIX_ERROR_POSITION = 1 shl 2;
  G_MARKUP_IGNORE_QUALIFIED = 1 shl 3;

type
  PGMarkupParseContext = type Pointer;

  PGMarkupParser = ^TGMarkupParser;
  TGMarkupParser = record
    start_element: procedure(context: PGMarkupParseContext; element_name: Pgchar; attribute_names: PPgchar; attribute_values: PPgchar; user_data: Tgpointer; error: PPGError); cdecl;
    end_element: procedure(context: PGMarkupParseContext; element_name: Pgchar; user_data: Tgpointer; error: PPGError); cdecl;
    text: procedure(context: PGMarkupParseContext; text: Pgchar; text_len: Tgsize; user_data: Tgpointer; error: PPGError); cdecl;
    passthrough: procedure(context: PGMarkupParseContext; passthrough_text: Pgchar; text_len: Tgsize; user_data: Tgpointer; error: PPGError); cdecl;
    error: procedure(context: PGMarkupParseContext; error: PGError; user_data: Tgpointer); cdecl;
  end;

function g_markup_parse_context_new(parser: PGMarkupParser; flags: TGMarkupParseFlags; user_data: Tgpointer; user_data_dnotify: TGDestroyNotify): PGMarkupParseContext; cdecl; external libglib2;
function g_markup_parse_context_ref(context: PGMarkupParseContext): PGMarkupParseContext; cdecl; external libglib2;
procedure g_markup_parse_context_unref(context: PGMarkupParseContext); cdecl; external libglib2;
procedure g_markup_parse_context_free(context: PGMarkupParseContext); cdecl; external libglib2;
function g_markup_parse_context_parse(context: PGMarkupParseContext; text: Pgchar; text_len: Tgssize; error: PPGError): Tgboolean; cdecl; external libglib2;
procedure g_markup_parse_context_push(context: PGMarkupParseContext; parser: PGMarkupParser; user_data: Tgpointer); cdecl; external libglib2;
function g_markup_parse_context_pop(context: PGMarkupParseContext): Tgpointer; cdecl; external libglib2;
function g_markup_parse_context_end_parse(context: PGMarkupParseContext; error: PPGError): Tgboolean; cdecl; external libglib2;
function g_markup_parse_context_get_element(context: PGMarkupParseContext): Pgchar; cdecl; external libglib2;
function g_markup_parse_context_get_element_stack(context: PGMarkupParseContext): PGSList; cdecl; external libglib2;
procedure g_markup_parse_context_get_position(context: PGMarkupParseContext; line_number: Pgint; char_number: Pgint); cdecl; external libglib2;
function g_markup_parse_context_get_offset(context: PGMarkupParseContext): Tgsize; cdecl; external libglib2;
procedure g_markup_parse_context_get_tag_start(context: PGMarkupParseContext; line_number: Pgsize; char_number: Pgsize; offset: Pgsize); cdecl; external libglib2;
function g_markup_parse_context_get_user_data(context: PGMarkupParseContext): Tgpointer; cdecl; external libglib2;
function g_markup_escape_text(text: Pgchar; length: Tgssize): Pgchar; cdecl; external libglib2;
function g_markup_printf_escaped(format: pchar; args: array of const): Pgchar; cdecl; external libglib2;
function g_markup_printf_escaped(format: pchar): Pgchar; cdecl; external libglib2;
function g_markup_vprintf_escaped(format: pchar; args: Tva_list): Pgchar; cdecl; external libglib2;

type
  PGMarkupCollectType = ^TGMarkupCollectType;
  TGMarkupCollectType = longint;
const
  G_MARKUP_COLLECT_INVALID = 0;
  G_MARKUP_COLLECT_STRING = 1;
  G_MARKUP_COLLECT_STRDUP = 2;
  G_MARKUP_COLLECT_BOOLEAN = 3;
  G_MARKUP_COLLECT_TRISTATE = 4;
  G_MARKUP_COLLECT_OPTIONAL = 1 shl 16;

function g_markup_collect_attributes(element_name: Pgchar; attribute_names: PPgchar; attribute_values: PPgchar; error: PPGError; first_type: TGMarkupCollectType;
  first_attr: Pgchar): Tgboolean; cdecl; varargs; external libglib2;

function G_MARKUP_ERROR: TGQuark;


// === Konventiert am: 22-6-26 17:10:49 ===


implementation


function G_MARKUP_ERROR: TGQuark;
begin
  G_MARKUP_ERROR := g_markup_error_quark;
end;


end.
