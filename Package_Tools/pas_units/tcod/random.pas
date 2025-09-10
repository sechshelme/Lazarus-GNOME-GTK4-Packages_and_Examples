unit random;

interface

uses
  fp_tcod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function TCOD_rng_splitmix64_next(state: PUInt64): uint64; inline;

// === Konventiert am: 10-9-25 15:54:10 ===


implementation

function TCOD_rng_splitmix64_next(state: PUInt64): uint64; inline;
var
  z: uint64;
begin
  state^ := state^ + $9E3779B97F4A7C15;
  z := state^;
  z := (z xor (z shr 30)) * $BF58476D1CE4E5B9;
  z := (z xor (z shr 27)) * $94D049BB133111EB;
  Result := z xor (z shr 31);
end;


end.
