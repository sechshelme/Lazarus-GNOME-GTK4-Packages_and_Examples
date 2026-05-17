{$IFDEF read_interface}


const
  BSON_DECIMAL128_STRING = 43;
  BSON_DECIMAL128_INF = 'Infinity';
  BSON_DECIMAL128_NAN = 'NaN';

procedure bson_decimal128_to_string(dec: Pbson_decimal128_t; str: pchar); cdecl; external libbson;
function bson_decimal128_from_string(_string: pchar; dec: Pbson_decimal128_t): Boolean; cdecl; external libbson;
function bson_decimal128_from_string_w_len(_string: pchar; len: longint; dec: Pbson_decimal128_t): Boolean; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
