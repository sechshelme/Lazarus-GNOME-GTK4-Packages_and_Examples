{$IFDEF read_interface}


const
  LIBCURL_COPYRIGHT = 'Daniel Stenberg, <daniel@haxx.se>.';
  LIBCURL_VERSION = '8.5.0';
  LIBCURL_VERSION_MAJOR = 8;
  LIBCURL_VERSION_MINOR = 5;
  LIBCURL_VERSION_PATCH = 0;
  LIBCURL_VERSION_NUM = $080500;
  LIBCURL_TIMESTAMP = '2023-12-06';

function CURL_VERSION_BITS(x, y, z: longint): longint;
function CURL_AT_LEAST_VERSION(x, y, z: longint): Boolean;


// === Konventiert am: 12-7-25 13:49:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function CURL_VERSION_BITS(x, y, z: longint): longint;
begin
  CURL_VERSION_BITS := ((x shl 16) or (y shl 8)) or z;
end;

function CURL_AT_LEAST_VERSION(x, y, z: longint): Boolean;
begin
  CURL_AT_LEAST_VERSION := LIBCURL_VERSION_NUM >= (CURL_VERSION_BITS(x, y, z));
end;


{$ENDIF read_implementation}
