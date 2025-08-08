unit thread_db;

interface

uses
  clib, pthreadtypes, procfs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/thread_db.h

type
  Ptd_err_e = ^Ttd_err_e;
  Ttd_err_e = longint;

const
  TD_OK = 0;
  TD_ERR = 1;
  TD_NOTHR = 2;
  TD_NOSV = 3;
  TD_NOLWP = 4;
  TD_BADPH = 5;
  TD_BADTH = 6;
  TD_BADSH = 7;
  TD_BADTA = 8;
  TD_BADKEY = 9;
  TD_NOMSG = 10;
  TD_NOFPREGS = 11;
  TD_NOLIBTHREAD = 12;
  TD_NOEVENT = 13;
  TD_NOCAPAB = 14;
  TD_DBERR = 15;
  TD_NOAPLIC = 16;
  TD_NOTSD = 17;
  TD_MALLOC = 18;
  TD_PARTIALREG = 19;
  TD_NOXREGS = 20;
  TD_TLSDEFER = 21;
  TD_NOTALLOC = TD_TLSDEFER;
  TD_VERSION = (TD_TLSDEFER) + 1;
  TD_NOTLS = (TD_TLSDEFER) + 2;

type
  Ptd_thr_state_e = ^Ttd_thr_state_e;
  Ttd_thr_state_e = longint;

const
  TD_THR_ANY_STATE = 0;
  TD_THR_UNKNOWN = 1;
  TD_THR_STOPPED = 2;
  TD_THR_RUN = 3;
  TD_THR_ACTIVE = 4;
  TD_THR_ZOMBIE = 5;
  TD_THR_SLEEP = 6;
  TD_THR_STOPPED_ASLEEP = 7;

type
  Ptd_thr_type_e = ^Ttd_thr_type_e;
  Ttd_thr_type_e = longint;

const
  TD_THR_ANY_TYPE = 0;
  TD_THR_USER = 1;
  TD_THR_SYSTEM = 2;

type
  Ptd_thragent_t = type Pointer;
  PPtd_thragent_t = ^Ptd_thragent_t;

  Ttd_thrhandle_t = record
    th_ta_p: Ptd_thragent_t;
    th_unique: Tpsaddr_t;
  end;
  Ptd_thrhandle_t = ^Ttd_thrhandle_t;

  Plink_map = type Pointer;

const
  TD_THR_ANY_USER_FLAGS = $ffffffff;
  TD_THR_LOWEST_PRIORITY = -(20);
  TD_SIGNO_MASK = 0;
  TD_EVENTSIZE = 2;
  BT_UISHIFT = 5;
  BT_NBIPUI = 1 shl BT_UISHIFT;
  BT_UIMASK = BT_NBIPUI - 1;

type
  Ttd_thr_events_t = record
    event_bits: array[0..(TD_EVENTSIZE) - 1] of uint32;
  end;
  Ptd_thr_events_t = ^Ttd_thr_events_t;

type
  Ptd_event_e = ^Ttd_event_e;
  Ttd_event_e = longint;

const
  TD_ALL_EVENTS = 0;
  TD_EVENT_NONE = TD_ALL_EVENTS;
  TD_READY = (TD_ALL_EVENTS) + 1;
  TD_SLEEP = (TD_ALL_EVENTS) + 2;
  TD_SWITCHTO = (TD_ALL_EVENTS) + 3;
  TD_SWITCHFROM = (TD_ALL_EVENTS) + 4;
  TD_LOCK_TRY = (TD_ALL_EVENTS) + 5;
  TD_CATCHSIG = (TD_ALL_EVENTS) + 6;
  TD_IDLE = (TD_ALL_EVENTS) + 7;
  TD_CREATE = (TD_ALL_EVENTS) + 8;
  TD_DEATH = (TD_ALL_EVENTS) + 9;
  TD_PREEMPT = (TD_ALL_EVENTS) + 10;
  TD_PRI_INHERIT = (TD_ALL_EVENTS) + 11;
  TD_REAP = (TD_ALL_EVENTS) + 12;
  TD_CONCURRENCY = (TD_ALL_EVENTS) + 13;
  TD_TIMEOUT = (TD_ALL_EVENTS) + 14;
  TD_MIN_EVENT_NUM = TD_READY;
  TD_MAX_EVENT_NUM = TD_TIMEOUT;
  TD_EVENTS_ENABLE = 31;

type
  Ptd_notify_e = ^Ttd_notify_e;
  Ttd_notify_e = longint;

const
  NOTIFY_BPT = 0;
  NOTIFY_AUTOBPT = 1;
  NOTIFY_SYSCALL = 2;

type
  Ttd_notify_t = record
    _type: Ttd_notify_e;
    u: record
      case longint of
        0: (bptaddr: Tpsaddr_t);
        1: (syscallno: longint);
      end;
  end;
  Ptd_notify_t = ^Ttd_notify_t;

type
  Ttd_event_msg_t = record
    event: Ttd_event_e;
    th_p: Ptd_thrhandle_t;
    msg: record
      case longint of
        1: (data: PtrUInt);
      end;
  end;
  Ptd_event_msg_t = ^Ttd_event_msg_t;

  Ttd_eventbuf_t = record
    eventmask: Ttd_thr_events_t;
    eventnum: Ttd_event_e;
    eventdata: pointer;
  end;
  Ptd_eventbuf_t = ^Ttd_eventbuf_t;

  Ttd_ta_stats_t = record
    nthreads: longint;
    r_concurrency: longint;
    nrunnable_num: longint;
    nrunnable_den: longint;
    a_concurrency_num: longint;
    a_concurrency_den: longint;
    nlwps_num: longint;
    nlwps_den: longint;
    nidle_num: longint;
    nidle_den: longint;
  end;
  Ptd_ta_stats_t = ^Ttd_ta_stats_t;

  Tthread_t = Pointer;
  Pthread_t = ^Tthread_t;

  Ppthread_t= Pthread_t;

  Tthread_key_t = Pointer;

  Titer_fProc = procedure(para1: pointer);

  Ttd_thr_iter_f = function(para1: Ptd_thrhandle_t; para2: pointer): longint; cdecl;
  Ttd_key_iter_f = function(para1: Tthread_key_t; para2: Titer_fProc; para3: pointer): longint; cdecl;

  Pps_prochandle = type Pointer;
  PPps_prochandle = ^Pps_prochandle;

  Ttd_thrinfo_t = record
    ti_ta_p: Ptd_thragent_t;
    ti_user_flags: dword;
    ti_tid: Tthread_t;
    ti_tls: pchar;
    ti_startfunc: Tpsaddr_t;
    ti_stkbase: Tpsaddr_t;
    ti_stksize: longint;
    ti_ro_area: Tpsaddr_t;
    ti_ro_size: longint;
    ti_state: Ttd_thr_state_e;
    ti_db_suspended: byte;
    ti_type: Ttd_thr_type_e;
    ti_pc: PtrInt;
    ti_sp: PtrInt;
    ti_flags: smallint;
    ti_pri: longint;
    ti_lid: Tlwpid_t;
    ti_sigmask: Tsigset_t;
    ti_traceme: byte;
    ti_preemptflag: byte;
    ti_pirecflag: byte;
    ti_pending: Tsigset_t;
    ti_events: Ttd_thr_events_t;
  end;
  Ptd_thrinfo_t = ^Ttd_thrinfo_t;

function td_init: Ttd_err_e; cdecl; external libc;
function td_log: Ttd_err_e; cdecl; external libc;
function td_symbol_list: PPchar; cdecl; external libc;
function td_ta_new(__ps: Pps_prochandle; __ta: PPtd_thragent_t): Ttd_err_e; cdecl; external libc;
function td_ta_delete(__ta: Ptd_thragent_t): Ttd_err_e; cdecl; external libc;
function td_ta_get_nthreads(__ta: Ptd_thragent_t; __np: Plongint): Ttd_err_e; cdecl; external libc;
function td_ta_get_ph(__ta: Ptd_thragent_t; __ph: PPps_prochandle): Ttd_err_e; cdecl; external libc;
function td_ta_map_id2thr(__ta: Ptd_thragent_t; __pt: Tpthread_t; __th: Ptd_thrhandle_t): Ttd_err_e; cdecl; external libc;
function td_ta_map_lwp2thr(__ta: Ptd_thragent_t; __lwpid: Tlwpid_t; __th: Ptd_thrhandle_t): Ttd_err_e; cdecl; external libc;
function td_ta_thr_iter(__ta: Ptd_thragent_t; __callback: Ttd_thr_iter_f; __cbdata_p: pointer; __state: Ttd_thr_state_e; __ti_pri: longint; __ti_sigmask_p: Psigset_t; __ti_user_flags: dword): Ttd_err_e; cdecl; external libc;
function td_ta_tsd_iter(__ta: Ptd_thragent_t; __ki: Ttd_key_iter_f; __p: pointer): Ttd_err_e; cdecl; external libc;
function td_ta_event_addr(__ta: Ptd_thragent_t; __event: Ttd_event_e; __ptr: Ptd_notify_t): Ttd_err_e; cdecl; external libc;
function td_ta_set_event(__ta: Ptd_thragent_t; __event: Ptd_thr_events_t): Ttd_err_e; cdecl; external libc;
function td_ta_clear_event(__ta: Ptd_thragent_t; __event: Ptd_thr_events_t): Ttd_err_e; cdecl; external libc;
function td_ta_event_getmsg(__ta: Ptd_thragent_t; __msg: Ptd_event_msg_t): Ttd_err_e; cdecl; external libc;
function td_ta_setconcurrency(__ta: Ptd_thragent_t; __level: longint): Ttd_err_e; cdecl; external libc;
function td_ta_enable_stats(__ta: Ptd_thragent_t; __enable: longint): Ttd_err_e; cdecl; external libc;
function td_ta_reset_stats(__ta: Ptd_thragent_t): Ttd_err_e; cdecl; external libc;
function td_ta_get_stats(__ta: Ptd_thragent_t; __statsp: Ptd_ta_stats_t): Ttd_err_e; cdecl; external libc;
function td_thr_validate(__th: Ptd_thrhandle_t): Ttd_err_e; cdecl; external libc;
function td_thr_get_info(__th: Ptd_thrhandle_t; __infop: Ptd_thrinfo_t): Ttd_err_e; cdecl; external libc;
function td_thr_getfpregs(__th: Ptd_thrhandle_t; __regset: Pprfpregset_t): Ttd_err_e; cdecl; external libc;
function td_thr_getgregs(__th: Ptd_thrhandle_t; __gregs: Tprgregset_t): Ttd_err_e; cdecl; external libc;
function td_thr_getxregs(__th: Ptd_thrhandle_t; __xregs: pointer): Ttd_err_e; cdecl; external libc;
function td_thr_getxregsize(__th: Ptd_thrhandle_t; __sizep: Plongint): Ttd_err_e; cdecl; external libc;
function td_thr_setfpregs(__th: Ptd_thrhandle_t; __fpregs: Pprfpregset_t): Ttd_err_e; cdecl; external libc;
function td_thr_setgregs(__th: Ptd_thrhandle_t; __gregs: Tprgregset_t): Ttd_err_e; cdecl; external libc;
function td_thr_setxregs(__th: Ptd_thrhandle_t; __addr: pointer): Ttd_err_e; cdecl; external libc;
function td_thr_tlsbase(__th: Ptd_thrhandle_t; __modid: dword; __base: Ppsaddr_t): Ttd_err_e; cdecl; external libc;
function td_thr_tls_get_addr(__th: Ptd_thrhandle_t; __map_address: Tpsaddr_t; __offset: Tsize_t; __address: Ppsaddr_t): Ttd_err_e; cdecl; external libc;
function td_thr_event_enable(__th: Ptd_thrhandle_t; __event: longint): Ttd_err_e; cdecl; external libc;
function td_thr_set_event(__th: Ptd_thrhandle_t; __event: Ptd_thr_events_t): Ttd_err_e; cdecl; external libc;
function td_thr_clear_event(__th: Ptd_thrhandle_t; __event: Ptd_thr_events_t): Ttd_err_e; cdecl; external libc;
function td_thr_event_getmsg(__th: Ptd_thrhandle_t; __msg: Ptd_event_msg_t): Ttd_err_e; cdecl; external libc;
function td_thr_setprio(__th: Ptd_thrhandle_t; __prio: longint): Ttd_err_e; cdecl; external libc;
function td_thr_setsigpending(__th: Ptd_thrhandle_t; __n: byte; __ss: Psigset_t): Ttd_err_e; cdecl; external libc;
function td_thr_sigsetmask(__th: Ptd_thrhandle_t; __ss: Psigset_t): Ttd_err_e; cdecl; external libc;
function td_thr_tsd(__th: Ptd_thrhandle_t; __tk: Tthread_key_t; __data: Ppointer): Ttd_err_e; cdecl; external libc;
function td_thr_dbsuspend(__th: Ptd_thrhandle_t): Ttd_err_e; cdecl; external libc;
function td_thr_dbresume(__th: Ptd_thrhandle_t): Ttd_err_e; cdecl; external libc;

// === Konventiert am: 8-8-25 15:25:51 ===


implementation


end.
