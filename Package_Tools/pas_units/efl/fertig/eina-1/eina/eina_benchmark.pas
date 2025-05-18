unit eina_benchmark;

interface

uses
  ctypes, efl, eina_types, eina_array;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Benchmark_Specimens = procedure(request: longint); cdecl;

  TEina_Benchmark = record
  end;
  PEina_Benchmark = ^TEina_Benchmark;

function EINA_BENCHMARK(_function: Pointer): TEina_Benchmark_Specimens;

function eina_benchmark_new(name: pchar; run: pchar): PEina_Benchmark; cdecl; external libeina;
procedure eina_benchmark_free(bench: PEina_Benchmark); cdecl; external libeina;
function eina_benchmark_register(bench: PEina_Benchmark; name: pchar; bench_cb: TEina_Benchmark_Specimens; count_start: longint; count_end: longint;
  count_step: longint): TEina_Bool; cdecl; external libeina;
function eina_benchmark_run(bench: PEina_Benchmark): PEina_Array; cdecl; external libeina;

// === Konventiert am: 16-5-25 19:49:04 ===


implementation


function EINA_BENCHMARK(_function: Pointer): TEina_Benchmark_Specimens;
begin
  EINA_BENCHMARK := TEina_Benchmark_Specimens(_function);
end;


end.
