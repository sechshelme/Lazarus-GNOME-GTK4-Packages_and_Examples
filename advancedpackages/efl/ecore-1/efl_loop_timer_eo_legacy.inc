{$IFDEF read_interface}


// Doppelt im C-Header
//type
//  PEfl_Loop_Timer = ^TEfl_Loop_Timer;
//  TEfl_Loop_Timer = TEo;

procedure ecore_timer_interval_set(obj: PEfl_Loop_Timer; in_: double); cdecl; external libecore;
function ecore_timer_interval_get(obj: PEfl_Loop_Timer): double; cdecl; external libecore;
function ecore_timer_pending_get(obj: PEfl_Loop_Timer): double; cdecl; external libecore;
procedure ecore_timer_reset(obj: PEfl_Loop_Timer); cdecl; external libecore;
procedure ecore_timer_loop_reset(obj: PEfl_Loop_Timer); cdecl; external libecore;
procedure ecore_timer_delay(obj: PEfl_Loop_Timer; add: double); cdecl; external libecore;

// === Konventiert am: 21-5-25 16:49:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
