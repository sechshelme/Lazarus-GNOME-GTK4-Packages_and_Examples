unit soup_cookie;

interface

uses
  fp_glib2, fp_soup, soup_message;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSoupSameSitePolicy = ^TSoupSameSitePolicy;
  TSoupSameSitePolicy = longint;

const
  SOUP_SAME_SITE_POLICY_NONE = 0;
  SOUP_SAME_SITE_POLICY_LAX = 1;
  SOUP_SAME_SITE_POLICY_STRICT = 2;

function soup_cookie_get_type: TGType; cdecl; external libsoup;

function SOUP_TYPE_COOKIE: TGType;

const
  SOUP_COOKIE_MAX_AGE_ONE_HOUR = 60 * 60;
  SOUP_COOKIE_MAX_AGE_ONE_DAY = SOUP_COOKIE_MAX_AGE_ONE_HOUR * 24;
  SOUP_COOKIE_MAX_AGE_ONE_WEEK = SOUP_COOKIE_MAX_AGE_ONE_DAY * 7;
  SOUP_COOKIE_MAX_AGE_ONE_YEAR = SOUP_COOKIE_MAX_AGE_ONE_DAY * 365.2422;

function soup_cookie_new(name: pchar; value: pchar; domain: pchar; path: pchar; max_age: longint): PSoupCookie; cdecl; external libsoup;
function soup_cookie_parse(header: pchar; origin: PGUri): PSoupCookie; cdecl; external libsoup;
function soup_cookie_copy(cookie: PSoupCookie): PSoupCookie; cdecl; external libsoup;
function soup_cookie_get_name(cookie: PSoupCookie): pchar; cdecl; external libsoup;
procedure soup_cookie_set_name(cookie: PSoupCookie; name: pchar); cdecl; external libsoup;
function soup_cookie_get_value(cookie: PSoupCookie): pchar; cdecl; external libsoup;
procedure soup_cookie_set_value(cookie: PSoupCookie; value: pchar); cdecl; external libsoup;
function soup_cookie_get_domain(cookie: PSoupCookie): pchar; cdecl; external libsoup;
procedure soup_cookie_set_domain(cookie: PSoupCookie; domain: pchar); cdecl; external libsoup;
function soup_cookie_get_path(cookie: PSoupCookie): pchar; cdecl; external libsoup;
procedure soup_cookie_set_path(cookie: PSoupCookie; path: pchar); cdecl; external libsoup;
procedure soup_cookie_set_max_age(cookie: PSoupCookie; max_age: longint); cdecl; external libsoup;
function soup_cookie_get_expires(cookie: PSoupCookie): PGDateTime; cdecl; external libsoup;
procedure soup_cookie_set_expires(cookie: PSoupCookie; expires: PGDateTime); cdecl; external libsoup;
function soup_cookie_get_secure(cookie: PSoupCookie): Tgboolean; cdecl; external libsoup;
procedure soup_cookie_set_secure(cookie: PSoupCookie; secure: Tgboolean); cdecl; external libsoup;
function soup_cookie_get_http_only(cookie: PSoupCookie): Tgboolean; cdecl; external libsoup;
procedure soup_cookie_set_http_only(cookie: PSoupCookie; http_only: Tgboolean); cdecl; external libsoup;
procedure soup_cookie_set_same_site_policy(cookie: PSoupCookie; policy: TSoupSameSitePolicy); cdecl; external libsoup;
function soup_cookie_get_same_site_policy(cookie: PSoupCookie): TSoupSameSitePolicy; cdecl; external libsoup;
function soup_cookie_to_set_cookie_header(cookie: PSoupCookie): pchar; cdecl; external libsoup;
function soup_cookie_to_cookie_header(cookie: PSoupCookie): pchar; cdecl; external libsoup;
function soup_cookie_applies_to_uri(cookie: PSoupCookie; uri: PGUri): Tgboolean; cdecl; external libsoup;
function soup_cookie_equal(cookie1: PSoupCookie; cookie2: PSoupCookie): Tgboolean; cdecl; external libsoup;
procedure soup_cookie_free(cookie: PSoupCookie); cdecl; external libsoup;
function soup_cookies_from_response(msg: PSoupMessage): PGSList; cdecl; external libsoup;
function soup_cookies_from_request(msg: PSoupMessage): PGSList; cdecl; external libsoup;
procedure soup_cookies_to_response(cookies: PGSList; msg: PSoupMessage); cdecl; external libsoup;
procedure soup_cookies_to_request(cookies: PGSList; msg: PSoupMessage); cdecl; external libsoup;
procedure soup_cookies_free(cookies: PGSList); cdecl; external libsoup;
function soup_cookies_to_cookie_header(cookies: PGSList): pchar; cdecl; external libsoup;
function soup_cookie_domain_matches(cookie: PSoupCookie; host: pchar): Tgboolean; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:45:12 ===


implementation


function SOUP_TYPE_COOKIE: TGType;
begin
  SOUP_TYPE_COOKIE := soup_cookie_get_type;
end;


end.
