unit gmime_parser_options;

interface

uses
  fp_glib2, fp_gmime3;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeRfcComplianceMode = ^TGMimeRfcComplianceMode;
  TGMimeRfcComplianceMode = longint;

const
  GMIME_RFC_COMPLIANCE_LOOSE = 0;
  GMIME_RFC_COMPLIANCE_STRICT = 1;

type
  PGMimeParserWarning = ^TGMimeParserWarning;
  TGMimeParserWarning = longint;

const
  GMIME_WARN_DUPLICATED_HEADER = 1;
  GMIME_WARN_DUPLICATED_PARAMETER = 2;
  GMIME_WARN_UNENCODED_8BIT_HEADER = 3;
  GMIME_WARN_INVALID_CONTENT_TYPE = 4;
  GMIME_WARN_INVALID_RFC2047_HEADER_VALUE = 5;
  GMIME_WARN_MALFORMED_MULTIPART = 6;
  GMIME_WARN_TRUNCATED_MESSAGE = 7;
  GMIME_WARN_MALFORMED_MESSAGE = 8;
  GMIME_CRIT_INVALID_HEADER_NAME = 9;
  GMIME_CRIT_CONFLICTING_HEADER = 10;
  GMIME_CRIT_CONFLICTING_PARAMETER = 11;
  GMIME_CRIT_MULTIPART_WITHOUT_BOUNDARY = 12;
  GMIME_WARN_INVALID_PARAMETER = 13;
  GMIME_WARN_INVALID_ADDRESS_LIST = 14;
  GMIME_CRIT_NESTING_OVERFLOW = 15;
  GMIME_WARN_PART_WITHOUT_CONTENT = 16;
  GMIME_CRIT_PART_WITHOUT_HEADERS_OR_CONTENT = 17;

type
  PGMimeParserOptions = type Pointer;
  TGMimeParserWarningFunc = procedure(offset: Tgint64; errcode: TGMimeParserWarning; item: Pgchar; user_data: Tgpointer); cdecl;

function g_mime_parser_options_get_type: TGType; cdecl; external libgmime3;
function g_mime_parser_options_get_default: PGMimeParserOptions; cdecl; external libgmime3;
function g_mime_parser_options_new: PGMimeParserOptions; cdecl; external libgmime3;
procedure g_mime_parser_options_free(options: PGMimeParserOptions); cdecl; external libgmime3;
function g_mime_parser_options_clone(options: PGMimeParserOptions): PGMimeParserOptions; cdecl; external libgmime3;
function g_mime_parser_options_get_address_compliance_mode(options: PGMimeParserOptions): TGMimeRfcComplianceMode; cdecl; external libgmime3;
procedure g_mime_parser_options_set_address_compliance_mode(options: PGMimeParserOptions; mode: TGMimeRfcComplianceMode); cdecl; external libgmime3;
function g_mime_parser_options_get_allow_addresses_without_domain(options: PGMimeParserOptions): Tgboolean; cdecl; external libgmime3;
procedure g_mime_parser_options_set_allow_addresses_without_domain(options: PGMimeParserOptions; allow: Tgboolean); cdecl; external libgmime3;
function g_mime_parser_options_get_parameter_compliance_mode(options: PGMimeParserOptions): TGMimeRfcComplianceMode; cdecl; external libgmime3;
procedure g_mime_parser_options_set_parameter_compliance_mode(options: PGMimeParserOptions; mode: TGMimeRfcComplianceMode); cdecl; external libgmime3;
function g_mime_parser_options_get_rfc2047_compliance_mode(options: PGMimeParserOptions): TGMimeRfcComplianceMode; cdecl; external libgmime3;
procedure g_mime_parser_options_set_rfc2047_compliance_mode(options: PGMimeParserOptions; mode: TGMimeRfcComplianceMode); cdecl; external libgmime3;
function g_mime_parser_options_get_fallback_charsets(options: PGMimeParserOptions): PPchar; cdecl; external libgmime3;
procedure g_mime_parser_options_set_fallback_charsets(options: PGMimeParserOptions; charsets: PPchar); cdecl; external libgmime3;
function g_mime_parser_options_get_warning_callback(options: PGMimeParserOptions): TGMimeParserWarningFunc; cdecl; external libgmime3;
procedure g_mime_parser_options_set_warning_callback(options: PGMimeParserOptions; warning_cb: TGMimeParserWarningFunc; user_data: Tgpointer); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:32:48 ===

function GMIME_TYPE_PARSER_OPTIONS: TGType;

implementation

function GMIME_TYPE_PARSER_OPTIONS: TGType;
begin
  GMIME_TYPE_PARSER_OPTIONS := g_mime_parser_options_get_type;
end;



end.
