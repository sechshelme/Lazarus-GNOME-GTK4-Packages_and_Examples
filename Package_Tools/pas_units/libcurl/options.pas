unit options;

interface

uses
  fp_curl, curl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pcurl_easytype = ^Tcurl_easytype;
  Tcurl_easytype = longint;

const
  CURLOT_LONG = 0;
  CURLOT_VALUES = 1;
  CURLOT_OFF_T = 2;
  CURLOT_OBJECT = 3;
  CURLOT_STRING = 4;
  CURLOT_SLIST = 5;
  CURLOT_CBPTR = 6;
  CURLOT_BLOB = 7;
  CURLOT_FUNCTION = 8;

type
  Tcurl_easyoption = record
    name: pchar;
    id: TCURLoption;
    _type: Tcurl_easytype;
    flags: dword;
  end;
  Pcurl_easyoption = ^Tcurl_easyoption;

function curl_easy_option_by_name(name: pchar): Pcurl_easyoption; cdecl; external libcurl;
function curl_easy_option_by_id(id: TCURLoption): Pcurl_easyoption; cdecl; external libcurl;
function curl_easy_option_next(prev: Pcurl_easyoption): Pcurl_easyoption; cdecl; external libcurl;

// === Konventiert am: 12-7-25 13:50:12 ===


implementation



end.
