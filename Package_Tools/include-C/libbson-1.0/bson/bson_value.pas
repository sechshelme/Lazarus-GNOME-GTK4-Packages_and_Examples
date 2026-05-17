unit bson_value;

interface

uses
  fp_bson,bson_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure bson_value_copy(src: Pbson_value_t; dst: Pbson_value_t); cdecl; external libbson;
procedure bson_value_destroy(value: Pbson_value_t); cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:24 ===


implementation



end.
