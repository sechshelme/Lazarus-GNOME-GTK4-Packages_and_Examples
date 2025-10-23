{$IFDEF read_interface}


type
  Tevent_watermark = record
    low: Tsize_t;
    high: Tsize_t;
  end;
  Pevent_watermark = ^Tevent_watermark;

  Pbufferevent = ^Tbufferevent;
  PPbufferevent = ^Pbufferevent;

  Tbufferevent_data_cb = procedure(bev: Pbufferevent; ctx: pointer); cdecl;
  Pbufferevent_data_cb = ^Tbufferevent_data_cb;
  Tbufferevent_event_cb = procedure(bev: Pbufferevent; what: smallint; ctx: pointer); cdecl;
  Pbufferevent_event_cb = ^Tbufferevent_event_cb;

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


  // === Konventiert am: 26-8-25 17:43:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
