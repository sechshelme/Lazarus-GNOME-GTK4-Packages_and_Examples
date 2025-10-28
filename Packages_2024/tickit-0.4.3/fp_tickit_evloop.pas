unit fp_tickit_evloop;

interface

uses
  fp_tickit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PTickitWatch = type Pointer;

  TTickitEventHooks = record
    init: function(t: PTickit; initdata: pointer): pointer; cdecl;
    Destroy: procedure(Data: pointer); cdecl;
    run: procedure(Data: pointer; flags: TTickitRunFlags); cdecl;
    stop: procedure(Data: pointer); cdecl;
    io: function(Data: pointer; fd: longint; cond: TTickitIOCondition; flags: TTickitBindFlags; watch: PTickitWatch): Tbool; cdecl;
    cancel_io: procedure(Data: pointer; watch: PTickitWatch); cdecl;
    timer: function(Data: pointer; at: Ptimeval; flags: TTickitBindFlags; watch: PTickitWatch): Tbool; cdecl;
    cancel_timer: procedure(Data: pointer; watch: PTickitWatch); cdecl;
    later: function(Data: pointer; flags: TTickitBindFlags; watch: PTickitWatch): Tbool; cdecl;
    cancel_later: procedure(Data: pointer; watch: PTickitWatch); cdecl;
    signal: function(Data: pointer; signum: longint; flags: TTickitBindFlags; watch: PTickitWatch): Tbool; cdecl;
    cancel_signal: procedure(Data: pointer; watch: PTickitWatch); cdecl;
    process: function(Data: pointer; pid: Tpid_t; flags: TTickitBindFlags; watch: PTickitWatch): Tbool; cdecl;
    cancel_process: procedure(Data: pointer; watch: PTickitWatch); cdecl;
  end;
  PTickitEventHooks = ^TTickitEventHooks;

function tickit_evloop_next_timer_msec(t: PTickit): longint; cdecl; external libtickit;
procedure tickit_evloop_invoke_timers(t: PTickit); cdecl; external libtickit;
function tickit_evloop_get_watch_data(watch: PTickitWatch): pointer; cdecl; external libtickit;
procedure tickit_evloop_set_watch_data(watch: PTickitWatch; Data: pointer); cdecl; external libtickit;
function tickit_evloop_get_watch_data_int(watch: PTickitWatch): longint; cdecl; external libtickit;
procedure tickit_evloop_set_watch_data_int(watch: PTickitWatch; Data: longint); cdecl; external libtickit;
procedure tickit_evloop_invoke_watch(watch: PTickitWatch; flags: TTickitEventFlags); cdecl; external libtickit;
procedure tickit_evloop_invoke_iowatch(watch: PTickitWatch; flags: TTickitEventFlags; cond: TTickitIOCondition); cdecl; external libtickit;
procedure tickit_evloop_invoke_processwatch(watch: PTickitWatch; flags: TTickitEventFlags; wstatus: longint); cdecl; external libtickit;
procedure tickit_evloop_invoke_sigwatches(t: PTickit; signum: longint); cdecl; external libtickit;
procedure tickit_evloop_sigwinch(t: PTickit); cdecl; external libtickit;
function tickit_new_with_evloop(tt: PTickitTerm; evhooks: PTickitEventHooks; initdata: pointer): PTickit; cdecl; external libtickit;

// === Konventiert am: 2-5-25 13:40:44 ===


implementation



end.
