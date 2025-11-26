{$IFDEF read_interface}


type
  PSoupURIComponent = ^TSoupURIComponent;
  TSoupURIComponent = longint;

const
  SOUP_URI_NONE = 0;
  SOUP_URI_SCHEME = 1;
  SOUP_URI_USER = 2;
  SOUP_URI_PASSWORD = 3;
  SOUP_URI_AUTH_PARAMS = 4;
  SOUP_URI_HOST = 5;
  SOUP_URI_PORT = 6;
  SOUP_URI_PATH = 7;
  SOUP_URI_QUERY = 8;
  SOUP_URI_FRAGMENT = 9;

function soup_uri_decode_data_uri(uri: pchar; content_type: PPchar): PGBytes; cdecl; external libsoup;
function soup_uri_equal(uri1: PGUri; uri2: PGUri): Tgboolean; cdecl; external libsoup;
function soup_uri_copy(uri: PGUri; first_component: TSoupURIComponent; args: array of const): PGUri; cdecl; external libsoup;
function soup_uri_copy(uri: PGUri; first_component: TSoupURIComponent): PGUri; cdecl; external libsoup;

const
  SOUP_HTTP_URI_FLAGS = G_URI_FLAGS_HAS_PASSWORD or G_URI_FLAGS_ENCODED_PATH or G_URI_FLAGS_ENCODED_QUERY or G_URI_FLAGS_ENCODED_FRAGMENT or G_URI_FLAGS_SCHEME_NORMALIZE;

  // === Konventiert am: 29-9-25 19:43:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
