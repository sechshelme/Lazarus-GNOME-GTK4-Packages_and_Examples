unit sokol_time;

interface

uses
  fp_sokol;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



procedure stm_setup;cdecl;external libsokol;
function stm_now:Tuint64_t;cdecl;external libsokol;
function stm_diff(new_ticks:Tuint64_t; old_ticks:Tuint64_t):Tuint64_t;cdecl;external libsokol;
function stm_since(start_ticks:Tuint64_t):Tuint64_t;cdecl;external libsokol;
function stm_laptime(last_time:Puint64_t):Tuint64_t;cdecl;external libsokol;
function stm_round_to_common_refresh_rate(frame_ticks:Tuint64_t):Tuint64_t;cdecl;external libsokol;
function stm_sec(ticks:Tuint64_t):double;cdecl;external libsokol;
function stm_ms(ticks:Tuint64_t):double;cdecl;external libsokol;
function stm_us(ticks:Tuint64_t):double;cdecl;external libsokol;
function stm_ns(ticks:Tuint64_t):double;cdecl;external libsokol;

// === Konventiert am: 22-3-26 16:22:53 ===


implementation



end.
