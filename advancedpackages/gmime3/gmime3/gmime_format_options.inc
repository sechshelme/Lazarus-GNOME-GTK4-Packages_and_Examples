{$IFDEF read_interface}


type
  PGMimeNewLineFormat = ^TGMimeNewLineFormat;
  TGMimeNewLineFormat = longint;

const
  GMIME_NEWLINE_FORMAT_UNIX = 0;
  GMIME_NEWLINE_FORMAT_DOS = 1;

type
  PGMimeParamEncodingMethod = ^TGMimeParamEncodingMethod;
  TGMimeParamEncodingMethod = longint;

const
  GMIME_PARAM_ENCODING_METHOD_DEFAULT = 0;
  GMIME_PARAM_ENCODING_METHOD_RFC2231 = 1;
  GMIME_PARAM_ENCODING_METHOD_RFC2047 = 2;

type
  PGMimeFormatOptions = type Pointer;

function g_mime_format_options_get_type: TGType; cdecl; external libgmime3;
function g_mime_format_options_get_default: PGMimeFormatOptions; cdecl; external libgmime3;
function g_mime_format_options_new: PGMimeFormatOptions; cdecl; external libgmime3;
procedure g_mime_format_options_free(options: PGMimeFormatOptions); cdecl; external libgmime3;
function g_mime_format_options_clone(options: PGMimeFormatOptions): PGMimeFormatOptions; cdecl; external libgmime3;
function g_mime_format_options_get_param_encoding_method(options: PGMimeFormatOptions): TGMimeParamEncodingMethod; cdecl; external libgmime3;
procedure g_mime_format_options_set_param_encoding_method(options: PGMimeFormatOptions; method: TGMimeParamEncodingMethod); cdecl; external libgmime3;
function g_mime_format_options_get_newline_format(options: PGMimeFormatOptions): TGMimeNewLineFormat; cdecl; external libgmime3;
procedure g_mime_format_options_set_newline_format(options: PGMimeFormatOptions; newline: TGMimeNewLineFormat); cdecl; external libgmime3;
function g_mime_format_options_get_newline(options: PGMimeFormatOptions): pchar; cdecl; external libgmime3;
function g_mime_format_options_create_newline_filter(options: PGMimeFormatOptions; ensure_newline: Tgboolean): PGMimeFilter; cdecl; external libgmime3;
function g_mime_format_options_is_hidden_header(options: PGMimeFormatOptions; header: pchar): Tgboolean; cdecl; external libgmime3;
procedure g_mime_format_options_add_hidden_header(options: PGMimeFormatOptions; header: pchar); cdecl; external libgmime3;
procedure g_mime_format_options_remove_hidden_header(options: PGMimeFormatOptions; header: pchar); cdecl; external libgmime3;
procedure g_mime_format_options_clear_hidden_headers(options: PGMimeFormatOptions); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:41 ===

function GMIME_TYPE_FORMAT_OPTIONS: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_FORMAT_OPTIONS: TGType;
begin
  GMIME_TYPE_FORMAT_OPTIONS := g_mime_format_options_get_type;
end;



{$ENDIF read_implementation}
