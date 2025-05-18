unit eina_counter;

interface

uses
  ctypes, efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEina_Counter = record
  end;
  PEina_Counter = ^TEina_Counter;

function eina_counter_new(name: pchar): PEina_Counter; cdecl; external libeina;
procedure eina_counter_free(counter: PEina_Counter); cdecl; external libeina;
procedure eina_counter_start(counter: PEina_Counter); cdecl; external libeina;
procedure eina_counter_stop(counter: PEina_Counter; specimen: longint); cdecl; external libeina;
function eina_counter_dump(counter: PEina_Counter): pchar; cdecl; external libeina;

// === Konventiert am: 17-5-25 13:52:13 ===


implementation



end.
