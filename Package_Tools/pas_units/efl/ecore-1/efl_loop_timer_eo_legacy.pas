unit efl_loop_timer_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Loop_Timer = ^TEfl_Loop_Timer;
  TEfl_Loop_Timer = TEo;

procedure ecore_timer_interval_set(obj: PEfl_Loop_Timer; in_: double); cdecl; external libecore;
function ecore_timer_interval_get(obj: PEfl_Loop_Timer): double; cdecl; external libecore;
function ecore_timer_pending_get(obj: PEfl_Loop_Timer): double; cdecl; external libecore;
procedure ecore_timer_reset(obj: PEfl_Loop_Timer); cdecl; external libecore;
procedure ecore_timer_loop_reset(obj: PEfl_Loop_Timer); cdecl; external libecore;
procedure ecore_timer_delay(obj: PEfl_Loop_Timer; add: double); cdecl; external libecore;

// === Konventiert am: 21-5-25 16:49:17 ===


implementation



end.
