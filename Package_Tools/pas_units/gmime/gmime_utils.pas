unit gmime_utils;

interface

uses
  fp_glib2, fp_gmime3, gmime_parser_options, gmime_format_options, gmime_encodings;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function g_mime_utils_header_decode_date(str: pchar): PGDateTime; cdecl; external libgmime3;
function g_mime_utils_header_format_date(date: PGDateTime): pchar; cdecl; external libgmime3;
function g_mime_utils_generate_message_id(fqdn: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_decode_message_id(message_id: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_structured_header_fold(options: PGMimeParserOptions; format: PGMimeFormatOptions; header: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_unstructured_header_fold(options: PGMimeParserOptions; format: PGMimeFormatOptions; header: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_header_printf(options: PGMimeParserOptions; format: PGMimeFormatOptions; text: pchar; args: array of const): pchar; cdecl; external libgmime3;
function g_mime_utils_header_printf(options: PGMimeParserOptions; format: PGMimeFormatOptions; text: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_header_unfold(value: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_quote_string(str: pchar): pchar; cdecl; external libgmime3;
procedure g_mime_utils_unquote_string(str: pchar); cdecl; external libgmime3;
function g_mime_utils_text_is_8bit(text: pbyte; len: Tsize_t): Tgboolean; cdecl; external libgmime3;
function g_mime_utils_best_encoding(text: pbyte; len: Tsize_t): TGMimeContentEncoding; cdecl; external libgmime3;
function g_mime_utils_decode_8bit(options: PGMimeParserOptions; text: pchar; len: Tsize_t): pchar; cdecl; external libgmime3;
function g_mime_utils_header_decode_text(options: PGMimeParserOptions; text: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_header_encode_text(options: PGMimeFormatOptions; text: pchar; charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_header_decode_phrase(options: PGMimeParserOptions; phrase: pchar): pchar; cdecl; external libgmime3;
function g_mime_utils_header_encode_phrase(options: PGMimeFormatOptions; phrase: pchar; charset: pchar): pchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:34:34 ===


implementation



end.
