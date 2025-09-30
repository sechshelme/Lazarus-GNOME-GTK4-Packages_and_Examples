unit soup_headers;

interface

uses
  fp_glib2, fp_soup, soup_status;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function soup_headers_parse(str: pchar; len: longint; dest: PSoupMessageHeaders): Tgboolean; cdecl; external libsoup;
function soup_headers_parse_request(str: pchar; len: longint; req_headers: PSoupMessageHeaders; req_method: PPchar; req_path: PPchar;
  ver: PSoupHTTPVersion): Tguint; cdecl; external libsoup;
function soup_headers_parse_status_line(status_line: pchar; ver: PSoupHTTPVersion; status_code: Pguint; reason_phrase: PPchar): Tgboolean; cdecl; external libsoup;
function soup_headers_parse_response(str: pchar; len: longint; headers: PSoupMessageHeaders; ver: PSoupHTTPVersion; status_code: Pguint;
  reason_phrase: PPchar): Tgboolean; cdecl; external libsoup;
function soup_header_parse_list(header: pchar): PGSList; cdecl; external libsoup;
function soup_header_parse_quality_list(header: pchar; unacceptable: PPGSList): PGSList; cdecl; external libsoup;
procedure soup_header_free_list(list: PGSList); cdecl; external libsoup;
function soup_header_contains(header: pchar; token: pchar): Tgboolean; cdecl; external libsoup;
function soup_header_parse_param_list(header: pchar): PGHashTable; cdecl; external libsoup;
function soup_header_parse_semi_param_list(header: pchar): PGHashTable; cdecl; external libsoup;
function soup_header_parse_param_list_strict(header: pchar): PGHashTable; cdecl; external libsoup;
function soup_header_parse_semi_param_list_strict(header: pchar): PGHashTable; cdecl; external libsoup;
procedure soup_header_free_param_list(param_list: PGHashTable); cdecl; external libsoup;
procedure soup_header_g_string_append_param(_string: PGString; name: pchar; value: pchar); cdecl; external libsoup;
procedure soup_header_g_string_append_param_quoted(_string: PGString; name: pchar; value: pchar); cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:51 ===


implementation



end.
