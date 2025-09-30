unit soup_date_utils;

interface

uses
  fp_glib2, fp_soup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSoupDateFormat = ^TSoupDateFormat;
  TSoupDateFormat = longint;

const
  SOUP_DATE_HTTP = 1;
  SOUP_DATE_COOKIE = 2;

function soup_date_time_to_string(date: PGDateTime; format: TSoupDateFormat): pchar; cdecl; external libsoup;
function soup_date_time_new_from_http_string(date_string: pchar): PGDateTime; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:59 ===


implementation



end.
