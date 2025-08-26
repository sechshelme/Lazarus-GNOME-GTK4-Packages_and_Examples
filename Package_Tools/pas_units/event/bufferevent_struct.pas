unit bufferevent_struct;

interface

uses
  clib, fp_event, event, buffer, bufferevent;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tevent_watermark = record
    low: Tsize_t;
    high: Tsize_t;
  end;
  Pevent_watermark = ^Tevent_watermark;

  Tbufferevent = record
    ev_base: Pevent_base;
    be_ops: Pbufferevent_ops;
    ev_read: Tevent;
    ev_write: Tevent;
    input: Pevbuffer;
    output: Pevbuffer;
    wm_read: Tevent_watermark;
    wm_write: Tevent_watermark;
    readcb: Tbufferevent_data_cb;
    writecb: Tbufferevent_data_cb;
    errorcb: Tbufferevent_event_cb;
    cbarg: pointer;
    timeout_read: Ttimeval;
    timeout_write: Ttimeval;
    enabled: smallint;
  end;
  Pbufferevent = ^Tbufferevent;


  // === Konventiert am: 26-8-25 17:43:44 ===


implementation



end.
