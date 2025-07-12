unit urlapi;

interface

uses
  fp_curl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PCURLUcode = ^TCURLUcode;
  TCURLUcode = longint;

const
  CURLUE_OK = 0;
  CURLUE_BAD_HANDLE = 1;
  CURLUE_BAD_PARTPOINTER = 2;
  CURLUE_MALFORMED_INPUT = 3;
  CURLUE_BAD_PORT_NUMBER = 4;
  CURLUE_UNSUPPORTED_SCHEME = 5;
  CURLUE_URLDECODE = 6;
  CURLUE_OUT_OF_MEMORY = 7;
  CURLUE_USER_NOT_ALLOWED = 8;
  CURLUE_UNKNOWN_PART = 9;
  CURLUE_NO_SCHEME = 10;
  CURLUE_NO_USER = 11;
  CURLUE_NO_PASSWORD = 12;
  CURLUE_NO_OPTIONS = 13;
  CURLUE_NO_HOST = 14;
  CURLUE_NO_PORT = 15;
  CURLUE_NO_QUERY = 16;
  CURLUE_NO_FRAGMENT = 17;
  CURLUE_NO_ZONEID = 18;
  CURLUE_BAD_FILE_URL = 19;
  CURLUE_BAD_FRAGMENT = 20;
  CURLUE_BAD_HOSTNAME = 21;
  CURLUE_BAD_IPV6 = 22;
  CURLUE_BAD_LOGIN = 23;
  CURLUE_BAD_PASSWORD = 24;
  CURLUE_BAD_PATH = 25;
  CURLUE_BAD_QUERY = 26;
  CURLUE_BAD_SCHEME = 27;
  CURLUE_BAD_SLASHES = 28;
  CURLUE_BAD_USER = 29;
  CURLUE_LACKS_IDN = 30;
  CURLUE_LAST = 31;

type
  PCURLUPart = ^TCURLUPart;
  TCURLUPart = longint;

const
  CURLUPART_URL = 0;
  CURLUPART_SCHEME = 1;
  CURLUPART_USER = 2;
  CURLUPART_PASSWORD = 3;
  CURLUPART_OPTIONS = 4;
  CURLUPART_HOST = 5;
  CURLUPART_PORT = 6;
  CURLUPART_PATH = 7;
  CURLUPART_QUERY = 8;
  CURLUPART_FRAGMENT = 9;
  CURLUPART_ZONEID = 10;

const
  CURLU_DEFAULT_PORT = 1 shl 0;
  CURLU_NO_DEFAULT_PORT = 1 shl 1;
  CURLU_DEFAULT_SCHEME = 1 shl 2;
  CURLU_NON_SUPPORT_SCHEME = 1 shl 3;
  CURLU_PATH_AS_IS = 1 shl 4;
  CURLU_DISALLOW_USER = 1 shl 5;
  CURLU_URLDECODE = 1 shl 6;
  CURLU_URLENCODE = 1 shl 7;
  CURLU_APPENDQUERY = 1 shl 8;
  CURLU_GUESS_SCHEME = 1 shl 9;
  CURLU_NO_AUTHORITY = 1 shl 10;
  CURLU_ALLOW_SPACE = 1 shl 11;
  CURLU_PUNYCODE = 1 shl 12;
  CURLU_PUNY2IDN = 1 shl 13;

type
  TCurl_URL = record
  end;
  PCurl_URL = ^TCurl_URL;

  PCURLU = PCurl_URL;

function curl_url: PCURLU; cdecl; external libcurl;
procedure curl_url_cleanup(handle: PCURLU); cdecl; external libcurl;
function curl_url_dup(in_: PCURLU): PCURLU; cdecl; external libcurl;
function curl_url_get(handle: PCURLU; what: TCURLUPart; part: PPchar; flags: dword): TCURLUcode; cdecl; external libcurl;
function curl_url_set(handle: PCURLU; what: TCURLUPart; part: pchar; flags: dword): TCURLUcode; cdecl; external libcurl;
function curl_url_strerror(para1: TCURLUcode): pchar; cdecl; external libcurl;

// === Konventiert am: 12-7-25 13:50:22 ===


implementation



end.
