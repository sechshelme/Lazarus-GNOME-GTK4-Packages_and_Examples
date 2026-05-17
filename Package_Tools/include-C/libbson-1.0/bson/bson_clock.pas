unit bson_clock;

interface

uses
  fp_bson;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function bson_get_monotonic_time: Tint64_t; cdecl; external libbson;
function bson_gettimeofday(tv: Ptimeval): longint; cdecl; external libbson;

// === Konventiert am: 17-5-26 16:54:01 ===


implementation



end.
