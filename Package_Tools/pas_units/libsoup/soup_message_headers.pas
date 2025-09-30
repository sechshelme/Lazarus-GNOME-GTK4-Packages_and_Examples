unit soup_message_headers;

interface

uses
  fp_glib2, fp_soup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSoupMessageHeaders = type Pointer;
  PPSoupMessageHeaders = ^PSoupMessageHeaders;

function soup_message_headers_get_type: TGType; cdecl; external libsoup;

function SOUP_TYPE_MESSAGE_HEADERS: TGType;

type
  PSoupMessageHeadersType = ^TSoupMessageHeadersType;
  TSoupMessageHeadersType = longint;

const
  SOUP_MESSAGE_HEADERS_REQUEST = 0;
  SOUP_MESSAGE_HEADERS_RESPONSE = 1;
  SOUP_MESSAGE_HEADERS_MULTIPART = 2;

function soup_message_headers_new(_type: TSoupMessageHeadersType): PSoupMessageHeaders; cdecl; external libsoup;
function soup_message_headers_ref(hdrs: PSoupMessageHeaders): PSoupMessageHeaders; cdecl; external libsoup;
procedure soup_message_headers_unref(hdrs: PSoupMessageHeaders); cdecl; external libsoup;
procedure soup_message_headers_append(hdrs: PSoupMessageHeaders; name: pchar; value: pchar); cdecl; external libsoup;
procedure soup_message_headers_replace(hdrs: PSoupMessageHeaders; name: pchar; value: pchar); cdecl; external libsoup;
procedure soup_message_headers_remove(hdrs: PSoupMessageHeaders; name: pchar); cdecl; external libsoup;
procedure soup_message_headers_clear(hdrs: PSoupMessageHeaders); cdecl; external libsoup;
procedure soup_message_headers_clean_connection_headers(hdrs: PSoupMessageHeaders); cdecl; external libsoup;
function soup_message_headers_get_one(hdrs: PSoupMessageHeaders; name: pchar): pchar; cdecl; external libsoup;
function soup_message_headers_get_list(hdrs: PSoupMessageHeaders; name: pchar): pchar; cdecl; external libsoup;
function soup_message_headers_header_contains(hdrs: PSoupMessageHeaders; name: pchar; token: pchar): Tgboolean; cdecl; external libsoup;
function soup_message_headers_header_equals(hdrs: PSoupMessageHeaders; name: pchar; value: pchar): Tgboolean; cdecl; external libsoup;

type
  TSoupMessageHeadersForeachFunc = procedure(name: pchar; value: pchar; user_data: Tgpointer); cdecl;

procedure soup_message_headers_foreach(hdrs: PSoupMessageHeaders; func: TSoupMessageHeadersForeachFunc; user_data: Tgpointer); cdecl; external libsoup;
function soup_message_headers_get_headers_type(hdrs: PSoupMessageHeaders): TSoupMessageHeadersType; cdecl; external libsoup;

type
  TSoupMessageHeadersIter = record
    dummy: array[0..2] of Tgpointer;
  end;
  PSoupMessageHeadersIter = ^TSoupMessageHeadersIter;

procedure soup_message_headers_iter_init(iter: PSoupMessageHeadersIter; hdrs: PSoupMessageHeaders); cdecl; external libsoup;
function soup_message_headers_iter_next(iter: PSoupMessageHeadersIter; name: PPchar; value: PPchar): Tgboolean; cdecl; external libsoup;

type
  PSoupEncoding = ^TSoupEncoding;
  TSoupEncoding = longint;

const
  SOUP_ENCODING_UNRECOGNIZED = 0;
  SOUP_ENCODING_NONE = 1;
  SOUP_ENCODING_CONTENT_LENGTH = 2;
  SOUP_ENCODING_EOF = 3;
  SOUP_ENCODING_CHUNKED = 4;
  SOUP_ENCODING_BYTERANGES = 5;

function soup_message_headers_get_encoding(hdrs: PSoupMessageHeaders): TSoupEncoding; cdecl; external libsoup;
procedure soup_message_headers_set_encoding(hdrs: PSoupMessageHeaders; encoding: TSoupEncoding); cdecl; external libsoup;
function soup_message_headers_get_content_length(hdrs: PSoupMessageHeaders): Tgoffset; cdecl; external libsoup;
procedure soup_message_headers_set_content_length(hdrs: PSoupMessageHeaders; content_length: Tgoffset); cdecl; external libsoup;

type
  PSoupExpectation = ^TSoupExpectation;
  TSoupExpectation = longint;

const
  SOUP_EXPECTATION_UNRECOGNIZED = 1 shl 0;
  SOUP_EXPECTATION_CONTINUE = 1 shl 1;

function soup_message_headers_get_expectations(hdrs: PSoupMessageHeaders): TSoupExpectation; cdecl; external libsoup;
procedure soup_message_headers_set_expectations(hdrs: PSoupMessageHeaders; expectations: TSoupExpectation); cdecl; external libsoup;

type
  TSoupRange = record
    start: Tgoffset;
    end_: Tgoffset;
  end;
  PSoupRange = ^TSoupRange;
  PPSoupRange = ^PSoupRange;

function soup_message_headers_get_ranges(hdrs: PSoupMessageHeaders; total_length: Tgoffset; ranges: PPSoupRange; length: Plongint): Tgboolean; cdecl; external libsoup;
procedure soup_message_headers_free_ranges(hdrs: PSoupMessageHeaders; ranges: PSoupRange); cdecl; external libsoup;
procedure soup_message_headers_set_ranges(hdrs: PSoupMessageHeaders; ranges: PSoupRange; length: longint); cdecl; external libsoup;
procedure soup_message_headers_set_range(hdrs: PSoupMessageHeaders; start: Tgoffset; end_: Tgoffset); cdecl; external libsoup;
function soup_message_headers_get_content_range(hdrs: PSoupMessageHeaders; start: Pgoffset; end_: Pgoffset; total_length: Pgoffset): Tgboolean; cdecl; external libsoup;
procedure soup_message_headers_set_content_range(hdrs: PSoupMessageHeaders; start: Tgoffset; end_: Tgoffset; total_length: Tgoffset); cdecl; external libsoup;
function soup_message_headers_get_content_type(hdrs: PSoupMessageHeaders; params: PPGHashTable): pchar; cdecl; external libsoup;
procedure soup_message_headers_set_content_type(hdrs: PSoupMessageHeaders; content_type: pchar; params: PGHashTable); cdecl; external libsoup;
function soup_message_headers_get_content_disposition(hdrs: PSoupMessageHeaders; disposition: PPchar; params: PPGHashTable): Tgboolean; cdecl; external libsoup;
procedure soup_message_headers_set_content_disposition(hdrs: PSoupMessageHeaders; disposition: pchar; params: PGHashTable); cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:27 ===


implementation


function SOUP_TYPE_MESSAGE_HEADERS: TGType;
begin
  SOUP_TYPE_MESSAGE_HEADERS := soup_message_headers_get_type;
end;


end.
