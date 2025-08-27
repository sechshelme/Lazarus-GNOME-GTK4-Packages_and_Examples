unit event_struct;

interface

uses
  fp_time, fp_event, util, event;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  EVLIST_TIMEOUT = $01;
  EVLIST_INSERTED = $02;
  EVLIST_SIGNAL = $04;
  EVLIST_ACTIVE = $08;
  EVLIST_INTERNAL = $10;
  EVLIST_ACTIVE_LATER = $20;
  EVLIST_FINALIZING = $40;
  EVLIST_INIT = $80;
  EVLIST_ALL = $ff;

type
  Pevent = ^Tevent;
  Pevent_callback = ^Tevent_callback;

  Tevent_callback = record
    evcb_active_next: record
      tqe_next: Pevent_callback;
      tqe_prev: ^Pevent_callback;
      end;
    evcb_flags: smallint;
    evcb_pri: Tev_uint8_t;
    evcb_closure: Tev_uint8_t;
    evcb_cb_union: record
      case longint of
        0: (evcb_callback: procedure(para1: Tevutil_socket_t; para2: smallint; para3: pointer));
        1: (evcb_selfcb: procedure(para1: Pevent_callback; para2: pointer));
        2: (evcb_evfinalize: procedure(para1: Pevent; para2: pointer));
        3: (evcb_cbfinalize: procedure(para1: Pevent_callback; para2: pointer));
      end;
    evcb_arg: pointer;
  end;

  Pevent_base = type Pointer;

  Tevent = record
    ev_evcallback: Tevent_callback;
    ev_timeout_pos: record
      case longint of
        0: (ev_next_with_common_timeout: record
            tqe_next: Pevent;
            tqe_prev: ^Pevent;
            end);
        1: (min_heap_idx: longint);
      end;
    ev_fd: Tevutil_socket_t;
    ev_base: Pevent_base;
    ev_: record
      case longint of
        0: (ev_io: record
            ev_io_next: record
              le_next: Pevent;
              le_prev: ^Pevent;
              end;
            ev_timeout: Ttimeval;
            end);
        1: (ev_signal: record
            ev_signal_next: record
              le_next: Pevent;
              le_prev: ^Pevent;
              end;
            ev_ncalls: smallint;
            ev_pncalls: Psmallint;
            end);
      end;
    ev_events: smallint;
    ev_res: smallint;
    ev_timeout: Ttimeval;
  end;

  Tevent_list = record
    tqh_first: Pevent;
    tqh_last: ^Pevent;
  end;
  Pevent_list = ^Tevent_list;

  Tevent_dlist = record
    lh_first: Pevent;
  end;
  Pevent_dlist = ^Tevent_dlist;



  // === Konventiert am: 26-8-25 19:40:28 ===


implementation



end.
