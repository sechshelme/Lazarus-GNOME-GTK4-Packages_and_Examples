
unit tickit_evloop;
interface

{
  Automatically converted by H2Pas 1.0.0 from tickit_evloop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    tickit_evloop.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PTickit  = ^Tickit;
PTickitEventHooks  = ^TickitEventHooks;
PTickitTerm  = ^TickitTerm;
PTickitWatch  = ^TickitWatch;
Ptimeval  = ^timeval;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ C++ extern C conditionnal removed }
{$ifndef __TICKIT_EVLOOP_H__}
{$define __TICKIT_EVLOOP_H__}
{
 * The contents of this file should be considered entirely experimental, and
 * subject to any change at any time. We make no API or ABI stability
 * guarantees at this time.
  }
type
{ opaque  }
{ Below here is optional  }
(* Const before type ignored *)
  PTickitEventHooks = ^TTickitEventHooks;
  TTickitEventHooks = record
      init : function (t:PTickit; initdata:pointer):pointer;cdecl;
      destroy : procedure (data:pointer);cdecl;
      run : procedure (data:pointer; flags:TTickitRunFlags);cdecl;
      stop : procedure (data:pointer);cdecl;
      io : function (data:pointer; fd:longint; cond:TTickitIOCondition; flags:TTickitBindFlags; watch:PTickitWatch):Tbool;cdecl;
      cancel_io : procedure (data:pointer; watch:PTickitWatch);cdecl;
      timer : function (data:pointer; at:Ptimeval; flags:TTickitBindFlags; watch:PTickitWatch):Tbool;cdecl;
      cancel_timer : procedure (data:pointer; watch:PTickitWatch);cdecl;
      later : function (data:pointer; flags:TTickitBindFlags; watch:PTickitWatch):Tbool;cdecl;
      cancel_later : procedure (data:pointer; watch:PTickitWatch);cdecl;
      signal : function (data:pointer; signum:longint; flags:TTickitBindFlags; watch:PTickitWatch):Tbool;cdecl;
      cancel_signal : procedure (data:pointer; watch:PTickitWatch);cdecl;
      process : function (data:pointer; pid:Tpid_t; flags:TTickitBindFlags; watch:PTickitWatch):Tbool;cdecl;
      cancel_process : procedure (data:pointer; watch:PTickitWatch);cdecl;
    end;

{ Helper functions for eventloop implementations  }

function tickit_evloop_next_timer_msec(t:PTickit):longint;cdecl;external;
procedure tickit_evloop_invoke_timers(t:PTickit);cdecl;external;
function tickit_evloop_get_watch_data(watch:PTickitWatch):pointer;cdecl;external;
procedure tickit_evloop_set_watch_data(watch:PTickitWatch; data:pointer);cdecl;external;
function tickit_evloop_get_watch_data_int(watch:PTickitWatch):longint;cdecl;external;
procedure tickit_evloop_set_watch_data_int(watch:PTickitWatch; data:longint);cdecl;external;
procedure tickit_evloop_invoke_watch(watch:PTickitWatch; flags:TTickitEventFlags);cdecl;external;
procedure tickit_evloop_invoke_iowatch(watch:PTickitWatch; flags:TTickitEventFlags; cond:TTickitIOCondition);cdecl;external;
procedure tickit_evloop_invoke_processwatch(watch:PTickitWatch; flags:TTickitEventFlags; wstatus:longint);cdecl;external;
procedure tickit_evloop_invoke_sigwatches(t:PTickit; signum:longint);cdecl;external;
procedure tickit_evloop_sigwinch(t:PTickit);cdecl;external;
function tickit_new_with_evloop(tt:PTickitTerm; evhooks:PTickitEventHooks; initdata:pointer):PTickit;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }

implementation


end.
