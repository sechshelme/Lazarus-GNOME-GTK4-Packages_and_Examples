{$IFDEF read_interface}


const
  BSON_ERROR_JSON = 1;
  BSON_ERROR_READER = 2;
  BSON_ERROR_INVALID = 3;

procedure bson_set_error(error: Pbson_error_t; domain: Tuint32_t; code: Tuint32_t; format: pchar; args: array of const); cdecl; external libbson;
procedure bson_set_error(error: Pbson_error_t; domain: Tuint32_t; code: Tuint32_t; format: pchar); cdecl; external libbson;
function bson_strerror_r(err_code: longint; buf: pchar; buflen: Tsize_t): pchar; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
