unit bson_context;

interface

uses
  fp_bson, bson_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function bson_context_new(flags: Tbson_context_flags_t): Pbson_context_t; cdecl; external libbson;
procedure bson_context_destroy(context: Pbson_context_t); cdecl; external libbson;
function bson_context_get_default: Pbson_context_t; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:53:55 ===


implementation



end.
