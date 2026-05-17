unit bson_keys;

interface

uses
  fp_bson;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function bson_uint32_to_string(value: Tuint32_t; strptr: PPchar; str: pchar; size: Tsize_t): Tsize_t; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:43 ===


implementation



end.
