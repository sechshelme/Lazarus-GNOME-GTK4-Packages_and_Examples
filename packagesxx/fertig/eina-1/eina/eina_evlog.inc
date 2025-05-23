{$IFDEF read_interface}


type
  TEina_Evlog_Item = record
    tim: double;
    srctim: double;
    thread: qword;
    obj: qword;
    event_offset: word;
    detail_offset: word;
    event_next: word;
  end;
  PEina_Evlog_Item = ^TEina_Evlog_Item;

  TEina_Evlog_Buf = record
    buf: pbyte;
    size: dword;
    top: dword;
    overflow: dword;
  end;
  PEina_Evlog_Buf = ^TEina_Evlog_Buf;

procedure eina_evlog(event: pchar; obj: pointer; srctime: double; detail: pchar); cdecl; external libeina;
function eina_evlog_steal: PEina_Evlog_Buf; cdecl; external libeina;
procedure eina_evlog_start; cdecl; external libeina;
procedure eina_evlog_stop; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:00:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
